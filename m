Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F90637D108
	for <linux-staging@lists.linux.dev>; Sun,  3 May 2026 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777823457; cv=none; b=Tf8oOPr++gIaeQ+Mt26gAt1yq6n4g+dsoV0Pt83tK4diLkl5iXX9GU+RE88rFy5NafB9RIti2j/N5M7zZifeFbb9jI6S2UEiQ7dsBz4NHTWC553Q06uj24RHjXWWxMvsTLRdDC4Kv0LM1oNEOuB5O6Tm70mZcEQ/r9QpBd3dYPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777823457; c=relaxed/simple;
	bh=Ugo8FZsvUX5SLBnI784m2vGhq3KYvxYW1XFRmp2PGXs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IjJ4mjouFZtbukq2K4TtMNoA9AwAHuEHC+vQ1oUWHl9fzw/yy9JKwxnU8vX8WmAvcTpIWRWycqZlIg3xEx3BPsbhgi4+wOL858rXgWv4hc/MJ+twWemUG6gefiQEhRU8xDjCMaHwlRyRRZgH/EiUEEpcYslKME2wxmW4eVvLb+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XRCfqn7i; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XRCfqn7i"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c19d23b19so4736925c88.0
        for <linux-staging@lists.linux.dev>; Sun, 03 May 2026 08:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777823455; x=1778428255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXpQHmN/EITCfDuS0GJbAxm/AvnRF3xZvwUCSEiGaVU=;
        b=XRCfqn7iTt3LCgtEmMgkjjIvOpRskIp75Lxi6z7zIRft68pdp5GILEdXJPOP8/uWt4
         maSd8W+GVJDdKdXYE4WpDl2I4rglUw2QOyLoO3I8fjyE8Sayb80fqMcydxKrCymJM5Bh
         bOBLAObJheRxNLblUt4rNMLNW8F6h+YbwnFuALVbDULfHQukn16odBhaBGM+QIJdDqf8
         NmKY31KHAaFKyIkpBhWG1B5qOHB5hjU9Bg+vPa1tsBVW63kIuqELKtTYYGoImw2SNRDi
         kfLCPLyIssqbtfIDvKWX03P1CKDudWERA5T+kAuEOZUekV9URNmhXQwgMbYvHGCy94zb
         fWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777823455; x=1778428255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXpQHmN/EITCfDuS0GJbAxm/AvnRF3xZvwUCSEiGaVU=;
        b=MgyFmOVqdczsW0/UKKCboHIw7ZOhC61/320ehsE9xMw1cUH8SiDDJOhSOkaOVseSrA
         e/vIvGWJdoUfxKFVovi6r4pQhTNUmJFErc3zNqFH/Inqs7qhW2OgidDLADOf/qnlj7ok
         qJ+putVySf41K7HseLwZSXPZCDTO2UmTm9OqRpV6O9yVWUkS2C0i+del3zmYEE+iunbh
         7m+IEzvMim1fDi06muzELRKS+1jbT0DbU14smOoLRgYv5dQGD8GSGdxxu7AbLDmAtq8n
         B7R+ans3gRlaFkrwbPvt6624oWCMGKytGaun6TyuWTUZnJSksd2eZuVtrnwrlg3oNZXW
         2HDg==
X-Forwarded-Encrypted: i=1; AFNElJ+AaN0EhNv98DbiBOBgSGhvWSaQqOaBcSg1R6ZX07Up8A1PAvZ0Prc+1E3Ae9SptJr80cm2Uija5Gg4k5FD@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ2SkGrIMdVOP0TItOat9Ug0mj25kYYuW0W+woR89quXpCJVVG
	FxbKTFbRBWUAyWK5lJ9PnkF2Oh61dzei9FTKxK33ZvEKjmG6Fem/bFCq
