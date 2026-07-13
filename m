Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E669C408018
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 12:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944694; cv=none; b=D0NeQMJaohzUjddu2StzFeTX4KzHsurdOTqAhnhAECIQ5EXrWwalYxoumCqJJAFRXAoFPw+vy8xefTlmzHDgAhxLlb9WPF6txaTy5LfL3RWGZY2rG3BB+RrrRdEsuHE8KAqPpiylMPpCo0Dr/Hnk1wdKg7Em4z7KLevV0Ijiy0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944694; c=relaxed/simple;
	bh=PdPDblUOn/WdFcz0v/ad9NxuPCUExDaGjMo+g3Frs3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=md31BcXxVmUD1ljbkrf1hIBE9eLG3frpK5p4KgBBYcyOLvBr8Uy54b9Kg/V/ExWMfrrV9uUIg2CWmMm54zJ5JaVlGVA2YNRT3EMgi0TT6HTYd/OHBDjWj3K1kTDN7Ol8KwkC9tABw+5X33CbdSX9U42NAfh20tGtZODX68b9fpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9VX5vQn; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9VX5vQn"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38511175ad3so2410475a91.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 05:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944692; x=1784549492; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=;
        b=J9VX5vQnkGKyGeeYFTRWg+jjuBvUWrpvEwWo9vMST7ljp2yopUTS30pOXcgsppwLXK
         YRtLuJrOzyPU6iQDyJaGGrptYUZZzuWfB/W0NFp4xcbx4kRkJgD64/hh5IHFUk96ROTG
         iUpqLyppegQTL9IFeXMI3Z5nWymY4fTsg6e1sYSY7fcNuryMOj3Tt5FkRmG2VbOENnml
         bt1i6R2dLaqHg4SceZlmy1HJdku0u6ewfcl7asJMa61nem77Xg+RyaLgFKlsSmpMveQO
         JbvVF0QcPhUNmPLH8/tqMM1iR/5NPZUchKjl5yyXkyo1OEkLQA2idEb/gFJyAMQCMsuW
         a7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944692; x=1784549492;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PKJfzcOO3DPVFtYYdFmzNXMgq4lw0a0uxvJDNfRGA24=;
        b=JTC/RgUgPtEN9RSMxfG1xMKA8khIH+nRmlSd2KL8AzSd+Qk3G93X3mmoZ71i2s8kvv
         tNI6Ljzo4/Jo6nFDvuRau02rw3vsumX7Adq/C1vEMv5PIiJKrvia8fjpx7L6KxoSoqi4
         Sdc5WYPk2oKTXqdCisyz2vAaLHOtNfoz3TL4lUqtLbeQmxffb1yFFSjBeNdZSBhtb5mx
         4Qb2asGFiqHCzzfZAgSfa8C0j8x5HEYkCmGcq6zHsThzEzPcB/S7m9gI6OMSU8r0jNrv
         1woJ6jLd8z+J6gOuBheV0k5mTUhuZXBywQdfEKg00j6J3UhSjm2TZF2+El4bIiFa4Kl2
         K6fg==
X-Forwarded-Encrypted: i=1; AHgh+RpVjSNyBJz9aZh3gxXtci/uKhd41tM3fvNdwkD3jLvKwNIfJ0z0tswQtmq/X0Wn527S2lnTywddzQpL6wGV@lists.linux.dev
X-Gm-Message-State: AOJu0YxcSIExgr/IWqeMZ5FBKjLEPmwDEDmySSO56bOAKB8P5AuaPsE0
	cvfWsLbARtFXmsMOKoCQMoVQuyQ8iiaYN+urDQLrU1mG3HVhn0MLTPxn
