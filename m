Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5882D29C6;
	Tue, 24 Jun 2025 14:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750776624; cv=none; b=XrV+td8HzvBQihA/s+ci7ovViE/LXyAyM14kGINckXwL/7C/E0C9liTsyTVL91Qdhloua2NascJT5uomE4eMwbSNVOCg9PtiA16itC+uPBH6dUukiOkAk+h+/jTfHyp/WkwkzcGeCcYr/8kUCWKeGJ45RwclpOEnDyfFNBOnZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750776624; c=relaxed/simple;
	bh=BLBs6VvptUTipdYqP5sZ+EBtpSjpz67hsxN65i7P6Jk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Aw157kbYhNbyaTG+5Utp4tz+VW42e9FlN6ma5IrTE08NdSj08GmcNACjyMdbpTM7wYSLzf4IwPtNgscbfcxYK1SposqZN8hB6m9RKtguU0kzNs+MwhjIRoZq14hYNhus+0524iM1XuNN3XhcaFGAiLDqLv0aDKQrOQqlwfVDs8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=joAq0qF8; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="joAq0qF8"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so958406f8f.0;
        Tue, 24 Jun 2025 07:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750776621; x=1751381421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MLiCLOp03+AJLmaw4roATsJrCtRQMhCkeGidyycUVtg=;
        b=joAq0qF8zNWo/jItk1S3vO9WcKDuFM7K9IcvKNF7qLgFusrBOCUHIytMTTJ6CObvf2
         YkhzMNZ9g7btxSUw91CUUzlHM2MuTdbmkAj05UWLixAXOwLwxyIL9DVwVySP+//gTAdi
         bfA6a97iWa8Fj0eai7YcIhotXA9Lh9s9hNtrrUL/pjVzzDtuojHpASMk5vEJVm7CrHHD
         f1/7VjR5D6TwkXgCDWnfKRu3/xOXrwZqfmBV3vVRPtWdiedA7snufDA75v40X+JkOQE7
         752AYy9jkLLusWH0hRleo+mvov/tR4rJ9j9LQwO54naFpeSHpG2MZkmlE49F57KjK2bt
         TXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750776621; x=1751381421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLiCLOp03+AJLmaw4roATsJrCtRQMhCkeGidyycUVtg=;
        b=nsWTLDZyC3BIf0ZG+rPstNQb3rRuC59YcWzshSw/dAYTdH51KQJFqFs4OQA8JGjVKp
         OVOqF3Xtd0ZdWyTzgCSwLzBS20uFSX/cqGAza/P6FDW1vM8rf4Zg71k/oaeteZ5hKSMi
         D8uLRhgG09dSPBNFH4N6GdkGZG81/Fss4S2gfeN420nTlbMmOyYANVozR4fCe5FWerUl
         pFhTltQf0HCDB4do2AHyHS7ZH6dJwMN+L52nhMoEUqN+B2LLzTXjP3a67Sr6TrL1bwFf
         vOQjtJqA6cE0I9ClDW+xyGZwV0nW31J10n1Clx6d5AMB7TNbpcpxyWImpLs7dQ3GvAFW
         xC9g==
X-Forwarded-Encrypted: i=1; AJvYcCU5btTvO7vAYmNAL8l9D5yJFKt12ihxXv/sBLcIlyyPjZdiG5kE8Wa6buu7nQQYFRF1KdQCcJulJpDKNyE+eg==@lists.linux.dev, AJvYcCXjOCiBjSIgwHNT4HoLkXxIGBXR2A+TGSdtOzeVxk6glPFwA/94irmIsp6PRzV5eyt3BvYQqMC9ZNOVbLSUnmZWfWEiWg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9gDxmTUKK8Ni7h0mmgHv+uU/Gl0joLeWu9OxgqGFdeTLvDWVV
	Q8fArTKGiX5lpInsy+em9KcIyg/crRkZhSHzPM1WETNlzC2tXjT2lSPE
X-Gm-Gg: ASbGnctrwxJh7OLy0x4FhEe/7Geo61FCdPEqS1ccQrCj2u1bVpLqpo2SMvJffpcz5q9
	l6jTyPZnETETNB3rwGD8kMsQy9l18NF3Rma1PADTsFIoDQFno+5dyQkIkTqQf06Fe2sS8UZNObG
	jDqQFqem5Wtw7egXjtDP5OizH3nhM/uYFonMJ4QgELd/x9I8K4fzDGamYjjT1VEWkhJPggvNKoa
	RqQSXZAgo91Z0DOFWwbbsJfTGI/31Gxtk83YCRWnm2vQHH1yLilYYF8u1iG2vaU5RGewOhx46ft
	ukMk01qSj5PG8a74AIB2uOK+PymjUkE+y95YCj8oIrDYk5syOrXt9F5PdWNP9q794+2oTkCdpcn
	ADHrJ7Gr54XATw9qwsPMchV4=
X-Google-Smtp-Source: AGHT+IGp7FJxQ3lNRUT+69d4u3yFJMen8jE313LI5u9E0DtmCWAKYJVpQdPQQhXkTON2m4kEE//Lew==
X-Received: by 2002:a05:6000:2f83:b0:3a4:f7ea:a638 with SMTP id ffacd0b85a97d-3a6d128bc58mr4951035f8f.3.1750776620577;
        Tue, 24 Jun 2025 07:50:20 -0700 (PDT)
Received: from localhost.localdomain ([156.208.189.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ff8b8sm2092841f8f.71.2025.06.24.07.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:50:19 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: remove debug sysfs attributes active_bo and free_bo
Date: Tue, 24 Jun 2025 17:49:43 +0300
Message-Id: <20250624144943.39297-1-abdelrahmanfekry375@gmail.com>
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
any standard kernel ABI and needs to be removed before this
driver can be moved out of drivers/staging.

- Remove active_bo and free_bo attributes
- Remove group registration calls form hmm_init() and hmm_cleanup()

Suggested-by : Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v2:
- Add Suggested-by line
- Remove unnecessary comments
v1: https://lore.kernel.org/all/20250624130841.34693-1-abdelrahmanfekry375@gmail.com/

 drivers/staging/media/atomisp/pci/hmm/hmm.c | 92 +--------------------
 1 file changed, 1 insertion(+), 91 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..0a4d7dd5e6c4 100644
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
 
@@ -145,7 +55,7 @@ void hmm_cleanup(void)
 {
 	if (dummy_ptr == mmgr_EXCEPTION)
 		return;
-	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
+
 
 	/* free dummy memory first */
 	hmm_free(dummy_ptr);
-- 
2.25.1

