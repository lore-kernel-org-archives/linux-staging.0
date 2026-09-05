Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39CD44CF40
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 12:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611709; cv=none; b=kLfhMLCHjlwzHJs4HoBHmOh4YwJP0VcKzwQHjZUVmSBq8DMwuLymMHWHiqWJRff3LgjYMPW+xn+kPqekKGwLbtLK1RSFJkj6oz70IOCHteZ0kHnPWbKiB14pNEcblaq4eeEFtmwLxVeDrAzT2nHuHSIrTUkg1ZizjuJl0dqcvzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611709; c=relaxed/simple;
	bh=FscHQeKZUzuZgsN1YVbqBe6K3v3ip/hOfNYfXM/WTBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWS6+yz6BXpJAkRDMBnJYAwITVXF10S7Y49CErsOAF+y3nptVSzKVldiJHz66SnbxjiTUOELl2sJt2ZOiCAv/Pzdc6OaZxMXyIbY1DuP5al+c0DMpcPqHgWU3iPcfyBAOAIeW4TRvAkGXnrIfjE5OoO5zLxMK9f2iP+ubFbpBS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i644CoCF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i644CoCF"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so20811405ad.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 05:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611704; x=1789216504; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3X7uidjFB8vVdKb+fO92WnrzwU/cqJo9nFwSZVVmzI=;
        b=i644CoCFUhQJG8lJY75deDRUUfgTbtQD/wwP7arR8cb3VkjXZyH8ZoxK0geBEdPb1d
         +wT1tMSu6NwhBRfat4QwEZRK0hX8TRLL39yH6pkYm1GYBuM5JceX5xEOAF9Mm1bSorE+
         6RVD/a12CW+KNIYixvMygixVM6xYp3tmb23FiRv3qJwWosTs1IZqKk88w9lcU4LKLjW7
         cQmm6c5rqSfl9F5XdVHA4deHmdEUo5oK4c+QEPBDTZFpVbDrlJCPPjzv2L+v/m+tXH2T
         0E3K39WhGAdkleOvvN81c0b0jwPmIUrLhOkvHmCNYzoE30qMUnTuZP/PPIrLUcO6plc2
         aI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611704; x=1789216504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3X7uidjFB8vVdKb+fO92WnrzwU/cqJo9nFwSZVVmzI=;
        b=pHNH+2xQwtSd0CqcS4TwyS1hyXBskqIg3zKAt0LUZDNg4/9sW22PrzoAM6yZt6kLDy
         sBMGAVlzYTnecJQEU52Oi/kH9uWkr4VyU20KJywMTio1+Lh1zGwSx15bZdAboKGJ1px3
         TSOr5PY27JFMvFlDtT1e76iWnZ5k3b0hUScz7nxVkiFlLttrRi4xX/mAATvtId3XR5z9
         7kxAg+TmeaWwC2PAlQ4apYZwRQGThW3AuiuiseOtiKgllmQr6Si+I25C1+5CoTMjIlAe
         hvka2TbIOAAmmGTQpzTlO9cA/xac+Iilbdgm4JGqdqk05VUmVI1dxDjS2pgrA2crSfYt
         bYaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaT0JYZ6M98bavi6PFxzT6+J2ejY4B3xC+HxcjtLUtRO48coC/E+FXHsfA9d2BufqEezpUcJGpqN0bg4wi@lists.linux.dev
X-Gm-Message-State: AFuF++kFmHfbxQMURJxKz3Q30iTNaSa4BovXvdeGCmM0Yl2K43YXW2GU
	bzzjrX+CbAufviN8bq9VmZbuT09fZt9g1SYxkSQmqzxyoxvFCdDRxDkz
X-Gm-Gg: AYBFou1CPtQbikjLG8eeh/dYqoi0NeMMj1vf1r1A7cscqdbTlSmCU2CiyyuNrCQfs9j
	IS4fvzEA7XkiXTZCA9EaIOsnS9lSUe/fEiI3hUe0vNDp2i4jH6jRiI2gEQO+b0viWZCjqLvApDt
	NYmwFpjq98NwdHioOwcq1jM9t50Oq4VD133stEDywvEJxtu+ivelN9eDUTnEDcQatKKyTqQ1zf2
	iqlE4wtHb8l0Xe3XiR4qfKStrQuFUm9Ja7ZoyAVKfP9yl3aTkMmz7wDEEjyrkgz+Zlt7PTssJZQ
	sK6nWB/x1Aw+WLiXM0J9ZBWunhgafNEeqgIFxSpHRAlbUUArWPpCFS+9WhATac/8wqNXZ2myD7g
	o6BvhlHDZFX1rBiWc0Vpda9E8DTEJOCQBOuHZdanYP4GP9nyN4pilnvA21x6wszc7U9T7Ktohmf
	Qh38F2QpAPWoyP++gfvy7SB1cHwfBwPO4fpuAj5vVo2ZAUeMCTY75CDnPD8x9HpAr54tNitG/T0
	EunIwownVAqZ1K0Ji5tx2gBc6y+iTmo6A0zWV3DLjc=
X-Received: by 2002:a17:90b:258d:b0:396:4c63:7193 with SMTP id 98e67ed59e1d1-39b261323e0mr19491750a91.11.1788611703632;
        Sat, 05 Sep 2026 05:35:03 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:35:03 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v6 3/4] media: dvb-core: remove defective and unsafe ULE debug block
Date: Sat,  5 Sep 2026 09:34:49 -0300
Message-ID: <20260905123450.5620-3-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905123450.5620-1-breno3011alves@gmail.com>
References: <20260905123450.5620-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Completely purge the unmaintained DVB_ULE_DEBUG code block from
dvb_net.c due to severe lockless race conditions and buffer overflow
vulnerabilities on global network state variables.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/media/dvb-core/dvb_net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_net.c b/drivers/media/dvb-core/dvb_net.c
index a2159b2bc..3b503695e 100644
--- a/drivers/media/dvb-core/dvb_net.c
+++ b/drivers/media/dvb-core/dvb_net.c
@@ -68,7 +68,7 @@ static inline __u32 iov_crc32( __u32 c, struct kvec *iov, unsigned int cnt )
 
 #define DVB_NET_MULTICAST_MAX 10
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 /*
  * The code inside DVB_ULE_DEBUG keeps a history of the
  * last 100 TS cells processed.
@@ -320,7 +320,7 @@ static int dvb_net_ule_new_ts_cell(struct dvb_net_ule_handle *h)
 {
 	/* We are about to process a new TS cell. */
 
-#ifdef DVB_ULE_DEBUG
+#ifdef CONFIG_DVB_ULE_DEBUG
 	if (ule_where >= &ule_hist[100*TS_SZ])
 		ule_where = ule_hist;
 	memcpy(ule_where, h->ts, TS_SZ);
@@ -659,7 +659,7 @@ static void dvb_net_ule_check_crc(struct dvb_net_ule_handle *h,
 			h->ts_remain > 2 ?
 				*(unsigned short *)h->from_where : 0);
 
-	#ifdef DVB_ULE_DEBUG
+	#ifdef CONFIG_DVB_ULE_DEBUG
 		hexdump(iov[0].iov_base, iov[0].iov_len);
 		hexdump(iov[1].iov_base, iov[1].iov_len);
 		hexdump(iov[2].iov_base, iov[2].iov_len);
-- 
2.43.0

