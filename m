Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CFE256C6C
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 06:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778567537; cv=none; b=qe6dNVxP70N+Apg7SYF4N477vYFo0hBWFp3SfBbg+XWW5KyMK24IBige7w5FKgIfp1duKsILCYPmtDvmF9R8m0ElDSJt491FAdpTMUNA2SjljqtsWPHsjL9Cb3QjhuKehJsuCMi17fm0b+cDkdqfiLwQfMgDv0gzNATd5QWFIxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778567537; c=relaxed/simple;
	bh=r80PupXzJ7qT/TyhnL8vDTlmQRxpUkexzCrzzSAjiRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r4uBNrc5HzDAZvspoXzjfmy+TxgcJibEEm92NywkwQBIzaM7oYqhQp/BoKPnWyLUHqNLW+KSd/9vpppB8WBXVMPNNJ3RRCfwDOgcC2sbKgF0L0rbzp9h6IfBu/gAP81hm41JDqUZQq3zUR+fnbfVyEEfNgTT9y0GRtpYUoReDVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BItHkF86; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BItHkF86"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bc763e2ba8so13949705ad.3
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 23:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778567530; x=1779172330; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ux42De8qANDVDmmwND0UWgZm7rh596ZSmESwCt0gT1A=;
        b=BItHkF861fHAWFs9FacTRwoKEyhC8mEG+saRNBNDzp4HkHevnEF3C5ixZRBLCyNgVs
         ilg16rNy/a+CCq5oUQAq1b5NNKpipZIHsKHQv1OxONN4dIe370+Kt68fVy2dN6Iv+5xe
         w29HDvKbOXAxZuPvLFEPPbHzAZnLzeZLzAiLNfQKKpqsP9JSTT/7lNAvIgUp57uf+ln9
         3lzy/KJvITL+1NeHbPCuFdE6CWTJ6/yYuEDjKdM07KOuGClxosWhvqqslALhYfxukkNH
         gvn1yR2wsDpjfLcNUfdlsh/et6R/jSGEZbGEBBG9Lwd/J/5NmLZ408EMA8OOaGui5s0f
         koeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778567530; x=1779172330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ux42De8qANDVDmmwND0UWgZm7rh596ZSmESwCt0gT1A=;
        b=Ci66MgEpPlVH80NlcopPSJ/zKpLtKOSrIRtTQh9j6KEuQCKxwEXykQWamah2YKV1oW
         /ZU+I1MwTxzGi+AjG2Tk0gWUIvvoBRWb6xnFPLy7DxqXHZX0b/xlp54B8oxlyXw3BCun
         TMfIKOcCyKYxZ/Xqven0JzoRgLHLMBEjzXOOBTZzPSZrm/05l6vHSRkvT3Tl6rbRGlU/
         +FfKdZ9wmmw89aYOpzv8duBNvYW7AQDoGRuGthASEhDsVgXhpQ+ED1/kvMKGaPMiPEvx
         DoPfDeLJRfJoICTeIhxZCQjfKDKt7x3yEUDeWDTlihO/LJjzrnb2dCySiClzmB210A7o
         kuXw==
X-Gm-Message-State: AOJu0Yxn/QUqqYe93EnDmBHwfrobtyMBCHiuZRPYV936dzdapJig9OiN
	P40Omy3URo7S4UNleG7VznGB+OHxoBQTYzx3VBuYWKH373aRGj/Ppxc5
X-Gm-Gg: Acq92OEQGEgU3X6MXcq8SDDaI90TTE80TzEeoHGO+NJLfaoVnKiTq3ZFTQOg+zgh3ff
	7SybtP9avA0O2rPBurJphMBHgcId6a8Jq/GoqJ8AFoV+ZX5yjyrf9AEQc0sW8uRcUjh3dJjA5TP
	6VohlQDCgahNJiN3VT0GI08FyODKKtDLD5JGM6j4Yuz14bSH0PRwMJ3MG8WmZHl97YGrZim5ZWu
	Gsx1DbudAfUUbwxekwGHk6cb7VCjifTCeOK7S4wn3yj7rbWfdIDw6WvAzfLgRZMIVzaT+h6vvUL
	N6/pZCA8rSo1siK9wHg4Bg8u/fAQByoILNCLBqOUoz+wvZ5Dy/GvMA475xRsF7gb6LDHWXOAk+x
	ptEcVycIjXR9oj+8PQY3GBjKQgyCcGoTJ2ZLsHmWjgjxwVROLelS5VIuKN9sFLnfsRloePj0kDI
	p8RwZZ/ocT5PxLhradKAf50Wo+Ft5pSRGaRUv3QpHq/mUz4BfkdoV22dBA+mbKxW7X8YK54DbAu
	J0frCuSuv6txuzPR4ZNuUYiC0UzkeQLRWpjUaP8D9Eb
X-Received: by 2002:a17:903:32ce:b0:2b7:8a56:7cda with SMTP id d9443c01a7336-2bd010f53f3mr21231005ad.4.1778567529721;
        Mon, 11 May 2026 23:32:09 -0700 (PDT)
Received: from nixos ([2405:201:c40d:9039:f456:a88e:917b:7f29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm128923585ad.47.2026.05.11.23.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 23:32:09 -0700 (PDT)
From: Ayushman Rout <ayushmanrout27@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayushman Rout <ayushmanrout27@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix line lengths in rtw_cmd.c
Date: Tue, 12 May 2026 12:01:35 +0530
Message-ID: <20260512063135.2880-1-ayushmanrout27@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Minor Fix in lines exceeding 100 characters

Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..ef15b513d363 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -184,7 +184,8 @@ int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv)
 		return -ENOMEM;
 	}
 
-	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
+	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
+		((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
 
 	pcmdpriv->cmd_issued_cnt = 0;
 	pcmdpriv->cmd_done_cnt = 0;
@@ -735,12 +736,19 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	if (!pmlmepriv->assoc_by_bssid)
 		memcpy(&pmlmepriv->assoc_bssid[0], &pnetwork->network.mac_address[0], ETH_ALEN);
 
-	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
+	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter,
+						     &pnetwork->network.ies[0],
+						     &psecnetwork->ies[0],
+						     pnetwork->network.ie_length);
 
 	pqospriv->qos_option = 0;
 
 	if (pregistrypriv->wmm_enable) {
-		tmp_len = rtw_restruct_wmm_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length, psecnetwork->ie_length);
+		tmp_len = rtw_restruct_wmm_ie(padapter,
+					      &pnetwork->network.ies[0],
+					      &psecnetwork->ies[0],
+					      pnetwork->network.ie_length,
+					      psecnetwork->ie_length);
 
 		if (psecnetwork->ie_length != tmp_len) {
 			psecnetwork->ie_length = tmp_len;
-- 
2.51.2

