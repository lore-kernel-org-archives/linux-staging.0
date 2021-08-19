Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC31A72
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 09:43:41 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-25-tzJRfeh1Naq-lFeOcnhxig-1; Thu, 19 Aug 2021 10:43:38 +0100
X-MC-Unique: tzJRfeh1Naq-lFeOcnhxig-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Thu, 19 Aug 2021 10:43:38 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Thu, 19 Aug 2021 10:43:38 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Aakash Hemadri' <aakashhemadri123@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Shuah Khan <skhan@linuxfoundation.org>, Bjorn Helgaas <bjorn@helgaas.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/2] staging: rtl8723bs: fix cast to restricted __le32
Thread-Topic: [PATCH 2/2] staging: rtl8723bs: fix cast to restricted __le32
Thread-Index: AQHXksUjJhmKROZmZkOAch25AOXZzqt6ltFA
Date: Thu, 19 Aug 2021 09:43:37 +0000
Message-ID: <eb38f6e0ae60489ca396de32d64f0513@AcuMS.aculab.com>
References: <cover.1629135143.git.aakashhemadri123@gmail.com>
 <1be80f0196bed681bf55bfe3155f564b4ebf3b76.1629135143.git.aakashhemadri123@gmail.com>
In-Reply-To: <1be80f0196bed681bf55bfe3155f564b4ebf3b76.1629135143.git.aakashhemadri123@gmail.com>
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

From: Aakash Hemadri
> Sent: 16 August 2021 18:35
>=20
> Fix sparse warning:
> warning: cast to restricted __le32

How many different copies of this crappy copy are there?
>=20
...
> diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c
> b/drivers/staging/rtl8723bs/core/rtw_security.c
> index 381deeea99d0..5320b1a46dfb 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_security.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_security.c
> @@ -122,7 +122,7 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *p=
recvframe)
>  =09=09arc4_crypt(ctx, payload, payload,  length);
>=20
>  =09=09/* calculate icv and compare the icv */
> -=09=09*((u32 *)crc) =3D le32_to_cpu(~crc32_le(~0, payload, length - 4));
> +=09=09*((u32 *)crc) =3D ~crc32_le(~0, payload, length - 4);

You've removed a byteswap which is needed on BE architectures.

>  =09}
>  }
> @@ -621,7 +621,7 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *pr=
ecvframe)
>  =09=09=09arc4_setkey(ctx, rc4key, 16);
>  =09=09=09arc4_crypt(ctx, payload, payload, length);
>=20
> -=09=09=09*((u32 *)crc) =3D le32_to_cpu(~crc32_le(~0, payload, length - 4=
));
> +=09=09=09*((u32 *)crc) =3D ~crc32_le(~0, payload, length - 4);
>=20
>  =09=09=09if (crc[3] !=3D payload[length - 1] || crc[2] !=3D payload[leng=
th - 2] ||
>  =09=09=09    crc[1] !=3D payload[length - 3] || crc[0] !=3D payload[leng=
th - 4])

As above - crc32_le() does a 'little-endian crc' but returns a host-ordered=
 value.
The (horrid) array cast means you need to store a LE value.

There are a dozen better ways to do this - I'm bored of quoting them.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

