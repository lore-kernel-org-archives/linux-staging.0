Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5C3A3E63
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 15:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778513412; cv=none; b=VKp3ZncHkuby3qyk+tZG0nnaNn5onjPzTsmJtR3XHW8mOj0xfLLWF3YtZvIJ0//2IOkXl84ZOvK6cGFvtfq6jBUPLCZRseIY4NOSwHbc1UWhmjvwcZXQDOxfQBfHB04r7m7LaXFdChPbIoG2ht03QoK2E0b0HVUCt4UY26hiZBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778513412; c=relaxed/simple;
	bh=ZdS+rpovKuZlf79yhgSlyR+MT28rd0NTZoCrok3qGa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QkMY/Y4baQJwAph7v35Yy4LrFrlecFNoUe3tpHmgYhHn0MV4KerIxc5Kk1QIw/BSdatzfdZA31xJ2rTLIZMjiZ8eex6Ng8bBxChsxeW8ppvULxJKoA3Zp7Mcs5bwgBYP98VVKX4kJZJX0/ebcgtGhn/xFDLj/+BdbyEkRqMKhhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfvPu3bx; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfvPu3bx"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-366375c43c2so2469821a91.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 08:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778513411; x=1779118211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MweUNj1BGElINwgsMvSs+qKc/DwMCdtBnuHB/ajyfD0=;
        b=JfvPu3bxQ2ATrWJ3MXpKToY0dYGv/zSQzLskrhY/RJnBVZz6b5QH2AV3wl6it2g6pc
         42iJid8Zjx8sPAFS32pWEbfjW51VRFyj9ACjpYo/IQvCuN6yOOgqfO6FRQBa6i1fBk1x
         8LIypYsEs7I6+0yMOShWW5S0/Uczs8VnElh4SIxLOYSlPgCMlPUu5NIV9gdS0xFvTn72
         Bd9ZQtk76+VRpU5HGldHvDjsMg3GCGaaFOrWDuyFrakkbiNkhQcbuuJqWt16HFEf6cAL
         BWeZhLYohXoJHm+WusBknbwvzDuBWOP3xz/nSIF2XmJHQFv2z7Pvweum5xfyEjV4X2P4
         CYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778513411; x=1779118211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MweUNj1BGElINwgsMvSs+qKc/DwMCdtBnuHB/ajyfD0=;
        b=jV6ZCs7c+CPv7kcHmKDO8num6p+1MDkzE+t5sIxIKXHvtkcoDApLFeA1K1Ma60g5QQ
         CxhxaBoEdTAyBrwN3dcAlltwKbHj1wlCBgqIwcH64ZE8vOJh9M6S8iPC5uN2sPBUcBY4
         Hmgs7JyNOZU3C3f4+SU6LU7BHs/s5pMu3LAiM0Rbpaem1Fn85KRUGwQUgglSM0EyGsZU
         nlOaaJVPgq/MKWnLEiTiMwkGs1+mlHUJWF9pDfg8bZUxtb35P8CO18KjL0NbjOKZIs30
         JVk+20Zap6GQ8c0QuXdQVyf6pMT9f1SGf9KK0YtLmzUyzqYawE9XMezXALUvO4CRFdiB
         S1ug==
X-Gm-Message-State: AOJu0YztobcEHulh8tKM+3BqG2GpbmzsCLruv3kA599yNJMKKIaDRDAT
	J656P9AkHqodCTkDfBCQ+BjIAYxCEcYXt8eOA8s1JLWbcod2JUCPlZG6
X-Gm-Gg: Acq92OE6KY+qKC2nBICCldskcZR2brOn3s0Faf7BbcUPxuMOon2r16WMsO5gA6wVocJ
	Tm6TwcRbNtO0LMzd33521VYEr0gVBk/V+HL5LgHsJD9UFEp6m77c83bLsaC6GvqXVnIOObWBIJS
	aQnX6tG6hbWEGQpylOSg+YFaj7A5ZB0bdbaVS3iRH8nPDVk2y706R3ygCz8Fs4sEKS54kLT/+d1
	M3TC9dy5ETMii/Mo+pzQ9z5f76kiJTGP7BDsinioONZrZd7bPRBDFaVGcsFEDPq/uyNx+1gE+NQ
	1EPhY/2sXRXySdXAGEahiTuvtWLF1/W3smaVJp+3sSAtZBw0zMO6aoubql3IjmKtcVoy5EFrDJC
	qsNNEjq9ghIzOwPE+O6MVgprMWDO3XHxvS54Bm70fc1w9/dqMTQRQKGtyoFulQRl6aE+cAMIInJ
	FLeFScjP2fBctf1xpxu9v0aX8BaiYqpJnzluPEcMMUpTYC47wCdG8oNyjdWpOJ1ayIuvCkamQFI
	+Q+ZJoOWcYxmlnM4dBGkjxB2xK3uMp2OugZo+UBWY2R
X-Received: by 2002:a17:90b:2884:b0:366:16d1:6a25 with SMTP id 98e67ed59e1d1-3664c8db246mr15255583a91.5.1778513408012;
        Mon, 11 May 2026 08:30:08 -0700 (PDT)
Received: from nixos ([2405:201:c40d:9039:f0ec:39a2:9884:a02e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d623fa47sm8327752a91.3.2026.05.11.08.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:30:07 -0700 (PDT)
From: Ayushman Rout <ayushmanrout27@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ayushman Rout <ayushmanrout27@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix line lengths in rtw_cmd.c
Date: Mon, 11 May 2026 20:59:32 +0530
Message-ID: <20260511152932.5894-1-ayushmanrout27@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed 2 lines exceeding 100 characters

Signed-off-by: Ayushman Rout <ayushmanrout27@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..e6857c9351ce 100644
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
@@ -735,12 +736,16 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	if (!pmlmepriv->assoc_by_bssid)
 		memcpy(&pmlmepriv->assoc_bssid[0], &pnetwork->network.mac_address[0], ETH_ALEN);
 
-	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
+	psecnetwork->ie_length = rtw_restruct_sec_ie
+		(padapter, &pnetwork->network.ies[0],
+		&psecnetwork->ies[0], pnetwork->network.ie_length);
 
 	pqospriv->qos_option = 0;
 
 	if (pregistrypriv->wmm_enable) {
-		tmp_len = rtw_restruct_wmm_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length, psecnetwork->ie_length);
+		tmp_len = rtw_restruct_wmm_ie
+			(padapter, &pnetwork->network.ies[0],
+			&psecnetwork->ies[0], pnetwork->network.ie_length, psecnetwork->ie_length);
 
 		if (psecnetwork->ie_length != tmp_len) {
 			psecnetwork->ie_length = tmp_len;
-- 
2.51.2

