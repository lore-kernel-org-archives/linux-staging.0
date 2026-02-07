Received: from sonic301-19.consmr.mail.sg3.yahoo.com (sonic301-19.consmr.mail.sg3.yahoo.com [106.10.242.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E337B136E3F
	for <linux-staging@lists.linux.dev>; Sat,  7 Feb 2026 06:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770445418; cv=none; b=qzvYwcJruhGsw61bOpwTJyiTNK5jqXRbuuP+UFMBTThf1kqfAsz++hsHK3Z3eZj3M9Mrq1Y/2Bxc1io+Waoa1mLmo4xrHBRaL4rQeFJQ0n9cut+tlzWi3mpcpYzcb3fGOTntlD19/W9/zHx9u4YIBq6OU45n3HMCjHd5l8xT76M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770445418; c=relaxed/simple;
	bh=d6GFbM7nW6yCsyqWj1UV5CV+I7nhdIIGdLyy30Ik+mw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=psg9gU/DhH+d+xpMBNW93IDcQlB1xRKHO+Z6pRyvZs6x37bVPiI1ZrePZjpN8zjcvaQTsWmrKAflxy3qAgeJ7z9Ho716iQPE2kkCGM8RNIan7sq/1Hr3jgROY1vskPNrGLdsdZgxramgBcuFxCYbxoTKBhICd0ld+nUp7Bdf3qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=OpnUf2vC; arc=none smtp.client-ip=106.10.242.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="OpnUf2vC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1770445410; bh=akNNAQ3ickYaDWL4uUlrHqER/MTOQlPPO2U0tSJdjFs=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=OpnUf2vCTrhSV3appimhGM5TB7WUGAdG6G5ya1RJi2AememsvObjeWsQjZ3rJMP+gqcrte1NEdEaWusG3HWi/fP63+GafrfWc3Azwh2by7SR6UJnHOZNGIr+Aw1Su8k4NqG8mX/z+tjMarF+Ov/guhgRtWUcU/ZqIl91BVmTvyLpzYv9rCLSyJHeMa/R0wjo82qAfVBgBqJh6pYbYjdsZ/yko6qCfDknqCHIpZt8TTGUpkcPxLj7186fuW5zt27u5JeTlgB9LHqOQQ4qoAVtff0FFUFByi9E71xWKykFDf9HHzFVkovXsv5vjyAeJyQI2N3DD5oH6wROqmNjkhWUmQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1770445410; bh=Ri09Hn+0e1/FdD46kSLtdk/vKz55YpO83fPm63peZW5=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=nKdVyupQa0CDEPbwQWDYKIdMk7hlBZNeLughrY1fJa1zMuK+jkXKfLVWoD/bRAuRLNEI3k5LueZOmw/pfFyiulj/oEn/RXKzgw6I2Y3UA/z8R3hGVOaRbeHS9UDVGOZwE/AhRe/6i9TG/c4UQX2MSNiSIHO4RVmSsomnz/epkWySoSL/CRwcpK/zIl6GwUKT++nh0OHRsGLJVrSimtIk/+3gSpOIDuc6zz8uxZ+vX45ubS3DmG0feeJu32w5nIuyK9zpm1uFEextcm+pOajY3Gs7m14H3CSVsy8VlFDvSv2832gwFOs59CR6uh5WMPRzIAyEr266zuyy0q6XDLTJzQ==
X-YMail-OSG: zk_yjGoVM1l7XvmCJ6H7sFBlUxzzDep4igx91OawQ09s5rVIdij7n0KbHuVoNor
 JaCeg631lOvK.hqnfWqOo2MsoaDfCQHb02A.k4yN_SPsn3s86vJ0eqe6qvioewPQoKEVTwGk5xUz
 DSvp7eL_06vejKB_kt1vXCU72oaN8xDknuo_lFmCbsN7hofPtk0AGLDPktfMO4JdDOLAi8JfNfJj
 kCZmHkTCZYZ8bNlshJ534mnjYbMQeIquNhKaWzLSA3HavISAlm0FKKd6hrLTtnIM4pBD12RiAVUS
 45XTbkinnr29ZwZ_Kby74TQrUvvd0yvwkvhh9oxHMX9ooiRft2ukXVW572UqDzuZdhxrFtrP7Ro3
 kxaXGqiDCeCrFLQCPqMpmSOysz86cIJxE9GlldONqMda63p.BH_g8RvXMzwUuadTBjoV4lPJgZIK
 UAsgAzvAHKqPjlUH0Sdvj8SzpO4XpsXMDQb0pEZiK.1vJIOgPXhm1RoKtKxRJCuCHwwrXqKu1Vw0
 zSee3SB2YzBQfvPRFINNxH4jFOzqq3Uo3bbypKSHrIRsczp8ptf40PWofJ2mlLenk8EE1SiQvimZ
 4ZWsN3q838eI9_CobSGiTmgJuIIMkxs2ZO9HVBr6S44S1vOq0zJmdxRRL5djcurHbiA4ehqETzTq
 9uwCUeeNP2iceKvY0NFrci1iRcpWTFckvQ7pRoXAlru79V_Dx10AZYG3JZd0uHpLb6w7B.e2EdxK
 QHPId3SOB_qNX6qqDLRwsHF2lf4o70U5VV.nIrXHAv3s80HJfMRHzPjGbsBPwz6imxupQveUUCV3
 q6dkLcPZ9VY9moJguoqFf.5fhFZ3fBsAlFLCvoror7_Zgt.UgKIegcAIJBidonEWkXWOine6kifG
 BbjNnzgWNmkSnvU3813q65SRfVe2ppkRC66I5v3mRjTDAXHryhm9Jrw5piIAuGxF0uqQvNdwt88X
 3nK0COP5AHneQOyzq.Duyw.vk1.vvL3aeflfeQ11nlPFy_Nb8ef5uNLIlWX62AylYvRM9YrWP3HQ
 9_.kKxz4M27ysq3HCB1L1I2y62ytKuyWDKhhMZwpPfrCHo2M8McRHAIFu.IyTpF14YKZvoeQDv4n
 lRokYKUG_OTl61QRe54Kn4qw_oqKaYY44ouWl_zrXOPfEQRudG5npaCGaRZ88em.Bi_GONNbK70l
 OKTyNJ0cE0Pdo07l_1DmwfUA7oae1E8UJZTWRwANCvxowPbCPOi8RBwXzyTjwspz5_y22K.gQEwi
 JZHlcQLXoYmfDBF2Z49ZHPB12Ltp3Fkgb62kv9bGu88lo2Y6h3ALJASKQp0OFzkIhWsyP6c3.Yic
 r4hapc1U.KOnxdNY3DBAugspht5tRbPtxsSrF.0cZ2ouERVcOY655IVN4NyqCV8MKLBrXTOtp_iO
 LOfvH2_dWm0ulC49glpQxIg34Sm0zPuKYy7rYS_9mn6M10BtAIrjThE.Vtzn.NfMim_Q6i9HK3E4
 TMxkUDokZ2n2cJUwLeISlP.hUMzBKa8p_qb1SjauHqtmzkgY5pMUb9GptRnQFpf9g4.SadC41bIO
 hhzu_rV7Go6jfQmNwvvZv7BQuQJZkUsacudeJfjznD5bnUbOJAtJREY6hQPEsg_57k05x9Sa1M8v
 B_4EvPO6GOAPtTAFX_FBj.BSzGADuE0Dm80SSXCexigGMHJDT27nT.AqNM61nT6b4.E_LOrX9TIW
 t14qwsWYLYW3puGOtSUnPxEMPCjjEgfHIMfxh03AU.SdjAa6ynwelXbRgW.kD9LU_I8uUolFq7BQ
 QLnczXgUmcFY8tCrUFwipKSPCF7_3Iv6b8OTROyxy_W8Zx3P_IFY27V0N66hCQH2ZWH_Le1sNscp
 LfXBtjOiz_771ViZXlA09JFsrPRXvZjGnTNzBNSM06kAbz_SnqH6JPaq3traRE9QoZQHZ_cavxbZ
 _coY4Y60WhfqrpaVjME8fXfx_zjWnzifmSkWdlphyrGEw7W9cxI8mV.GW.zR3pM8u0czIJ4jxZHc
 V1MZFdyCjM7SqyqZssJNqfCVZz0IFztfpseFBzD6aBgxcKdTmp3Xk.l1xAPzqqe3sa.PHknVKQ8b
 xm0Ell.qfcpb6IAyZCQJPjEHb5PUsICfN7x7CYJ8q5tY_vH2NFK5xMDXWp785hvy27ixG6YwzK0K
 gpyjwI7fDtgbV2m0vjM8IF67mPGqG7ugWwU18ps67n.tcbOqol82BOCouWnuj14eHKaGJFcY4Jb7
 OFYdZlX5TtQb2gp2E_8gV3Pj8zpHhYi6d2zccalzEmsV8B0SwAgCwyR0wfXd4dtdqInbCeUIPZH2
 W
X-Sonic-MF: <kaizhetan@yahoo.com>
X-Sonic-ID: 5c0c4009-3553-4dfc-bc21-949a0328f30a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.sg3.yahoo.com with HTTP; Sat, 7 Feb 2026 06:23:30 +0000
Received: by hermes--production-sg3-d7b46f8d-fp4gx (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 677a6d475935b9fc0e7502834051d674;
          Sat, 07 Feb 2026 06:13:16 +0000 (UTC)
From: Tan Kai Zhe <kaizhetan@yahoo.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rename CamelCase function Set_MSR to set_msr
Date: Sat,  7 Feb 2026 14:13:13 +0800
Message-ID: <20260207061313.20103-1-kaizhetan@yahoo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260207061313.20103-1-kaizhetan.ref@yahoo.com>

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Avoid CamelCase: <Set_MSR>

Signed-off-by: Tan Kai Zhe <kaizhetan@yahoo.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 18 +++++++++---------
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c |  2 +-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c  |  2 +-
 .../staging/rtl8723bs/include/rtw_mlme_ext.h   |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 477fe238add4..f3c4ac821b47 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -688,7 +688,7 @@ void start_bss_network(struct adapter *padapter)
 	}
 
 	/* set MSR to AP_Mode */
-	Set_MSR(padapter, _HW_STATE_AP_);
+	set_msr(padapter, _HW_STATE_AP_);
 
 	/* Set BSSID REG */
 	rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, pnetwork->mac_address);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884fcce50d9c..82742701602b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3873,7 +3873,7 @@ void site_survey(struct adapter *padapter)
 			/* rtw_hal_set_hwreg(padapter, HW_VAR_TXPAUSE, (u8 *)(&val8)); */
 
 			/* config MSR */
-			Set_MSR(padapter, (pmlmeinfo->state & 0x3));
+			set_msr(padapter, (pmlmeinfo->state & 0x3));
 
 			initialgain = 0xff; /* restore RX GAIN */
 			rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
@@ -4090,7 +4090,7 @@ void start_create_ibss(struct adapter *padapter)
 
 		/* set msr to WIFI_FW_ADHOC_STATE */
 		pmlmeinfo->state = WIFI_FW_ADHOC_STATE;
-		Set_MSR(padapter, (pmlmeinfo->state & 0x3));
+		set_msr(padapter, (pmlmeinfo->state & 0x3));
 
 		/* issue beacon */
 		if (send_beacon(padapter) == _FAIL) {
@@ -4129,7 +4129,7 @@ void start_clnt_join(struct adapter *padapter)
 	caps = rtw_get_capability((struct wlan_bssid_ex *)pnetwork);
 	update_capinfo(padapter, caps);
 	if (caps&WLAN_CAPABILITY_ESS) {
-		Set_MSR(padapter, WIFI_FW_STATION_STATE);
+		set_msr(padapter, WIFI_FW_STATION_STATE);
 
 		val8 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_8021X) ? 0xcc : 0xcf;
 
@@ -4156,7 +4156,7 @@ void start_clnt_join(struct adapter *padapter)
 
 		pmlmeinfo->state = WIFI_FW_AUTH_NULL | WIFI_FW_STATION_STATE;
 	} else if (caps&WLAN_CAPABILITY_IBSS) { /* adhoc client */
-		Set_MSR(padapter, WIFI_FW_ADHOC_STATE);
+		set_msr(padapter, WIFI_FW_ADHOC_STATE);
 
 		val8 = 0xcf;
 		rtw_hal_set_hwreg(padapter, HW_VAR_SEC_CFG, (u8 *)(&val8));
@@ -4762,7 +4762,7 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 	rtw_hal_set_hwreg(padapter, HW_VAR_BSSID, null_addr);
 
 	/* set MSR to no link state -> infra. mode */
-	Set_MSR(padapter, _HW_STATE_STATION_);
+	set_msr(padapter, _HW_STATE_STATION_);
 
 	pmlmeinfo->state = WIFI_FW_NULL_STATE;
 
@@ -5205,7 +5205,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	}
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_SET_OPMODE, (u8 *)(&type));
-	/* Set_MSR(padapter, type); */
+	/* set_msr(padapter, type); */
 
 	if (psetop->mode == Ndis802_11APMode) {
 		/*  Do this after port switch to */
@@ -5299,8 +5299,8 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		timer_delete_sync(&pmlmeext->link_timer);
 
 		/* set MSR to nolink -> infra. mode */
-		/* Set_MSR(padapter, _HW_STATE_NOLINK_); */
-		Set_MSR(padapter, _HW_STATE_STATION_);
+		/* set_msr(padapter, _HW_STATE_NOLINK_); */
+		set_msr(padapter, _HW_STATE_STATION_);
 
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_DISCONNECT, NULL);
@@ -5563,7 +5563,7 @@ u8 sitesurvey_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 		rtw_hal_set_hwreg(padapter, HW_VAR_INITIAL_GAIN, (u8 *)(&initialgain));
 
 		/* set MSR to no link state */
