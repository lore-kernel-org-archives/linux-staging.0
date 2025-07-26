Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC90F1FC7CA
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504419; cv=none; b=RJzbQj+MaHqhUrPG/i2ZSKd6s8mcvy+ox5/C/Qk/SDSzKtOyzXPxUysBSMNB/kuEJ6hCOlDRK7mKvFqIkV4cveCMuQGObnFYZ1cPPx7vz7ZoZCCBZblYjXC0XKrBsbSt9KiOEWQZFpGnL41dZIV88vyHEH3UcosSe1jsw4peuwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504419; c=relaxed/simple;
	bh=xmYYMyOZJwjwp2JTaH48jAKSP1kH73X0D1fbu/mH484=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zp4OebVlKupCBDS7ciDmlxR1vYCJZg27HsOoF7S49iGWiElXAHoE7AzWZtWP5xzWVZOLi8F0rPvPeQunZy9sEbwF0PeoD/JSLzRgqXlNQCOa7J09RBIkbjLq/ZeWS2SKLMpYy3I0pBNRe+cvOxjwGnGBv0hkT0U23Vu1sgYEpFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0ZImK0w; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0ZImK0w"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e623a12701so431039085a.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504416; x=1754109216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nah+LM+soUeFmNwfK2IEfdnCoc7CZm0auXL4WL3rki8=;
        b=j0ZImK0wgJ17z+Xv1fmQULevfI83ryT77VZN27FKztQPIWvLk4+NCNIbl+vIjvWygW
         LSL+hhg1Q7TAzai0ZI2chLkm+n3jsMOtyzsmAsudH1WFY8sGtBeBljAKgqpXzZBR8aGC
         3tE84K5hcrY5TkmVRCu09hV5xHFeJEnqGmmlpkowIm35CG03k69qQW4BVLzfBPNlCGeL
         mkVxXV0WAf3ZnOCU6zlgbxUrbu4E8owG5z3Ta9umVScbQNK72DISFfvNEdqjW/qddSe7
         bsBUqX5SGOrNU/mPucocQq+u0ktpnqMRDbx7KJF7VgtcUdcdqiDxL0Qzlg4s0876D9f+
         fZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504416; x=1754109216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nah+LM+soUeFmNwfK2IEfdnCoc7CZm0auXL4WL3rki8=;
        b=wGpeScAzrRqxiz8Zyz72IA/gLYGImH7UVK40SiN2VpDZrZGm+N51mrEfmvFYWdqboZ
         dTVClWgQpMxWdBH8INhI5KK5QcNUTPgS/zR+Jjvv7f1bwoeBHZUIZuksNgq93sCfCR4O
         9Hy1RdTe7Y1PDMku6tfFs2Li9/tc/knrbv+GB3NGLvyfAYK86vljAQvuhNdr69oRZVFI
         wzkBjLcU4KnUZBDNLDamCMjbdBqItTBnGOpI2zAzHJiv5+TvcHoRG2261HoAn8PpRjMp
         yxj+vy2yC6aQz5JUH4GGieRkKv8QCa3T/ZIfn8qP1mXIpX/1jSVRlZJm7MYmsiwIjGm4
         viUw==
X-Gm-Message-State: AOJu0YztHlhfARZh4GMm42znB/1PQwikmrhEdU0lQsViumsX5wuDSt5Q
	On5pZIwrsu/61caVkTY5JR6SyQDD+9WIHf8DXroxu/t17QK5z7sdEKdd
X-Gm-Gg: ASbGncsxO+M/IHvR9EvnTbgXhfaAqp8rYdJrXt0Qvs0o37gAx7mV4cFlFmCIP+iIUpF
	SsQcdEfPR4ZmqDTHPhMC/LcPTLgzYLu56TcRP7SRUW+Ex/HMYWYssX/Y84TfT8obM7+yHt3+Bwt
	LZtEggnXPWcVWBnqEew/YUjyiU2nKqL/D2ZYo2tkhNbpqe5UqCr0Ev6nxKkxuo/zcDrVCU3N01J
	o8z5xyP2Um4HddVOjS872V2+mHjE8nz2n69tkAgOK7vltoRdxzDkcUUueApr9pzdN19DKxslgaJ
	HCpkfFLySmVzc3b+LsCVCvDzGWjrhfJuu9e0oY/11H1xtc+cHp0lb2tHYkehWdt1ZVyMrINpL4d
	cXu/ATyuH/84qn+Rl8ouK2Kw8rj3urgDSN0tYCwG1Ay6lEkXqyrw=
