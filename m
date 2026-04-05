Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E9E344D8C
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 13:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775394131; cv=none; b=cjuOmyyHHs/qRjhzTgnoAtzZAP+hXdT6my7F73UuxRV9IHUSCSXxl3KZ+JpCMmv4jhvKzfBac/8oLd0/jYk+cy/ilGHHHpcSgkGBDIMZymgIVSGisCXgAkE2WLeCl6liBkeKxxUyETVNtqWZQKYRJq+9GrL3Qk/tzX5g4Jl/Iys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775394131; c=relaxed/simple;
	bh=vKl+da08tKy/5ohTIlpS3cu0vuMay75ezIasg7X46uw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=R2BYpReAsunDywmo9R1TQatqJ9GfLnRs9RA6LqHnDl2FIwdh8qv8RZQhQ9U/1FUvSeGYEUzT21Qspnj1iztZQZtozpqOh8jjBmsVEAuJBfE3G0/ho4W2H2DZuSsDq9PZW0UiRX/HApRT9g9vkcgPXI3hJIdiiF+tmg9D86xjO14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=v4CSRzeB; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="v4CSRzeB"
Date: Sun, 05 Apr 2026 15:01:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775394126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O9I3Gc+U490PVfOFS7g8REjthQhxiI1+ksc8FeliMy0=;
	b=v4CSRzeBwZLdnfafoFDp/W9aoXh7grdv+kpmrB+KNzXcDgh9rbXMQa2Z/knFTvppc2W1kb
	ajVf6HtXLjXlRjKnBq+VFTaLnWskKCfHxe93+vj3DuFWmpMkRwjW6JlIz7Cilr1+PxKd1w
	mBSalrFzcsAlhptMnBps5bJ6s8EqDvQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Prithvi Tambewagh <activprithvi@gmail.com>, gregkh@linuxfoundation.org,
 abrahamadekunle50@gmail.com, b9788213@gmail.com, straube.linux@gmail.com,
 ethantidmore06@gmail.com, andriy.shevchenko@linux.intel.com,
 dan.carpenter@linaro.org, weibu@redadmin.org, knavaneeth786@gmail.com,
 ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFT_PATCH_v3_0/5=5D_staging=3A_rtl8723bs=3A?=
 =?US-ASCII?Q?_Code_cleanup_in_drivers/staging/rtl8723bs?=
In-Reply-To: <20260405114132.310774-1-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com>
Message-ID: <7E2F475C-4B51-4D5A-B110-A8A796124A0B@linux.dev>
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

