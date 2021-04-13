Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C3173
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 10:32:09 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-111-z87EccfoNGWB0XIN9fdlag-1; Tue, 13 Apr 2021 11:32:06 +0100
X-MC-Unique: z87EccfoNGWB0XIN9fdlag-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 11:32:05 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 11:32:05 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'sakari.ailus@linux.intel.com'" <sakari.ailus@linux.intel.com>
CC: 'Mitali Borkar' <mitaliborkar810@gmail.com>, "bingbu.cao@intel.com"
	<bingbu.cao@intel.com>, "tian.shu.qiu@intel.com" <tian.shu.qiu@intel.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "outreachy-kernel@googlegroups.com"
	<outreachy-kernel@googlegroups.com>, "mitali_s@me.iitr.ac.in"
	<mitali_s@me.iitr.ac.in>
Subject: RE: [PATCH 2/6] staging: media: intel-ipu3: preferred __aligned(size)
 over __attribute__aligned(size)
Thread-Topic: [PATCH 2/6] staging: media: intel-ipu3: preferred
 __aligned(size) over __attribute__aligned(size)
Thread-Index: AQHXLyewN18t7A08NkSuo10kWluH2aqyET/AgAAWMYCAABkZMA==
Date: Tue, 13 Apr 2021 10:32:05 +0000
Message-ID: <249c86809f374e13ac0be28c279eae7e@AcuMS.aculab.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
 <277be5f4da82449aaf0a635b60ad0728@AcuMS.aculab.com>
 <20210413095621.GQ3@paasikivi.fi.intel.com>
In-Reply-To: <20210413095621.GQ3@paasikivi.fi.intel.com>
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

From: sakari.ailus@linux.intel.com
> Sent: 13 April 2021 10:56
>=20
> Hi David,
>=20
> On Tue, Apr 13, 2021 at 07:40:12AM +0000, David Laight wrote:
> > From: Mitali Borkar
> > > Sent: 12 April 2021 00:09
> > >
> > > This patch fixes the warning identified by checkpatch.pl by replacing
> > > __attribute__aligned(size) with __aligned(size)
> > >
> > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > ---
> > >  .../staging/media/ipu3/include/intel-ipu3.h   | 74 +++++++++--------=
--
> > >  1 file changed, 37 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > index 589d5ccee3a7..d95ca9ebfafb 100644
> > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > @@ -84,7 +84,7 @@ struct ipu3_uapi_grid_config {
> > >   */
> > >  struct ipu3_uapi_awb_raw_buffer {
> > >  =09__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> > > -=09=09__attribute__((aligned(32)));
> > > +=09=09__aligned(32);
> > >  } __packed;
> >
> > WTF?
> >
> > It either has 1-byte alignment because it is just __u8,
> > 32-byte because of the aligned(32),
> > or 1 byte because of the outer packed.
> >
> > What alignment does this (and all the other) structures
> > actually need?
>=20
> 32 as noted above. Here packed makes no difference though.

Bollocks - it ought to override the __aligned(32);


> Some of these structs are used embedded in other structs or alone. I
> haven't checked this one.
>=20
> It's also possible to have __packed and __aligned() conflict (in which ca=
se
> a decent compiler would give you a warning) --- which does not happen
> currently AFAIK.

At least one compiler is objecting to some similar constructs.

> >
> > Specifying 'packed' isn't free.
>=20
> It may be free if the packed alignment of the fields corresponds to
> architecture's packing. Here __aligned() is used to satisfy
> hardware alignment requirements and __packed is used to ensure the same
> memory layout independently of ABI rules.

No that isn't what packed is for.
'packed' also tells the compiler that the structure may 'exist' at
an unaligned address.
On many architectures this requires the compiler use byte sized
access and shifts for all members.

If you are worried that the compiler/ABI might have inserted
padding then add a compile-time assert on the structure size.
But most kernel code assumes that structures where everything
is on its natural boundary won't have any padding.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

