Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC6A23535E
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676722; cv=none; b=LCIZotGYKBheq8UyEBIG5bGniQVtIXCJN7h4SEDxAzVietwaNhNpgb0zgeESzzKKyZ+xo/7JemSqQccwSXd9JCWLjZ3oTFeNLpCpSKv3Eutse8G5UGPL/qOxoCZe0qsAT9yPe7Q2YyA5Nh1cqgepZNGbovKzgJ95syQxUXHLp80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676722; c=relaxed/simple;
	bh=vZrf20GKAPFUKLVSFlUjVLL4jly5kgKFKHr7XbMl1XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tl0w0K1Q7/HXtV1MqcTS7r6LKvDxBYQhLIcfcM5WoahrxT8tUpE6aBgpHad5KdNjPCOcCdg6Ay3/6GSfJIC5IRO7h/tmkcfVY0WMuN+gmyJgrWI1hdMo8VocL3JFWJuBlhEOBaUjZPNQJSxDT9tt3lWNvM51Hs2NrhMZleWWaik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3I0NSoU; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3I0NSoU"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82ce09b61beso73584b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775676719; x=1776281519; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CPaJ+H7LBZA4DJEQT1k+JmDVy1NMUCuI/xA7eobHm5Y=;
        b=n3I0NSoUsP/JyDCwFktRSrl9DSSFO2GsdTc9z42x0suxZz0dl/HDppvXFGbC7AOSbx
         GT/wsT6GAgB1c9oq2t3gGIcUh2i6h6k2NpI9fGENx0iLeEAUqEhvimhaei0FzmxgJPwu
         bNUUCGmNchJP7xu5Nj05HRlmm/kReVoUyZOeLwaJp/Da5oJwH1sUbETabfY8qSBHdiMF
         ZQavfKmGe7E7XaUW/b9fZFGKrRhXYXHt6FWriFdJ7IHynHfAPCzXXkq0nXzKYAzGuK0i
         2bGxtK1LSlPNB4Jv8OZ3cDRQ6dHLwXAkaaKv8yznzA9MVpboWjjRFrT59F4xhWACBaNT
         z6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775676719; x=1776281519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CPaJ+H7LBZA4DJEQT1k+JmDVy1NMUCuI/xA7eobHm5Y=;
        b=JCQqMW7VvAJTFsQ9q3c4yEhpZHH/ND97LGV06f8nxODfT3O7TgFGIRQKuhWWcvj+eA
         x30CzruaNP11WlFnOxpf1GrcxPwCFQhPtoiR9hGhjgEeONCqtYby3HTWYNurBg6wTYyt
         uc2FpnYa8zubeUtWVVx5H+3eXlu0pYrc/b85HPiNDFd5v3GZg5gq247YCJvnGNQTtxK1
         jGL1xKmpui5lgf1JroIGtZBABKb5NLgsQV0c5cdO4qFifFhb5rJjGQ2Xh8YdJfhHY0Or
         024TD9XTfDaVfeHabBFoFLGEhXpzc/uE07SGzETb9IgH/NHZgqcxhUAK/cC5Hpw60tsh
         Beow==
X-Forwarded-Encrypted: i=1; AJvYcCVmdhO9CvwFpeTd7tNzyykZ9Nbc//RgVL/f2KssfpZ1ZAeiA2iXKoMyw8ykBL0aJ+z3gVhNG2wMMH8SKJE1@lists.linux.dev
X-Gm-Message-State: AOJu0YyCuS+wF+t+ljQSS8sZHryjoguc4ppi9d1bw98zgXM560oICIii
	zKE+TarkFWvubzsWEhSFDA4WQVlErbYL9/Heq5u1bXZHptPpQjyuGS2+XUFsbg==
