Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9322B8CB
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770065695; cv=none; b=T707FY9j64liR1R/zhBgD1qOOHZdXbsmJ8WFr2kGZQAebk28oQnLwkKvUMzUfb4ZVBNxaimDzV89hFenLHSTa9ZOKyI8MVhaKy3rFyfFAbzQGxibQCW5MpcgHT67898uHdZ7aai+P8SkLHmskSYM4s+nZDNJ5KqrOYiduwJ0OtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770065695; c=relaxed/simple;
	bh=xbzYJNxSCFjkiffSM6jyIjz1IvRu/q+sVuB3QG1dkqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RI/DTxKXi6MAfXqOOq6zp1DzqFp6oNuZLJsyP6L1b7eHE6Ez3Phs/p3pczCKA/vvplE0aCTuzgFt2NE36nA4kF0ktrsh2DItK8QoypC9ZcNrJ/YALcrq/rkachRjmR7J6MSnTc5oJq8TaR30qOmVHc6Hf8gNzdbOAMaABrEI9L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQpXC3+I; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQpXC3+I"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-79427f739b0so47618797b3.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 12:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770065693; x=1770670493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1iTIQduAX8adZigUW+P0nUWVGs+OtfVrnk6DuA8/cXI=;
        b=aQpXC3+IlqikYgKEH5ciJl6cuCYo2JjrbomZ+zEKMkc+rU3kPEuSrrH1fkG8XnNyKI
         YPkE5OkINuU+IURspMQ7HCf1elluWxFAOuFIVnbN7V6FkSAnxqdiZrO11FMj3HqyG0Mh
         sUjGZrgF4KLxumaivxli4FW3aUR/Z97i7P51Aok/0dNySKtXooADmaP3IqayNmVi+C48
         HAsPy/YZA97iE3A2qnkerlQQAFDWJaoZHkb3T17MdLsA0koE51O3PVCqhm+xw72pMM74
         LYBYfyQZ/6CTvMtxJ9b4wC8xeBZsnR2kNtNYXbPGCKYUjlGaSKJL5vPADxuVIVFVj0uC
         gtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770065693; x=1770670493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1iTIQduAX8adZigUW+P0nUWVGs+OtfVrnk6DuA8/cXI=;
        b=H673LM1uKOqkquGZHCohL9vwYYaJTsFyLFXv5lbdiUXgPPLZE0layyLsl8E+mKdqj7
         vPa5o7qUTf42BBdJZSq7bZGzZWqTUN3mTO01m1RoKFR7RugtfO4IZYMBMMqQEpfrKVq2
         /Ke13g607zHtppAO683XRyxDCmwnWB49hb0rMfpx86vfT53+K6TL8SZ1nmMD7VvcBcHi
         IVh6+sdcni1j5Ko/22eKOnnGhLIJINElSL8GFIf7XyVW0U31nURWv62f9pC6lXvcFaeL
         pxGMM2JhLpgYlncMJ9OfkufmooqJS3B58wkPUoCC9CwFebDYlZB8FN1aKCNjAFqQp6nh
         dj0A==
X-Forwarded-Encrypted: i=1; AJvYcCWu1ssmv4SgD4WLw7KSrTG+AJTXZPzI6DyRfs3Dg0e1dgDRMdtivg8FH4BJpT8bFL4v4cNROIO8cmJ9g7WG@lists.linux.dev
X-Gm-Message-State: AOJu0YzMBMhX4wBXwofHGGPwkZYrdHkkcQMLVnhw4YXHC6r4U+JCjUH4
	CtMJnbRlra/c48GjFrajAM28Y88IWlUUmRD9ai8Ux43+BzPJB09BcYJp
X-Gm-Gg: AZuq6aIVAFU1Q/WMKCdGVvpj7ZTX2VkULbCqCYZA+4FxktSv0yEqTXr6RC/scOhCQUh
	6EvEcICAfcrGNmXBXq5N2yumPr5KHCCPlzAszj+26tBOVvZkfl+gDFxJRHxO++FIT+mSbdBbClU
	j2y01eHg7bZ9UHW79f+K7iZMnArpzHV5VJ3dfTe6OLtPbREOAp4tfXAR4sLQQWOreLJpeUKSsvQ
	654MVrlQGkzD1Z5+TZLpKSZPce1aBpbH03Ww8748j4qWUGB5spPPkfgYqmuuQ+M3QrtnWyyU8o8
	lRtuAIWG3OCK+gdLfXFGcsh8YIq7XtWb8cctDVF2wiuav+VhTKu/ZW+roycCzCY+bnHpRzQULWA
	Y9laQfw8C2JcuHWPDJZ3+8VcHmOtXrX78PLMceGxzJpeSvIvaSxwCrYkFD+vDiFKX9uXnQdaoqt
	tHfJBgBRzjmyKzOuBIxvFxxHo=
X-Received: by 2002:a05:690c:dc7:b0:78c:2916:3ef5 with SMTP id 00721157ae682-7949de63e70mr120040087b3.8.1770065692890;
        Mon, 02 Feb 2026 12:54:52 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794b2468901sm55977777b3.22.2026.02.02.12.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 12:54:52 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: gregkh@linuxfoundation.org,
	straube.linux@gmail.com
Cc: dan.carpenter@linaro.org,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix null dereference in find_network
Date: Mon,  2 Feb 2026 14:54:29 -0600
Message-ID: <20260202205429.20181-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable pwlan has the possibility of being NULL when passed into 
rtw_free_network_nolock() which would later dereference the variable.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2:
- Included more context to demonstrate possible null dereference.

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 8e1e1c97f0c4..e734d35c11a9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -828,22 +828,24 @@ static void rtw_reset_rx_info(struct debug_priv *pdbgpriv)
 	pdbgpriv->dbg_rx_ampdu_window_shift_cnt = 0;
 }
 
 static void find_network(struct adapter *adapter)
 {
 	struct wlan_network *pwlan = NULL;
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
 	struct wlan_network *tgt_network = &pmlmepriv->cur_network;
 
 	pwlan = rtw_find_network(&pmlmepriv->scanned_queue, tgt_network->network.mac_address);
-	if (pwlan)
-		pwlan->fixed = false;
+	if (!pwlan)
+		return;
+
+	pwlan->fixed = false;
 
 	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) &&
 	    (adapter->stapriv.asoc_sta_count == 1))
 		rtw_free_network_nolock(adapter, pwlan);
 }
 
 /* rtw_free_assoc_resources: the caller has to lock pmlmepriv->lock */
 void rtw_free_assoc_resources(struct adapter *adapter, int lock_scanned_queue)
 {
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
-- 
2.52.0

