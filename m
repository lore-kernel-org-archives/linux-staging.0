Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21F3AF664
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 09:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827173; cv=none; b=rzBOp+Wy0xu2aNjTliti73URKnmOjG4qsyaH7YdlrqLgogMkurmVco6z0yq/C2UJ9V7sz2R+nyU8gzLv8iT5B4SQ6Pwx95vcq40tzz4gLexIUQpENm5DvCfCywF7Vbp+F4ExDZ4VsEA7cnE4DbnoTqqfc5v3wDqCtioU38qj6vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827173; c=relaxed/simple;
	bh=igU83HtYO7tFU/f5vlXLLCBce+I4gWeQj3A1ix0Niec=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BJ7siFs1khxjvQIfHzjSS8CFa0lKSWDyzaKn8mX/CeTtd5oePOjx97jOOrwstdXftuP4ZvEMHLe0F7z9yx9yQ3aqmke2hUtSrfPiINKLteG9TrjYL3RA6g/Pl8VX4OQctuhfYTZvETnGu18vRhLvy3mXvq+zcs24kQtpGGc5ljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EBQv1KbQ; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EBQv1KbQ"
Date: Wed, 18 Mar 2026 10:45:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773827153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIm9Od/Zh0T9DP9p96tTedNLMh0fsmk6QJWAjCriR/Y=;
	b=EBQv1KbQZZhTyNmDFoEPAWmyNEUbTpEa57K+gIbbKSwIydpk0G+ojP2PcFH6fMCbq/PYot
	Yzumqn/3xlW2FRfzSXJow18bNpJ6qItE9AoJmyVrVzGc8XhFRbsWkhyg388zjdp2JX7anQ
	PCTv5XPUZ7+ljzltx3N+qTuBnrJWG00=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>, gregkh@linuxfoundation.org
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 straube.linux@gmail.com, dan.carpenter@linaro.org, ethantidmore06@gmail.com,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_=5BPATCH=5D_staging=3A_rtl8723bs=3A_c?=
 =?US-ASCII?Q?lean_up_coding_style_in_sdio=5Fhalinit=2Ec_V2?=
In-Reply-To: <20260318092639.27055-1-aadarshmandal9354@gmail.com>
References: <46281493-328B-478A-985D-8F7A9218441A@linux.dev> <20260318092639.27055-1-aadarshmandal9354@gmail.com>
Message-ID: <80CB87F0-7F01-4E5C-BD38-45BC93297C49@linux.dev>
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

Hi Aadarsh,

Thanks for sending the v2=2E It is great that you are working on these cle=
anups!

However, it looks like something went wrong with your local git tree when =
generating this patch=2E Instead of removing the dead code, this patch actu=
ally adds 161 lines to the file=2E It re-adds the commented-out code (e=2Eg=
=2E, `+/* sdio_AggSettingTxUpdate(padapter); */`) and inserts several large=
 functions that shouldn't be part of a simple style cleanup=2E=20

You might have accidentally reverted your changes, diffed against the wron=
g branch, or merged something incorrectly=2E I recommend doing a fresh "git=
 fetch" from the staging tree, creating a new branch, and doing the cleanup=
s again=2E

Also, for your v3, here are two quick formatting tips for the patch email:

1=2E Subject Line: Your subject currently says "[PATCH] [PATCH] =2E=2E=2E =
V2"=2E The standard kernel format is "[PATCH v2] staging: rtl8723bs: clean =
up=2E=2E=2E"=2E You can generate this automatically by using the "-v" flag:=
  "git format-patch -v3 =2E=2E=2E"

2=2E Changelog Placement: Your version history ("update since v1=2E=2E=2E"=
) is currently in the main commit body=2E Anything above the "---" line bec=
omes the permanent commit message in the Linux kernel history=2E=20

