Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B07806
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 10:49:29 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-63-N2DKP2DGM8SWAiwiGxM7Pg-1; Thu, 31 Mar 2022 11:49:25 +0100
X-MC-Unique: N2DKP2DGM8SWAiwiGxM7Pg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Thu, 31 Mar 2022 11:49:24 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Thu, 31 Mar 2022 11:49:24 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <dan.carpenter@oracle.com>
CC: 'Alaa Mohamed' <eng.alaamohamedsoliman.am@gmail.com>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: gdm724x: Fix Duplication of Side Effects
Thread-Topic: [PATCH] staging: gdm724x: Fix Duplication of Side Effects
Thread-Index: AQHYROi924sZ22xfrE+zbiso9jQv5KzZSk9w///yggCAABHMsA==
Date: Thu, 31 Mar 2022 10:49:24 +0000
Message-ID: <acde5b1e8495431dac05403c593d4679@AcuMS.aculab.com>
References: <20220331101849.71046-1-eng.alaamohamedsoliman.am@gmail.com>
 <ebbc4a14c30f492f8553e6ef572bbcbe@AcuMS.aculab.com>
 <20220331104012.GM3293@kadam>
In-Reply-To: <20220331104012.GM3293@kadam>
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
> Sent: 31 March 2022 11:40
>=20
> On Thu, Mar 31, 2022 at 10:29:04AM +0000, David Laight wrote:
> > From: Alaa Mohamed
> > > Sent: 31 March 2022 11:19
> > >
> > > Fix Duplication of Side Effects for GDM_TTY_READY(gdm) macro
> > > reported by checkpatch
> > > "CHECK: Macro argument reuse 'gdm' - possible side-effects?"
> > >
> > > Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
> > > ---
> > >  drivers/staging/gdm724x/gdm_tty.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/staging/gdm724x/gdm_tty.c b/drivers/staging/gdm7=
24x/gdm_tty.c
> > > index 04df6f9f5403..6f0274470e69 100644
> > > --- a/drivers/staging/gdm724x/gdm_tty.c
> > > +++ b/drivers/staging/gdm724x/gdm_tty.c
> > > @@ -27,7 +27,9 @@
> > >
> > >  #define MUX_TX_MAX_SIZE 2048
> > >
> > > -#define GDM_TTY_READY(gdm) (gdm && gdm->tty_dev && gdm->port.count)
> > > +#define GDM_TTY_READY(_gdm) \
> > > +=09({ typeof(_gdm) (gdm) =3D (_gdm); \
> > > +=09(gdm && gdm->tty_dev && gdm->port.count); })
> >
> > Did you test this?
> >
> > see https://godbolt.org/z/cazPrrzPv
> >
>=20
> I don't understand the link.  The patch should work as far as I can see.

If you call GDM_TTY_READY(gdm) the first line ends up as:
=09struct xxx *gdm =3D gdm;
which shadows the parameter.
There's probably a warning about an uninitialised variable as well.

The 'gdm' and '_gdm' would need swapping over.
But, as you said, just:
#define GDM_TTY_READY(gdm) ((gdm) && (gdm)->tty_dev && (gdm)->port.count)
is fine - I'd add the () but not worry about multiple evaluation.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

