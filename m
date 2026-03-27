Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D9C3DEAF1
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774610108; cv=none; b=sWDwluXbA0LeOQByS41vnsvMeA5HVlNdEL/UcWlJvB85zeri5EZhqfndae3uMuwEdZvsDQJeRyUrbWw6EuevZLay+RsQNz2TYUpY02cI8kKp77hFpB6h2kuiwXH+z5D/9+cYuOcfCI0JU9DabAjR6D/Qc2cRlH9kvYvX5Z4b5BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774610108; c=relaxed/simple;
	bh=tFhCJtiwMIdTlZXgIbPceA01Rw1Q15s5r97JT3SAqik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WBf4iF3acH2Gp7mZie6HJ/bnrLD6sBOHeM/lVOwAPiU2CTv8g0frzu2l1PP99FEqvIYJ97AduMb4sxhqcqdess4ATqYppdy/QSYD4AW9l1hxvJjgsSsPGOdQC+3oTWERbEXfr2jYS0C3NT9Vy0Q7vrDVIXcQYlv+M4tJ+1B78N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEkSrjZa; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEkSrjZa"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-35a1cc6e478so1228322a91.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 04:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774610105; x=1775214905; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgEBY2zczlI9Ef7Dl/8TnPsWAREcFxRDPJaiBshvt5o=;
        b=fEkSrjZaJWWM+sMXmbsTVC7Udn/ENnTyxY/bnl3o7KMsr3uTN24qhILddNmMOICrz2
         Cfx0ypbemaSSdKJUKfpunJHOMAQ2y04IF0XWusb2wwx/hWYje2MEp9Myp9vOcu7e6PWk
         g7lKmyjT5Z2iHVf6d+Zy5z6trCDoaeqmJlCvGfOV4QAaDT14a5VSgn6cXnTPa+bxJNwp
         isCFrWmNShhMz5bJ5oCE2IAN3AlizaG8EgWIuTKjx04oM7z2px5wvkxWeSsob2H2c1pU
         i1zFL2KuXchyoquMbQiSC5j3P98HBJDa9uby9bzQ+teW6VjudcAZeDWK9noVVgVPm31L
         +EMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774610105; x=1775214905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgEBY2zczlI9Ef7Dl/8TnPsWAREcFxRDPJaiBshvt5o=;
        b=hGUEYSynvFw8COHU7fcmBglbEzfDPUb2IJt0FZX2vGZGtMC2qry3wSZ8Vz3K5Bzrlp
         8arTf1npGEak3yMXsEXBTgtz5HOOQZtmi3ojn8xRBsoVWdwvMYlp+AMb/j7ZkU0RSHkN
         TZpCJv06bjIY3aGAg/y/5R4ifyMiIDTc/E0MoMO4t+4dv8sTui6ecCPOfQLz1wqx/H8S
         YG8eZeN0Sl5LV0yAhyg9Gjt/sUs5yX/93TxWlH+/fYahq6iWaPh4uBZNKnVkw6Wprik4
         kQtVzMNt+/Q+IT5FPCyaUfdJJuxmt02bAcRFakU++lmTWDxFfv8j671llhLDKEGI2x0K
         vdOA==
X-Gm-Message-State: AOJu0YwxFVmqWpHWR6vHMktuMXOicjBFA/3MJhbR50oRjDtueflKRSl0
	ZxfjXVYhgNMvZaZLPRY4jGPYNtkSUg7kdtEPYWREYKC6YWzSWOeZpMlG
X-Gm-Gg: ATEYQzz8iBIBxA69sx+2Soj7qVIH+hJ4DeKy45GWXYqmTqszLGsdptmDxpmZ99uxZ4C
	8XgDSk4tJxjgrcvO9Zc6XXYgwwktsvj+pO9vQRbVd1i77DMzAcb/vGIwvNow+7Go7MCG2ijei7D
	4MZKB1npDgxfxHEIiAUsuV3SVEltULPdBl2nSW8HbXOXCYk/O5jnlMT6IoeULkv9feT66XQVBYF
	8izCgAY2Qvvg01exby0UnPSs4hLaA6yznV8j/RB84tdHzwjFrx1nWQSLsQy1Ywnertj5CPIxm2e
	nUErIzgDNK00SEtHs1fCQ+6W4opBu6QU4p33I/ItSrTxLUFpS6TeEB8cc+SQFxO3xg3VldY3jXm
	YkkdDUzoz8Q0pGO+HA4vxoK+fnQpo8gElDfhCv64O0kt3OYVGveqIsY5qSljs9uznrGEI4ukXC1
	ABAyG+HhKyOZ40N7fTJlLaljkNMGkx0NuR178TmIs9TWXXYaLnrSGTqA==
X-Received: by 2002:a17:90b:2245:b0:35b:a7be:ae62 with SMTP id 98e67ed59e1d1-35c300d00d6mr2351009a91.30.1774610104722;
        Fri, 27 Mar 2026 04:15:04 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22ba5700sm4622405a91.8.2026.03.27.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:15:04 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix spelling in comment
Date: Fri, 27 Mar 2026 19:14:54 +0800
Message-ID: <20260327111455.3260-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "co-existance" to "co-existence" in comment.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
v2: Fix author name format in From and Signed-off-by lines.
v3: Update patch version number.

 drivers/staging/rtl8723bs/include/hal_data.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index b87c90f693ec..ff4383e30322 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:48:04.333064200 +0800
+++ b/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:49:02.478348700 +0800
@@ -385,7 +385,7 @@ struct hal_com_data {
 	struct dm_priv dmpriv;
 	struct dm_odm_t		odmpriv;

-	/*  For bluetooth co-existance */
+	/*  For bluetooth co-existence */
 	struct bt_coexist		bt_coexist;

 	/*  Interrupt related register information. */