For a single patch, you should place your changelog notes below the "---" =
line so they are dropped when the maintainer applies the patch=2E Alternati=
vely, if you decide to break your cleanups into multiple patches (a patch s=
eries), you should generate a cover letter ("git format-patch -v3 --cover-l=
etter =2E=2E=2E") and put your version history in the cover letter instead=
=2E

Always double-check your generated "=2Epatch" file with a text editor or "=
cat" before sending to make sure the diff only contains the exact lines you=
 intended to change=2E

Also, for future versions of this series or any further discussions, pleas=
e use my developer address luka=2Egejak@linux=2Edev in the CC list instead =
of my Gmail account=2E This helps me keep my kernel work organized and cons=
istent with my own patches=2E

Looking forward to v3!

Best regards,
Luka Gejak

On March 18, 2026 10:26:39 AM GMT+01:00, Aadarsh Mandal <aadarshmandal9354=
@gmail=2Ecom> wrote:
>update since v1:
>- fixed the changes mentioned by the Luka Gejak
>- removed the commented code and space
>
>Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail=2Ecom>
>---
>Note:
>* This patch is part of the GSoC2026 application process for device tree =
bindings conversions
>* https://github=2Ecom/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-De=
vice-Tree-Bindings
>
> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 163 ++++++++++++++++++-
> 1 file changed, 161 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/sta=
ging/rtl8723bs/hal/sdio_halinit=2Ec
>index 1026554bcff0=2E=2E063a0737933e 100644
>--- a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>@@ -6,7 +6,6 @@
>  ***********************************************************************=
*******/
> #include <drv_types=2Eh>
> #include <rtl8723b_hal=2Eh>
>-
> #include "hal_com_h2c=2Eh"
> /*
>  * Description:
>@@ -69,8 +68,8 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
> 	rtw_write16(padapter, REG_APS_FSMCO, value16);
>=20
> 	/*  Enable CMD53 R/W Operation */
>-
> 	rtw_write8(padapter, REG_CR, 0x00);
>+
> 	/*  Enable MAC DMA/WMAC/SCHEDULE/SEC block */
> 	value16 =3D rtw_read16(padapter, REG_CR);
> 	value16 |=3D (
>@@ -483,6 +479,158 @@ static void _initSdioAggregationSetting(struct adap=
ter *padapter)
> 	struct hal_com_data	*pHalData =3D GET_HAL_DATA(padapter);
>=20
> 	/*  Tx aggregation setting */
>+/*	sdio_AggSettingTxUpdate(padapter); */
>+
>+	/*  Rx aggregation setting */
>+	HalRxAggr8723BSdio(padapter);
>+
>+	sdio_AggSettingRxUpdate(padapter);
>+
>+	/*  201/12/10 MH Add for USB agg mode dynamic switch=2E */
>+	pHalData->UsbRxHighSpeedMode =3D false;
>+}
>+
>+static void _InitOperationMode(struct adapter *padapter)
>+{
>+	struct mlme_ext_priv *pmlmeext;
>+	u8 regBwOpMode =3D 0;
>+
>+	pmlmeext =3D &padapter->mlmeextpriv;
>+
>+	/* 1 This part need to modified according to the rate set we filtered!!=
 */
>+	/*  */
>+	/*  Set RRSR, RATR, and REG_BWOPMODE registers */
>+	/*  */
>+	switch (pmlmeext->cur_wireless_mode) {
>+	case WIRELESS_MODE_B:
>+		regBwOpMode =3D BW_OPMODE_20MHZ;
>+		break;
>+	case WIRELESS_MODE_G:
>+		regBwOpMode =3D BW_OPMODE_20MHZ;
>+		break;
>+	case WIRELESS_MODE_AUTO:
>+		regBwOpMode =3D BW_OPMODE_20MHZ;
>+		break;
>+	case WIRELESS_MODE_N_24G:
>+		/*  It support CCK rate by default=2E */
>+		/*  CCK rate will be filtered out only when associated AP does not sup=
port it=2E */
>+		regBwOpMode =3D BW_OPMODE_20MHZ;
>+		break;
>+
>+	default: /* for MacOSX compiler warning=2E */
>+		break;
>+	}
>+
>+	rtw_write8(padapter, REG_BWOPMODE, regBwOpMode);
>+}
>+
>+static void _InitInterrupt(struct adapter *padapter)
>+{
>+	/*  HISR - turn all off */
>+	rtw_write32(padapter, REG_HISR, 0);
>+
>+	/*  HIMR - turn all off */
>+	rtw_write32(padapter, REG_HIMR, 0);
>+
>+	/*  */
>+	/*  Initialize and enable SDIO Host Interrupt=2E */
>+	/*  */
>+	InitInterrupt8723BSdio(padapter);
>+
>+	/*  */
>+	/*  Initialize system Host Interrupt=2E */
>+	/*  */
>+	InitSysInterrupt8723BSdio(padapter);
>+}
>+
>+static void _InitRFType(struct adapter *padapter)
>+{
>+	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
>+
>+	pHalData->rf_chip	=3D RF_6052;
>+}
>+
>+static void _RfPowerSave(struct adapter *padapter)
>+{
>+/* YJ, TODO */
>+}
>+
>+/*  */
>+/*  2010/08/09 MH Add for power down check=2E */
>+/*  */
>+static bool HalDetectPwrDownMode(struct adapter *Adapter)
>+{
>+	u8 tmpvalue;
>+	struct hal_com_data *pHalData =3D GET_HAL_DATA(Adapter);
>+	struct pwrctrl_priv *pwrctrlpriv =3D adapter_to_pwrctl(Adapter);
>+
>+	EFUSE_ShadowRead(Adapter, 1, 0x7B/*EEPROM_RF_OPT3_92C*/, (u32 *)&tmpval=
ue);
>+
>+	/*  2010/08/25 MH INF priority > PDN Efuse value=2E */
>+	if (tmpvalue & BIT4 && pwrctrlpriv->reg_pdnmode)
>+		pHalData->pwrdown =3D true;
>+	else
>+		pHalData->pwrdown =3D false;
>+
>+	return pHalData->pwrdown;
>+}	/*  HalDetectPwrDownMode */
>+
>+u32 rtl8723bs_hal_init(struct adapter *padapter)
>+{
>+	s32 ret;
>+	struct hal_com_data *pHalData;
>+	struct pwrctrl_priv *pwrctrlpriv;
>+	u32 NavUpper =3D WiFiNavUpperUs;
>+	u8 val;
>+
>+	pHalData =3D GET_HAL_DATA(padapter);
>+	pwrctrlpriv =3D adapter_to_pwrctl(padapter);
>+
>+	if (
>+		adapter_to_pwrctl(padapter)->bips_processing =3D=3D true &&
>+		adapter_to_pwrctl(padapter)->pre_ips_type =3D=3D 0
>+	) {
>+		unsigned long start_time;
>+		u8 cpwm_orig, cpwm_now;
>+		u8 val8, bMacPwrCtrlOn =3D true;
>+
>+		/* for polling cpwm */
>+		cpwm_orig =3D 0;
>+		rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_orig);
>+
>+		/* set rpwm */
>+		val8 =3D rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
>+		val8 &=3D 0x80;
>+		val8 +=3D 0x80;
>+		val8 |=3D BIT(6);
>+		rtw_write8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1, val8);
>+		adapter_to_pwrctl(padapter)->tog =3D (val8 + 0x80) & 0x80;
>+
>+		/* do polling cpwm */
>+		start_time =3D jiffies;
>+		do {
>+			mdelay(1);
>+
>+			rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_now);
>+			if ((cpwm_orig ^ cpwm_now) & 0x80)
>+				break;
>+
>+			if (jiffies_to_msecs(jiffies - start_time) > 100)
>+				break;
>+
>+		} while (1);
>+
>+		rtl8723b_set_FwPwrModeInIPS_cmd(padapter, 0);
>+
>+		rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
>+
>+		hal_btcoex_InitHwConfig(padapter, false);
>+
>+		return _SUCCESS;
>+	}
>+
>+	/*  Disable Interrupt first=2E */
>+/*	rtw_hal_disable_interrupt(padapter); */
>=20
> 	ret =3D _InitPowerOn_8723BS(padapter);
> 	if (ret =3D=3D _FAIL)
>@@ -588,6 +739,8 @@ static void _initSdioAggregationSetting(struct adapte=
r *padapter)
>=20
> 	/*  Record original value for template=2E This is arough data, we can o=
nly use the data */
> 	/*  for power adjust=2E The value can not be adjustde according to diff=
erent power!!! */
>+/*	pHalData->OriginalCckTxPwrIdx =3D pHalData->CurrentCckTxPwrIdx; */
>+/*	pHalData->OriginalOfdm24GTxPwrIdx =3D pHalData->CurrentOfdm24GTxPwrId=
x; */
>=20
> 	rtl8723b_InitAntenna_Selection(padapter);
>=20
>@@ -630,6 +783,7 @@ static void _initSdioAggregationSetting(struct adapte=
r *padapter)
> 	/* ack for xmit mgmt frames=2E */
> 	rtw_write32(padapter, REG_FWHW_TXQ_CTRL, rtw_read32(padapter, REG_FWHW_=
TXQ_CTRL) | BIT(12));
>=20
>+/*	pHalData->PreRpwmVal =3D SdioLocalCmd52Read1Byte(padapter, SDIO_REG_H=
RPWM1) & 0x80; */
>=20
> 	{
> 		pwrctrlpriv->rf_pwrstate =3D rf_on;
>@@ -918,6 +1072,8 @@ static void _ReadPROMContent(struct adapter *padapte=
r)
> 	pEEPROM->EepromOrEfuse =3D (eeValue & BOOT_FROM_EEPROM) ? true : false;
> 	pEEPROM->bautoload_fail_flag =3D (eeValue & EEPROM_EN) ? false : true;
>=20
>+/*	pHalData->EEType =3D IS_BOOT_FROM_EEPROM(Adapter) ? EEPROM_93C46 : EE=
PROM_BOOT_EFUSE; */
>+
> 	_ReadEfuseInfo8723BS(padapter);
> }
>=20
