Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AFC1866
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 14:28:45 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-232-Pk1Wyq6qM162T3n3s26yow-1; Wed, 23 Mar 2022 14:28:43 +0000
X-MC-Unique: Pk1Wyq6qM162T3n3s26yow-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Wed, 23 Mar 2022 14:28:42 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Wed, 23 Mar 2022 14:28:42 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Martin Kaiser' <martin@kaiser.cx>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter
	<phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/7] staging: r8188eu: use ieee80211 define for version
 check
Thread-Topic: [PATCH 1/7] staging: r8188eu: use ieee80211 define for version
 check
Thread-Index: AQHYPoqESUbsEDAaEUG/qobs079+wKzNBQKg
Date: Wed, 23 Mar 2022 14:28:42 +0000
Message-ID: <3fafd45e349a4bc3aa8db888f08a71d3@AcuMS.aculab.com>
References: <20220323074859.177425-1-martin@kaiser.cx>
 <20220323074859.177425-2-martin@kaiser.cx>
In-Reply-To: <20220323074859.177425-2-martin@kaiser.cx>
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
> Sent: 23 March 2022 07:49
>=20
> Use the IEEE80211_FCTL_VERS define to check the version number
> of a received frame.
>=20
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/core/rtw_recv.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8=
188eu/core/rtw_recv.c
> index 8800ea4825ff..524a00345501 100644
> --- a/drivers/staging/r8188eu/core/rtw_recv.c
> +++ b/drivers/staging/r8188eu/core/rtw_recv.c
> @@ -1063,7 +1063,6 @@ static int validate_recv_frame(struct adapter *adap=
ter, struct recv_frame *precv
>  =09struct rx_pkt_attrib *pattrib =3D &precv_frame->attrib;
>  =09u8 *ptr =3D precv_frame->rx_data;
>  =09__le16 fc =3D *(__le16 *)ptr;

Those two lines are somewhat horrid.
Casts of pointers to integer types have a nasty habit of being bugs.
In any case 'ptr' should probably be 'frame_data'.
If the first two bytes are some kind of 16 bit id, then what follows?
Should this be a 'struct' that defines the frame data layout??

=09David

> -=09u8  ver =3D (unsigned char)(*ptr) & 0x3;
>  =09struct mlme_ext_priv *pmlmeext =3D &adapter->mlmeextpriv;
>=20
>  =09if (pmlmeext->sitesurvey_res.state =3D=3D SCAN_PROCESS) {
> @@ -1072,8 +1071,7 @@ static int validate_recv_frame(struct adapter *adap=
ter, struct recv_frame *precv
>  =09=09=09pmlmeext->channel_set[ch_set_idx].rx_count++;
>  =09}
>=20
> -=09/* add version chk */
> -=09if (ver !=3D 0)
> +=09if ((fc & IEEE80211_FCTL_VERS) !=3D 0)
>  =09=09return _FAIL;
>=20
>  =09pattrib->to_fr_ds =3D get_tofr_ds(ptr);
> --
> 2.30.2

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

