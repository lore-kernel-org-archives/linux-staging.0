Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794561538;
	b=3s6mf89lG24LW4nffeqAM/QCLLQultCBqSeHKlBABw8oh6YT6y3IGsvrMXz8VZ2Ipbg0
	 b0N5BXU3IGB5jzrSSS60ztdRrDVEkvmKJYalEA1XN4MVs5e/w5Qe515CpK0DcBdrWaA1H
	 C50ASzviUMjngJ9DECUP1cjlBwBnbYTPQjqS7OUEnM1Xp0UEOyGvBF9zndHu512bplkut
	 EjIloY0cLMuJFt+aXAwVN9FuFGZ/lHugFsVY68Y31WPO+bipa5yqn+lUZ2ryIaCUM2F6Y
	 n3a1QAMt13Szw3gQygbKWD/Rs7fqYJuvR6dtE+3cZ31BW8EI52XPeFngELuHSe/+nmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794561538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=szFe5emWnAit7KZ7yNX1R5l07ApZz83BJEZZ2s4QdVo=;
	b=lRpbVzV5neFbkJL4yAOhyzBlU6/JVKis9cxz6GZZtLbhp9ylvHdeuCO2XyzxOpflI2K0
	 ISPZmafj2rT4nkUgFhyaBvgatVZTOELIx2C0A9zcW/fRiJwdbxlOy4P8t3aFBQQGe9c2s
	 M9QA7M/QJUH/x2gog6zWbXBAMVKQQBO6br1FXliK6T2+tBJ4h3QlfBC9iVJ7bvS3DeIo3
	 VFKShcA4IO9QlZvbOPL3z/gA/MCxnF5hf4ytuzIv0Br+DdaRgceSi+U5fTNF+8YlasrsJ
	 /NAibqfsSZnQKL+CmZAu2zGCr2J8GThVa4CRCbENr6A6ZfNeTtohJy0BC8M7m2GTBEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPy5aOc6;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9266E606A323
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 09:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9266E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BPy5aOc6
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b5c3288e6cso278814b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 01:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794561538; x=1795166338; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=szFe5emWnAit7KZ7yNX1R5l07ApZz83BJEZZ2s4QdVo=;
        b=BPy5aOc6NxAnoG4WSsH0OGnSqGl5Fj+1t8ceId8x1p46hgQZAd0cpSXfaXXjLMbz7u
         UJcLV5HrLzJ/5MmoNEkfZKFFOT23WaE0KjmGjIF2CMm5Gi0cceS6l5VJUvVq30wNi4g8
         3iDpR6d2+JtumZBddNIDxf1waA0bhvt2URvRM4YAMPpwU4acL8rhr6lZGwd06umF/psS
         Z5s60Zh+Oy1yvBo+vlW22wNXgfKgANRTigFLFxD/Pw7jbnc5TME6xSf0Oid+Ui9tvGyi
         qdxe5byAgl07L3Q2GDulIR2AchON9Bse3J8nDRRQ0kDuX/HAYtvsZMexqEGbKM2zdozF
         c0uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794561538; x=1795166338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szFe5emWnAit7KZ7yNX1R5l07ApZz83BJEZZ2s4QdVo=;
        b=Xv53zT0jR0YL8ndlqNaeOb8FsbCKXEE0FtLVFGNu0MaxILZCWnhnuHTqkn7q7a0Ltb
         1RCW4EkMFL0EAgphwfv29gbInKADo3rCR+5X2e+6GyYNe1f/Pf0TKsnWR+1pwxuvt90y
         LELzLYxGmKgsjWlt2QI+NY+1TFOYWZmwEXK9nsf33OFYw2FaIfBNNly2aTYEwcNiXcbl
         iAsdIp/hgATay8gbh30FnGlVW9mAUg1NN1qhxnHA1JeqJ+uDJh7uQG7y4RxcI05tGAJ9
         4mlX7+wSQhxz0vPCa3LRUK16zFix+t9cGXdZk9PMOy+5M8sapIavLJhGWnk6snOqUK7Y
         88WQ==
X-Gm-Message-State: APuU4Z9CHBjOdHmPaqbU3iA4FegfW63tq+u1HdsV2TCg/XQgyCjmdsJh
	cF4Tlib0bGuOWE+QkMNpfpYotLjXXjkfcBU2l9gEGnWazsCf/gbrCKzB
