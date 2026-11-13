Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611793;
	b=boYnIYOhKDkj1MMTRrbdqJNoPmGHa7RJDGdJfVrNagDDhp5Nu82ehbi2V2RWSefe/mvl
	 4guYncSycKaQHOVCdHCWIGF4/dgsL8qGdoUcNDxe55vw8benXZ2SSuv4o+VGicg6xKR5X
	 BiNOd3ofaVnx6EoQRmaI8TUQccjpXKQk93ALWVYYLvY8/5VQ/ooen2absmNVM7Ew4MpwA
	 m7XBGNZAJyWA7hC7aN4IXO1lE5ThqHuIZ61PxklqUDq1epQtwWvduN2Ah0E88WhQcfmlC
	 3029R0vMg/omz0iB1aSx1iFz+CFs5IA4xvQanO1DosUpWW+7P11pGWz6g1Ah1pQ0XzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=B61Pzgho1QEzJ7TAhjDAzykpmBiR4YFWAuFRQ9Hawn0=;
	b=gBLlVxaBgr7AxqHYcJul8z5E4UHja8eBOpbcbEwcvrQkUWcz3jWrmgbsW8PsLCsEcqga
	 KxfBWP8OhjF+6hez4VyPvdhMdJjAGr3CeU2h9CKqXoqko7qk9miauE/7xZMaYIzf8zM0q
	 E16hNsuy5NUDMAaYw0EZXrumzAnqSbSwvCQEzxlHpH8ETlyvW6ewHJLR80ZFUmYlWRpNY
	 z6pOoDyGXA2yjL0iINMUHEDHEtPMOSNYw4yAMog4J2ZqWO0x9g8GHb8Gec5/3IPJudGtx
	 K3A1Qvq62as+e9YSCIKBLVswYxIpOPhc6w3S5Wh3cTFD4z74i6sHgWui3Bv3dBfj39A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YyVe54a;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8A8606A337
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 23:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8A8606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YyVe54a
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso8357415ad.3
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 15:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794611792; x=1795216592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=B61Pzgho1QEzJ7TAhjDAzykpmBiR4YFWAuFRQ9Hawn0=;
        b=0YyVe54adAqgMOeUN3JobFkeXwcUV8pKSptUyJOp4yn7c6i852nhixXOARpgELbNpv
         rJzgDkOwcAvjAp0Epl3fMMwlGJEsgSFGIHCX5lgYJe0RJbrRuOOEdTKhIwD4DwGL+Kwk
         mGkxuozQhQG6Griis36/M3qqbTT4oiSzjf2DqbKiMVt6dHe+9TBW4tl6jTu3WvccX5JL
         UYyYn1I8hu2lsxLhMNxTtswa4zSOr/KY4IK6BIIz9TsB76vf1WUReGkwIH+j5C1RO5fl
         Y66H2LBzHfWXwJro9QHMa3iLVipO9XckWwoIpHCN68GmTfebTW46qBpAW8xWfMMLiQGp
         aAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794611792; x=1795216592;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B61Pzgho1QEzJ7TAhjDAzykpmBiR4YFWAuFRQ9Hawn0=;
        b=Y0m6zXOIVeCGrWfZowHt9G2j5RSoD5nwmXrHJq4SwyTGuAiI7ktk8ec0vKfBsUkoQ2
         O0Dy+EzfZMbfKVbpQfzFzQxOefipGKfFvlD8CrJMVtmHDZJYR/SMhMRd4u8V/PxVzsIy
         q6yI2hJQacbt5BWHo3GKAf2RaHwCQ6CBefsy5/L3HB9dMdXNu25k6u/3l3NLOpEwGUEt
         gzClA/m8n8Tz5LOe/0lPyMYpbhZdoMnhJIEYYnB8xbDWezw0khKAlv56kfUkNIsiZOAx
         i4mJImRs67YETIBxFFnHsvemi+O+Jmh0rCjpdf/kJCHOAf9S/7ElSkCBfTxQUPKk1fNZ
         kQtg==