On April 5, 2026 1:41:27 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gmai=
l=2Ecom> wrote:
>This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
>majorly focusing on fixing checkpatch warnings of constant being on right
>side of test in comparisons, deletion of empty if block ,use of=20
>read_poll_timeout_atomic(), and other code simplifications=2E
>
>v2 link: https://lore=2Ekernel=2Eorg/linux-staging/20260403094647=2Efmgop=
6xh2cjpit3s@inspiron/T/#m3d08fd012119772e>
>v1 link: https://lore=2Ekernel=2Eorg/linux-staging/20260323145214=2Eubhsh=
y2gwp52j5zh@inspiron/T/#mc3b693b37c49fbdd>
>
>Note:
>1=2E I found that for this change in v2:
>
>-       if (
>-               (false =3D=3D pHalData->bDisableSWChannelPlan) &&
>-               rtw_is_channel_plan_valid(sw_channel_plan)
>-       )
>+       if (!pHalData->bDisableSWChannelPlan &&
>+           rtw_is_channel_plan_valid(sw_channel_plan))
>
>for this code, checkpatch gave the check:
>
>CHECK: Using comparison to false is error prone
>#126: FILE: drivers/staging/rtl8723bs/hal/hal_com=2Ec:126:
>+               (false =3D=3D pHalData->bDisableSWChannelPlan) &&
>
>which is a different logical change than the ones covered in this patch s=
eries=2E
>Hence, to keep the patch series to a reasonable length and since this is =
RFT
>path series, I did not consider this change right now=2E
>
>2=2E This change in v2:
>
>        if (BandWidth =3D=3D CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
>-               if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>+               if (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7)
>                        txPower +=3D pHalData->BW20_24G_Diff[RFPath][TX_1=
S];
>        } else if (BandWidth =3D=3D CHANNEL_WIDTH_40) { /*  BW40-1S, BW40=
-2S */
>-               if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>+               if (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7)
>                        txPower +=3D pHalData->BW40_24G_Diff[RFPath][TX_1=
S];
>        }
>
>can be reformatted as:
>
>diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec b/drivers/s=
taging/rtl8723bs/hal/hal_com_phycfg=2Ec
>index 9e523491a008=2E=2Eefd1c76f2953 100644
>--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec
>@@ -469,11 +469,10 @@ u8 PHY_GetTxPowerIndexBase(
>        if ((Rate >=3D MGN_6M && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate)=
)
>                txPower +=3D pHalData->OFDM_24G_Diff[RFPath][TX_1S];
>=20
>-       if (BandWidth =3D=3D CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
>-               if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>+       if (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7) {
>+               if (BandWidth =3D=3D CHANNEL_WIDTH_20) /*  BW20-1S, BW20-=
2S */
>                        txPower +=3D pHalData->BW20_24G_Diff[RFPath][TX_1=
S];
>-       } else if (BandWidth =3D=3D CHANNEL_WIDTH_40) { /*  BW40-1S, BW40=
-2S */
>-               if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>+               else if (BandWidth =3D=3D CHANNEL_WIDTH_40) /*  BW40-1S, =
BW40-2S */
>                        txPower +=3D pHalData->BW40_24G_Diff[RFPath][TX_1=
S];
>for which it is sent as a separate patch - patch 5 in this series=2E
>
>3=2E I found, in drivers/staging/rtl8723bs/hal/odm=2Eh:
>
>struct odm_rate_adaptive {
>        u8 Type;                                /*  DM_Type_ByFW/DM_Type_=
ByDriver */
>        u8 LdpcThres;                   /*  if RSSI > LdpcThres =3D> swit=
ch from LPDC to BCC */
>        bool bUseLdpc;
>        bool bLowerRtsRate;
>        u8 HighRSSIThresh;              /*  if RSSI > HighRSSIThresh    =
=3D> RATRState is DM_RATR_STA_HIGH */
>        u8 LowRSSIThresh;               /*  if RSSI <=3D LowRSSIThresh   =
 =3D> RATRState is DM_RATR_STA_LOW */
>        u8 RATRState;                   /*  Current RSSI level, DM_RATR_S=
TA_HIGH/DM_RATR_STA_MIDDLE/DM_RATR_>
>
>};
>
>and based on the explanation of parameters HighRSSIThresh & LowRSSIThresh=
=20
>I thought this change:
>
>diff --git a/drivers/staging/rtl8723bs/hal/odm=2Ec b/drivers/staging/rtl8=
723bs/hal/odm=2Ec
>index 639b6da2302b=2E=2Eca4495f101fd 100644
>--- a/drivers/staging/rtl8723bs/hal/odm=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/odm=2Ec
>@@ -343,9 +343,9 @@ bool ODM_RAStateCheck(
>        }
>=20
>        /*  Decide RATRState by RSSI=2E */
>-       if (RSSI > HighRSSIThreshForRA)
>+       if (HighRSSIThreshForRA < RSSI)
>                RATRState =3D DM_RATR_STA_HIGH;
>-       else if (RSSI > LowRSSIThreshForRA)
>+       else if (LowRSSIThreshForRA < RSSI)=20
>                RATRState =3D DM_RATR_STA_MIDDLE;
>       else
>                RATRState =3D DM_RATR_STA_LOW;
>
>doesn't seem to be right, thats why I dropped this change as well=2E
>
>4=2E This patch series is compile tested using the following commands, wh=
ich
>   include setting the necessary configurations:
>        1=2E make defconfig
>        2=2E scripts/config --enable CONFIG_STAGING
>        3=2E scripts/config --module CONFIG_MMC
>        4=2E scripts/config --module CONFIG_RTL8723BS
>        5=2E make olddefconfig
>        6=2E make -j$(nproc)
>        7=2E git rebase -i --exec "make -j$(nproc) M=3Ddrivers/staging/rt=
l8723bs" HEAD~5=20
>
>The final rebase --exec gave a successful output:
>
>Executing: make -j12 M=3Ddrivers/staging/rtl8723bs
>make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723b=
s'
>  CC [M]  core/rtw_ap=2Eo
>  CC [M]  core/rtw_btcoex=2Eo
>  CC [M]  core/rtw_cmd=2Eo
>  CC [M]  core/rtw_efuse=2Eo
>  CC [M]  core/rtw_io=2Eo
>  CC [M]  core/rtw_ioctl_set=2Eo
>  CC [M]  core/rtw_ieee80211=2Eo
>  CC [M]  core/rtw_mlme=2Eo
>  CC [M]  core/rtw_mlme_ext=2Eo
>  CC [M]  core/rtw_pwrctrl=2Eo
>  CC [M]  core/rtw_recv=2Eo
>  CC [M]  core/rtw_security=2Eo
>  CC [M]  core/rtw_sta_mgt=2Eo
>  CC [M]  core/rtw_wlan_util=2Eo
>  CC [M]  core/rtw_xmit=2Eo
>  CC [M]  hal/hal_intf=2Eo
>  CC [M]  hal/hal_com=2Eo
>  CC [M]  hal/hal_com_phycfg=2Eo
>  CC [M]  hal/hal_btcoex=2Eo
>  CC [M]  hal/hal_sdio=2Eo
>  CC [M]  hal/hal_pwr_seq=2Eo
>  CC [M]  hal/HalPhyRf=2Eo
>  CC [M]  hal/HalPwrSeqCmd=2Eo
>  CC [M]  hal/odm_CfoTracking=2Eo
>  CC [M]  hal/odm=2Eo
>  CC [M]  hal/odm_DIG=2Eo
>  CC [M]  hal/odm_DynamicBBPowerSaving=2Eo
>  CC [M]  hal/odm_DynamicTxPower=2Eo
>  CC [M]  hal/odm_EdcaTurboCheck=2Eo
>  CC [M]  hal/odm_HWConfig=2Eo
>  CC [M]  hal/odm_RegConfig8723B=2Eo
>  CC [M]  hal/rtl8723b_cmd=2Eo
>  CC [M]  hal/rtl8723b_dm=2Eo
>  CC [M]  hal/rtl8723b_hal_init=2Eo
>  CC [M]  hal/rtl8723b_phycfg=2Eo
>  CC [M]  hal/rtl8723b_rf6052=2Eo
>  CC [M]  hal/rtl8723b_rxdesc=2Eo
>  CC [M]  hal/rtl8723bs_recv=2Eo
>  CC [M]  hal/rtl8723bs_xmit=2Eo
>  CC [M]  hal/sdio_halinit=2Eo
>  CC [M]  hal/sdio_ops=2Eo
>  CC [M]  hal/HalBtc8723b1Ant=2Eo
>  CC [M]  hal/HalBtc8723b2Ant=2Eo
>  CC [M]  hal/HalHWImg8723B_BB=2Eo
>  CC [M]  hal/HalHWImg8723B_MAC=2Eo
>  CC [M]  hal/HalHWImg8723B_RF=2Eo
>  CC [M]  hal/HalPhyRf_8723B=2Eo
>  CC [M]  os_dep/ioctl_cfg80211=2Eo
>  CC [M]  os_dep/osdep_service=2Eo
>  CC [M]  os_dep/os_intfs=2Eo
>  CC [M]  os_dep/sdio_intf=2Eo
>  CC [M]  os_dep/sdio_ops_linux=2Eo
>  CC [M]  os_dep/wifi_regd=2Eo
>  CC [M]  os_dep/xmit_linux=2Eo
>  LD [M]  r8723bs=2Eo
>  MODPOST Module=2Esymvers
>  CC [M]  r8723bs=2Emod=2Eo
>  CC [M]  =2Emodule-common=2Eo
>  LD [M]  r8723bs=2Eko
>make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs=
'
>Executing: make -j12 M=3Ddrivers/staging/rtl8723bs
>make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723b=
s'
>  CC [M]  hal/HalPhyRf_8723B=2Eo
>  LD [M]  r8723bs=2Eo
>  MODPOST Module=2Esymvers
>  CC [M]  r8723bs=2Emod=2Eo
>  LD [M]  r8723bs=2Eko
>make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs=
'
>Executing: make -j12 M=3Ddrivers/staging/rtl8723bs
>make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723b=
s'
>  CC [M]  core/rtw_ap=2Eo
>  CC [M]  core/rtw_btcoex=2Eo
>  CC [M]  core/rtw_cmd=2Eo
>  CC [M]  core/rtw_efuse=2Eo
>  CC [M]  core/rtw_io=2Eo
>  CC [M]  core/rtw_ioctl_set=2Eo
>  CC [M]  core/rtw_ieee80211=2Eo
>  CC [M]  core/rtw_mlme=2Eo
>  CC [M]  core/rtw_mlme_ext=2Eo
>  CC [M]  core/rtw_pwrctrl=2Eo
>  CC [M]  core/rtw_recv=2Eo
>  CC [M]  core/rtw_security=2Eo
>  CC [M]  core/rtw_sta_mgt=2Eo
>  CC [M]  core/rtw_wlan_util=2Eo
>  CC [M]  core/rtw_xmit=2Eo
>  CC [M]  hal/hal_intf=2Eo
>  CC [M]  hal/hal_com=2Eo
>  CC [M]  hal/hal_com_phycfg=2Eo
>  CC [M]  hal/hal_btcoex=2Eo
>  CC [M]  hal/hal_sdio=2Eo
>  CC [M]  hal/hal_pwr_seq=2Eo
>  CC [M]  hal/HalPhyRf=2Eo
>  CC [M]  hal/HalPwrSeqCmd=2Eo
>  CC [M]  hal/odm=2Eo
>  CC [M]  hal/odm_CfoTracking=2Eo
>  CC [M]  hal/odm_DIG=2Eo
>  CC [M]  hal/odm_DynamicBBPowerSaving=2Eo
>  CC [M]  hal/odm_DynamicTxPower=2Eo
>  CC [M]  hal/odm_EdcaTurboCheck=2Eo
>  CC [M]  hal/odm_HWConfig=2Eo
>  CC [M]  hal/odm_RegConfig8723B=2Eo
>  CC [M]  hal/rtl8723b_cmd=2Eo
>  CC [M]  hal/rtl8723b_dm=2Eo
>  CC [M]  hal/rtl8723b_hal_init=2Eo
>  CC [M]  hal/rtl8723b_phycfg=2Eo
>  CC [M]  hal/rtl8723b_rf6052=2Eo
>  CC [M]  hal/rtl8723b_rxdesc=2Eo
>  CC [M]  hal/rtl8723bs_recv=2Eo
>  CC [M]  hal/rtl8723bs_xmit=2Eo
>  CC [M]  hal/sdio_halinit=2Eo
>  CC [M]  hal/sdio_ops=2Eo
>  CC [M]  hal/HalBtc8723b1Ant=2Eo
>  CC [M]  hal/HalBtc8723b2Ant=2Eo
>  CC [M]  hal/HalHWImg8723B_BB=2Eo
>  CC [M]  hal/HalHWImg8723B_MAC=2Eo
>  CC [M]  hal/HalHWImg8723B_RF=2Eo
>  CC [M]  hal/HalPhyRf_8723B=2Eo
>  CC [M]  os_dep/ioctl_cfg80211=2Eo
>  CC [M]  os_dep/osdep_service=2Eo
>  CC [M]  os_dep/os_intfs=2Eo
>  CC [M]  os_dep/sdio_intf=2Eo
>  CC [M]  os_dep/sdio_ops_linux=2Eo
>  CC [M]  os_dep/wifi_regd=2Eo
>  CC [M]  os_dep/xmit_linux=2Eo
>  LD [M]  r8723bs=2Eo
>  MODPOST Module=2Esymvers
>  LD [M]  r8723bs=2Eko
>make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs=
'
>Executing: make -j12 M=3Ddrivers/staging/rtl8723bs
>make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723b=
s'
>  CC [M]  hal/rtl8723b_cmd=2Eo
>  LD [M]  r8723bs=2Eo
>  MODPOST Module=2Esymvers
>  CC [M]  r8723bs=2Emod=2Eo
>  LD [M]  r8723bs=2Eko
>make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs=
'
>Executing: make -j12 M=3Ddrivers/staging/rtl8723bs
>make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723b=
s'
>  CC [M]  hal/hal_com_phycfg=2Eo
>  LD [M]  r8723bs=2Eo
>  MODPOST Module=2Esymvers
>  CC [M]  r8723bs=2Emod=2Eo
>  LD [M]  r8723bs=2Eko
>make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs=
'
>Successfully rebased and updated refs/heads/staging-realtek-patch-series=
=2E
>
>However, since I currently don't have rtl8723bs hardware I am unfortunate=
ly
>unable to do runtime testing for this patch series=2E
>
>Prithvi Tambewagh (5):
>  staging: rtl8723bs: move constant to right side of test in comparison
>  staging: rtl8723bs: remove empty if statement block
>  staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
>  staging: rtl8723bs: use read_poll_timeout_atomic in
>    _is_fw_read_cmd_down
>  staging: rtl8723bs: remove duplicate rate checks in
>    PHY_GetTxPowerIndexBase()
>
> =2E=2E=2E/staging/rtl8723bs/hal/HalBtc8723b2Ant=2Ec    |  4 ++--
> drivers/staging/rtl8723bs/hal/HalPhyRf_8723B=2Ec |  5 +----
> drivers/staging/rtl8723bs/hal/hal_com=2Ec        |  2 +-
> drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec | 11 +++++------
> drivers/staging/rtl8723bs/hal/rtl8723b_cmd=2Ec   | 18 +++++++-----------
> =2E=2E=2E/staging/rtl8723bs/hal/rtl8723b_hal_init=2Ec  | 18 +++++++++---=
------
> drivers/staging/rtl8723bs/hal/rtl8723bs_xmit=2Ec |  2 +-
> drivers/staging/rtl8723bs/include/ieee80211=2Eh  |  4 ++--
> drivers/staging/rtl8723bs/include/wifi=2Eh       |  5 +----
> 9 files changed, 29 insertions(+), 40 deletions(-)
>

Hi Prithvi,
You do not need to provide compilation output in cover letter, also=20
since these are only style changes, I believe testing is not=20
necessary=2E Furthermore, it would be better to list changes in v2/v3=20
rather than pasting code snippets here=2E
Best regards,
Luka Gejak
