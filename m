Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4921C9F9;
	Fri, 27 Jun 2025 07:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751009521; cv=none; b=k7xaJlbkBfmTor5DAT0GFlRnyzKHVl3tgKzR3DzjnOAD/F4yPYezYd9xKn8Njz89d5Zbb2/zMzm4zocTqqCH37j0HA0/wcFuEJA59Aa9utrIdldTSUtZLYHJT5b/nJRY4LLfMJQ0BJoKlVqlJCfGQEGrOPtBlc4reAA0WoYOu+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751009521; c=relaxed/simple;
	bh=CsGo1GsbYINnY/8tnwOpQqo8uzAdi38TQdAiBPI/wtc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SSlZaRVxElUThdVhSbqusaJc6SWf/iUFLLWx9hg30N+viPDAwKytxau/Zs4LuEmi7HjyV/mnRNPAsrbC6whx58wOYtXywyhnd2b9udMlkyZtaoLzmBCnYs4RhJjYP1CFS/lXDxTCyOuzU1uPpD/DKxbY/ivRQYBemkIDp6e8c1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JwF0ArFr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JwF0ArFr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45362642f3bso2625395e9.2;
        Fri, 27 Jun 2025 00:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751009518; x=1751614318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TScBpjlTpSBrukUzd8MltsW16ug3e51n2CNSK0/YESI=;
        b=JwF0ArFrDv+5e+hDczGveOrWVqRwkm/nZbSMuP5B6lEPbVXf7QKnIjpjpHv6GZ4Kd+
         qg829kEKA+CcK5QSeNqRLxtgBk2xl/NZMYxQ9Qxreds96xo+21c5DArH/VG2Hz7cZ3u4
         x7PD2+veyqGGvKCeY20Fv0SDI5LbZGq8Xc/gTQmnybrBW1RJspU8G6ljFxSn2EJ+HGk3
         yZ7H6xoHjZRiOy8DNvdk/bgV/dN6lw6F5iMAqfB1kMKE5qrNl3sHsjVR2sn9jjE571gn
         xIIwe/91JDyUVjaWYi8/Dq3fb0apbg4WzpefmGZnruDegVgZysbbtbmmz3ELzXh+pv4y
         wZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751009518; x=1751614318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TScBpjlTpSBrukUzd8MltsW16ug3e51n2CNSK0/YESI=;
        b=aSO2gNMCBBLusa+Hu8gCCMLh4QRmc4uJeKWXryL5PTe6ZaVQ/UZ+HyqZV+6bRt8mo9
         uiEQBRU6vQtN1aGjJuAMjS8DWxZ+D9PiQrFNfxwGl27QJpOJRRRmbSzetXuR596Nelp+
         LOH647AUomdKAxo/BelZesNXsvwyVgnbpGy+ngz86wMF18Kd4bJci8FSE5FI9y/IUlZh
         PoLqYfqJNL89hm5MCQZ13lZ0zHsZyNFyamPAFy/v2BoONEr6AZcO4Qu21IHt2v3cRcQh
         uvI+NYqFKAjzlbS/oNtOOvdyQyTUSDE4rCnOTXwsLiNOhLHVk5m8sx1LHs/edfvIgUpw
         GaaA==
X-Forwarded-Encrypted: i=1; AJvYcCVglDH0lcJqktUIRz8tm/sVNeDmbKpsclfvGEJSrrS4mBhs9gNC5xyKHq/jgaYrCO4sIHoqc1z3t/MNpDtP@lists.linux.dev
X-Gm-Message-State: AOJu0YyMlK8kCcqV9uDxBXLq5ONuxIEFnlCFfAWtT47FQRorKHaK2/D5
	X+eWhfq21Km/PnU92qk2Rap3P2pWeRGxe36/Gf+P+bK0SzBTsVJ3NXWA
X-Gm-Gg: ASbGncs45ShQ1XNh5aH7TeYYXq80awYm/gEspFqDCpGW9dvRiuZQDN1omlW3++knrsL
	A9WRXwuGOWweT/V+p7BAsgWFqdGYf1fa6QHH1erUiwDelc7jboH2SHvagi4oL4W1aDFnOK+vJVU
	yKR8k+BjADeSZIBMRjf0HYwAu3NsfUoknmX+6D5Suc3Oh526R1pC9mzmVdfaYc3btSVpY/+pKB5
	ASQ3BqonmjSR316CwB7YpGj4rafnd9zKWK3sURCLm4941e3yt+RW+SRVqaRbMtJBLjFRYeP6ynp
	dYNQXaBU14cj8SbeIfs1WWN+1Bb1GX0p4ekce2cWVEy3zcqKzpuk+HwBMm9Jd3UZJbRPb0foWmj
	I+7FQIgfmI6TXn7rlrEyq3hLD
X-Google-Smtp-Source: AGHT+IE76NO/bOabugCB8DyLAXSDRN+k6axz7/mxNvs22Q813ctMby/ju5/cUVSYpa3ZP5RqlSPsrg==
X-Received: by 2002:a05:6000:2a06:b0:3a5:3399:51b1 with SMTP id ffacd0b85a97d-3a8fdeff8b9mr580958f8f.6.1751009517507;
        Fri, 27 Jun 2025 00:31:57 -0700 (PDT)
