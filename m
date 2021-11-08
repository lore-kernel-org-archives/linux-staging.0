Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81D42C85
	for <linux-staging@lists.linux.dev>; Mon,  8 Nov 2021 10:55:54 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-187-MTx5LVPGM4S4GiBqox-4vw-1; Mon, 08 Nov 2021 10:55:52 +0000
X-MC-Unique: MTx5LVPGM4S4GiBqox-4vw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.24; Mon, 8 Nov 2021 10:55:48 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.024; Mon, 8 Nov 2021 10:55:48 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Larry Finger' <Larry.Finger@lwfinger.net>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>
CC: "phil@philpotter.co.uk" <phil@philpotter.co.uk>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Zameer Manji
	<zmanji@gmail.com>, kernel test robot <lkp@intel.com>, Stable
	<stable@vger.kernel.org>
Subject: RE: [PATCH v2] staging: r8188eu: Fix breakage introduced when 5G code
 was removed
Thread-Topic: [PATCH v2] staging: r8188eu: Fix breakage introduced when 5G
 code was removed
Thread-Index: AQHX0/3oe+k3iU2vCUKwt3hlkWjVnqv5dSlg
Date: Mon, 8 Nov 2021 10:55:48 +0000
Message-ID: <8e4dd863ae894c8488a3d3d0f6a11f66@AcuMS.aculab.com>
References: <20211107173543.7486-1-Larry.Finger@lwfinger.net>
In-Reply-To: <20211107173543.7486-1-Larry.Finger@lwfinger.net>
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

From: Larry Finger
> Sent: 07 November 2021 17:36
>=20
> In commit 221abd4d478a ("staging: r8188eu: Remove no more necessary defin=
itions
> and code"), two entries were removed from RTW_ChannelPlanMap[], but not r=
eplaced
> with zeros. The position within this table is important, thus the patch b=
roke
> systems operating in regulatory domains osted later than entry 0x13 in th=
e table.
> Unfortunately, the FCC entry comes before that point and most testers did=
 not see
> this problem.
...
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/stagin=
g/r8188eu/core/rtw_mlme_ext.c
> index 55c3d4a6faeb..5b60e6df5f87 100644
> --- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> +++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
> @@ -107,6 +107,7 @@ static struct rt_channel_plan_map=09RTW_ChannelPlanMa=
p[RT_CHANNEL_DOMAIN_MAX] =3D {
>  =09{0x01},=09/* 0x10, RT_CHANNEL_DOMAIN_JAPAN */
>  =09{0x02},=09/* 0x11, RT_CHANNEL_DOMAIN_FCC_NO_DFS */
>  =09{0x01},=09/* 0x12, RT_CHANNEL_DOMAIN_JAPAN_NO_DFS */
> +=09{0x00}, /* 0x13 */
>  =09{0x02},=09/* 0x14, RT_CHANNEL_DOMAIN_TAIWAN_NO_DFS */
>  =09{0x00},=09/* 0x15, RT_CHANNEL_DOMAIN_ETSI_NO_DFS */
>  =09{0x00},=09/* 0x16, RT_CHANNEL_DOMAIN_KOREA_NO_DFS */
> @@ -118,6 +119,7 @@ static struct rt_channel_plan_map=09RTW_ChannelPlanMa=
p[RT_CHANNEL_DOMAIN_MAX] =3D {
>  =09{0x00},=09/* 0x1C, */
>  =09{0x00},=09/* 0x1D, */
>  =09{0x00},=09/* 0x1E, */
> +=09{0x00},=09/* 0x1F, */
>  =09/*  0x20 ~ 0x7F , New Define =3D=3D=3D=3D=3D */
>  =09{0x00},=09/* 0x20, RT_CHANNEL_DOMAIN_WORLD_NULL */
>  =09{0x01},=09/* 0x21, RT_CHANNEL_DOMAIN_ETSI1_NULL */

Is it worth changing that to use designated array initialisers?
so:
=09[0x21] =3D {0x01} /* RT_CHANNEL_DOMAIN_ETS11_NULL */

Then the {0x00} entries can be missed out (or just commented as not used).

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

