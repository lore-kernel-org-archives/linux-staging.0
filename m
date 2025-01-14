Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7A1D5145
	for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 16:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736873661; cv=none; b=GqvAnvM49E56uoNkHsNQBg3897Sdz2CLaOLgK0ikRnrfa++LW7sYetegow/4OBJIdfElyKAbet4odHUpDf8R1pAcZJfHJYhM6blIOWksQ0jQ9uinmBgROkYGVXGUVFpYwQsM68MTLVn1uABbFCYkRchU2zm8+b5MvUoVL6tnaJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736873661; c=relaxed/simple;
	bh=gIFz1qslCXNFz5PpHh4jvvbQq0R5IsHSVaUxp2AQ9w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xfqe3duIwb/MAW56rWmhCbWiual7K7kPDeDRI8uvtXNathWMYcYN4YSiKAxWllpFeRKHsy/DdfgJN8BnIyYyI9hP2jkvI774v1fXr5pX+U3x7v3sLjcll/2sMPvnDkaOPypStHSQ6VqHkfbz+LSWkLIygFH1S1CC4fBOh2xXsd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PF2AAT/v; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PF2AAT/v"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385dece873cso2844717f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jan 2025 08:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736873657; x=1737478457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/6EC8Pbzw7aJB5sG54VmdFYYMNN5qTwv2WxHgAtFp0=;
        b=PF2AAT/v5w5hHJS36ZOzH+MJ4IXqQPB9Zkripf5zylMuo2uVPOteBI73DAEbtzvJ5m
         RZ3+fMoBe1GpWK6WUrGEpRgfT0IaOb/xr0tirCerNw+F0iXOrUjFM5HNoGPI0wW8BysC
         Ve2p+03TnLK1e2Cieptd324zo6C4YL37VfsyoZauaQCiTvsMqxq2Z3rRZXHRNYyIjuQf
         DqMhJpYNohG4ooTPQkjolub5BT1d8bXWhfwUTLFHE2CtkEXd3pCHLRcbWvV4CwvrxSGh
         gWTXgQKJ0WDBoZwVi9524LNqyrcJbNhLZkAwEDa4cUJOuIg2R9LZImnbJu7BMN8HFXhR
         d1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873657; x=1737478457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/6EC8Pbzw7aJB5sG54VmdFYYMNN5qTwv2WxHgAtFp0=;
        b=Swov3R2SzL07CVY3v46H6pXOp90AMN1uP1EVG6uPHteB3vq+6XbyWHdkKoUYUAvLOv
         tCsgoy740sBRl0LXRgmc2fjJ7CvZd+9XgOoGXkv3v5f5lxMRYksp8pfjXgc16FXkepU7
         UjU440wTn2B7lTmLiv+drgFOdbSGi4H4OVwcwajN0SV2cuTJU9NoCWHORKlZAu9A/kS5
         7IXh36E0Dirf06+UzrhEJrOUVJfZIKJCbcLDdzKEEdgDPd6trfGkgixX2eBUV/YBEYu2
         QrA/lk/i4kOnsazXcDedRyyjF3Eoy9jxacx2+PQnTk0ET/pX9HdNIBU5dFvDQTZoJ3qF
         VFPw==
X-Forwarded-Encrypted: i=1; AJvYcCUFp4qeakAs/KQqQZfeRwkl9sce6pwtcKWQ5r8tKZbW6R0QgUbq7vR+zHHdLx3neg1uHlExLruKEHsJRgHQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3Gy9G4Kqaqd+B6zqeWV7Ri1gQretSe0de8grIn00zWpH/qbsB
	d6npc3u1w78orAa5G0C4/QEhPYAamE6EA4PBFq30SI4JtdPOlGfA
X-Gm-Gg: ASbGncs9Kxc/RsImxjp+ctoJYW6pcMXY1L3Pk08LbItst34eVhtPQfBxTt1NQcnz3Mt
	49oT9J453lAna11h3t1FInSt5aP6WRLrgw1OQ15Q5d4mXGrziS8M8y7OlHcKaFFgFxKAboYa7OV
	OM0GYSR8KCuNc9bR4RgdmNPsvtXdKliJzYHbxY698kr/KRbdaNtAf0dQJ8WJjhQqxGzPXpryztK
	KpeIpCxrujIEOsvbcQnb32SgQ+PcVdsNFSMJ2vf/PwjIICAiLPoOh2E01lAcYjSCr9/yYpYMZ+X
	4880eMHrTT2Jb6fS
X-Google-Smtp-Source: AGHT+IH5UikWqZxq6PoBApIIVMvesRGnZonJwFzQ0J2vDs5+3d3zLG/tksm1X8PANjugQ+T9E5MdcA==
X-Received: by 2002:a05:6000:470d:b0:385:fd24:3303 with SMTP id ffacd0b85a97d-38a870821bbmr22628586f8f.0.1736873656927;
        Tue, 14 Jan 2025 08:54:16 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e03e5fsm179930495e9.18.2025.01.14.08.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:54:16 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/4] staging: gpib: Use __iomem attribute for io addresses
Date: Tue, 14 Jan 2025 17:54:00 +0100
Message-ID: <20250114165403.16410-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114165403.16410-1-dpenkler@gmail.com>
References: <20250114165403.16410-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In a number of drivers the PCI memory pointers were declared simply as
void *.
This caused sparse to emit the following warning, for example:

