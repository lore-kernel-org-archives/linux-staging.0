Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D222C9E
	for <linux-staging@lists.linux.dev>; Mon, 21 Mar 2022 09:14:38 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-278-qw6f7-ngP1apDy64emi6IQ-1; Mon, 21 Mar 2022 09:14:35 +0000
X-MC-Unique: qw6f7-ngP1apDy64emi6IQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Mon, 21 Mar 2022 09:14:36 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Mon, 21 Mar 2022 09:14:36 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dan Carpenter' <dan.carpenter@oracle.com>
CC: 'Martin Kaiser' <martin@kaiser.cx>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>, Michael Straube
	<straube.linux@gmail.com>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] staging: r8188eu: remove local BIT macro
Thread-Topic: [PATCH] staging: r8188eu: remove local BIT macro
Thread-Index: AQHYO7vDt7lRrzeqGEaCQ6n5CUyH5azHRaWwgAJI4ACAAADG0A==
Date: Mon, 21 Mar 2022 09:14:36 +0000
Message-ID: <8173b8e8846646de844de50952c5117e@AcuMS.aculab.com>
References: <20220319180342.3143734-1-martin@kaiser.cx>
 <ac3343ea279b4d048d77b3cf2724bcbe@AcuMS.aculab.com>
 <20220321090648.GH3293@kadam>
In-Reply-To: <20220321090648.GH3293@kadam>
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
> Sent: 21 March 2022 09:07
>=20
> On Sat, Mar 19, 2022 at 10:35:58PM +0000, David Laight wrote:
> > OTOH this code is a big pile of poo.
> > Abstraction functions gone mad.
>=20
> Yeah.
>=20
> I wrote an email similar to yours and I even wrote some sample code.
> But then I deleted it because I don't pay Martin anything so I'm just
> grateful for what he sends and can't reasonably ask for more.
>=20
> This code constantly amazes me with how many abstractions there are.
> Martin keeps deleting them, and I think he's going to run out but so
> far that hasn't happened.
>=20
> Anyway here is the diff just for laughs since you brought it up.  Not
> something that's necessarry and definitely not a priority.
>=20
> I don't really like enable/disable functions that do opposite things
> depending on if true/false is passed as a parameter.  They're normally
> more readable split apart.
>=20
> Ideally there would be adapter_to_pdbm() and adapter_to_podm() helper
> functions.
>=20
> diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c
> b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> index 665b077190bc..d973cf341031 100644
> --- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
> +++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
> @@ -276,12 +276,23 @@ void Restore_DM_Func_Flag(struct adapter *padapter)
>  =09SetHwReg8188EU(padapter, HW_VAR_DM_FUNC_OP, (u8 *)(&saveflag));
>  }
>=20
> +void enable_dm_func(struct adapter *padapter, u32 mode)
> + {
> +=09struct dm_pri *pdmpriv =3D adapter_to_pdbm(padapter);
> +=09struct odm_dm_struct *podmpriv =3D adapter_to_pod(padapter);
> +
> +=09if (mode =3D=3D DYNAMIC_ALL_FUNC_ENABLE) {
> +=09=09podmpriv->SupportAbility =3D pdmpriv->InitODMFlag;
> +=09} else {
> +=09=09podmpriv->SupportAbility |=3D mode;
> +=09}
> +}
> +
> +void disable_dm_func(struct adapter *padapter, u32 mode)
> +{
> +=09struct odm_dm_struct *podmpriv =3D adapter_to_pod(padapter);
> +
> +=09podmpriv->SupportAbility &=3D mode;
> + }

I'd go even further.
One function for each of 'set', 'enable' and 'disable'.
Doing '=3D', '|=3D' and '&=3D ~'.

But then you realise it just isn't worth the effort.
Just type:
=09=09adapter_to_pod(padapter)-> SupportAbility =3D ...
directly in the code.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

