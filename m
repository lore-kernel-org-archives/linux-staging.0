Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B567A31
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 08:24:20 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-313-XVMppRVmPTmC9nCcaFVojQ-1; Thu, 03 Nov 2022 08:24:17 +0000
X-MC-Unique: XVMppRVmPTmC9nCcaFVojQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 3 Nov
 2022 08:24:15 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Thu, 3 Nov 2022 08:24:15 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Deepak R Varma' <drv@mailo.com>, "outreachy@lists.linux.dev"
	<outreachy@lists.linux.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: rtl8192e: Use min_t/max_t macros for variable
 comparison
Thread-Topic: [PATCH] staging: rtl8192e: Use min_t/max_t macros for variable
 comparison
Thread-Index: AQHY7wupCXQamuU4VU+fXwTqUG6oz64s3Icw
Date: Thu, 3 Nov 2022 08:24:15 +0000
Message-ID: <d8fa86bf71694f23b8f175245722e86f@AcuMS.aculab.com>
References: <Y2LxC2kziM1TznhO@qemulion>
In-Reply-To: <Y2LxC2kziM1TznhO@qemulion>
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

From: Deepak R Varma
> Sent: 02 November 2022 22:37
>=20
> Simplify code by using min_t and max_t helper macros in place of lengthy
> if/else block oriented logical evaluation and value assignment. This
> issue is identified by coccicheck using the minmax.cocci file.
>=20
> Use the *_t variants of min/max macros to avoid compiler warnings about
> data typecast.
> Also, use u32 as type for min_t macro to avoid any truncation of data
> associated with enum constant HT_AGG_SIZE_32K.
>=20
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/rtl8192e/rtl819x_HTProc.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/=
rtl8192e/rtl819x_HTProc.c
> index 62aa8e893c34..ccb86660ab48 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -587,17 +587,12 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
>  =09=09=09else
>  =09=09=09=09pHTInfo->CurrentAMPDUFactor =3D HT_AGG_SIZE_64K;
>  =09=09} else {
> -=09=09=09if (pPeerHTCap->MaxRxAMPDUFactor < HT_AGG_SIZE_32K)
> -=09=09=09=09pHTInfo->CurrentAMPDUFactor =3D
> -=09=09=09=09=09=09 pPeerHTCap->MaxRxAMPDUFactor;
> -=09=09=09else
> -=09=09=09=09pHTInfo->CurrentAMPDUFactor =3D HT_AGG_SIZE_32K;
> +=09=09=09pHTInfo->CurrentAMPDUFactor =3D min_t(u32, pPeerHTCap->MaxRxAMP=
DUFactor,
> +=09=09=09=09=09=09=09    HT_AGG_SIZE_32K);

For min() to fail there must be a signed v unsigned mismatch.
Maybe that ought to be fixed.

>  =09=09}
>  =09}
> -=09if (pHTInfo->MPDU_Density > pPeerHTCap->MPDUDensity)
> -=09=09pHTInfo->current_mpdu_density =3D pHTInfo->MPDU_Density;
> -=09else
> -=09=09pHTInfo->current_mpdu_density =3D pPeerHTCap->MPDUDensity;
> +=09pHTInfo->current_mpdu_density =3D max_t(u8, pHTInfo->MPDU_Density,
> +=09=09=09=09=09      pPeerHTCap->MPDUDensity);

Using u8 with max_t() really doesn't make any sense.
The value will get promoted to signed int prior to the comparison.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

