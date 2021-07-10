Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4BB168
	for <linux-staging@lists.linux.dev>; Sat, 10 Jul 2021 20:42:06 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-288-KIu4VRrmNiiz93j7OdgeJQ-1; Sat, 10 Jul 2021 21:42:03 +0100
X-MC-Unique: KIu4VRrmNiiz93j7OdgeJQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Sat, 10 Jul 2021 21:42:02 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Sat, 10 Jul 2021 21:42:02 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Fabio M. De Francesco'" <fmdefrancesco@gmail.com>, Larry Finger
	<Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel test
 robot" <lkp@intel.com>
CC: "kbuild-all@lists.01.org" <kbuild-all@lists.01.org>,
	"fabioaiuto83@gmail.com" <fabioaiuto83@gmail.com>
Subject: RE: [PATCH] staging: rtl8188eu: Replace a custom function with
 crc32_le()
Thread-Topic: [PATCH] staging: rtl8188eu: Replace a custom function with
 crc32_le()
Thread-Index: AQHXdZlS7uKLeikeukSCM0Q+7FrN3Ks8qnww
Date: Sat, 10 Jul 2021 20:42:02 +0000
Message-ID: <d53fb195104a4b269a7cd320049a133b@AcuMS.aculab.com>
References: <20210701133809.26534-1-fmdefrancesco@gmail.com>
 <202107100829.RxcC1tei-lkp@intel.com> <1790135.9ZQ2ZFNHWj@linux.local>
In-Reply-To: <1790135.9ZQ2ZFNHWj@linux.local>
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
> Sent: 10 July 2021 15:39
...
> [CUT]
[PASTE}
> 597=09=09=09=09=09=09*((__le32 *)crc) =3D ~crc32_le(~0, payload, length);
>=20
> I suppose that these warnings are false positives for the reasons explain=
ed in
> my patch.

No they are an indication you aren't doing things 'right'.
You shouldn't need an __le32 cast in this code.
'crc' should be defined as __le32 (not u8[4]) and IIRC
get_unaligned_le32() used in the latter check.

Actually what is this code actually doing.
ISTR it is doing a crc32() and then comparing the result with the
crc in the buffer?
No hardware ever does that.
What happens is the receiver does the crc of the whole buffer
including the transmitted crc and then checks the value is the
required 'magic' constant'.
This all works because the crc is inverted before transmission.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

