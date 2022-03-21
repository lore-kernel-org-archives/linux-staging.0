Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5CD36F
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 22:39:16 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-96-AKQkeZfLOTaKITOaaCe37w-1; Mon, 21 Mar 2022 22:39:13 +0000
X-MC-Unique: AKQkeZfLOTaKITOaaCe37w-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 22:39:14 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Mon, 21 Mar 2022 22:39:14 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Martin Kaiser' <martin@kaiser.cx>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter
	<phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/6] staging: r8188eu: clean up odm dynamic functions
Thread-Topic: [PATCH 0/6] staging: r8188eu: clean up odm dynamic functions
Thread-Index: AQHYPWMAEqIti2f5FEmtSMAd4Wfc1azKba+w
Date: Mon, 21 Mar 2022 22:39:13 +0000
Message-ID: <d5a5e6d319b244778e7109f4e0f45902@AcuMS.aculab.com>
References: <20220321203031.143486-1-martin@kaiser.cx>
In-Reply-To: <20220321203031.143486-1-martin@kaiser.cx>
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

From: Martin Kaiser
> Sent: 21 March 2022 20:30
>=20
> Simplify the code for odm dynamic functions. Remove unused capabilities
> and intermediate steps.

Looks like a reasonable first tidyup to me :-)
There is a lot more goop in there!

=09David

>=20
> This should be applied after the "remove local BIT macro" patch.
>=20
> Martin Kaiser (6):
>   staging: r8188eu: remove two limit defines
>   staging: r8188eu: remove unused defines for dynamic functions
>   staging: r8188eu: DYNAMIC_BB_DYNAMIC_TXPWR is not used
>   staging: r8188eu: DYNAMIC_BB_ANT_DIV is not used
>   staging: r8188eu: DYNAMIC_RF_CALIBRATION is not used
>   staging: r8188eu: refactor dm func set and clear
>=20
>  drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  6 ++---
>  drivers/staging/r8188eu/core/rtw_wlan_util.c  | 12 ---------
>  drivers/staging/r8188eu/hal/usb_halinit.c     | 16 +++---------
>  drivers/staging/r8188eu/include/hal_intf.h    |  2 +-
>  .../staging/r8188eu/include/rtw_mlme_ext.h    | 25 -------------------
>  5 files changed, 7 insertions(+), 54 deletions(-)
>=20
> --
> 2.30.2

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

