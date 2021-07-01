Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C8B72
	for <linux-staging@lists.linux.dev>; Thu,  1 Jul 2021 14:52:12 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-113-DqUz9PK-PK6sTLwh_3HG4w-1; Thu, 01 Jul 2021 15:52:09 +0100
X-MC-Unique: DqUz9PK-PK6sTLwh_3HG4w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 1 Jul
 2021 15:52:08 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Thu, 1 Jul 2021 15:52:08 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Fabio M. De Francesco'" <fmdefrancesco@gmail.com>, Larry Finger
	<Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: rtl8188eu: Replace a custom function with
 crc32_le()
Thread-Topic: [PATCH] staging: rtl8188eu: Replace a custom function with
 crc32_le()
Thread-Index: AQHXbn5ab3Zj0XkM6U+MISzKcNjhyasuNAtw
Date: Thu, 1 Jul 2021 14:52:08 +0000
Message-ID: <2fac9d8813374e95bcc04134a0f40f45@AcuMS.aculab.com>
References: <20210701133809.26534-1-fmdefrancesco@gmail.com>
In-Reply-To: <20210701133809.26534-1-fmdefrancesco@gmail.com>
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
> Sent: 01 July 2021 14:38
>=20
> Use crc32_le in place of the custom getcrc32. This change makes GCC
> to warn about incorrect castings to the restricted type __le32, but
> they can be safely ignored because crc32_le calculates bitwise
> little-endian Ethernet AUTODIN II CRC32.
>=20
...
> -=09=09=09=09=09*((__le32 *)crc) =3D getcrc32(payload, length);/* modifie=
d by Amy*/
> +=09=09=09=09=09*((__le32 *)crc) =3D ~crc32_le(~0, payload, length);

Haven't we been round this before?
You need to get rid of these crappy casts.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

