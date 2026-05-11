Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E532C08BB
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778481873; cv=none; b=ttTYbSeQUTxJpJFCQxkrtu3XmoIOARBE2kz0u2CPwHOH2mHyvU+szN6RMmtOvgVfKjGids/7rf7RSf5P92Qp4MbDsOtt37Oo8UZt+EIVFnKiJ1SUBfHlMGAt0m+Yn5kOfzPwIVgd6T2W5WKHHxooG1XDyBBxEUnWg+txgBvSfgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778481873; c=relaxed/simple;
	bh=MubGKdVtElLZDMMLV2O4TfM6LdLRUl012f4NGy8OJQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VhCgpgYv8cRNFxcSZD9iXbqoW9xBqoaKpmshPFeGpKzRF5veV/cMMc+t2Sls0Mu/TPqll3bd5lgElWhwkLKtmTSTBa2G5KjXPVhvl4sbecyaLG+U21hdSBUErUnsdApgWZlf6WAb6dUochjXDMzb7w1Eg7od5L6h2fHcCZQdHjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ce9sSBMZ; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ce9sSBMZ"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b4650d5f5cso14584015ad.0
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481871; x=1779086671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UpE+0/qZleWuEVPXkrm2PRcTft37Agqw0mX3Um/YFlU=;
        b=ce9sSBMZFB3OS1dIXjcvdY1PoK5rIGTeyl48GWKzyB88IgrEuJZlLsirQ1au/ikVit
         BM7QzpIptGzvgww0oBT4UHifCKLuItd4XGYB4uBxUnuG9/oCRBZZENrC7eW2xT5ua8iu
         ZBFuV23HFXghYa/6j7LWRPM7ZQJ6OLxzHQgQDeaGP4Fx5cX+S00J4diHLVbYsg1N8vBu
         av5KnuvLLu24DPFD6AHZem2oBhALL1DIDRGO49TkPcwCnyqxt6XtHvZl4jF6hpQBvyy1
         lsrg2ArRnWJUNTgqD60gryRheSWgzzhQWt8QBMEYTDAH1qNkFjeY49sORQV+KnlwtPGW
         Ecuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481871; x=1779086671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpE+0/qZleWuEVPXkrm2PRcTft37Agqw0mX3Um/YFlU=;
        b=MQJu0S0iHR0UoyzgwJro9LziJ6JvD+FOP3q7QjW/QtCLDdtk2YQ/wQzug1EARnuUyx
         +WgcQnKU28+RRNrRoo52GuSkXFq+5+o289aOHPy58L9ERrqJE7eNxVPrGFLBBxAYu5k7
         ZkKSg94XyDWOD+oE61h/QFyrOxEj1yibVTs43EWxVVxBLVXpE8YkufQGWKfM5zoFnNxw
         FcqPYtD44x2Mzwj9R3t944yWu363KqMkw/Lm35FbxJu9KvzrItAZygCkt9FgjrcYD5g+
         dxhMl8XX7OA5+W9uv+7UjrIf3ORzAXAJwYbJ6yvJELPJr8YEPNXVYVmYfnoVWqtd+69S
         6sHg==
X-Forwarded-Encrypted: i=1; AFNElJ/tydoxFWnReSF5V1k3vHG4rle9V+IwQgm1pD70fnrMrCDwU+CH3GCg1H+a7SZzFCq4VKg48xyhrBDiXs0J@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0zKCYZw9LvWTZabROkvSzNd8NJ2zWfTHVyrkfhLf1CCvFzXMN
	CsnA6m7twNPJ0d0XZJbTKPJbuw05n/x6FPtmIjIGwCv+8ZXDQnkRZxMt
X-Gm-Gg: Acq92OGDh2tV3VCLGl+8IgGdPY2+nX8EjPld2xSapfWgdxs/7iNn3P6xCs7u1z0dgW2
	naHbr++JMFRswEkzQFKJiy1ye8/Lod65dn0bvysOkwKoeHu7gqo0CcFTHavNXKjH1VA8k/EaKm+
	zuB1BENI04qlcFmrC4gdYDfskhrR/VJyB+MS3pVm1LvzzeAKVITfwLUSrW0pfPB/6SM/6QnUCwM
	1WXiaM7SQqr57CdJ7686G8naYRvtPCnVYlByx5SuHmO/kirtljSJDswwJpfmXUFXELjTUECyhh6
	8LHDtpOoV4qEsgtUjDgjOzNSZSte7t++HX8+kNj1vJK6/TR1rPThysLdJuZagh4xjOSi61ZdH6P
	36XVpJ+lIP8kfeSqq/LLN1rs/Ru9YXCb3aLvWnJR41E6TOcBaISbWZkAZAr2aWc9QRkJws/6urD
	CzT5ZKUXq/nGLuKGlHz3xgru+PtWHn0QTtQjgC138uHnEmnjKG82o=
X-Received: by 2002:a17:902:ea0e:b0:2b2:481b:de68 with SMTP id d9443c01a7336-2ba79c14a7cmr264888785ad.35.1778481871270;
        Sun, 10 May 2026 23:44:31 -0700 (PDT)
Received: from MAHADEV.localdomain ([103.211.132.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm90453055ad.72.2026.05.10.23.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:44:30 -0700 (PDT)
From: Hanu-man12 <shawharshit116@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Hanu-man12 <shawharshit116@gmail.com>
Subject: [PATCH] staging: vme_user: fix lines exceeding 80 characters in vme_tsi148.c
Date: Mon, 11 May 2026 06:43:55 +0000
Message-ID: <20260511064355.1177-1-shawharshit116@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Hanu-man12 <shawharshit116@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 4cf3486646ce..0e8a67fbf562 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -755,7 +755,8 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 					size, 0x10000, PCIBIOS_MIN_MEM,
 					0, NULL, NULL);
 	if (retval) {
-		dev_err(tsi148_bridge->parent, "Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
+		dev_err(tsi148_bridge->parent,
+			"Failed to allocate mem resource for window %d size 0x%lx start 0x%lx\n",
 			image->number, (unsigned long)size,
 			(unsigned long)image->bus_resource.start);
 		goto err_resource;
@@ -2252,7 +2253,8 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct vme_lm_resource *lm;
 
 	if (geoid >= VME_MAX_SLOTS) {
-		dev_err(&pdev->dev, "VME geographical address must be between 0 and %d (exclusive), but got %d\n",
+		dev_err(&pdev->dev,
+			"VME geographical address must be between 0 and %d (exclusive), but got %d\n",
 			VME_MAX_SLOTS, geoid);
 		return -EINVAL;
 	}
-- 
2.53.0

