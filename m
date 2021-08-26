Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DF872
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 08:51:27 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-140-kV8jce2GMwKPSLUR9I4nHg-1; Thu, 26 Aug 2021 09:51:25 +0100
X-MC-Unique: kV8jce2GMwKPSLUR9I4nHg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 26 Aug 2021 09:51:24 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 26 Aug 2021 09:51:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Pavel Skripkin' <paskripkin@gmail.com>, "Larry.Finger@lwfinger.net"
	<Larry.Finger@lwfinger.net>, "phil@philpotter.co.uk" <phil@philpotter.co.uk>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"straube.linux@gmail.com" <straube.linux@gmail.com>,
	"fmdefrancesco@gmail.com" <fmdefrancesco@gmail.com>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 5/6] staging: r8188eu: add error handling of rtw_read32
Thread-Topic: [PATCH v3 5/6] staging: r8188eu: add error handling of
 rtw_read32
Thread-Index: AQHXmLmWEBrRSWSvqkChOMAmAhSABKuFfA1Q
Date: Thu, 26 Aug 2021 08:51:23 +0000
Message-ID: <27f5e52d520b453cbcabb3d72f0f5d15@AcuMS.aculab.com>
References: <cover.1629789580.git.paskripkin@gmail.com>
 <93bf46ce2d0ce12e94672acf28b64dc341fde038.1629789580.git.paskripkin@gmail.com>
In-Reply-To: <93bf46ce2d0ce12e94672acf28b64dc341fde038.1629789580.git.paskripkin@gmail.com>
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

From: Pavel Skripkin <paskripkin@gmail.com>
> Sent: 24 August 2021 08:28
>=20
> _rtw_read32 function can fail in case of usb transfer failure. But
> previous function prototype wasn't designed to return an error to
> caller. It can cause a lot uninit value bugs all across the driver code,
> since rtw_read32() returns local stack variable to caller.
>=20
> Fix it by changing the prototype of this function. Now it returns an
> int: 0 on success, negative error value on failure and callers should pas=
s
> the pointer to storage location for register value.

Pretty horrid API interface.
Functions like readl() - which can fail just return ~0u and let
the caller worry about whether that causes serious grief.

You could make all the read functions return __u64 and return ~0ull
on error.
Testing for (value & 1ull << 63) will be reasonable even on 32bit.

...
> -static u32 usb_read32(struct intf_hdl *pintfhdl, u32 addr)
> +static int usb_read32(struct intf_hdl *pintfhdl, u32 addr, u32 *data)
>  {
>  =09u8 requesttype;
>  =09u16 wvalue;
>  =09u16 len;
> -=09__le32 data;
> +=09int res;
> +=09__le32 tmp;
> +
> +=09if (WARN_ON(unlikely(!data)))
> +=09=09return -EINVAL;
>=20

Kill the NULL check - it is a silly coding error.
An OOPS is just as easy to debug.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

