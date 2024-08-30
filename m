Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15C16CDBA
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 05:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724995097; cv=none; b=TWUNhxTJ01HoF8LEsF+4luFE3ai4H2uDSLVvdgmwcYX5P7lQFQtgnoJ+YkXe+rWbNEotw4ltgg98a8uyX5zkfSpt2svfrX8Up6AHuE1M7dS/T7+jDYmFZbhKd7uU6RyicNms115XII/GvW0qmusuW5TyZNQ4uJ7wo2cngSsguag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724995097; c=relaxed/simple;
	bh=t4kbdGAxtPguU+bAxcGS2rq6P+WLCvz4IOBMCY7MIKE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cpkYUDoo24ZumXXSB04CFCEw2/q9IfT9N8x+xpM+E+WPH/rhQ63unuDuO/68PZHC4DZDJA5KBZHAMeR/w2zPath9XgM6hj74HMHkDl+Rd+ecooCSzNua2H/VU9JBGwesF3IIQeghQK7dR5voIkQJ4jNFVZcE/+eHNKNoqu0WguM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lhg9oUqk; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhg9oUqk"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-714302e7285so1252041b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 22:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724995095; x=1725599895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssc6z58Q9ZpbGeFW4UOcRDaOLol5H9gcdkFINcBIMq0=;
        b=lhg9oUqkaOB4Zh+vPmJZEMBcXxEFoYpoXUqP4x++v/ZNUbypDT50mZwyNqFCITsUFy
         RhRp7GWDmAg4uGEr2v5LrUfdIMy9WKDYcVC9VV16UKycQo3/KaxSW1xo9kOxIjJkp6jW
         J+u0qAjX2LHmT//jHEq9HZFzWhamrGnQUXx/+UZToey8ZELwpAYlssaEtm0C5JrUsPJ+
         SFihSHovu6ka2BnCDCjyxzT7jFyXQjeJWnRQeO8rbFcQxvdDmyJ+yoAGfPXPUSWmrGum
         OEt9XxxDIeC0yz4SqXp82T4RtAtEh8LQ0rLXYjMpIU7CeGrTnLWCOCbH1C3o0u9ey6XF
         cdOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724995095; x=1725599895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssc6z58Q9ZpbGeFW4UOcRDaOLol5H9gcdkFINcBIMq0=;
        b=A2sOlpIjc+4UffLyg1Y+I7F9s7BobGFYbiuR1OHtXgPtFXGSUr3WBJUGx6eij0dwcd
         12bNV6a7t+zdUfWzXMSHjtth4S96xsNfQGV9iQ50E1JV4KGh+Bo3xf7dDZ4oh6Pjmioq
         JAXQ30EJgQKct84iqIAPWLOkoqHc20R+43nK2ZXXpzIDRmwXCn4unRRbk53EjC4ct9wR
         J/SGwfOYyRl/XvBoBQLIKhrfGZPcnD7ESuedNelj/t0E2DYne0hdcyiXasyTxiw74+Tc
         FRhxan0viMUOC0TjgFsaRq+ghMxNR06dxQuBL6x74ZXeehMM1RsQtFwQax9NsAz60srQ
         W+OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZcROP5TVxuSm0xZNQX+L4KtGkU7yfOlNj5SfZCFzF8fNfH903XQGnM/z6M0xm4m4+JJMtzya7xm/4P0dn@lists.linux.dev
X-Gm-Message-State: AOJu0YwLXw+X5CM40WpjoiLln/7RLRLbY7455YqYQglsSR5Z/+bH2YU2
	V1+PiegjZf5zEskLYd/9yG58Vs/b7qS0IAKazDn8Jaev0W6O5IWy
X-Google-Smtp-Source: AGHT+IEPva632bmQqJBFKxEikCEAtW8zvLrbfVLcHcMd2B/A84V4ALPqbhoFVkZqv80iEMAfbk4CdQ==
X-Received: by 2002:a05:6a00:3d0f:b0:714:24dd:b3ca with SMTP id d2e1a72fcca58-715dfccb2d1mr6894479b3a.24.1724995094788;
        Thu, 29 Aug 2024 22:18:14 -0700 (PDT)
Received: from fedora.. ([106.219.166.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e557b960sm1973127b3a.41.2024.08.29.22.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 22:18:14 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: vme_user: changed geoid data type from int to u32
Date: Fri, 30 Aug 2024 10:48:07 +0530
Message-ID: <20240830051807.4397-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Geoid is a module parameter which is set by root user.
Its valid values are between 0 and VME_MAX_SLOTS. So, changing data type
of geoid from int to u32 since it will always be positive.

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c   | 6 +++---
 drivers/staging/vme_user/vme_tsi148.c | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index c4fb2b65154c..4a59c9069605 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -79,7 +79,7 @@ struct fake_driver {
 };
 
 /* Module parameter */
-static int geoid;
+static u32 geoid;
 
 static const char driver_name[] = "vme_fake";
 
@@ -1059,7 +1059,7 @@ static int __init fake_init(void)
 	struct vme_slave_resource *slave_image;
 	struct vme_lm_resource *lm;
 
-	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {
+	if (geoid >= VME_MAX_SLOTS) {
 		pr_err("VME geographical address must be between 0 and %d (exclusive), but got %d\n",
 			VME_MAX_SLOTS, geoid);
 		return -EINVAL;
@@ -1289,7 +1289,7 @@ static void __exit fake_exit(void)
 }
 
 MODULE_PARM_DESC(geoid, "Set geographical addressing");
-module_param(geoid, int, 0);
+module_param(geoid, uint, 0);
 
 MODULE_DESCRIPTION("Fake VME bridge driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index 6b6ad781b966..31a44025e08f 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -36,7 +36,7 @@ static void tsi148_remove(struct pci_dev *);
 
 /* Module parameter */
 static bool err_chk;
-static int geoid;
+static u32 geoid;
 
 static const char driver_name[] = "vme_tsi148";
 
@@ -2252,7 +2252,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct vme_dma_resource *dma_ctrlr;
 	struct vme_lm_resource *lm;
 
-	if (geoid < 0 || geoid >= VME_MAX_SLOTS) {
+	if (geoid >= VME_MAX_SLOTS) {
 		dev_err(&pdev->dev, "VME geographical address must be between 0 and %d (exclusive), but got %d\n",
 			VME_MAX_SLOTS, geoid);
 		return -EINVAL;
@@ -2631,7 +2631,7 @@ MODULE_PARM_DESC(err_chk, "Check for VME errors on reads and writes");
 module_param(err_chk, bool, 0);
 
 MODULE_PARM_DESC(geoid, "Override geographical addressing");
-module_param(geoid, int, 0);
+module_param(geoid, uint, 0);
 
 MODULE_DESCRIPTION("VME driver for the Tundra Tempe VME bridge");
 MODULE_LICENSE("GPL");
-- 
2.46.0