X-Forwarded-Encrypted: i=1; AL+hErFThypo+3pizfUg027iuHpJlvC1rhjOrnNdaMfonpuqH7vPPmc6yRUfAfhk4MRh18GGf9M8FlQF9H0K/avE@lists.linux.dev
X-Gm-Message-State: APuU4Z9gXfvknOjUtS5tci+KvfyFPsRo/XHKmnBwV6DNLytoJfaPm0Ze
	lsokvD5HWGtFbZ7gY/XN9+VAI8TikW5PTJ5XPLRZmOtmyGlymjl9HaHU
X-Gm-Gg: AYBFou1r7++fcox0fvaTRgXn3pSlKUa4qYxFBdG7zyjWIh9lx3sNjjGB+L8Yqdf2SXT
	lPzkQFzL36eTpGBfv54Bq9XtSd6ho74hIYDRNhd+ydwKlRG7NdmTLTKv+9dMkoN4hKWhk4BYakG
	P0jEUnBGwSOG1dtaI4Hf+oY7n8wNg1FfQS91VQttDod7O+Pnys+yhCsCCwU5sgTJ+7Pr1yhJbcZ
	CPdGqDGFF2b/UhL8z5zj+sUj4CIQBY5T4tv8kDy938oCZyCzfiknHsp/ut8GnPgFZio0oI0PCsX
	xFM1RAYu7e4msZzmnRdiaB91P+7vWDLexyNZa3cpmT1qcri4QwXU+g36i0QDtoj5IYpr7G6C1SY
	E0bkS0dtuIhjSF1Lp6V9g9y9EPlz3WuQKZNAnade2dpE3xhjfgv78TdUYupKbBSQNf7Y0+wamhl
	B7LY7rvhJGyzspm4JWIbDWvyNCNnhTD1TGnOl5zivc+4y/HKZ5xIN5VUichikJyKZUC8z4mzBWc
	HilJ/e/FrICsefXXsL3sgouftOyL5yiS++aC2vTAin5zY+cZAkmnTVNI9L4Fr9pd/tufl+Tk3k4
	tpciw2UvK4gP03GxfvTi/a5kMiP0X4WaHb4VwWoH7Q1WzoA=
X-Received: by 2002:a17:902:f687:b0:2ed:3c11:67e with SMTP id d9443c01a7336-2ee0dad0688mr45369915ad.24.1794611792061;
        Fri, 13 Nov 2026 15:16:32 -0800 (PST)
Received: from lenoq.localdomain ([49.43.112.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f862426sm16398055ad.46.2026.11.13.15.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 15:16:31 -0800 (PST)
From: Priyanshu Singh <singhpriyanshu9838@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?UTF-8?q?Oscar=20Alejandro=20S=C3=A1nchez=20Lucero?= <aleszlucero@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Priyanshu Singh <singhpriyanshu9838@gmail.com>
Subject: [PATCH v2] staging: octeon: fix asymmetric output buffer pool accounting
Date: Fri, 13 Nov 2026 23:16:22 +0000
Message-ID: <20261113231622.17907-1-singhpriyanshu9838@gmail.com>
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
(err_tx:) and in cvm_oct_remove(), cvm_oct_mem_empty_fpa() is called with
128 instead of 1024 as the expected buffer count.

This asymmetric accounting causes cvm_oct_free_hw_memory() to report a
false warning ("Freeing of pool 2 had too many buffers (-896)") upon
draining the pool.

Define CVM_OCT_NUM_OUTPUT_BUFFERS in ethernet-defines.h and use this
constant across cvm_oct_configure_common_hw(),
cvm_oct_probe(), and cvm_oct_remove() to ensure symmetric allocation
and deallocation.

This was found via manual code inspection and is compile-tested only.

Signed-off-by: Priyanshu Singh <singhpriyanshu9838@gmail.com>
---
v1 -> v2:
 - Make it clear in commit message that, this was found via code inspection
   and is compile-tested only.
 - Fix missing space typo in commit message.

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

