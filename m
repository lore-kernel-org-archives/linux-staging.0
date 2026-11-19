Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097195;
	b=nWT6JjsjgGla5SydC512fXGrZyUr2rhlva7O6z/ntfttC7gW05iehhvICCzo1Z/2n3y9
	 UuKRI/A5ZrGRBIom+NEhxy4ISgPM0pIwThGlzo0Wwx+SVPAnCZh0pJxQ31uZ97G5aXvXI
	 jzKwwIY5JzXbQbQl9ZmO3bIj7Od8og4KMweuE65gHi4rWtVh8hwNCqSqqNvABgZ7okXFL
	 NnJ0lXKgZMOC4D7GIQzwXwlK9jwxXeay0tmiR2bP2qu3jyi/CKv/9ZhAtcJIMApgVzA42
	 vt+QSno+s6aKsEeJSKlzNU6PXE8C/oEfmjQRw4SfLDKjoIgsFLboAUyVD1SkQRLKywQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097195;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=vLqBhvls3J0T+lMLmdvKWmEWWHL4FOKReVb0TX0CKAM=;
	b=uQMsi70//46uE9hdFf2tKKHVGUOfV4yiK3u/ZWzRsR1z6QDBIT52av8QUcuZg3GD8wWd
	 aFet2xJzes5liLhJ1hPxvJaEkC7Y2Vn8g7SUaGOTPXaS26vml6HB+QntQxVEzfcjCFnYL
	 Ay9gQa9oy0c4qRNtAgf1UzVKeMcpBbzhYhqqB92/UYnDJqZwr91PQ//Ncdzpus6eT4LD3
	 j9b2eK+YzyC7AneGO2Y0ozDB7D8di3SYtqKZx768p5MXVZ0ezb9nE9gjY2S6ozt9W4Izl
	 Y8syJLdfb6BilEKHjcQ/K8O6XY/sHrHY/ym7Dub+PRIvGpRia/cwzh/Q0s08Y7xVLEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lRusmdKl;
	arc=none smtp.remote-ip=117.135.210.5
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFC0606A320
	for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFC0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=lRusmdKl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vL
	qBhvls3J0T+lMLmdvKWmEWWHL4FOKReVb0TX0CKAM=; b=lRusmdKlEJ8/XKvbkY
	0mcJWuo+p2wT5/6iBOeCHcEtblGOzZ/VuHL+gS4EwCNb8FBNaITGue8KVbXtdI2l
	Q4y+NBLMeVSGoLdXXzo7awSEIbDi5FzTJNC8c7Q1QqM24/VMWDP6K1QM//X8IBEZ
	Z9RsGlqQiY+ezsssDqe7AtTVQ=
Received: from Ubuntu26.04LTS (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnb6hdAv9qLxZ+Gw--.50288S5;
	Thu, 19 Nov 2026 22:06:23 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiaqi Shi <shijiaqi_develop@163.com>
Subject: [PATCH 3/3] staging: sm750fb: remove duplicate SM750LE_REVISION_ID definition
Date: Thu, 19 Nov 2026 22:06:20 +0800
Message-ID: <20261119140620.169368-4-shijiaqi_develop@163.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261119140620.169368-1-shijiaqi_develop@163.com>
References: <20261119140620.169368-1-shijiaqi_develop@163.com>
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
X-CM-TRANSID:QCgvCgDnb6hdAv9qLxZ+Gw--.50288S5
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wry5GFyfCF1rCF4xJryrWFg_yoW3Wrc_Xr
	47Kw4fJ34q9ayvyr4Dua10yFWFq3yUX3y0g3W5K393ursrJFZ8Wryqv3W3ZryrCFWfGr9r
	Z3W8Jr4Fy3WjyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRDUUUUUUUU==
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbC7x8yhWr-Al-wHQAA3i

sm750.h includes ddk750_chip.h, which already defines
SM750LE_REVISION_ID. Remove the redundant conditional definition from
sm750.h.

Signed-off-by: Jiaqi Shi <shijiaqi_develop@163.com>
---
 drivers/staging/sm750fb/sm750.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index ea8f445b5fd4..32f58bd7b547 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -7,9 +7,6 @@
 
 #define DEFAULT_SM750_CHIP_CLOCK	290
 #define DEFAULT_SM750LE_CHIP_CLOCK	333
-#ifndef SM750LE_REVISION_ID
-#define SM750LE_REVISION_ID ((unsigned char)0xfe)
-#endif
 
 enum sm750_pnltype {
 	SM750_24TFT = 0,	/* 24bit tft */
-- 
2.53.0