X-Gm-Gg: AfdE7cklCrvmvVLTDkexZPoxt1LPQTElrQm6H1yTEpSQbVRGkVpDlVgmLolKV8ukjbi
	ap9bufngpfw82cJCAm1O/OIztPE7k2GWjmv49D3auePy96dCHvbbfeEhU05W46SXSxHJRxbaqP1
	6M6SWSmikY/WGH8gvy+FfbxCfYwA2LL8hsZSZsB1iUle+i1OafQe1x0tdI9tjZ0DzR8qsfbGGvB
	GfQBR4S2feDe9PfOF5jrR0RxHN6t0mveUrUrZLzrDrQ7mk9oHEub/t0iW0p8ymGb6IkF/nv5aqw
	D7899Pyp1q67WMIyvFJ9ctNb6ZY3QvRdKHW6S3KhvIb7RME2rDuMIEmP+cPaXmTJsFbuVwYYVu4
	Z5uwUZOkT3oRnj7cuBoVxHglfZ8cZv9oGzL5+d3ObXUw6ksBnDJGbj5gqPqGi9RuLxuEtYXEjZj
	dU7kOnkGU9iQ==
X-Received: by 2002:a17:90b:180c:b0:38e:fbe:b67b with SMTP id 98e67ed59e1d1-38e0fbeb818mr766655a91.0.1783944692422;
        Mon, 13 Jul 2026 05:11:32 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:11:31 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Doruk Tan Ozturk <doruk@0sec.ai>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Subject: [PATCH v7 15/19] media: meson: vdec: Fix concurrent firmware loading race and hardware timeout
Date: Mon, 13 Jul 2026 17:37:10 +0530
Message-ID: <20260713120840.17427-16-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The vdec_1 firmware loader used static variables for DMA buffer
addresses (`mc_addr`, `mc_addr_map`). This made allocations global
across sessions, corrupting state when multiple decoders loaded
firmware concurrently. Under stress this triggered KASAN reports,
lost references, and memory leaks. Making mc_addr and mc_addr_map
local to each load call, eliminating cross‑session races.

The firmware DMA completion check also relied on a raw decrement
loop of 1000 iterations. On modern CPUs this loop completed far
too quickly, often before hardware signaled ready, producing
false "DMA hang" errors. Replacing the busy‑wait loop with
readl_poll_timeout_atomic(),  providing a bounded, microsecond
scale poll with proper timeout semantics.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec_1.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec_1.c b/drivers/staging/media/meson/vdec/vdec_1.c
index a65cb49594465..27363c9a5af3c 100644
--- a/drivers/staging/media/meson/vdec/vdec_1.c
+++ b/drivers/staging/media/meson/vdec/vdec_1.c
@@ -29,14 +29,14 @@ vdec_1_load_firmware(struct amvdec_session *sess, const char *fwname)
 	struct amvdec_core *core = sess->core;
 	struct device *dev = core->dev_dec;
 	struct amvdec_codec_ops *codec_ops = sess->fmt_out->codec_ops;
-	static void *mc_addr;
-	static dma_addr_t mc_addr_map;
+	void *mc_addr;
+	dma_addr_t mc_addr_map;
 	int ret;
-	u32 i = 1000;
+	u32 val;
 
 	ret = request_firmware(&fw, fwname, dev);
 	if (ret < 0)
-		return -EINVAL;
+		return ret;
 
 	if (fw->size < MC_SIZE) {
 		dev_err(dev, "Firmware size %zu is too small. Expected %u.\n",
@@ -63,11 +63,11 @@ vdec_1_load_firmware(struct amvdec_session *sess, const char *fwname)
 	amvdec_write_dos(core, IMEM_DMA_COUNT, MC_SIZE / 4);
 	amvdec_write_dos(core, IMEM_DMA_CTRL, (0x8000 | (7 << 16)));
 
-	while (--i && amvdec_read_dos(core, IMEM_DMA_CTRL) & 0x8000);
-
-	if (i == 0) {
+	ret = readl_poll_timeout_atomic(core->dos_base + IMEM_DMA_CTRL, val,
+					!(val & 0x8000), 10, 10000);
+	if (ret) {
 		dev_err(dev, "Firmware load fail (DMA hang?)\n");
-		ret = -EINVAL;
+		ret = -ETIMEDOUT;
 		goto free_mc;
 	}
 
-- 
2.50.1