X-Gm-Gg: AYBFou0hOFqKgQPAqiM+JMyxNFYximqUh0pnaHWTmSxDf+4ISDtJvZ06dv/pufAsRH6
	b4QjtxWopPwSO3FsgbHscgq+/rpe75ZFbycZNbc406uJ1w3yfJBAwqridKGPc9vS83GqcT8nw97
	HI6goXhksxFMxvhI1lPEGTa8bo3QJYU5DXZnwWSrZj4rIdVrSo9LMgVGChn3dR5vsTUbdLKB7P3
	u5fsEKkL0wxvPNDZOuQG/9VjMeutZh0wAaZWGWXIxWD7UOCVOjH3m2kxiLgBkDXMiz1M5h0k6ht
	8FetxhIhusFMJ3qH14MWd+Mo+gUjNYKd81Pk1f3qf8My01Awf+/s4LeDxNxf7d6Mx9PZEPepQFe
	gUN7Mxw9GXyQWx+vhbqbNd5915PBMv+9qAoOtmWh5d5LOO1azKsCeYZtLDaJJpusbRfgHQxT8eS
	q0mNlQlYylhh2V2O+BMPM5nUVl1QN+7IS/6GTkgOuz6sZyBge2yrFQixNvGzq4cgTL4HNsG9ckm
	4FiN+Az/PzBQ2vKCkghIMaQjx3V91PZP9Fg6/hQbtLFNWXBbXgaxcIKzY4EivSq3IQUD5ZpuKAl
	ReetJl9FylRB96b6gtohF98UjUos3jZaFPr4HIQjmpDSHV2v
X-Received: by 2002:a05:6a00:bc04:b0:886:46c:8a1f with SMTP id d2e1a72fcca58-8beb6c6bac5mr2268997b3a.35.1794561537969;
        Fri, 13 Nov 2026 01:18:57 -0800 (PST)
Received: from lenoq.localdomain ([49.43.112.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a7edbsm810541b3a.18.2026.11.13.01.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:18:57 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH] staging: octeon: fix asymmetric output buffer pool accounting
Date: Fri, 13 Nov 2026 09:18:47 +0000
Message-ID: <20261113091847.117705-1-singhpriyanshu9838@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In cvm_oct_configure_common_hw(), when CVMX_FPA_OUTPUT_BUFFER_POOL differs
from CVMX_FPA_PACKET_POOL, 1024 output buffers are allocated and added to
the hardware Free Pool Allocator (FPA) pool. However, in cvm_oct_probe()
(err_tx:) and in cvm_oct_remove(),cvm_oct_mem_empty_fpa() is called with
128 instead of 1024 as the expected buffer count.

This asymmetric accounting causes cvm_oct_free_hw_memory() to report a
false warning ("Freeing of pool 2 had too many buffers (-896)") upon
draining the pool.

Define CVM_OCT_NUM_OUTPUT_BUFFERS in ethernet-defines.h and use this
constant across cvm_oct_configure_common_hw(),
cvm_oct_probe(), and cvm_oct_remove() to ensure symmetric allocation
and deallocation.

Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
---
 drivers/staging/octeon/ethernet-defines.h | 2 ++
 drivers/staging/octeon/ethernet.c         | 9 ++++++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-defines.h b/drivers/staging/octeon/ethernet-defines.h
index c060374a3da2..3ce7c125ccfd 100644
--- a/drivers/staging/octeon/ethernet-defines.h
+++ b/drivers/staging/octeon/ethernet-defines.h
@@ -37,4 +37,6 @@
 
 #define TOTAL_NUMBER_OF_PORTS		(CVMX_PIP_NUM_INPUT_PORTS + 1)
 
+#define CVM_OCT_NUM_OUTPUT_BUFFERS	1024
+
 #endif /* __ETHERNET_DEFINES_H__ */
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index dea5696a6642..e0e6d40602f0 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -162,7 +162,8 @@ static void cvm_oct_configure_common_hw(struct platform_device *pdev)
 			     num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_fill_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 1024);
+				     CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				     CVM_OCT_NUM_OUTPUT_BUFFERS);
 
 #ifdef __LITTLE_ENDIAN
 	{
@@ -974,7 +975,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      CVM_OCT_NUM_OUTPUT_BUFFERS);
 
 	return ret;
 }
@@ -1009,7 +1011,8 @@ static void cvm_oct_remove(struct platform_device *pdev)
 			      num_packet_buffers);
 	if (CVMX_FPA_OUTPUT_BUFFER_POOL != CVMX_FPA_PACKET_POOL)
 		cvm_oct_mem_empty_fpa(pdev, CVMX_FPA_OUTPUT_BUFFER_POOL,
-				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE, 128);
+				      CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE,
+				      CVM_OCT_NUM_OUTPUT_BUFFERS);
 }
 
 static const struct of_device_id cvm_oct_match[] = {
-- 
2.53.0

