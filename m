Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E261A6808
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776009941; cv=none; b=XmpTW39CEXwcjwwK76jAO1cKx4YGkmAZ4tQSEI31x6Wf08Bv9iHCDz+0sbr0K3E4ceeaKhV4svamHzgTkGzoPTgmPvZFg2hjLus+JkfdG6fLgSKRL/HaPc8OoN8KByqMam1ri6X1/NvpTvE8ZWyztxRxlRtMchW+hdOhZxXBBMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776009941; c=relaxed/simple;
	bh=xzF4BI154PzhD8AHUGGczDAtq6Xy+1bLW7Xu1WqDp1M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DWuhT+RqPIVWMnnNb6xCU2nyrz31Jam6gWXE9XL8+DvM4AjQaBpRR0uRJZzzqFBcJp24NDJqSDLzFNdKnth9OXzk8qmdLL0gnP7MsM1toZgKPBaXcpg4TkIA3hg2Onyk+O+IOslkQNxDT9vT9NdOLvLs8QBRLZfBRo3CWZJPOiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FzXq19UB; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FzXq19UB"
Date: Sun, 12 Apr 2026 18:05:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776009937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eg4QaKvKVHgMCzka5astJNn6ZmbPz+hzNI5FndNYN9k=;
	b=FzXq19UBY1uD4NdoOfSNiEgxEaj9/7931PvMNzhwLt/UKyBYKx/oTbwWm/YYWwfFN0vGyq
	8Td1O5LZwt0G59U8oqtcsXhaaAUF1+qIdggfIqbrhZizRZDyjspXnt+a0yEzpwN5qo4dNQ
	kzNVNPOSa+BBLgJVXsnH0LW5CyfZwEY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Josh Hesketh <josh.hesketh@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Michael Straube <straube.linux@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/3=5D_staging=3A_rtl8723bs=3A_?=
 =?US-ASCII?Q?fix_whitespace_issues_in_sdio=5Fhalinit=2Ec?=
In-Reply-To: <20260412150633.12071-2-josh.hesketh@gmail.com>
References: <20260412150633.12071-1-josh.hesketh@gmail.com> <20260412150633.12071-2-josh.hesketh@gmail.com>
Message-ID: <0B9DF20F-F251-4CE4-9D54-CF7F31966B65@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On April 12, 2026 5:06:32 PM GMT+02:00, Josh Hesketh <josh=2Ehesketh@gmail=
=2Ecom> wrote:
>Remove spaces before tabs in comments and fix extra spaces to
>address checkpatch warnings=2E
>
>Signed-off-by: Josh Hesketh <josh=2Ehesketh@gmail=2Ecom>
>---
>v2:
> - Rebased on staging-next
> - Split from original patch 1/2
> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 32 ++++++++++----------
> 1 file changed, 16 insertions(+), 16 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/sta=
ging/rtl8723bs/hal/sdio_halinit=2Ec
>index 4d74b14c3cd4=2E=2E4a4f6b03253a 100644
>--- a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>@@ -822,7 +822,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
>=20
> /*  */
> /*  Description: */
>-/* 	RTL8723e card disable power sequence v003 which suggested by Scott=
=2E */
>+/*	RTL8723e card disable power sequence v003 which suggested by Scott=2E=
 */
> /*  */
> /*  First created by tynli=2E 2011=2E01=2E28=2E */
> /*  */
>@@ -834,7 +834,7 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
adapter)
> 	/*  Run LPS WL RFOFF flow */
> 	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INT=
F_SDIO_MSK, rtl8723B_enter_lps_flow);
>=20
>-	/* 	=3D=3D=3D=3D Reset digital sequence   =3D=3D=3D=3D=3D=3D */
>+	/*	=3D=3D=3D=3D Reset digital sequence   =3D=3D=3D=3D=3D=3D */
>=20
> 	val =3D rtw_read8(padapter, REG_MCUFWDL);
> 	if ((val & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
>@@ -857,7 +857,7 @@ static void CardDisableRTL8723BSdio(struct adapter *p=
adapter)
> 	val |=3D BIT(0);
> 	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
>=20
>-	/* 	=3D=3D=3D=3D Reset digital sequence end =3D=3D=3D=3D=3D=3D */
>+	/*	=3D=3D=3D=3D Reset digital sequence end =3D=3D=3D=3D=3D=3D */
>=20
> 	bMacPwrCtrlOn =3D false;	/*  Disable CMD53 R/W */
> 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
>@@ -959,13 +959,13 @@ void rtl8723bs_interface_configure(struct adapter *=
padapter)
> }
>=20
> /*  */
>-/* 	Description: */
>-/* 		We should set Efuse cell selection to WiFi cell in default=2E */
>+/*	Description: */
>+/*		We should set Efuse cell selection to WiFi cell in default=2E */
> /*  */
>-/* 	Assumption: */
>-/* 		PASSIVE_LEVEL */
>+/*	Assumption: */
>+/*		PASSIVE_LEVEL */
> /*  */
>-/* 	Added by Roger, 2010=2E11=2E23=2E */
>+/*	Added by Roger, 2010=2E11=2E23=2E */
> /*  */
> static void _EfuseCellSel(struct adapter *padapter)
> {
>@@ -1051,7 +1051,7 @@ static void _ReadEfuseInfo8723BS(struct adapter *pa=
dapter)
> static void _ReadPROMContent(struct adapter *padapter)
> {
> 	struct eeprom_priv *pEEPROM =3D GET_EEPROM_EFUSE_PRIV(padapter);
>-	u8 	eeValue;
>+	u8 eeValue;
>=20
> 	eeValue =3D rtw_read8(padapter, REG_9346CR);
> 	/*  To check system boot selection=2E */
>@@ -1062,11 +1062,11 @@ static void _ReadPROMContent(struct adapter *pada=
pter)
> }
>=20
> /*  */
>-/* 	Description: */
>-/* 		Read HW adapter information by E-Fuse or EEPROM according CR9346 re=
ported=2E */
>+/*	Description: */
>+/*		Read HW adapter information by E-Fuse or EEPROM according CR9346 rep=
orted=2E */
> /*  */
>-/* 	Assumption: */
>-/* 		PASSIVE_LEVEL (SDIO interface) */
>+/*	Assumption: */
>+/*		PASSIVE_LEVEL (SDIO interface) */
> /*  */
> /*  */
> static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
>@@ -1179,14 +1179,14 @@ void SetHwRegWithBuf8723B(struct adapter *padapte=
r, u8 variable, u8 *pbuf, int l
> }
>=20
> /*  */
>-/* 	Description: */
>-/* 		Query setting of specified variable=2E */
>+/*	Description: */
>+/*		Query setting of specified variable=2E */
> /*  */
> u8 GetHalDefVar8723BSDIO(
> 	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
> )
> {
>-	u8 	bResult =3D _SUCCESS;
>+	u8 bResult =3D _SUCCESS;
>=20
> 	switch (eVariable) {
> 	case HAL_DEF_IS_SUPPORT_ANT_DIV:

LGTM=2E
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
