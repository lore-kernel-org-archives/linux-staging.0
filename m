Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8471
	for <linux-staging@lists.linux.dev>; Mon, 10 May 2021 13:38:57 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-27-bBycmq91M5C3TfJHA3srvw-1; Mon, 10 May 2021 14:38:53 +0100
X-MC-Unique: bBycmq91M5C3TfJHA3srvw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 10 May 2021 14:38:50 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Mon, 10 May 2021 14:38:49 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Fabio Aiuto' <fabioaiuto83@gmail.com>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] staging: rtl8723bs: replace private CRC-32
 routines with in-kernel ones
Thread-Topic: [PATCH v2 1/2] staging: rtl8723bs: replace private CRC-32
 routines with in-kernel ones
Thread-Index: AQHXRaBE0Vec4dAP60OcHOZcBIBf86rcuAwA
Date: Mon, 10 May 2021 13:38:49 +0000
Message-ID: <29938747c82e4cf1837be5f1cdb803b7@AcuMS.aculab.com>
References: <cover.1620652505.git.fabioaiuto83@gmail.com>
 <cdd9bc521b7119a9c2787b46109eb76f94bd295a.1620652505.git.fabioaiuto83@gmail.com>
In-Reply-To: <cdd9bc521b7119a9c2787b46109eb76f94bd295a.1620652505.git.fabioaiuto83@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
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

> replace private CRC-32 routines with in-kernel ones.

Have you verified that they compute the same CRC?

There are all sorts of subtle reasons why the outputs can differ.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

