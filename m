Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956C815CB6
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 11:15:31 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-146-75xd6qPbO8iGWQnN0ZN75w-1; Sat, 29 Oct 2022 12:15:28 +0100
X-MC-Unique: 75xd6qPbO8iGWQnN0ZN75w-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Sat, 29 Oct
 2022 12:15:27 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Sat, 29 Oct 2022 12:15:27 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Julia Lawall' <julia.lawall@inria.fr>, UMWARI JOVIAL
	<umwarijovial@gmail.com>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"outreachy@lists.linux.dev" <outreachy@lists.linux.dev>
Subject: RE: [PATCH] Remove Unnecessary typecast of c90 int constant
Thread-Topic: [PATCH] Remove Unnecessary typecast of c90 int constant
Thread-Index: AQHY6p4QqXp6c6aJbUmajhb1BaK9064lOaUg
Date: Sat, 29 Oct 2022 11:15:27 +0000
Message-ID: <aca0b365ab6b46789fd20dec14454ad6@AcuMS.aculab.com>
References: <20221028063711.GA35659@rdm>
 <alpine.DEB.2.22.394.2210280918550.2845@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2210280918550.2845@hadrien>
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

From: Julia Lawall
> Sent: 28 October 2022 08:23
>=20
> On Fri, 28 Oct 2022, UMWARI JOVIAL wrote:
>=20
> > According to Linux kernel coding style.
> >
> > Reported by checkpatch:
> > WARNING: Unnecessary typecast of c90 int constant - '(int)2.412e8' coul=
d be '2.412e8'
> > WARNING: Unnecessary typecast of c90 int constant - '(int)2.487e8' coul=
d be '2.487e8'
>=20
> It's not ideal to just include the checkpatch messges verbatim in your lo=
g
> message.  It woudl be better to say what you are doing and why, in
> complete sentences ("According to the Linux coding style" is not a
> complete sentence).
>=20
> I also suspect that the checkpatch message is wrong.  Floating point
> numbers cannot be used in the kernel, and the case of the constant ensure=
s
> that the value will be converted to an integer at compile time.

Much better to just use 241200000u (or 241200u * 1000 for readability).

=09David

>=20
> julia
>=20
> >
> > Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
> > ---
> >  drivers/staging/rtl8192e/rtllib_softmac_wx.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > index fdf867a5dd7a..4fc4fb25d8d6 100644
> > --- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
> > @@ -41,8 +41,8 @@ int rtllib_wx_set_freq(struct rtllib_device *ieee, st=
ruct iw_request_info *a,
> >
> >  =09/* if setting by freq convert to channel */
> >  =09if (fwrq->e =3D=3D 1) {
> > -=09=09if ((fwrq->m >=3D (int)2.412e8 &&
> > -=09=09     fwrq->m <=3D (int)2.487e8)) {
> > +=09=09if ((fwrq->m >=3D 2.412e8 &&
> > +=09=09     fwrq->m <=3D 2.487e8)) {
> >  =09=09=09int f =3D fwrq->m / 100000;
> >  =09=09=09int c =3D 0;
> >
> > --
> > 2.25.1
> >
> >
> >

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

