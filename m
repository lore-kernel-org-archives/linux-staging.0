Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C0F4A29
	for <linux-staging@lists.linux.dev>; Tue, 18 Oct 2022 11:21:31 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-232-MyyZk4qTO_2gQ2IgehS1sQ-1; Tue, 18 Oct 2022 12:21:28 +0100
X-MC-Unique: MyyZk4qTO_2gQ2IgehS1sQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 18 Oct
 2022 12:21:26 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Tue, 18 Oct 2022 12:21:26 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Greg KH' <gregkh@linuxfoundation.org>, Deepak R Varma <drv@mailo.com>
CC: "outreachy@lists.linux.dev" <outreachy@lists.linux.dev>,
	"Larry.Finger@lwfinger.net" <Larry.Finger@lwfinger.net>,
	"phil@philpotter.co.uk" <phil@philpotter.co.uk>, "paskripkin@gmail.com"
	<paskripkin@gmail.com>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kumarpraveen@linux.microsoft.com"
	<kumarpraveen@linux.microsoft.com>, "saurabh.truth@gmail.com"
	<saurabh.truth@gmail.com>
Subject: RE: [PATCH 2/4] staging: r8188eu: reformat long computation lines
Thread-Topic: [PATCH 2/4] staging: r8188eu: reformat long computation lines
Thread-Index: AQHY4jImRI1yBSI2nkicUdp3IjMNEK4UAvtg
Date: Tue, 18 Oct 2022 11:21:26 +0000
Message-ID: <a0bef75b959f4ca6a7bbfaacd531f8ae@AcuMS.aculab.com>
References: <cover.1666011479.git.drv@mailo.com>
 <2dd27eff9aab5ffe31e61086c0584982794507cf.1666011479.git.drv@mailo.com>
 <Y01iLXp20G0FSJFG@kroah.com>
In-Reply-To: <Y01iLXp20G0FSJFG@kroah.com>
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

From: Greg KH
> Sent: 17 October 2022 15:10
>=20
> On Mon, Oct 17, 2022 at 06:52:50PM +0530, Deepak R Varma wrote:
> > Reformat long running computation instructions to improve code readabil=
ity.
> > Address following checkpatch script complaints:
> > =09CHECK: line length of 171 exceeds 100 columns
> > =09CHECK: line length of 113 exceeds 100 columns
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >  drivers/staging/r8188eu/core/rtw_br_ext.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/stagin=
g/r8188eu/core/rtw_br_ext.c
> > index 79daf8f269d6..427da7e8ba4c 100644
> > --- a/drivers/staging/r8188eu/core/rtw_br_ext.c
> > +++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
> > @@ -211,8 +211,10 @@ static int __nat25_network_hash(unsigned char *net=
work_addr)
> >  =09} else if (network_addr[0] =3D=3D NAT25_IPX) {
> >  =09=09unsigned long x;
> >
> > -=09=09x =3D network_addr[1] ^ network_addr[2] ^ network_addr[3] ^ netw=
ork_addr[4] ^
> network_addr[5] ^
> > -=09=09=09network_addr[6] ^ network_addr[7] ^ network_addr[8] ^ network=
_addr[9] ^
> network_addr[10];
> > +=09=09x =3D network_addr[1] ^ network_addr[2] ^ network_addr[3] ^
>=20
> Why not go out to [4] here and then you are one line shorter?

and/or use a shorter variable name....

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