X-Gm-Gg: AeBDieuawOxFTSEq/3RMZmN0/3JAqoHn9rarXyDeDob9HRHH6pVVBkXnV293k0pjlun
	1RT37tBF1DvS4PN6c6Ugbh4ONYRsyWpFY9QGpSsCHSaS+HeSd4sLvwvxMAD8sL5iAg2Onq27dIR
	T9KjMotyrzyaKERvIyR1wSFI3VkfEldGD0CELEd/5dH1XqSPVMxrii948Xs5rdFLB/NW0ZZuKZe
	d/VDbczAYQlCPeRHYbza767iRiLpyg+V77j851rHiwKO64LaUL6V5bdR7/y598I6zxmkwUS/5kH
	K8bOY0CABd5IQMmF82//qn8UzEYm1M9D/f69r7CLryFPwo+f6dD2sbwQN0cxmzjUr5GJ5dYbP3J
	qGG4MLIzA7TY60calKz9bNsrKF9Vg/5kLQQRsbJL+hTyfOkJT1N0vM0pSBxBd8hj/XFDjT32C+s
	jWGjT3JuL2YcmgG20ilsIlQ4/k28def9PJ65V9T586GTsxUht2/MGcieyZSAFkYpdbUTvFvydlC
	loyapWCBH0=
X-Received: by 2002:a05:7022:913:b0:128:df80:1852 with SMTP id a92af1059eb24-12dfd7abf72mr2914148c88.9.1777823455259;
        Sun, 03 May 2026 08:50:55 -0700 (PDT)
Received: from aidan-cachyPC ([8.3.93.248])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8424ef1sm15620729c88.9.2026.05.03.08.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 08:50:54 -0700 (PDT)
From: Aidan Russell <aidanlrussell@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikolay Kulikov <nikolayof23@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aidan Russell <aidanlrussell@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Fix spelling mistakes in comments
Date: Sun,  3 May 2026 08:50:43 -0700
Message-ID: <20260503155043.15936-1-aidanlrussell@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several spelling mistakes in comments in the rtl8723bs staging
driver.

No functional changes.

Signed-off-by: Aidan Russell <aidanlrussell@gmail.com>
---

Changes in v3:
 * Change "dont" to "do not"

Changes in v2:
 * Limit patch to spelling-only comment edits.
 * Drop unrelated comment formatting

 drivers/staging/rtl8723bs/core/rtw_cmd.c     | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c    | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 72d5905a48e9..1f65267e7316 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1650,7 +1650,7 @@ u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
 	return res;
 }
 
-/* dont call R/W in this function, beucase SDIO interrupt have claim host */
+/* do not call R/W in this function, because SDIO interrupt have claim host */
 /* or deadlock will happen and cause special-systemserver-died in android */
 u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3ecf4f979c03..7a6bd87c8d08 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1378,7 +1378,7 @@ void rtw_stadel_event_callback(struct adapter *adapter, u8 *pbuf)
 		u16 media_status;
 
 		media_status = (mac_id << 8) | 0; /*   MACID|OPMODE:0 means disconnect */
-		/* for STA, AP, ADHOC mode, report disconnect stauts to FW */
+		/* for STA, AP, ADHOC mode, report disconnect status to FW */
 		rtw_hal_set_hwreg(adapter, HW_VAR_H2C_MEDIA_STATUS_RPT, (u8 *)&media_status);
 	}
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..ca1cb58fc801 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -576,7 +576,7 @@ void LPS_Leave_check(struct adapter *padapter)
  *
  * This will be called when CPWM interrupt is up.
  *
- * using to update cpwn of drv; and drv willl make a decision to up or down pwr level
+ * using to update cpwn of drv; and drv will make a decision to up or down pwr level
  */
 void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportpwrstate)
 {
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index dba146b696e0..a21aa2964a6b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -726,7 +726,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 			}
 		}
 
-		/* for parsing ICMP pakcets */
+		/* for parsing ICMP packets */
 		{
 			struct iphdr *piphdr = (struct iphdr *)tmp;
 
@@ -1358,7 +1358,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 			/* set final tx command size */
 			pattrib->last_txcmdsz = pattrib->pktlen;
 
-			/* set protected bit must be beofre SW encrypt */
+			/* set protected bit must be before SW encrypt */
 			SetPrivacy(mem_start);
 			/* software encrypt */
 			xmitframe_swencrypt(padapter, pxmitframe);
-- 
2.54.0

