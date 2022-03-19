Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916DB5395
	for <linux-staging@lists.linux.dev>; Sat, 19 Mar 2022 22:36:02 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-103-5yAVdD5nNv2Y22tzMnRdCQ-1; Sat, 19 Mar 2022 22:35:58 +0000
X-MC-Unique: 5yAVdD5nNv2Y22tzMnRdCQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Sat, 19 Mar 2022 22:35:58 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Sat, 19 Mar 2022 22:35:58 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Martin Kaiser' <martin@kaiser.cx>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: Larry Finger <Larry.Finger@lwfinger.net>, Phillip Potter
	<phil@philpotter.co.uk>, Michael Straube <straube.linux@gmail.com>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: r8188eu: remove local BIT macro
Thread-Topic: [PATCH] staging: r8188eu: remove local BIT macro
Thread-Index: AQHYO7vDt7lRrzeqGEaCQ6n5CUyH5azHRaWw
Date: Sat, 19 Mar 2022 22:35:58 +0000
Message-ID: <ac3343ea279b4d048d77b3cf2724bcbe@AcuMS.aculab.com>
References: <20220319180342.3143734-1-martin@kaiser.cx>
In-Reply-To: <20220319180342.3143734-1-martin@kaiser.cx>
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

From: Martin Kaiser <martin@kaiser.cx>
> Sent: 19 March 2022 18:04
>=20
> The r8188eu driver defines a local BIT(x) macro. Remove this local macro
> and use the one from include/linux/bits.h.
>=20
> The global BIT macro returns an unsigned long value, the removed local
> BIT macro used a signed int.
>=20
> DYNAMIC_BB_DYNAMIC_TXPWR is defined as BIT(2), ~DYNAMIC_BB_DYNAMIC_TXPWR
> is passed to Switch_DM_Func as a u32 parameter. We need a cast in this
> case as ~DYNAMIC_BB_DYNAMIC_TXPWR is a 64-bit value on x86_64 systems.

Hmmm....
Why not fix the called function so that the caller doesn't
need to do the invert.

...
> b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> index 665b077190bc..f32401deae9a 100644
> --- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
> +++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> @@ -1276,13 +1276,13 @@ void update_IOT_info(struct adapter *padapter)
>  =09=09pmlmeinfo->turboMode_cts2self =3D 0;
>  =09=09pmlmeinfo->turboMode_rtsen =3D 1;
>  =09=09/* disable high power */
> -=09=09Switch_DM_Func(padapter, (~DYNAMIC_BB_DYNAMIC_TXPWR), false);
> +=09=09Switch_DM_Func(padapter, (u32)(~DYNAMIC_BB_DYNAMIC_TXPWR), false);

The function is defined as a real function:
Even though all the callers either pass 'true' or 'false' for enable.

void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
{
=09if (enable)
=09=09SetHwReg8188EU(padapter, HW_VAR_DM_FUNC_SET, (u8 *)(&mode));
=09else
=09=09SetHwReg8188EU(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
}

That (u8 *)&mode cast is at best dubious.

Searching for the callers also gives:
=09Switch_DM_Func(padapter, DYNAMIC_FUNC_DISABLE, false)

Should that have an invert?
Or is the other call wrong?
They don't both look right.
Or is DYNAMIC_FUNC_DISABLE just zero?

SetHwReg8188EU() is basically a big switch statement on the
'probably mostly constant' second argument.
The two relevant switch cases are:

=09case HW_VAR_DM_FUNC_SET:
=09=09if (*((u32 *)val) =3D=3D DYNAMIC_ALL_FUNC_ENABLE) {
=09=09=09podmpriv->SupportAbility =3D=09pdmpriv->InitODMFlag;
=09=09} else {
=09=09=09podmpriv->SupportAbility |=3D *((u32 *)val);
=09=09}
=09=09break;
=09case HW_VAR_DM_FUNC_CLR:
=09=09podmpriv->SupportAbility &=3D *((u32 *)val);
=09=09break;

So the ~ should probably be moved to the final statement.

OTOH this code is a big pile of poo.
Abstraction functions gone mad.

If you have a function that does two different things based on
a parameter that is always a constant you really should have
two different functions.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

