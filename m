Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A08F7D
	for <linux-staging@lists.linux.dev>; Thu,  2 Feb 2023 22:02:29 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-12-478z_lYPOei3OtwiRyw-yA-1; Thu, 02 Feb 2023 22:02:26 +0000
X-MC-Unique: 478z_lYPOei3OtwiRyw-yA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Thu, 2 Feb
 2023 22:02:25 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Thu, 2 Feb 2023 22:02:25 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <error27@gmail.com>
CC: 'Guru Mehar Rachaputi' <gurumeharrachaputi@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Thread-Topic: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Thread-Index: AQHZNV2KzQ5LmfuLeUG1rTftT0qCPq66BnZAgAAPVoCAAiKyIA==
Date: Thu, 2 Feb 2023 22:02:25 +0000
Message-ID: <08b38578bb0f4088aeedbf4b179d9c59@AcuMS.aculab.com>
References: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
 <Y9ilj812USHrSXe+@kroah.com> <Y9jrOKMGl7ITKxhP@combine-ThinkPad-S1-Yoga>
 <19e492521b4a4d31aa13c45e8616689b@AcuMS.aculab.com> <Y9pno7gZHa+r/Rg3@kadam>
In-Reply-To: <Y9pno7gZHa+r/Rg3@kadam>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Dan Carpenter
> Sent: 01 February 2023 13:23
>=20
> On Wed, Feb 01, 2023 at 12:34:50PM +0000, David Laight wrote:
> > In reality having a uapi structure with embedded padding should
> > be banned.
> > But that would need a compiler attribute to enforce it.
>=20
> It would be simple enough to grep the names of all the UAPI struct and
> use pahole to make a list of the existing structs which have holes.
> Then re-run the script every week and complain when new holey struct
> types are added.
>=20
> You could do a similar thing with Smatch looking at copy_to/from_user()
> struct types.

Would it be possible to add aa attribute and check to sparse?

Might persuade people to use it instead of 'packed' for structures
that map defined byte layouts and so mustn't be holey - but are
never actually misaligned in memory.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

