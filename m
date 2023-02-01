Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FCEA45
	for <linux-staging@lists.linux.dev>; Wed,  1 Feb 2023 12:34:54 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-194-5Zea5NvWMKWWFd2YUm9l9A-1; Wed, 01 Feb 2023 12:34:51 +0000
X-MC-Unique: 5Zea5NvWMKWWFd2YUm9l9A-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.45; Wed, 1 Feb
 2023 12:34:50 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.045; Wed, 1 Feb 2023 12:34:50 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guru Mehar Rachaputi' <gurumeharrachaputi@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Thread-Topic: [PATCH] staging: pi433: modify bit_rate from u16 to u32
Thread-Index: AQHZNV2KzQ5LmfuLeUG1rTftT0qCPq66BnZA
Date: Wed, 1 Feb 2023 12:34:50 +0000
Message-ID: <19e492521b4a4d31aa13c45e8616689b@AcuMS.aculab.com>
References: <Y9h42l/8EcPqn63x@combine-ThinkPad-S1-Yoga>
 <Y9ilj812USHrSXe+@kroah.com> <Y9jrOKMGl7ITKxhP@combine-ThinkPad-S1-Yoga>
In-Reply-To: <Y9jrOKMGl7ITKxhP@combine-ThinkPad-S1-Yoga>
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

From: Guru Mehar Rachaputi
> Sent: 31 January 2023 10:20
...
> > >  struct pi433_tx_cfg {
> > >  =09__u32=09=09=09frequency;
> > > -=09__u16=09=09=09bit_rate;
> > > +=09__u32=09=09=09bit_rate;
> > >  =09__u32=09=09=09dev_frequency;
> > >  =09enum modulation=09=09modulation;
> > >  =09enum mod_shaping=09mod_shaping;
> >
> > And didn't you just break existing userspace code?  If not, how?  If so=
,
> > how did you test this?
> >
> My apologies, I did not study code. While testing, the probe function of
> pi433 driver didn't appear in the lsmod operation. I suspected my
> testing was wrong.

You don't need to study any code, just the structure you changed.

On all architectures (except m68k) there is a two byte pad
after the bit_rate field, this is likely to be filled with
random data from the applications stack.

On little-endian architectures the low byte is in the same place,
so if the 'random data' is zero it will happen to work.

However, on big-endian architectures, the low byte moves so
the value passed (by old applications) will always be wrong.

In reality having a uapi structure with embedded padding should
be banned.
But that would need a compiler attribute to enforce it.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