X-Google-Smtp-Source: AGHT+IHqImVx161CnR8opFPNvrqp44DGum14iIX4WljcQ4qQP0d3IMEZTB3jJOmQ2Y80Ec/Sak268A==
X-Received: by 2002:a05:620a:4591:b0:7e3:463a:5189 with SMTP id af79cd13be357-7e63bf53d4bmr614021485a.1.1753504416552;
        Fri, 25 Jul 2025 21:33:36 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:36 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 05/20] staging: rtl8723bs: remove space before tabs
Date: Sat, 26 Jul 2025 04:32:03 +0000
Message-Id: <20250726043218.386738-6-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed occurrences of space characters preceding tab characters
in the codebase. Spaces before tabs cause inconsistent indentation
and are flagged by checkpatch.pl as style violations.

This change improves code formatting consistency and adheres
to the Linux kernel coding style.

No functional changes made.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 26 +++++++++++------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 536b6d036e88..f8680124ce24 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -559,10 +559,10 @@ void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
 
 /* select the desired network based on the capability of the (i)bss. */
 /*  check items: (1) security */
-/* 			   (2) network_type */
-/* 			   (3) WMM */
-/* 			   (4) HT */
-/*                      (5) others */
+/*		 (2) network_type */
+/*		 (3) WMM */
+/*		 (4) HT */
+/*               (5) others */
 int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork);
 int rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
 {
@@ -1819,7 +1819,7 @@ signed int rtw_set_key(struct adapter *adapter, struct security_priv *psecurityp
 	u8 keylen;
 	struct cmd_obj		*pcmd;
 	struct setkey_parm	*psetkeyparm;
-	struct cmd_priv 	*pcmdpriv = &adapter->cmdpriv;
+	struct cmd_priv		*pcmdpriv = &adapter->cmdpriv;
 	signed int	res = _SUCCESS;
 
 	psetkeyparm = rtw_zmalloc(sizeof(struct setkey_parm));
@@ -1922,8 +1922,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 /*  */
 /*  Search by BSSID, */
 /*  Return Value: */
-/* 		-1		:if there is no pre-auth key in the  table */
-/* 		>= 0		:if there is pre-auth key, and   return the entry id */
+/*		-1		:if there is no pre-auth key in the  table */
+/*		>= 0		:if there is pre-auth key, and   return the entry id */
 /*  */
 /*  */
 
@@ -2073,7 +2073,7 @@ void rtw_joinbss_reset(struct adapter *padapter)
 	u8 threshold;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 
 	/* todo: if you want to do something io/reg/hw setting before join_bss, please add code here */
 
@@ -2099,8 +2099,8 @@ void rtw_joinbss_reset(struct adapter *padapter)
 
 void rtw_ht_use_default_setting(struct adapter *padapter)
 {
-	struct mlme_priv 	*pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct mlme_priv	*pmlmepriv = &padapter->mlmepriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	bool		bHwLDPCSupport = false, bHwSTBCSupport = false;
 	bool		bHwSupportBeamformer = false, bHwSupportBeamformee = false;
@@ -2174,7 +2174,7 @@ unsigned int rtw_restructure_ht_ie(struct adapter *padapter, u8 *in_ie, u8 *out_
 	u8 cbw40_enable = 0, stbc_rx_enable = 0, operation_bw = 0;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 
 	phtpriv->ht_option = false;
@@ -2294,7 +2294,7 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	int len;
 	struct ieee80211_ht_cap *pht_capie;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 	struct registry_priv *pregistrypriv = &padapter->registrypriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -2414,7 +2414,7 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 void rtw_append_exented_cap(struct adapter *padapter, u8 *out_ie, uint *pout_len)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-	struct ht_priv 	*phtpriv = &pmlmepriv->htpriv;
+	struct ht_priv	*phtpriv = &pmlmepriv->htpriv;
 	u8 cap_content[8] = {0};
 
 	if (phtpriv->bss_coexist)
-- 
2.39.5

