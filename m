Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E04111AA
	for <linux-staging@lists.linux.dev>; Mon, 10 Jun 2024 05:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717998542; cv=none; b=CBkv8iSZ4rqVGQpYjFC1LXffRM4dr/amFX6tIG8m/R99sG2thJFJdd3GqOaDJq4xJNB5dMRtS3kNFlTxz0cH7/uPYBgiN5ePCNybTg+sg+/97YdOMVDA/hI+jqYkdxCZMFl69NngCfSzh06LgNsyAPO5ZxZICtSt3B+D2NCKdQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717998542; c=relaxed/simple;
	bh=qYhOWTTUKof2c4QgKWFM13jGlMxV2R9Pkak3B0MAmE0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SC+/ZUkNQ3oiEImfFC6tOqXvlDqbrzuF9pJ2DRUv3Amqag5M1UZGt9Owc3ebLYID1RrqSJCRccJON/1ejHxO5CW4OhUPdxoL6UjOlasu57+wYSREJ1jjycFVtGEZ5S/SbLIH1Zu10YjYUqAWqTv1jQQvc8LdYRcT8ae9imCvD3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=TuBahjNX; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="TuBahjNX"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f6c7cdec83so31721125ad.0
        for <linux-staging@lists.linux.dev>; Sun, 09 Jun 2024 22:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1717998540; x=1718603340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRXRGFVuPvTPmvLX2a/6A6CGCqB7aDpnf5P75tUEXgY=;
        b=TuBahjNX+Z0awbvLrpRvE558Qop89I+Gy3Lfdc3IC0quDBH0aBoSfjjcMDV3i6EzJx
         MkhkCGeAZiHAf2zHYYPVV6Cewsl7ZtpfdHipV7M3DbZpn5VjpGL8RkfZ6CzBT6ZglsTM
         ZsAWL/c+HooQZlY6Va3joszkb9sV4TIdz3InvGE9BEyZOjxc3ovQ+6Q73BiBd468mx43
         luFU7TDvUyONyCKPb0FUz5jubx/ssOsppWFpe7lI2elueblZ47W9OVBXjvjHK+BUbXJh
         qFDUmOA6C8PCCphI4mhqDbHvr6K8xBuaohe4DJZFOxWJP+AtYCdYHNqaYj7K63gyAtw6
         Cmhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717998540; x=1718603340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RRXRGFVuPvTPmvLX2a/6A6CGCqB7aDpnf5P75tUEXgY=;
        b=XuhVzNMe15igGzsB3ABZ4IK3UQYd8ghIl4uRR2ANSas2AZ2ClMPdtZgjhlW2ROOGBt
         iv3bhDNu511wmNBxv9RCIX3lX31VOjSxQY4XuAYxjGwbuJx5/aoF8qGKhwE0s49QPOVL
         +VvXInyWGDIjjJcyEclr34GhoelV2ia7c/t09nvXBZ0T08qUmZ/vALiuMSDlpTzys0kV
         LiIqQ7r9kOwwzfXNYiLKiHM+vPiE83ptS/yOHbap4l0AiIOvI8kH4Rq9/6ms3pBqg6ui
         9FV7vU5U0RXfUFlZiIoMdF8sDGlC0oMvo33C6BtMgJoB2ooDFBpbuQKHpyNHgeJC/d44
         VoVA==
X-Gm-Message-State: AOJu0YxzT3aLH7kKvikgPCHpnx0wT2279XrVe7dqJW/A5dYQT10WhJ9o
	+NNY1OdK5gMJ5ufdNmezjxW15lj1/w4cQ5ZPXB4gcdBqkUxkDCY6dX+MRfwXtvo=
X-Google-Smtp-Source: AGHT+IGEuNTi3Jp96CjNxqopxOinooozrwQO8gHbqgUCgcm4hReSHbBK2fpFZHd1rpF2jZcIIXgRrw==
X-Received: by 2002:a17:902:e749:b0:1f6:f3cb:13e5 with SMTP id d9443c01a7336-1f6f3cb313fmr60008235ad.61.1717998539690;
        Sun, 09 Jun 2024 22:48:59 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f1aced64sm35653725ad.9.2024.06.09.22.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 22:48:59 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/24] Staging: rtl8192e: Rename variable HTCurrentOperaRate
Date: Sun,  9 Jun 2024 22:44:28 -0700
Message-Id: <20240610054449.71316-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240610054449.71316-1-tdavies@darkphysics.net>
References: <20240610054449.71316-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable HTCurrentOperaRate to ht_curr_op_rate
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 36a734ded7dc..e38cd0c9c013 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -496,7 +496,7 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	ieee->HTHighestOperaRate = ht_get_highest_mcs_rate(ieee,
 						       ieee->dot11ht_oper_rate_set,
 						       pMcsFilter);
-	ieee->HTCurrentOperaRate = ieee->HTHighestOperaRate;
+	ieee->ht_curr_op_rate = ieee->HTHighestOperaRate;
 
 	ht_info->current_op_mode = pPeerHTInfo->opt_mode;
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 46bc3561f56f..6dc641f78202 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1198,7 +1198,7 @@ struct rtllib_device {
 	u8	reg_dot11tx_ht_oper_rate_set[16];
 	u8	dot11ht_oper_rate_set[16];
 	u8	reg_ht_supp_rate_set[16];
-	u8	HTCurrentOperaRate;
+	u8	ht_curr_op_rate;
 	u8	HTHighestOperaRate;
 	u8	tx_dis_rate_fallback;
 	u8	tx_use_drv_assinged_rate;
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 8856191a1228..360d1cc446d0 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -510,8 +510,8 @@ static u8 rtllib_current_rate(struct rtllib_device *ieee)
 	if (ieee->mode & IEEE_MODE_MASK)
 		return ieee->rate;
 
-	if (ieee->HTCurrentOperaRate)
-		return ieee->HTCurrentOperaRate;
+	if (ieee->ht_curr_op_rate)
+		return ieee->ht_curr_op_rate;
 	else
 		return ieee->rate & 0x7F;
 }
-- 
2.30.2