agilent_82350b/agilent_82350b.c:44:58: warning: incorrect type in argument 2 (different address spaces)
agilent_82350b/agilent_82350b.c:44:58:    expected void volatile [noderef] __iomem *addr

Declare the PCI memory pointers as void __iomem *addr.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 10 +++++-----
 drivers/staging/gpib/agilent_82350b/agilent_82350b.h | 10 +++++-----
 drivers/staging/gpib/eastwood/fluke_gpib.h           |  2 +-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.h             |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c                |  4 ++--
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c          |  4 ++--
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 05490d1abc96..3f4f95b7fe34 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -808,15 +808,15 @@ void agilent_82350b_detach(gpib_board_t *board)
 		if (a_priv->gpib_base) {
 			tms9914_board_reset(tms_priv);
 			if (a_priv->misc_base)
-				iounmap((void *)a_priv->misc_base);
+				iounmap(a_priv->misc_base);
 			if (a_priv->borg_base)
-				iounmap((void *)a_priv->borg_base);
+				iounmap(a_priv->borg_base);
 			if (a_priv->sram_base)
-				iounmap((void *)a_priv->sram_base);
+				iounmap(a_priv->sram_base);
 			if (a_priv->gpib_base)
-				iounmap((void *)a_priv->gpib_base);
+				iounmap(a_priv->gpib_base);
 			if (a_priv->plx_base)
-				iounmap((void *)a_priv->plx_base);
+				iounmap(a_priv->plx_base);
 			pci_release_regions(a_priv->pci_device);
 		}
 		if (a_priv->pci_device)
diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h b/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
index 6915c1b2c85b..32b322113c10 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.h
@@ -45,11 +45,11 @@ enum board_model {
 struct agilent_82350b_priv {
 	struct tms9914_priv tms9914_priv;
 	struct pci_dev *pci_device;
-	void *plx_base;	//82350a only
-	void *gpib_base;
-	void *sram_base;
-	void *misc_base;
-	void *borg_base;
+	void __iomem *plx_base;	//82350a only
+	void __iomem *gpib_base;
+	void __iomem *sram_base;
+	void __iomem *misc_base;
+	void __iomem *borg_base;
 	int irq;
 	unsigned short card_mode_bits;
 	unsigned short event_status_bits;
diff --git a/drivers/staging/gpib/eastwood/fluke_gpib.h b/drivers/staging/gpib/eastwood/fluke_gpib.h
index 4e2144d45270..3e4348196b42 100644
--- a/drivers/staging/gpib/eastwood/fluke_gpib.h
+++ b/drivers/staging/gpib/eastwood/fluke_gpib.h
@@ -21,7 +21,7 @@ struct fluke_priv {
 	struct dma_chan *dma_channel;
 	u8 *dma_buffer;
 	int dma_buffer_size;
-	void *write_transfer_counter;
+	void __iomem *write_transfer_counter;
 };
 
 // cb7210 specific registers and bits
diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.h b/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
index 60b1bd6d3c15..de6fd2164414 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.h
@@ -33,7 +33,7 @@ struct fmh_priv {
 	u8 *dma_buffer;
 	int dma_buffer_size;
 	int dma_burst_length;
-	void *fifo_base;
+	void __iomem *fifo_base;
 	unsigned supports_fifo_interrupts : 1;
 };
 
diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index 0dbd3dc30721..2c970bab6545 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -1122,7 +1122,7 @@ static int ines_gpib_config(struct pcmcia_device *link)
 {
 	struct local_info *dev;
 	int retval;
-	void *virt;
+	void __iomem *virt;
 
 	dev = link->priv;
 	DEBUG(0, "%s(0x%p)\n", __func__, link);
@@ -1156,7 +1156,7 @@ static int ines_gpib_config(struct pcmcia_device *link)
 	}
 	virt = ioremap(link->resource[2]->start, resource_size(link->resource[2]));
 	writeb((link->resource[2]->start >> 2) & 0xff, virt + 0xf0); // IOWindow base
-	iounmap((void *)virt);
+	iounmap(virt);
 
 	/*
 	 * This actually configures the PCMCIA socket -- setting up
diff --git a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
index 60369a5dfb72..2fd1a29f0c8b 100644
--- a/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
+++ b/drivers/staging/gpib/tnt4882/tnt4882_gpib.c
@@ -116,7 +116,7 @@ static inline void tnt_paged_writeb(struct tnt4882_priv *priv, unsigned int valu
 /* readb/writeb wrappers */
 static inline unsigned short tnt_readb(struct tnt4882_priv *priv, unsigned long offset)
 {
-	void *address = priv->nec7210_priv.mmiobase + offset;
+	void __iomem *address = priv->nec7210_priv.mmiobase + offset;
 	unsigned long flags;
 	unsigned short retval;
 	spinlock_t *register_lock = &priv->nec7210_priv.register_page_lock;
@@ -154,7 +154,7 @@ static inline unsigned short tnt_readb(struct tnt4882_priv *priv, unsigned long
 
 static inline void tnt_writeb(struct tnt4882_priv *priv, unsigned short value, unsigned long offset)
 {
-	void *address = priv->nec7210_priv.mmiobase + offset;
+	void __iomem *address = priv->nec7210_priv.mmiobase + offset;
 	unsigned long flags;
 	spinlock_t *register_lock = &priv->nec7210_priv.register_page_lock;
 
-- 
2.47.1

