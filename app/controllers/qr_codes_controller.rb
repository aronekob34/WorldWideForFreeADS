class QrCodesController < ApplicationController
  def new
  end

  def create
  	@ad = Ad.last
  	qrcode = 'growstartups.xyz/ads/' + @ad.id.to_s
  	@qr = RQRCode::QRCode.new( qrcode, size: 3)
  end

  private
  def qr_code_params
  	params.require(:qr_code).permit(:text)
  end
end