X-Gm-Gg: AeBDietKLNA7HBbUYwhqPOnRPEAVjgPY1xW35jT4De/jLegxmVhNIqpY83VcCTQLV8l
	OrmHlkMOBG8UTaJZ0FedMZHaP05OaeKZgDCCl6cvFs9qFUWPhlVKATLXgOF7sSwjMg4kswBAlHJ
	BdriGKrxlzOnMevHXvlnxEh9ST8HeLL1BCjmYIVCGR0Tbx5FdxPLU0v9Jba34TKnh9me0reRIqd
	Gl/7YaC+Lq5mntI3xvoiM5r3v3wNrzda/MRSW1Eb4ba/N4fEtvfaYdUSoFc1GDG5zGoVuimq+vY
	oyBdCUsmqydVRQ9eTt907XmgQoAJRmRjuSdov+y1iArTAwCZLF7GRuJcjnppMI0LZtVoG417i0c
	eRyaHmMOP892c+zoz8QhKmz4mHQQBhzOl3Wj2pQ0b1iaL7kkxMZlQhNdlJ3Hcs86eUM0joNDPAq
	f44FKZqGhYfkC+Ptyn8WdzCaw=
X-Received: by 2002:a05:6a00:181f:b0:82d:29f:d003 with SMTP id d2e1a72fcca58-82d0da2af95mr22092466b3a.12.1775676718903;
        Wed, 08 Apr 2026 12:31:58 -0700 (PDT)
