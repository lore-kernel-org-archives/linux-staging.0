Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5954B342532
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 18:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154208; cv=none; b=SzE2Gs8238uA2GrWVZ1S4w3MkrKipluVoLKWFBSAii2WvbPh2/pSxyGs7Pw73pnml7YWe48Q409cl0j3W3jbjulrTXIXu9+6qzvZdjvWj1cpRBV2w6GcpnjVwIb8GwN9a7BL6EHLP6FkVHgxl5icssr760VLsEYNC1tnKl9LaIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154208; c=relaxed/simple;
	bh=lIQoyavRw2mxaKwIDMaLeH7SaMPO3OupKDMUZPF9wjA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hy6BaWA3fpB+H+0efIDBvhmykyoRssPmvvI5VyXEqchd9tmLRJlP1o79zHJBWFNa5oWkS8vUTJFkSwIZFc73O2mC+1HEfFqhP7uR+keRzlkQa4WF3GxgDgltoQUlPr0mT2GgUwykv+bm37U1ZsPFxugSgjUQuAyNAM6ih3+PDBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2osG67m; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2osG67m"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49258ac7294so5467885e9.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 11:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154205; x=1782759005; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FqrzsHUr/eg1YVIWDSZ7dTiuZ9JQpM3TQd+R0iB1BOg=;
        b=O2osG67mIFhmtsedL9BjXjKLdRmCMMwRVcIB2WyUxHJf9hdNc0z6/r0Odw1p5w2nAU
         Cw3RGgR4FXa9x1JIU5MMa9P4GJ39r0ZvTo89ugaowdpUBhJn2j0Tz5vzcTp+eTHsd9B5
         GttVKH56W1kH/31DefdGb/Nm/PpL9Pnx0iv/NPc3KJePpKXudlyWjd5lF8qJhNfUYwXw
         7HphW76ZTeuR9+BxFoGm458QVQrPwhsG1BIBUlZKuL8gKoKf5QiUm9fx9tYomQI+GLpP
         yagRUvsuQisKLYoVpW2ABePRzwf1lQXyTkD1rP6k+RdvkWZaElwvO6JjmczbtgeP1Yy+
         t+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154205; x=1782759005;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqrzsHUr/eg1YVIWDSZ7dTiuZ9JQpM3TQd+R0iB1BOg=;
        b=mOcD+vfI6NBMTZ9hGaucDXiQf6u2rLrvUz2cub85EevZYqcLbXsdWSU7uGhhX6d8aW
         +PUi51C68rdWeWduYzbwxLpYKoeXL+hak5G9ZOLKXDD5qaMAg/EdESEXQtayP/+4G4tu
         Ziudviic2pmbphRxQELenN/sPJllKojr/6NVhF+W7Z5EX+nr3/6taf00QXPy57Pw5tNs
         ylPVhtT7pb+Dw8Wp+xclERg+znIFH8OBTaQIGuySY9zTAZj4NmBdTU1ltPHjMhq2zdhs
         KlYSYENMbewQXlGf659+i52pZYlPBfhyueLUB9/lkWnpXjK5gQPMlogk6fOku+L4bugU
         X+dg==
X-Gm-Message-State: AOJu0YzN9gcyIqynKKKlhhPY/STPW0GnqLU9TxlNFxn4JBHFppi3RtUQ
	cDpzWKua4z9J6G1U2daGLNPKiPMx2oewnvulAKQh7HzcD4jtmkWMSe55
X-Gm-Gg: AfdE7cmuE/VRy2+msQ/yfplw36WA+VA+HjikKgyesEAuogVrip1vLENWth2b3BLhMII
	PTAI8HgzlCWqPzdvLyps75ISUsjJqL7JAgk9+bt1PmlY1O3RPVkSGjzlcjfRnCPbsGHFeYcEu5D
	ek/porudgWQhwzGFTTQHm1atLzIbIwjmZzrf7d4/o6AzmP6SnMvMOiqMEDREF6hMY3XhgMiR77b
	UiCxLw6TCfrThMVUGNUtPf5gvJLbrzS1Lwf8npSnFxOdoGzQ11FCGrv2tlzeCIzhpVBxIN9WfjZ
	gUXewLuJeTy5+SDc49oNMnjWkX2g9RPzMz16YFQwg0DADc/adM1rj524ajRvI2dumryNB91Gal6
	B1RD4eN9qZKhs6UET/0x1KeHCp4uBmmc9w3cVDhTBSL4GcgSAni5pWbJe5y8adD+N/LEajowaHn
	oVkB5O/qqMkh1H2m098LRLRqZ3vxZ00hoMCX7PxED/yKqMZpZAHo+8ni8=
X-Received: by 2002:a05:600c:5285:b0:492:4640:cf59 with SMTP id 5b1f17b1804b1-4924640cf67mr232352695e9.36.1782154204532;
        Mon, 22 Jun 2026 11:50:04 -0700 (PDT)
Received: from legion.localdomain ([92.44.171.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666788282sm40882832f8f.17.2026.06.22.11.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:50:04 -0700 (PDT)
From: Batu Ada Tutkun <batuadatutkun@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Batu Ada Tutkun <batuadatutkun@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation to use tabs instead of spaces
Date: Mon, 22 Jun 2026 21:49:59 +0300
Message-ID: <20260622184959.1668-1-batuadatutkun@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function parameters in ia_css_cnr.host.c and sp.c were indented
with spaces instead of tabs, violating the kernel coding style.
Replace leading spaces with tabs.

Signed-off-by: Batu Ada Tutkun <batuadatutkun@gmail.com>
---
 .../staging/media/atomisp/pci/hive_isp_css_common/host/sp.c   | 4 ++--
 .../atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c     | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
index 0fb8a6754..35a7fd270 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/sp.c
@@ -13,8 +13,8 @@
 #include "assert_support.h"
 
 void cnd_sp_irq_enable(
-    const sp_ID_t		ID,
-    const bool		cnd)
+	const sp_ID_t		ID,
+	const bool		cnd)
 {
 	if (cnd) {
 		sp_ctrl_setbit(ID, SP_IRQ_READY_REG, SP_IRQ_READY_BIT);
diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
index 54789d28a..469213a06 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/cnr/cnr_1.0/ia_css_cnr.host.c
@@ -13,8 +13,8 @@
 /* keep the interface here, it is not enabled yet because host doesn't know the size of individual state */
 void
 ia_css_init_cnr_state(
-    void/*struct sh_css_isp_cnr_vmem_state*/ * state,
-    size_t size)
+	void/*struct sh_css_isp_cnr_vmem_state*/ * state,
+	size_t size)
 {
 	memset(state, 0, size);
 }
-- 
2.53.0

