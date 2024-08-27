Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3551F1BB6B7
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 12:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724763431; cv=none; b=WUlU2KZSDBri85uC9V3WOvkMt92EUCNFK7RMC/21a3jQV2HusW1rl1j7hI1AL4NwrWfysrqUhsvxeu83QdzOl1xZ608J0b6cjAm3XUkPrC8mr620nwnR3h18c/spP8/VJgNVKeMfVbf5U+12v4yR7app3J6PZFTFRPOlqU0wWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724763431; c=relaxed/simple;
	bh=BbZamD6LlCd/Ke7Au06d6ACEbsktPFos16QcBbayGWE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdgCjW4+WQcOlyb/dCU+haseQwVSvulRQlii1bpiD+U/f39mc2aU1cgV8MKELCUTGNNfaZwtN7l8XYnz07/RPGIbdIMqixEftPN/KsyqlIXErwsYQXLFtsWIXZx6t0JuMrzhJR23MUocFb09Fwerdvo89W1qt6TZNp6xWyEA7Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuQw+Rs5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuQw+Rs5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d3c5f769d6so3648816a91.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 05:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724763428; x=1725368228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOnVyUAI+k+AUmy342rz93t96HsQeIGF39AfJfIncUQ=;
        b=HuQw+Rs5KungR521DC72ixzOpcjjiciVtTs0sogmdVNEh7InVqCyxlhRdrufPvjmZW
         BhDuXOaMQo2AudMuy7x6fFJXPatg128LTU3ZlkWE/Vua3D03rgESsXuOCaTMyKWrAy20
         XjRZwHw5Yoo2dsQOmNrE24WcQURkMSzrVe7N6HbeSGjt6e22P1TeVqXGpUvs+O/B+yaK
         ugpg5GgZ1TMOekY9QzfT0NQ7IvM6n+H/UVJKzwSkBb6Agd4uVvt2/ySwQxlE1r8SZbpn
         uy7plXkJSJUPnHgA8bnGwNwBfI0r1Gv2rjcaAab5y1b0dYJTO8hk0z7yXxPZ5xFsm86D
         RMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724763428; x=1725368228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOnVyUAI+k+AUmy342rz93t96HsQeIGF39AfJfIncUQ=;
        b=u/EfVwoz4psFFZ5k8hf6NHmfPNhqHz/fRFZycScFdNPyGJFx0U51EwCpjx5O+jF/Ja
         WgX6H4LtMIN2hub0d2AeTMFT5JQXiuDkz9f8KhiYsS07uMK2WYbRaT4/T2ZNZHl/kzFU
         hoK1ocIuVHh+dGPtqFzBN0GiMcssdQigEfut0aldbJwU0UfVHOsFHeNyc2YosKtrI9In
         jOpfx57alOx4ZF9QhrNPz6gohndP3GHVbYuLc9p1EPCKhaeVapvvf2bwXnaPhL55e196
         S6HfRLUJCv2Jfh+/tupx1MJNUeGH51i0N1LnCfiFGVabf0oX286snWE3y9yYn7gvo78z
         6tOg==
X-Forwarded-Encrypted: i=1; AJvYcCUGuUIyJzIrEDUO3Nu/tzDtE8xrUFqUtKCtS+kaGbg/rVWTkujoNoveDVuCrHZjXYKd5xqlVI1rcdGHahwb@lists.linux.dev
X-Gm-Message-State: AOJu0YzsWrkqjswHZ2LtKbAqkb5xCxIEF7tuEtFIYEtjOCLIm2vn5V2r
	6vQoQMzlXfN9Wa8IJrE+3z/Y9WXoJX+YmrdaIa/cTLLMIuNjxLNK
X-Google-Smtp-Source: AGHT+IFTLAoJWERHi+MiSdIholShXeXkfXIpGUgaYhi4kTbinj7aU/KGiBmwujDgdcH4H6kf2rkLpA==
X-Received: by 2002:a17:90a:8993:b0:2c9:81a2:e8da with SMTP id 98e67ed59e1d1-2d646d4ecc0mr12558438a91.35.1724763428156;
        Tue, 27 Aug 2024 05:57:08 -0700 (PDT)
Received: from fedora.. ([122.180.189.45])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebbb007csm14228143a91.44.2024.08.27.05.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 05:57:07 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH v3] staging: vme_user: added bound check to geoid
Date: Tue, 27 Aug 2024 18:26:05 +0530
Message-ID: <20240827125604.42771-2-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The geoid is a module parameter that allows users to hardcode the slot number.
A bound check for geoid was added in the probe function because only values
between 0 and less than VME_MAX_SLOT are valid.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
v3: Fix commit message and remove redundant comment.
v2: Removed unnecessary paranthesis and changed pr_err to dev_err.
v1: Added bound check to geoid

 drivers/staging/vme_user/vme_fake.c   | 6 ++++++
 drivers/staging/vme_user/vme_tsi148.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 7f84d1c86f29..c4fb2b65154c 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -1059,6 +1059,12 @@ static int __init fake_init(void)
 	struct vme_slave_resource *slave_image;
 	struct vme_lm_resource *lm;
 
+	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {
+		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+			VME_MAX_SLOTS, geoid);
+		return -EINVAL;
+	}
+
 	/* We need a fake parent device */
 	vme_root = root_device_register("vme");
 	if (IS_ERR(vme_root))
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index d81be8e4ceba..6b6ad781b966 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2252,6 +2252,12 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct vme_dma_resource *dma_ctrlr;
 	struct vme_lm_resource *lm;
 
+	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {
+		dev_err(&pdev->dev, "VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+			VME_MAX_SLOTS, geoid);
+		return -EINVAL;
+	}
+
 	/* If we want to support more than one of each bridge, we need to
 	 * dynamically generate this so we get one per device
 	 */
-- 
2.46.0

