Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EE71791EB
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 19:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725823601; cv=none; b=i/cwa4rZSuE6jSYaxqFkgdpEAYXk4HkivTEpS9ivrtG2ZmRDJgopRgGB9L01neLIV4ERHPCGzYQNMEpY9bVyVeXn5KgT++ucGJAJrwHa3tM9I9Z1O3cFmMMFpj1+ZdWECbqejf2qexZw5JCWYwiwkaXew1LjRMVJBlijooZtVOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725823601; c=relaxed/simple;
	bh=XHwe7H6bexz83D+eLYTBzL3QtD3B+r1/0yJ6B8ukoh0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oLALqwv/v7exezy87eeQajEQFpi6/EKQjrmsTva8B3mob88AxVqqja2VimaGPKMKY4KtXIX9ahfGGJv1nNASiD0pBURu6tjJdqaFNzxef6tqM8xQeypZNcnQbenurh4XRKv/lzRW1Csa6xwL6STRQC1jHuuQjhnmPtWFMROXK98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=iT+I56ui; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="iT+I56ui"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-205909af9b5so28595285ad.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 12:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1725823600; x=1726428400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAAFNjlraLtXoBlcyevuGi2oA1bUESdHP74uZQrkAmE=;
        b=iT+I56uikToroMKBccc9qrT9pogeSoUEfvSA/qRTyAKz7UoUlShtIftKVhqVC/KMi5
         0nhYZRTyIBPs1/19nlUa+wqcAQ71FaN0JdB9p2tD61PrAXcrwjCTHv8pn9y33FvBuOZm
         jzAU3azYq2cjIH1/j4GE4Wa3ecpoTtMvgTdo4cYyB06xk5a6I941hOyWG+PUjM/9KATx
         u3ZNujbI0BtRa8Zqxf50L2y9yb787AoGFvJgLaznbRHof0QmNJ+Zod2XgJpBmu7cNMQf
         r057l7kSfWbyQ0AIsYWe+rf2IjWCotOZcGwdyZGH7tFUhXGEKdAZPs6d8NBZrrgkCAxa
         aa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725823600; x=1726428400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAAFNjlraLtXoBlcyevuGi2oA1bUESdHP74uZQrkAmE=;
        b=Yz15dmTS7hVAuje2yq7vjqQQikhBDqKqNssX1TmCTV5SboMcgrkmvoHEaV9KWGuaN+
         /qYIw1+qDZCFxEOZMFGwjoJiGUifUWRISxRrXGKqYBCrrNLzngt8I8gqC/oGDhVMDI8z
         nwaJfvyS2sJ0uV8HVd07PZkC+x40TvvyLXO3ruN0p/NQBuN25k9E7+MTKlQse3GHUba2
         Gqo14eBx5tV62SzLtR56O0y9j4Uonl9qVd2XvwZ+frZ8WE62Wwr4mA0Ux9QMsonr0UEm
         7QHtFgPLPNcV6J4/Lt+rbB/tgf9lCjz4+NWzVYUgra16KEGZm1AHAEylS+u2x3c7zUSU
         X8xw==
X-Gm-Message-State: AOJu0Ywdpuh/3NUBXTLRlYY8ctvmnYmSSuyobPVgQdyAKSLoa8+TzLPr
	dLJMimj7VFf4xTR4fZVMcWPQLxxF4MS2EfBgycNU6qIBx8T5VG/y6+9CTjV0DeJtwhPBotl3v/y
	DMMI=
X-Google-Smtp-Source: AGHT+IHN/69yw/KFeXchSAAkjGr/WSIwkimD6G+sYs+qcUtKVBw5d1hD3Uo0qO9V73Yx/2Jyk+ARrQ==
X-Received: by 2002:a17:902:dacc:b0:205:76b1:175f with SMTP id d9443c01a7336-206f04e9593mr115995855ad.21.1725823599808;
        Sun, 08 Sep 2024 12:26:39 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710e1b085sm22703305ad.36.2024.09.08.12.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 12:26:39 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/16] Staging: rtl8192e: Rename variable pFrame
Date: Sun,  8 Sep 2024 12:26:21 -0700
Message-Id: <20240908192633.94144-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240908192633.94144-1-tdavies@darkphysics.net>
References: <20240908192633.94144-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pFrame to frame
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 188e1fd9554d..9c9c0bc0cfde 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -622,10 +622,10 @@ void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
 }
 EXPORT_SYMBOL(HT_update_self_and_peer_setting);
 
-u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame)
+u8 ht_c_check(struct rtllib_device *ieee, u8 *frame)
 {
 	if (ieee->ht_info->current_ht_support) {
-		if ((is_qos_data_frame(pFrame) && frame_order(pFrame)) == 1) {
+		if ((is_qos_data_frame(frame) && frame_order(frame)) == 1) {
 			netdev_dbg(ieee->dev, "HT CONTROL FILED EXIST!!\n");
 			return true;
 		}
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 9f812cedd1b3..95e1c81bf132 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1740,7 +1740,7 @@ u8 ht_get_highest_mcs_rate(struct rtllib_device *ieee, u8 *pMCSRateSet,
 		       u8 *pMCSFilter);
 extern u8 MCS_FILTER_ALL[];
 extern u16 MCS_DATA_RATE[2][2][77];
-u8 ht_c_check(struct rtllib_device *ieee, u8 *pFrame);
+u8 ht_c_check(struct rtllib_device *ieee, u8 *frame);
 void ht_reset_iot_setting(struct rt_hi_throughput *ht_info);
 bool is_ht_half_nmode_aps(struct rtllib_device *ieee);
 u16  tx_count_to_data_rate(struct rtllib_device *ieee, u8 nDataRate);
-- 
2.30.2

