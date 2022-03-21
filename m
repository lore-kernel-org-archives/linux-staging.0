Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F75E2C9E
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 09:04:49 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-317-OFJN3kdaOLmUPbxZoKh6yA-1; Mon, 21 Mar 2022 09:04:46 +0000
X-MC-Unique: OFJN3kdaOLmUPbxZoKh6yA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 09:04:46 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Mon, 21 Mar 2022 09:04:46 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, Martin Kaiser
	<martin@kaiser.cx>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger
	<Larry.Finger@lwfinger.net>, Phillip Potter <phil@philpotter.co.uk>, "Michael
 Straube" <straube.linux@gmail.com>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: r8188eu: remove local BIT macro
Thread-Topic: [PATCH] staging: r8188eu: remove local BIT macro
Thread-Index: AQHYPPvlt7lRrzeqGEaCQ6n5CUyH5azJiwtg
Date: Mon, 21 Mar 2022 09:04:46 +0000
Message-ID: <188ea71f265a4f9c968de68dc9ea6464@AcuMS.aculab.com>
References: <20220319180342.3143734-1-martin@kaiser.cx>
 <20220321081559.GF3293@kadam>
In-Reply-To: <20220321081559.GF3293@kadam>
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

From: Dan Carpenter
> Sent: 21 March 2022 08:16
>=20
> This version is better, thanks!
>=20
> Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> What the GCC devs should have done is run their checker on real code and
> silence the common false positives.  There are a few ways to do this.
> You could make ~ a special case.  They already ignore truncated sign
> extension so they could equally well ignore truncation when all it's a
> 32 bits which are all set to 1.  Probably the best answer is to do both.

Or start using -(BIT_VALUE + 1) instead of ~BIT_VALUE :-)

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

