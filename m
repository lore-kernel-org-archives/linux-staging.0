Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79047332603
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772176790; cv=none; b=P8je1LJ2057fhNuu1DXsxNu857/1aLjAHe1glptCsx9NGGg9Vo+4eYcmeW1G5Gk2i8dtKr9TB6N+x25FG0gmebiO8u+XKOxxWjMOn1sez8Jl6VrGIBgcN4785OOM2a2QEfV5Q8nN/dt92mOvSkZPmMlbjn2Szd8HIHjaNkJAy84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772176790; c=relaxed/simple;
	bh=WPLanvTyJbCnc/La3oCOMbQxMDjOLIAbyqnseETrsEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BNukk+cxGCVSeHhz5hCpVXTNlQ7RDLUuxqxt5RCxvr/9Dr92w4wHk3ULDLgjUF0/9NEsMGom9Axp8u42IWCFHD6T0aYEIA4W1botDGTIi+RT4WM3TB15eAb0LTF4rkoRAgczkL6dJd8wE3gaiVMlMGIjhhZb7r7bEoH8+fEg1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJFZ3OFx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJFZ3OFx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso14587705e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 23:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772176788; x=1772781588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DSZJw3Vy3MP+JJpVLSijKBxU6m5DERah2QEhlpzMicI=;
        b=PJFZ3OFxuSidfsIKh2NmjI1U7kr0tZe+9yIqtAVv2A5GT79XMpAhl1OPQ49xX9MxZV
         w9e5ovsxTcxgyOp/U/Lh+CiINPGf1YOdysnZUHU+hvNPdpq13s/wH9j99BX/GbITLMYZ
         SdPo55B7lm+DNHjRd3We6TSp8NPvmoVfCC2xMajzpAQgN8Otl+3YCPsqdnQBf9HHeAR/
         rxGFsH52GSjRb2DeOQH5lnu/RTC8pZocKnCjcVoTfte+mW9ie8YE0YD5NCwRbNktQudR
         /V05gsp+Jop2OrPZZwYGt3DRkRnVB7OHfoDpAF3dWF1X3c9ZOmlCK474WJxqK0cpfAvT
         ACOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772176788; x=1772781588;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DSZJw3Vy3MP+JJpVLSijKBxU6m5DERah2QEhlpzMicI=;
        b=Il3McgN/JBPek9QOcNmgKzR3CwMjKVVZk5GvTyrNflodNKpveA7tAvtsg9FXx54fs+
         I3S5/KHiCeCatTlvL74hyzD/G8cwJmIh7hkK7aHbEkZfJIYaXohxqkr59vLZR1kX+wCY
         nTjXcnRryUdwVZHTgVp+8zxiWRJyRFfDmkoV2PdJT9uPhcCEDjlI7S0g/lW8s8ruVZKj
         B+WLcyVHu1OjEFnXC+9MtpvVIuYTmyn1IBnLxSUXSAb5PVk/LP0QAizjtSFiduO7F71I
         JSt/5HB6UYMNufLCBiSnN/nQ3khHXcSRpl113jDl5Im+bm63zR+39GCVpNyKAIgETula
         4aAw==
X-Forwarded-Encrypted: i=1; AJvYcCXhzvGjAW9EMIFj0xGkeStmgGB99SOkrXUph/asCwRvcygT0BaUXc9avImyrcRhY83uvmsOvuZgQSihbDSv@lists.linux.dev
X-Gm-Message-State: AOJu0YzT1igT4xNMYhpIAzqvAM9weVp6TS5w0M4N1agu8yJWP3DZq8ev
	8Ex4p3V4fjG0tY38h0HswnEyEuVljCCKs9qjqRrgJgNnlFyYKiIHYIZe
X-Gm-Gg: ATEYQzzPaQ5Qqc16fOxMTuwFbteEPugr3RKevXRXmhc5sPmbKVvJufzFDjkUxf0LWL2
	ulUybKovDJtAefYym9dOX3Ru+3u1/OA05uN7UwiwdfQKmKSHQQbmX0AlhOTL19JUn1UG/WHJYNA
	x6MszMfFYF/cZUSrREW6B5ZiitvYbTDm4MrE1N8MbgznlJbNjbN7hTOHwMU6GGUjKN4jIufLizz
	AUi/t0gKRgQfVKiq7sBq6pihiMFJ3KOX6iRGK0NE6IcNLJUj/RX2jtBIHkJcTipHbU3V7nD0O/9
	sCa6CyEKAt6dcRgCvBw1DSieC5HEov7ySg7F3dzcEwMEXNMdArA94JVQBlN6FpGyLoSvrm8/nKY
	+5UkczFCCEViXptNLwm0TlKxRazaT1qgLh2QcmAjjWCFoEI0I458SUtN1BiPtn7fntze1zx1NUl
	mDseJXzMPtjm2qmASfu6/cwvM809CxYt+GJgSBVAk7TDgLSTAopQP5
X-Received: by 2002:a05:600c:3b9e:b0:483:78e1:784 with SMTP id 5b1f17b1804b1-483c9ba6785mr23406415e9.4.1772176787796;
        Thu, 26 Feb 2026 23:19:47 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfabb84esm170712625e9.0.2026.02.26.23.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 23:19:47 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	trohan2000@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mariyam Shahid <mariyam.shahid135@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Fix logical continuation placement
Date: Fri, 27 Feb 2026 12:19:41 +0500
Message-ID: <20260227071942.6328-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move logical operators to the end of the previous line
to fix checkpatch warnings.

Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---

v3: fix indentation as Dan specified
v2: fix indentation of continuation line, correct Ethan's email
v1: initial submission

 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3e62fc8f61cf..9c10d5441632 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1573,8 +1573,8 @@ static int rtw_ht_operation_update(struct adapter *padapter)
 	if (pmlmepriv->htpriv.ht_option)
 		return 0;
 
-	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT)
-	    && pmlmepriv->num_sta_ht_no_gf) {
+	if (!(pmlmepriv->ht_op_mode & IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT) &&
+	    pmlmepriv->num_sta_ht_no_gf) {
 		pmlmepriv->ht_op_mode |=
 			IEEE80211_HT_OP_MODE_NON_GF_STA_PRSNT;
 		op_mode_changes++;
@@ -1780,8 +1780,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_preamble_set) {
 		psta->no_short_preamble_set = 0;
 		pmlmepriv->num_sta_no_short_preamble--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_preamble == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_preamble == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
@@ -1799,8 +1799,8 @@ u8 bss_cap_update_on_sta_leave(struct adapter *padapter, struct sta_info *psta)
 	if (psta->no_short_slot_time_set) {
 		psta->no_short_slot_time_set = 0;
 		pmlmepriv->num_sta_no_short_slot_time--;
-		if (pmlmeext->cur_wireless_mode > WIRELESS_11B
-		    && pmlmepriv->num_sta_no_short_slot_time == 0){
+		if (pmlmeext->cur_wireless_mode > WIRELESS_11B &&
+		    pmlmepriv->num_sta_no_short_slot_time == 0){
 			beacon_updated = true;
 			update_beacon(padapter, 0xFF, NULL, true);
 		}
-- 
2.43.0