-		Set_MSR(padapter, _HW_STATE_NOLINK_);
+		set_msr(padapter, _HW_STATE_NOLINK_);
 
 		val8 = 1; /* under site survey */
 		rtw_hal_set_hwreg(padapter, HW_VAR_MLME_SITESURVEY, (u8 *)(&val8));
diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 9ab9fb25ced4..e4f1eef54a52 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -243,7 +243,7 @@ void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable)
 		rtw_hal_set_hwreg(padapter, HW_VAR_DM_FUNC_CLR, (u8 *)(&mode));
 }
 
-void Set_MSR(struct adapter *padapter, u8 type)
+void set_msr(struct adapter *padapter, u8 type)
 {
 	rtw_hal_set_hwreg(padapter, HW_VAR_MEDIA_STATUS, (u8 *)(&type));
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 054e2c2eab02..41ca4e284572 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1946,7 +1946,7 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 		rtw_write8(padapter, REG_BCN_CTRL, val8);
 
 		/*  set net_type */
-		Set_MSR(padapter, mode);
+		set_msr(padapter, mode);
 
 		if ((mode == _HW_STATE_STATION_) || (mode == _HW_STATE_NOLINK_)) {
 			{
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index dd5080056e58..afa5631a441a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -441,7 +441,7 @@ void Save_DM_Func_Flag(struct adapter *padapter);
 void Restore_DM_Func_Flag(struct adapter *padapter);
 void Switch_DM_Func(struct adapter *padapter, u32 mode, u8 enable);
 
-void Set_MSR(struct adapter *padapter, u8 type);
+void set_msr(struct adapter *padapter, u8 type);
 
 u8 rtw_get_oper_ch(struct adapter *adapter);
 void rtw_set_oper_ch(struct adapter *adapter, u8 ch);
-- 
2.53.0

