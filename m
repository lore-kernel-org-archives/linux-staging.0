Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92BC72
	for <linux-staging@lists.linux.dev>; Thu, 22 Jul 2021 15:30:14 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-154-E8XI6R9BMwq2Wfp8lcAmRg-1; Thu, 22 Jul 2021 16:30:10 +0100
X-MC-Unique: E8XI6R9BMwq2Wfp8lcAmRg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 22 Jul 2021 16:30:09 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 22 Jul 2021 16:30:09 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Fabio M. De Francesco'" <fmdefrancesco@gmail.com>, Larry Finger
	<Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 1/2] staging: rtl8188eu: Replace a custom function with
 crc32_le()
Thread-Topic: [PATCH v3 1/2] staging: rtl8188eu: Replace a custom function
 with crc32_le()
Thread-Index: AQHXfiEvucvRPynR106nc+5J/iJ13qtPHROQ
Date: Thu, 22 Jul 2021 15:30:08 +0000
Message-ID: <f396ffee4a414ee092625ee486b871fe@AcuMS.aculab.com>
References: <20210721110052.26376-1-fmdefrancesco@gmail.com>
 <20210721110052.26376-2-fmdefrancesco@gmail.com>
In-Reply-To: <20210721110052.26376-2-fmdefrancesco@gmail.com>
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
> Sent: 21 July 2021 12:01
>=20
> Use crc32_le() in place of the custom getcrc32().
>=20
...
> @@ -609,14 +595,15 @@ u32=09rtw_tkip_encrypt(struct adapter *padapter, st=
ruct xmit_frame
> *pxmitframe)
>=20
>  =09=09=09=09if ((curfragnum + 1) =3D=3D pattrib->nr_frags) {=09/* 4 the =
last fragment */
>  =09=09=09=09=09length =3D pattrib->last_txcmdsz - pattrib->hdrlen - patt=
rib->iv_len -
> pattrib->icv_len;
> -=09=09=09=09=09*((__le32 *)crc) =3D getcrc32(payload, length);/* modifie=
d by Amy*/
> +=09=09=09=09=09*((__le32 *)crc) =3D cpu_to_le32(~crc32_le(~0, payload, l=
ength));
>=20
>  =09=09=09=09=09arcfour_init(&mycontext, rc4key, 16);
>  =09=09=09=09=09arcfour_encrypt(&mycontext, payload, payload, length);
>  =09=09=09=09=09arcfour_encrypt(&mycontext, payload + length, crc, 4);
>  =09=09=09=09} else {
>  =09=09=09=09=09length =3D pxmitpriv->frag_len - pattrib->hdrlen - pattri=
b->iv_len -
> pattrib->icv_len;
> -=09=09=09=09=09*((__le32 *)crc) =3D getcrc32(payload, length);/* modifie=
d by Amy*/
> +=09=09=09=09=09*((__le32 *)crc) =3D cpu_to_le32(~crc32_le(~0, payload, l=
ength));
> +
>  =09=09=09=09=09arcfour_init(&mycontext, rc4key, 16);
>  =09=09=09=09=09arcfour_encrypt(&mycontext, payload, payload, length);
>  =09=09=09=09=09arcfour_encrypt(&mycontext, payload + length, crc, 4);

Change crc to be __le32, kill the casts and pass &crc in the last call.

> @@ -682,7 +669,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, struct=
 recv_frame *precvframe)
>  =09=09=09arcfour_init(&mycontext, rc4key, 16);
>  =09=09=09arcfour_encrypt(&mycontext, payload, payload, length);
>=20
> -=09=09=09*((__le32 *)crc) =3D getcrc32(payload, length - 4);
> +=09=09=09*((__le32 *)crc) =3D cpu_to_le32(~crc32_le(~0, payload, length =
- 4));
>=20
>  =09=09=09if (crc[3] !=3D payload[length - 1] ||
>  =09=09=09    crc[2] !=3D payload[length - 2] ||

You could to the same here, or make crc u32, remove the cpu_to_le32()
and use get_unaligned_u32(payload + length - 4) (or whatever it is called).

But it is much better to do:
=09crc =3D crc32_le(~0, payload, length);
=09if (crc !=3D VALID_CRC32)
=09=09res =3D _FAIL;

You can lookup VALID_CRC32, but it is crc32_le(0, "\xff\xff\xff\xff", 4);

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

