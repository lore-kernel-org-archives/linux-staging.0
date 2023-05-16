Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198FB1EA63
	for <linux-staging@lists.linux.dev>; Tue, 16 May 2023 10:31:26 +0000 (UTC)
Date: Tue, 16 May 2023 10:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atinb.me;
	s=protonmail; t=1684233070; x=1684492270;
	bh=iJIaomfcW1rpNE/WPLw3gIMwxLp8ji0De8wR8AnNQOg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=onUHz8N9cv1WFDuic0cHMZOslnUsZpx65oiicipX99d57N7l0mDRaQtTwUUtHaLKt
	 kSd/Ofslj614BLoMr4erq5d55H47dE2M9Z+wVY14yryLwB51GU9V2LYgldUfhpoqXq
	 BTK8rvJkPxfyWNsxnUCFq9DRzRIrSfUUnlW93yqJSeNW9/+4WvXyJXEayyp4ECCr0C
	 6fEA80JRzq+Wlk1UdM/YyHUKlefzI8/CgfyteTZSIlQB6HgoxSZddOBARJwYuwCFAF
	 dVzzkbJOWD1T8BGctSdCANtsneo2h22lgx1HBJ8fKT1KVa0kkrhBx5vD6ANdtfHT87
	 0g03MKrevjmJA==
To: Greg KH <gregkh@linuxfoundation.org>
From: Atin <hi@atinb.me>
Cc: linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: add whitespace before operator
Message-ID: <kqmc20X96l-opyiHjxQVIniliwVLkqa0w-6JN3DeMm7KEtJbVeRZ7b9ORH0xA1CQ1QnK3KcqgNcOq6hp9bqgslfW3gHyU7AwlcMwF3P_Tc4=@atinb.me>
In-Reply-To: <2023051346-pruning-porous-9570@gregkh>
References: <20230513120950.66944-1-hi@atinb.me> <2023051346-pruning-porous-9570@gregkh>
Feedback-ID: 64551405:user:proton
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I've sent an updated patch with the changes you suggested, please check.

Thanks,

Atin Bainada



------- Original Message -------
On Saturday, May 13th, 2023 at 6:28 PM, Greg KH <gregkh@linuxfoundation.org=
> wrote:


>=20
>=20
> On Sat, May 13, 2023 at 12:10:16PM +0000, Atin Bainada wrote:
>=20
> > fix the following post-commit hook checkpatch error:
>=20
>=20
> We have no default "post-commit hooks" :)
>=20
> You can run checkpatch.pl on a file, perhaps that is what you did here?
>=20
> > spaces required around that '?' (ctx:VxW)
> > 2278: FILE: rtl8723b_hal_init.c:2278:
> > + pHalData->ant_path =3D (tempval & BIT(6))? RF_PATH_B : RF_PATH_A;
> > ^
> >=20
> > Signed-off-by: Atin Bainada hi@atinb.me
> > ---
> > drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/driver=
s/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > index c3c1b49674d3..abfaf1eebf5b 100644
> > --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> > @@ -2275,7 +2275,7 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
> > pHalData->EEPROMBluetoothAntNum =3D tempval & BIT(0);
> > /* EFUSE_0xC3[6] =3D=3D 0, S1(Main)-RF_PATH_A; /
> > / EFUSE_0xC3[6] =3D=3D 1, S0(Aux)-RF_PATH_B */
> > - pHalData->ant_path =3D (tempval & BIT(6))? RF_PATH_B : RF_PATH_A;
> > + pHalData->ant_path =3D (tempval & BIT(6)) ? RF_PATH_B : RF_PATH_A;
>=20
>=20
> Why not rewrite this as a real if () statement to make it more
> understandable?
>=20
> thanks,
>=20
> greg k-h