Received: from localhost.localdomain ([156.208.147.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e74fbsm1963481f8f.10.2025.06.27.00.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 00:31:57 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.com,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v4] staging: media: atomisp: remove debug sysfs attributes active_bo and free_bo
Date: Fri, 27 Jun 2025 10:29:39 +0300
Message-Id: <20250627072939.21447-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs attributes active_bo and free_bo expose internal buffer
state used only for debugging purposes. These are not part of
any standard kernel ABI, and need to be removed before this
driver may be moved out of drivers/staging.

- Remove active_bo and free_bo attributes
- Remove group registration calls form hmm_init() and hmm_cleanup()

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v4:
- Fix typos

v3: https://lore.kernel.org/all/20250624170746.47188-1-abdelrahmanfekry375@gmail.com/
- remove blank line

v2: https://lore.kernel.org/all/20250624144943.39297-1-abdelrahmanfekry375@gmail.com/
- Add Suggested-by line
- Remove unnecessary comments

v1: https://lore.kernel.org/all/20250624130841.34693-1-abdelrahmanfekry375@gmail.com/

 drivers/staging/media/atomisp/pci/hmm/hmm.c | 92 ---------------------
 1 file changed, 92 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..469de184b9b8 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -28,88 +28,6 @@ struct hmm_bo_device bo_device;
 static ia_css_ptr dummy_ptr = mmgr_EXCEPTION;
 static bool hmm_initialized;

-/*
- * p: private
- * v: vmalloc
- */
-static const char hmm_bo_type_string[] = "pv";
-
-static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
-		       char *buf, struct list_head *bo_list, bool active)
-{
-	ssize_t ret = 0;
-	struct hmm_buffer_object *bo;
-	unsigned long flags;
-	int i;
-	long total[HMM_BO_LAST] = { 0 };
-	long count[HMM_BO_LAST] = { 0 };
-	int index1 = 0;
-	int index2 = 0;
-
-	ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
-	if (ret <= 0)
-		return 0;
-
-	index1 += ret;
-
-	spin_lock_irqsave(&bo_device.list_lock, flags);
-	list_for_each_entry(bo, bo_list, list) {
-		if ((active && (bo->status & HMM_BO_ALLOCED)) ||
-		    (!active && !(bo->status & HMM_BO_ALLOCED))) {
-			ret = scnprintf(buf + index1, PAGE_SIZE - index1,
-					"%c %d\n",
-					hmm_bo_type_string[bo->type], bo->pgnr);
-
-			total[bo->type] += bo->pgnr;
-			count[bo->type]++;
-			if (ret > 0)
-				index1 += ret;
-		}
-	}
-	spin_unlock_irqrestore(&bo_device.list_lock, flags);
-
-	for (i = 0; i < HMM_BO_LAST; i++) {
-		if (count[i]) {
-			ret = scnprintf(buf + index1 + index2,
-					PAGE_SIZE - index1 - index2,
-					"%ld %c buffer objects: %ld KB\n",
-					count[i], hmm_bo_type_string[i],
-					total[i] * 4);
-			if (ret > 0)
-				index2 += ret;
-		}
-	}
-
-	/* Add trailing zero, not included by scnprintf */
-	return index1 + index2 + 1;
-}
-
-static ssize_t active_bo_show(struct device *dev, struct device_attribute *attr,
-			      char *buf)
-{
-	return bo_show(dev, attr, buf, &bo_device.entire_bo_list, true);
-}
-
-static ssize_t free_bo_show(struct device *dev, struct device_attribute *attr,
-			    char *buf)
-{
-	return bo_show(dev, attr, buf, &bo_device.entire_bo_list, false);
-}
-
-
-static DEVICE_ATTR_RO(active_bo);
-static DEVICE_ATTR_RO(free_bo);
-
-static struct attribute *sysfs_attrs_ctrl[] = {
-	&dev_attr_active_bo.attr,
-	&dev_attr_free_bo.attr,
-	NULL
-};
-
-static struct attribute_group atomisp_attribute_group[] = {
-	{.attrs = sysfs_attrs_ctrl },
-};
-
 int hmm_init(void)
 {
 	int ret;
@@ -130,14 +48,6 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);

-	if (!ret) {
-		ret = sysfs_create_group(&atomisp_dev->kobj,
-					 atomisp_attribute_group);
-		if (ret)
-			dev_err(atomisp_dev,
-				"%s Failed to create sysfs\n", __func__);
-	}
-
 	return ret;
 }

@@ -145,12 +55,10 @@ void hmm_cleanup(void)
 {
 	if (dummy_ptr == mmgr_EXCEPTION)
 		return;
-	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);

 	/* free dummy memory first */
 	hmm_free(dummy_ptr);
 	dummy_ptr = 0;
-
 	hmm_bo_device_exit(&bo_device);
 	hmm_initialized = false;
 }
--
2.25.1

