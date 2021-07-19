Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9091070
	for <linux-staging@lists.linux.dev>; Mon, 19 Jul 2021 15:24:43 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-178-iMvtmtATPRWN2iDCvXdP_A-1; Mon, 19 Jul 2021 16:24:39 +0100
X-MC-Unique: iMvtmtATPRWN2iDCvXdP_A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Mon, 19 Jul 2021 16:24:38 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Mon, 19 Jul 2021 16:24:38 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, Len Baker <len.baker@gmx.com>
CC: Larry Finger <Larry.Finger@lwfinger.net>, Florian Schilhabel
	<florian.c.schilhabel@googlemail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Pavel Skripkin <paskripkin@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging/rtl8712: Remove all strcpy() uses in favor of
 strscpy()
Thread-Topic: [PATCH] staging/rtl8712: Remove all strcpy() uses in favor of
 strscpy()
Thread-Index: AQHXfGBOiwzYJ/Wx2kuQ1xZyGR2EOqtKavEA
Date: Mon, 19 Jul 2021 15:24:38 +0000
Message-ID: <de94438319a84e0985b3ba0f5c00807b@AcuMS.aculab.com>
References: <20210717155145.15041-1-len.baker@gmx.com>
 <20210719053747.GN1931@kadam>
In-Reply-To: <20210719053747.GN1931@kadam>
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
> Sent: 19 July 2021 06:38
...
> Not related to your patch but this code is bad.  What it does is the
> "ifname" can be set as a module parameter.  So instead of testing if it
> has been set, it uses the checking inside dev_alloc_name() to see if we
> can allocate what the user requested.  If not then set it to "wlan%d".
> If we cannot allocate what the user wants then we should return an
> error.
>=20
> It should do:
>=20
> =09if (ifname[0] =3D=3D '\0')
> =09=09strscpy(ifname, "wlan%d", sizeof(ifname));
>=20
> =09ret =3D dev_alloc_name(pnetdev, ifname);
> =09if (ret < 0) {
> =09=09dev_err(pnetdev, "allocating device name failed.\n");
> =09=09return NULL;
> =09}

I know only root can set module parameters, but having one
that contains a string used as a printf format seems
dangerous at best.

Isn't it best to let userspace rename the interfaces later on?

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