Received: from inspiron ([111.125.237.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9ca4efesm22248366b3a.61.2026.04.08.12.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 12:31:58 -0700 (PDT)
Date: Thu, 9 Apr 2026 01:01:47 +0530
From: Prithvi <activprithvi@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: gregkh@linuxfoundation.org, abrahamadekunle50@gmail.com,
	b9788213@gmail.com, straube.linux@gmail.com,
	ethantidmore06@gmail.com, andriy.shevchenko@linux.intel.com,
	dan.carpenter@linaro.org, weibu@redadmin.org,
	knavaneeth786@gmail.com, ignacio.pena87@gmail.com,
	dharanitharan725@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, suunj1331@gmail.com,
	ysinghcin@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: Re: [RFT PATCH v3 0/5] staging: rtl8723bs: Code cleanup in
 drivers/staging/rtl8723bs
Message-ID: <20260408193147.lpaswxqvkoyo7uqr@inspiron>
References: <20260405114132.310774-1-activprithvi@gmail.com>
 <7E2F475C-4B51-4D5A-B110-A8A796124A0B@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7E2F475C-4B51-4D5A-B110-A8A796124A0B@linux.dev>

On Sun, Apr 05, 2026 at 03:01:51PM +0200, Luka Gejak wrote:
> On April 5, 2026 1:41:27 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gmail.com> wrote:
> >This patch series focuses on code cleanup in drivers/staging/rtl8723bs,
> >majorly focusing on fixing checkpatch warnings of constant being on right
> >side of test in comparisons, deletion of empty if block ,use of 
> >read_poll_timeout_atomic(), and other code simplifications.
> >
> >v2 link: https://lore.kernel.org/linux-staging/20260403094647.fmgop6xh2cjpit3s@inspiron/T/#m3d08fd012119772e>
> >v1 link: https://lore.kernel.org/linux-staging/20260323145214.ubhshy2gwp52j5zh@inspiron/T/#mc3b693b37c49fbdd>
> >
> >Note:
> >1. I found that for this change in v2:
> >
> >-       if (
> >-               (false == pHalData->bDisableSWChannelPlan) &&
> >-               rtw_is_channel_plan_valid(sw_channel_plan)
> >-       )
> >+       if (!pHalData->bDisableSWChannelPlan &&
> >+           rtw_is_channel_plan_valid(sw_channel_plan))
> >
> >for this code, checkpatch gave the check:
> >
> >CHECK: Using comparison to false is error prone
> >#126: FILE: drivers/staging/rtl8723bs/hal/hal_com.c:126:
> >+               (false == pHalData->bDisableSWChannelPlan) &&
> >
> >which is a different logical change than the ones covered in this patch series.
> >Hence, to keep the patch series to a reasonable length and since this is RFT
> >path series, I did not consider this change right now.
> >
> >2. This change in v2:
> >
> >        if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
> >-               if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
> >+               if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
> >                        txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
> >        } else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
> >-               if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
> >+               if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7)
> >                        txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
> >        }
> >
> >can be reformatted as:
> >
> >diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> >index 9e523491a008..efd1c76f2953 100644
> >--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> >+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
> >@@ -469,11 +469,10 @@ u8 PHY_GetTxPowerIndexBase(
> >        if ((Rate >= MGN_6M && Rate <= MGN_54M) && !IS_CCK_RATE(Rate))
> >                txPower += pHalData->OFDM_24G_Diff[RFPath][TX_1S];
> > 
> >-       if (BandWidth == CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
> >-               if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
> >+       if (Rate >= MGN_MCS0 && Rate <= MGN_MCS7) {
> >+               if (BandWidth == CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
> >                        txPower += pHalData->BW20_24G_Diff[RFPath][TX_1S];
> >-       } else if (BandWidth == CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
> >-               if (MGN_MCS0 <= Rate && Rate <= MGN_MCS7)
> >+               else if (BandWidth == CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
> >                        txPower += pHalData->BW40_24G_Diff[RFPath][TX_1S];
> >for which it is sent as a separate patch - patch 5 in this series.
> >
> >3. I found, in drivers/staging/rtl8723bs/hal/odm.h:
> >
> >struct odm_rate_adaptive {
> >        u8 Type;                                /*  DM_Type_ByFW/DM_Type_ByDriver */
> >        u8 LdpcThres;                   /*  if RSSI > LdpcThres => switch from LPDC to BCC */
> >        bool bUseLdpc;
> >        bool bLowerRtsRate;
> >        u8 HighRSSIThresh;              /*  if RSSI > HighRSSIThresh    => RATRState is DM_RATR_STA_HIGH */
> >        u8 LowRSSIThresh;               /*  if RSSI <= LowRSSIThresh    => RATRState is DM_RATR_STA_LOW */
> >        u8 RATRState;                   /*  Current RSSI level, DM_RATR_STA_HIGH/DM_RATR_STA_MIDDLE/DM_RATR_>
> >
> >};
> >
> >and based on the explanation of parameters HighRSSIThresh & LowRSSIThresh 
> >I thought this change:
> >
> >diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
> >index 639b6da2302b..ca4495f101fd 100644
> >--- a/drivers/staging/rtl8723bs/hal/odm.c
> >+++ b/drivers/staging/rtl8723bs/hal/odm.c
> >@@ -343,9 +343,9 @@ bool ODM_RAStateCheck(
> >        }
> > 
> >        /*  Decide RATRState by RSSI. */
> >-       if (RSSI > HighRSSIThreshForRA)
> >+       if (HighRSSIThreshForRA < RSSI)
> >                RATRState = DM_RATR_STA_HIGH;
> >-       else if (RSSI > LowRSSIThreshForRA)
> >+       else if (LowRSSIThreshForRA < RSSI) 
> >                RATRState = DM_RATR_STA_MIDDLE;
> >       else
> >                RATRState = DM_RATR_STA_LOW;
> >
> >doesn't seem to be right, thats why I dropped this change as well.
> >
> >4. This patch series is compile tested using the following commands, which
> >   include setting the necessary configurations:
> >        1. make defconfig
> >        2. scripts/config --enable CONFIG_STAGING
> >        3. scripts/config --module CONFIG_MMC
> >        4. scripts/config --module CONFIG_RTL8723BS
> >        5. make olddefconfig
> >        6. make -j$(nproc)
> >        7. git rebase -i --exec "make -j$(nproc) M=drivers/staging/rtl8723bs" HEAD~5 
> >
> >The final rebase --exec gave a successful output:
> >
> >Executing: make -j12 M=drivers/staging/rtl8723bs
> >make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >  CC [M]  core/rtw_ap.o
> >  CC [M]  core/rtw_btcoex.o
> >  CC [M]  core/rtw_cmd.o
> >  CC [M]  core/rtw_efuse.o
> >  CC [M]  core/rtw_io.o
> >  CC [M]  core/rtw_ioctl_set.o
> >  CC [M]  core/rtw_ieee80211.o
> >  CC [M]  core/rtw_mlme.o
> >  CC [M]  core/rtw_mlme_ext.o
> >  CC [M]  core/rtw_pwrctrl.o
> >  CC [M]  core/rtw_recv.o
> >  CC [M]  core/rtw_security.o
> >  CC [M]  core/rtw_sta_mgt.o
> >  CC [M]  core/rtw_wlan_util.o
> >  CC [M]  core/rtw_xmit.o
> >  CC [M]  hal/hal_intf.o
> >  CC [M]  hal/hal_com.o
> >  CC [M]  hal/hal_com_phycfg.o
> >  CC [M]  hal/hal_btcoex.o
> >  CC [M]  hal/hal_sdio.o
> >  CC [M]  hal/hal_pwr_seq.o
> >  CC [M]  hal/HalPhyRf.o
> >  CC [M]  hal/HalPwrSeqCmd.o
> >  CC [M]  hal/odm_CfoTracking.o
> >  CC [M]  hal/odm.o
> >  CC [M]  hal/odm_DIG.o
> >  CC [M]  hal/odm_DynamicBBPowerSaving.o
> >  CC [M]  hal/odm_DynamicTxPower.o
> >  CC [M]  hal/odm_EdcaTurboCheck.o
> >  CC [M]  hal/odm_HWConfig.o
> >  CC [M]  hal/odm_RegConfig8723B.o
> >  CC [M]  hal/rtl8723b_cmd.o
> >  CC [M]  hal/rtl8723b_dm.o
> >  CC [M]  hal/rtl8723b_hal_init.o
> >  CC [M]  hal/rtl8723b_phycfg.o
> >  CC [M]  hal/rtl8723b_rf6052.o
> >  CC [M]  hal/rtl8723b_rxdesc.o
> >  CC [M]  hal/rtl8723bs_recv.o
> >  CC [M]  hal/rtl8723bs_xmit.o
> >  CC [M]  hal/sdio_halinit.o
> >  CC [M]  hal/sdio_ops.o
> >  CC [M]  hal/HalBtc8723b1Ant.o
> >  CC [M]  hal/HalBtc8723b2Ant.o
> >  CC [M]  hal/HalHWImg8723B_BB.o
> >  CC [M]  hal/HalHWImg8723B_MAC.o
> >  CC [M]  hal/HalHWImg8723B_RF.o
> >  CC [M]  hal/HalPhyRf_8723B.o
> >  CC [M]  os_dep/ioctl_cfg80211.o
> >  CC [M]  os_dep/osdep_service.o
> >  CC [M]  os_dep/os_intfs.o
> >  CC [M]  os_dep/sdio_intf.o
> >  CC [M]  os_dep/sdio_ops_linux.o
> >  CC [M]  os_dep/wifi_regd.o
> >  CC [M]  os_dep/xmit_linux.o
> >  LD [M]  r8723bs.o
> >  MODPOST Module.symvers
> >  CC [M]  r8723bs.mod.o
> >  CC [M]  .module-common.o
> >  LD [M]  r8723bs.ko
> >make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >Executing: make -j12 M=drivers/staging/rtl8723bs
> >make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >  CC [M]  hal/HalPhyRf_8723B.o
> >  LD [M]  r8723bs.o
> >  MODPOST Module.symvers
> >  CC [M]  r8723bs.mod.o
> >  LD [M]  r8723bs.ko
> >make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >Executing: make -j12 M=drivers/staging/rtl8723bs
> >make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >  CC [M]  core/rtw_ap.o
> >  CC [M]  core/rtw_btcoex.o
> >  CC [M]  core/rtw_cmd.o
> >  CC [M]  core/rtw_efuse.o
> >  CC [M]  core/rtw_io.o
> >  CC [M]  core/rtw_ioctl_set.o
> >  CC [M]  core/rtw_ieee80211.o
> >  CC [M]  core/rtw_mlme.o
> >  CC [M]  core/rtw_mlme_ext.o
> >  CC [M]  core/rtw_pwrctrl.o
> >  CC [M]  core/rtw_recv.o
> >  CC [M]  core/rtw_security.o
> >  CC [M]  core/rtw_sta_mgt.o
> >  CC [M]  core/rtw_wlan_util.o
> >  CC [M]  core/rtw_xmit.o
> >  CC [M]  hal/hal_intf.o
> >  CC [M]  hal/hal_com.o
> >  CC [M]  hal/hal_com_phycfg.o
> >  CC [M]  hal/hal_btcoex.o
> >  CC [M]  hal/hal_sdio.o
> >  CC [M]  hal/hal_pwr_seq.o
> >  CC [M]  hal/HalPhyRf.o
> >  CC [M]  hal/HalPwrSeqCmd.o
> >  CC [M]  hal/odm.o
> >  CC [M]  hal/odm_CfoTracking.o
> >  CC [M]  hal/odm_DIG.o
> >  CC [M]  hal/odm_DynamicBBPowerSaving.o
> >  CC [M]  hal/odm_DynamicTxPower.o
> >  CC [M]  hal/odm_EdcaTurboCheck.o
> >  CC [M]  hal/odm_HWConfig.o
> >  CC [M]  hal/odm_RegConfig8723B.o
> >  CC [M]  hal/rtl8723b_cmd.o
> >  CC [M]  hal/rtl8723b_dm.o
> >  CC [M]  hal/rtl8723b_hal_init.o
> >  CC [M]  hal/rtl8723b_phycfg.o
> >  CC [M]  hal/rtl8723b_rf6052.o
> >  CC [M]  hal/rtl8723b_rxdesc.o
> >  CC [M]  hal/rtl8723bs_recv.o
> >  CC [M]  hal/rtl8723bs_xmit.o
> >  CC [M]  hal/sdio_halinit.o
> >  CC [M]  hal/sdio_ops.o
> >  CC [M]  hal/HalBtc8723b1Ant.o
> >  CC [M]  hal/HalBtc8723b2Ant.o
> >  CC [M]  hal/HalHWImg8723B_BB.o
> >  CC [M]  hal/HalHWImg8723B_MAC.o
> >  CC [M]  hal/HalHWImg8723B_RF.o
> >  CC [M]  hal/HalPhyRf_8723B.o
> >  CC [M]  os_dep/ioctl_cfg80211.o
> >  CC [M]  os_dep/osdep_service.o
> >  CC [M]  os_dep/os_intfs.o
> >  CC [M]  os_dep/sdio_intf.o
> >  CC [M]  os_dep/sdio_ops_linux.o
> >  CC [M]  os_dep/wifi_regd.o
> >  CC [M]  os_dep/xmit_linux.o
> >  LD [M]  r8723bs.o
> >  MODPOST Module.symvers
> >  LD [M]  r8723bs.ko
> >make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >Executing: make -j12 M=drivers/staging/rtl8723bs
> >make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >  CC [M]  hal/rtl8723b_cmd.o
> >  LD [M]  r8723bs.o
> >  MODPOST Module.symvers
> >  CC [M]  r8723bs.mod.o
> >  LD [M]  r8723bs.ko
> >make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >Executing: make -j12 M=drivers/staging/rtl8723bs
> >make[1]: Entering directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >  CC [M]  hal/hal_com_phycfg.o
> >  LD [M]  r8723bs.o
> >  MODPOST Module.symvers
> >  CC [M]  r8723bs.mod.o
> >  LD [M]  r8723bs.ko
> >make[1]: Leaving directory '/home/prithvi/linux/drivers/staging/rtl8723bs'
> >Successfully rebased and updated refs/heads/staging-realtek-patch-series.
> >
> >However, since I currently don't have rtl8723bs hardware I am unfortunately
> >unable to do runtime testing for this patch series.
> >
> >Prithvi Tambewagh (5):
> >  staging: rtl8723bs: move constant to right side of test in comparison
> >  staging: rtl8723bs: remove empty if statement block
> >  staging: rtl8723bs: simplify boolean return in IsFrameTypeCtrl()
> >  staging: rtl8723bs: use read_poll_timeout_atomic in
> >    _is_fw_read_cmd_down
> >  staging: rtl8723bs: remove duplicate rate checks in
> >    PHY_GetTxPowerIndexBase()
> >
> > .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c    |  4 ++--
> > drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c |  5 +----
> > drivers/staging/rtl8723bs/hal/hal_com.c        |  2 +-
> > drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 11 +++++------
> > drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c   | 18 +++++++-----------
> > .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  | 18 +++++++++---------
> > drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c |  2 +-
> > drivers/staging/rtl8723bs/include/ieee80211.h  |  4 ++--
> > drivers/staging/rtl8723bs/include/wifi.h       |  5 +----
> > 9 files changed, 29 insertions(+), 40 deletions(-)
> >
> 
> Hi Prithvi,
> You do not need to provide compilation output in cover letter, also 
> since these are only style changes, I believe testing is not 
> necessary. Furthermore, it would be better to list changes in v2/v3 
> rather than pasting code snippets here.
> Best regards,
> Luka Gejak

Hi Luka,

Thanks for the feedback - I will incorporate it in v4 patch series; also 
since you said these are only style changes and testing isn't necessary I 
will remove the RFT tag from v4 patch series. 

Best Reagrds,
Prithvi
