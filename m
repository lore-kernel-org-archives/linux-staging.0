Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA01E72
	for <linux-staging@lists.linux.dev>; Tue,  7 Sep 2021 10:10:29 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-285-AjN96C9hN9WOcY0vzSbalw-1; Tue, 07 Sep 2021 11:10:26 +0100
X-MC-Unique: AjN96C9hN9WOcY0vzSbalw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Tue, 7 Sep 2021 11:10:19 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Tue, 7 Sep 2021 11:10:19 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Fabio M. De Francesco'" <fmdefrancesco@gmail.com>, Larry Finger
	<Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Pavel Skripkin
	<paskripkin@gmail.com>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] staging: r8188eu: Shorten calls chain of
 rtw_write8/16/32/N()
Thread-Topic: [PATCH v3 3/3] staging: r8188eu: Shorten calls chain of
 rtw_write8/16/32/N()
Thread-Index: AQHXowbxud4S7oFeskKSrbEZlc25E6uYWqHg
Date: Tue, 7 Sep 2021 10:10:19 +0000
Message-ID: <5a359f20e80341c9910ecc6286eb0aec@AcuMS.aculab.com>
References: <20210904220048.12822-1-fmdefrancesco@gmail.com>
 <20210904220048.12822-4-fmdefrancesco@gmail.com>
In-Reply-To: <20210904220048.12822-4-fmdefrancesco@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Fabio M. De Francesco
> Sent: 04 September 2021 23:01
>
> Shorten the calls chain of rtw_write8/16/32() down to the actual writes.
> For this purpose unify the four usb_write8/16/32/N() into the new
> usb_write(); make the latter parameterizable with 'size'; embed most of
> the code of usbctrl_vendorreq() into usb_write() and use in it the new
> usb_control_msg_send() API of USB Core.
>=20
...
> diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/stagin=
g/r8188eu/hal/usb_ops_linux.c
> index f9c4fd5a2c53..e31d1b1fdb12 100644
> --- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
> +++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
> @@ -8,76 +8,51 @@
>  #include "../include/recv_osdep.h"
>  #include "../include/rtl8188e_hal.h"
>=20
> -static int usbctrl_vendorreq(struct intf_hdl *pintfhdl, u16 value, void =
*pdata, u16 len, u8
> requesttype)
> +static int usb_read(struct intf_hdl *intfhdl, u32 addr, void *data, u8 s=
ize)
>  {
> -=09struct adapter=09*adapt =3D pintfhdl->padapter;
> -=09struct dvobj_priv  *dvobjpriv =3D adapter_to_dvobj(adapt);
> +=09u16 value =3D (u16)(addr & 0x0000ffff);
> +=09struct adapter *adapt =3D intfhdl->padapter;
> +=09struct dvobj_priv *dvobjpriv =3D adapter_to_dvobj(adapt);
>  =09struct usb_device *udev =3D dvobjpriv->pusbdev;
> -=09unsigned int pipe;
> -=09int status =3D 0;
> -=09u8 *pIo_buf;
> +=09int status;
> +=09u8 *io_buf;

Some of these changes are whitespace or renames.
They ought to be in a different patch.

I think you'll need 'reverse xmas tree' ordering as well.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

