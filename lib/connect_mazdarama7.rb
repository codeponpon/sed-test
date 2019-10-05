class ConnectMazdarama7
  attr_reader :params

  def initialize(params)
    @params = params
  end

  # sakapost    = สาขา (01 ,02)   datatype(varchar)
  # docnopost   = เลขที่การจอง datatype(varchar)
  # typepost    =  ประเภทการบันทึกจอง (ลูกค้า หรือ DCRC) datatype(text)
  # namepost    = ชื่อลูค้า datatype(varchar)
  # sernamepost = นามสกุล  datatype(varchar)
  # emailpost   = Email ลูกค้า datatype(varchar)
  # mobilepost  = โทรศัพท์ ลูกค้า datatype(varchar)
  # modelpost   =  ยี่ห้อ/รุ่นรถ datatype(varchar)
  # regisnopost = ทะเบียนรถ  datatype(varchar)
  # dtlpost     = รายละเอียดการเข้ารับบริการ datatype(text)
  # servicepost = ประเภทการเข้าซ่อม ( เช็คระยะ, เช็คทั่วไป,เปลี่ยนอะไหล่,อื่นๆ ) datatype(varchar)
  # otherpost   = ประเภาการเข้าซ่อมนอกเหนือจากทีมีให้เลือก  datatype(varchar)
  # milagepost  = เลขไมล์รถ ณ.ปัจจุบัน  datatype(varchar)
  # daypost     = วันที่จองเข้าซ่อม  datatype(varchar)
  # monthpost   = เดือนที่จองเข้าซ่อม datatype(varchar)
  # yearpost    = ปีที่จองเข้าซ่อม datatype(varchar)
  # timepost    = เวลาที่เข้าซ่อม datatype(varchar)   format(hh:nn)
  def call
    request = RestClient.get('http://110.164.126.188:8989/mazdaweb/appointment/servicepost.asp', {
        sakapost:   @params[:sakapost],
        docnopost:  @params[:docnopost],
        typepost:   @params[:typepost],
        namepost:   @params[:namepost],
        sernamepost: @params[:sernamepost],
        emailpost:  @params[:emailpost],
        mobilepost: @params[:mobilepost],
        modelpost:  @params[:modelpost],
        regisnopost: @params[:regisnopost],
        dtlpost:    @params[:dtlpost],
        otherpost:  @params[:otherpost],
        milagepost: @params[:milagepost],
        daypost:    @params[:daypost],
        monthpost:  @params[:monthpost],
        yearpost:   @params[:yearpost],
        timepost:   @params[:timepost],
        servicepost: @params[:servicepost]
    })
    if [200, 201].include?(request.code)
      return render json: {message: 'success'}, status: :ok
    elsif [403, 401].include?(request.code)
      raise PermissionError
    else
      log("HTTP request failed: " + request.code.to_s, :error)
    end

  rescue RestClient::ExceptionWithResponse => err
    raise err
  end

  def self.call(p)
    new(p).call
  end
end