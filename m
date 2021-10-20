Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BAB2C8B
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 20:46:15 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-115-nfpx-aVSOSaqIrh6sNXYUQ-1; Wed, 20 Oct 2021 21:46:13 +0100
X-MC-Unique: nfpx-aVSOSaqIrh6sNXYUQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Wed, 20 Oct 2021 21:46:11 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.023; Wed, 20 Oct 2021 21:46:11 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Greg KH' <gregkh@linuxfoundation.org>, Sebastian Luchetti
	<luchetti.linux@gmail.com>
CC: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: rts5208: ms.c: Remove two udelay calls and use
 usleep_range instead
Thread-Topic: [PATCH] staging: rts5208: ms.c: Remove two udelay calls and use
 usleep_range instead
Thread-Index: AQHXxCaBnEk8xGF8+EezDebeqGnpw6vcXlsg
Date: Wed, 20 Oct 2021 20:46:11 +0000
Message-ID: <15e2c625c8004534a3394271d49a3ba6@AcuMS.aculab.com>
References: <YWwWoB3+4HQTD4/t@Mononoke> <YWwoCuBIBc/xTPIu@kroah.com>
In-Reply-To: <YWwoCuBIBc/xTPIu@kroah.com>
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

From: Greg KH
> Sent: 17 October 2021 14:42
>=20
> On Sun, Oct 17, 2021 at 02:27:12PM +0200, Sebastian Luchetti wrote:
> > This patch fixes the issue:
> > CHECK: usleep_range is preferred over udelay; see
> > Documentation/timers/timers-howto.txt
> > in two occurrences.
> >
> > Signed-off-by: Sebastian Luchetti <luchetti.linux@gmail.com>
> > ---
> >  drivers/staging/rts5208/ms.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.=
c
> > index 2a6fab5c117a..7292c8f013fd 100644
> > --- a/drivers/staging/rts5208/ms.c
> > +++ b/drivers/staging/rts5208/ms.c
> > @@ -3236,7 +3236,7 @@ static int ms_write_multiple_pages(struct rtsx_ch=
ip *chip, u16 old_blk,
> >  =09=09=09return STATUS_FAIL;
> >  =09=09}
> >
> > -=09=09udelay(30);
> > +=09=09usleep_range(27, 32);
>=20
> These are very odd choices of a number, where did they come from?
>=20
> And as the other thread on this mailing list a few hours ago describes,
> for this same type of change, you need to test this with the actual
> hardware to know if this works properly or not.  Have you done so?

You also need to check that it is actually safe to sleep.
The style of the commit messages doesn't give massive
confidence that you have checked.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

