Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097199;
	b=tozNPSTSYt8QobMfzr+OwR3a8aEMWRCHnUxyvwf9pvkLbgOExKBZaiz3Enf9lDT4TqZM
	 Rf781SLKkfuRkthb7G/vOstuy2DURuXBIgNPh3inm7kccKSLZZzJFAJTFA3aC48JECvtj
	 N9tOWbQWnULEUZsYfGh7az7a7lJaPAnHheR7aJztFaUdTlPKeVi6QXc82I29DJUQrfHPf
	 YBtE7unFmJJwAVqc0id8T2CVF6ZTjJOAPDRmNsAYFwBYLUbAHU1rgAZy9Mlg/g9iI+Kp6
	 giUQZ59rbRvcx5JByMRfRls2ze4DGkz6LKss6+1zk/vvgdC8Vp63qDehZDma2xjOZ9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097199;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=49bgkH6TxM5NbruYwmC6aePaCqaF2KDGL/bobbfIDMM=;
	b=R9u3Ei8Vu4ybT8q6xx4OF/QCVtQY+EAXNkWP5wE9Q1wUC4/ZAE8kGP/yTX3ky/46BPAz
	 BhfOkIBMOl4qHEY5Rl9rN05zWY26Hl7cUdAFA/qd++h594FOgfRXlnTsId0QgSIgwv36y
	 lvcp9V6WfosyaVTLt0eIGZafYNU5WRgK5oA//Vf8uDz1OAveHmOmvKWlrIgDWgB7u1Iz0
	 Lzdpc3K9OAiY8xkY3xJl5gUvz7VmHeRkmY1lw2blPa05aYvXniwn4GqSos17lglA2Wb1o
	 qCY/TN0oXjbj42ct6FsJ7PBmYmagavl8+uVJab5m5j3Shp+CtzWrOmXPEe93ShUvqtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Pw76PHTE;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081B1606A320
	for <linux-staging@lists.linux.dev>; Thu, 19 Nov 2026 14:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 081B1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Pw76PHTE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=49
	bgkH6TxM5NbruYwmC6aePaCqaF2KDGL/bobbfIDMM=; b=Pw76PHTEj4LBaMwBrg
	emyKiKge/IblossaB8Vld3DKZFga3+r0ePzcs1sn2jTe1W+nIMwwB0XIc2Ew3GPj
	f0CNuOlM+KTTtvd6ZA0Kb5XFqV69vpwQYpIT2+iLaWGoTF0EGNQucSbULXZER2Hl
	9bzeV9TwIASld15yllgcKGdZc=
Received: from Ubuntu26.04LTS (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgDnb6hdAv9qLxZ+Gw--.50288S4;
	Thu, 19 Nov 2026 22:06:22 +0800 (CST)
From: Jiaqi Shi <shijiaqi_develop@163.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jiaqi Shi <shijiaqi_develop@163.com>
Subject: [PATCH 2/3] staging: sm750fb: remove more unused struct fields
Date: Thu, 19 Nov 2026 22:06:19 +0800
Message-ID: <20261119140620.169368-3-shijiaqi_develop@163.com>
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
X-CM-TRANSID:QCgvCgDnb6hdAv9qLxZ+Gw--.50288S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr48Gr4rWFy7tFy8ZF15XFb_yoW5JF47pr
	4jyw48Cr1Utan5tr1DAFs7ZryfK34xKryxGasrW3yF9r1UtFyY9rW5ta4DGrWUWF4fCw4Y
	qas8Cr1rWws7tFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYiifUUUUU=
X-CM-SenderInfo: xvklyxpdtlsvxhyhz0rs6rljoofrz/xtbCzh8yhWr-Al84iQAA3f

The hw_cursor, o_cursor, dpms, horizontal_frequency and
vertical_frequency fields are never read. Remove them and the only
assignment to hw_cursor.

Signed-off-by: Jiaqi Shi <shijiaqi_develop@163.com>
---
 drivers/staging/sm750fb/ddk750_mode.h |  2 --
 drivers/staging/sm750fb/sm750.c       |  2 --
 drivers/staging/sm750fb/sm750.h       | 10 ----------
 3 files changed, 14 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.h b/drivers/staging/sm750fb/ddk750_mode.h
index 1b70885f85e5..f52f893c6a6d 100644
--- a/drivers/staging/sm750fb/ddk750_mode.h
+++ b/drivers/staging/sm750fb/ddk750_mode.h
@@ -26,8 +26,6 @@ struct mode_parameter {
 
 	/* Refresh timing. */
 	unsigned long pixel_clock;
-	unsigned long horizontal_frequency;
-	unsigned long vertical_frequency;
 
 	/* Clock Phase. This clock phase only applies to Panel. */
 	enum spolarity clock_phase_polarity;
diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 21e310274330..99d410e184bd 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -584,8 +584,6 @@ static int sm750fb_set_drv(struct lynxfb_par *par)
 		crtc->vidmem_size >>= 1;
 
 	/* setup crtc and output member */
-	sm750_dev->hw_cursor = g_hwcursor;
-
 	crtc->line_pad = 16;
 	crtc->xpanstep = 8;
 	crtc->ypanstep = 1;
diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 7511fab2e0e3..ea8f445b5fd4 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -95,14 +95,6 @@ struct sm750_dev {
 	enum sm750_pnltype pnltype;
 	enum sm750_dataflow dataflow;
 	int nocrt;
-
-	/*
-	 * 0: no hardware cursor
-	 * 1: primary crtc hw cursor enabled,
-	 * 2: secondary crtc hw cursor enabled
-	 * 3: both ctrc hw cursor enabled
-	 */
-	int hw_cursor;
 };
 
 struct lynx_cursor {
@@ -123,7 +115,6 @@ struct lynx_cursor {
 struct lynxfb_crtc {
 	unsigned char __iomem *v_cursor; /* virtual address of cursor */
 	unsigned char __iomem *v_screen; /* virtual address of on_screen */
-	int o_cursor; /* cursor address offset in vidmem */
 	int o_screen; /* onscreen address offset in vidmem */
 	int channel;/* which channel this crtc stands for*/
 	resource_size_t vidmem_size;/* this view's video memory max size */
@@ -139,7 +130,6 @@ struct lynxfb_crtc {
 };
 
 struct lynxfb_output {
-	int dpms;
 	int paths;
 	/*
 	 * which paths(s) this output stands for,for sm750:
-- 
2.53.0

