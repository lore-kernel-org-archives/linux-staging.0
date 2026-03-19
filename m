Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334A7393DC7
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 17:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942166; cv=none; b=HNBxDyZmnmY35LXQrl5PJfmleGkIO+nZdrk7tQkhQrj7So8F/TNnD4oFXpZZ8Kk9ZE3BSNgK1NRavw2T4y3OWZxWCjdHTeK89Uyg171hZcqFwDlzEKQpHeeVRICkwV54zDW6v6+SqDw/zimWPPIrSjTcG+39rBS2rF5J+zBTxeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942166; c=relaxed/simple;
	bh=2hWfReVbKyDWnkN5ldkiJ1/OpGhG+p7pbVqUPDamaEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ttFAdBW+mWKBz+jbSB5xAJF9VdRkR7jOqFzy1xr/6f8JIZhzhOTawjH5QI9mYkwB+aIskzUSuowP2drqm/kxF7OxT987egayEwkqZtOc8eyD0b9OlBXZA8QO4kCU9On2xKDPgtVAAh/0ocg6Pet1VVeiGkH1Fm0F97a7k2Ium3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNEfqrWm; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNEfqrWm"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2c0c482e069so1123989eec.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 10:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773942162; x=1774546962; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xt/0Vsaxa/EJDEDsN+O/C83c9f3BwM/BMTG3Y8q3l7M=;
        b=ZNEfqrWmkdyp4CE1wNwPM/rESU5JOyo0wCi2nHQiQJaJLJ/FXQy4bDRbH1VRufTYIG
         gi+Q98E2YpEaxvlQu9d7n/Z9+hYwAc5SUo24mrCpg7eycnpUeWHPuwS0mloSQMayxnqC
         l932QRmYbFlsmgiH9r2RtymLw6lttTQkjema6BOzjfsWeQTc+Y4p0GO0/OdPNMyuWFSC
         Fj28A2E0quUW9IHzVxqM3uMt5vBnl+v3g4JLND9StZcg7KNmlXtv3zD9hX8RfmYDbweH
         TgQmJx6/TiXOUr12gPEZmuy2eAWctM2DT51RDEmRKRel8CR+nsJs9H0TRB4CZksFT5N0
         y5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773942162; x=1774546962;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xt/0Vsaxa/EJDEDsN+O/C83c9f3BwM/BMTG3Y8q3l7M=;
        b=b4Q65U+cLcyHbVvBIWMvWcLIxBYM329aD1TQWDsLqktytG8OQ+tmCLNCFqMu8+iY9q
         75KOZ2vORsBDJkqjoXgYew3criURX5GinAzSO919lav9js3Lm+1czc89hE36y0fs5LnO
         jhCH+0GPAjo4gga9uVprniGZ/dqTD6gMaWT7/8EnWh0TirVOCF+/9kqIFMWnLHYNQsAI
         Q6rf2ZNo2Coq1F4cZloFN41cIwN5mDLya/dJf7bTGjBTrMweQAgYNK9ayr2NRrTQ7uaN
         N5GXoZ/Mz0QV8AdcmqW/+Rn32ktGLX7iFHtiDEdH0Osw/mqU5yLrBXW6Ley8+ryyPjRS
         UgTA==
X-Forwarded-Encrypted: i=1; AJvYcCWn1cbLA/pXeTFJG2/bpFRLX/A8SO/V3Boa1E7Pu6KzTd0sFPA2s8PaQn0zc+Gufmcs7FSJH/1JqqcHEKX7@lists.linux.dev
X-Gm-Message-State: AOJu0Ywny47Cp8dlaECabXn5WffC4TDG5lHdSYgpfW90/7Mvu9yZvxV7
	VZYh4RQntJyAS255a7foQiicpqHkstyVtrrnP6d5IvT0TzPZPcm0CbY7
X-Gm-Gg: ATEYQzy8VrvGXDGkf7+T7mTL6NGm5PzKf7dHFBIupgvdx5H6MdiV48XxKPun3SF1IT+
	hX4Gk2e/L1AyWGBFbaAAWgg729bOj+9vPnbpaYfeLvFP+acK/fuBkA04bAQFG1PJSskfF2qJnPv
	KYVMicMz5WGY3P48U+QSFFa0Od7udc1gr/YUC3QLypNmfMJnHUbaau0SsMUxuXu3eIlTS06uHkJ
	SYh44mPh/kdpVYy+2ApeyiwaPponW8hUZpE+wGVKexoWe/sQ8+Yoirwpk9YZoGmkVz8illFeDUQ
	YEzOQulV9jytOWGtiI3UL95/lhwu/NwckU7yUl5pyA6U35wP5k29Qyh115X+gdKgIQ40NhQt+wW
	acDlEQbaNuoizzYZRBhFCQcyu3k/VUTTo0WBXpvxeWhSZTA3XoD/JrHbVNT0XHme6Zf4yNS99yb
	vBkIgVK0urmqFoYUXmrTlYtla3WR5hkleWdvzscZ271Qhku+N1Uu4lstvbnbUiGUdzfdLD7OJ+i
	hUPNVXfha5D9yU=
X-Received: by 2002:a05:7300:6da4:b0:2c0:dd99:f0b with SMTP id 5a478bee46e88-2c109728616mr126661eec.25.1773942161800;
        Thu, 19 Mar 2026 10:42:41 -0700 (PDT)
Received: from Malavya.sfsu.edu ([130.212.92.173])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e53b5235sm9107556eec.8.2026.03.19.10.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 10:42:41 -0700 (PDT)
From: MalavyaRaval <malavyaraval@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: luka.gejak@gmail.com,
	MalavyaRaval <malavyaraval@gmail.com>
Subject: [PATCH] staging: rtl8723bs: break long lines in rtw_sta_mgt.c
Date: Thu, 19 Mar 2026 10:42:28 -0700
Message-ID: <20260319174229.62021-1-malavyaraval@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original patch attempted to use the preferred sizeof(*ptr) style,
but since the target variable is a u8 pointer, this caused a buffer
overflow. Reverting to sizeof(struct sta_info) ensures the correct
allocation size while satisfying the line-splitting requirement.

Signed-off-by: MalavyaRaval <malavyaraval@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
index 07a6db1d2317..867877413859 100644
--- a/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
+++ b/drivers/staging/rtl8723bs/core/rtw_sta_mgt.c
@@ -54,7 +54,8 @@ u32 _rtw_init_sta_priv(struct	sta_priv *pstapriv)
 	struct sta_info *psta;
 	s32 i;
 
-	pstapriv->pallocated_stainfo_buf = vzalloc(sizeof(struct sta_info) * NUM_STA + 4);
+	pstapriv->pallocated_stainfo_buf = vzalloc(sizeof(struct sta_info) *
+						   NUM_STA + 4);
 
 	if (!pstapriv->pallocated_stainfo_buf)
 		return _FAIL;
-- 
2.43.0

