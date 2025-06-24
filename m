Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A91299AAA;
	Tue, 24 Jun 2025 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750770575; cv=none; b=QVLiKuicfm17Lc0xy4Cvqz98eRX3ZZewpmTrmOwlPyTRwn15U59XhaVl0k7kIR9buCXtuChDGpquLT/NKkaqOxccTKZzaDW4fzlY+IvTtdIiiEo1QfPJ43jO+zb6K3Iz/2RTFFEfNQdBYcnp649q4/oxXNS/ebV0SostlPyceyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750770575; c=relaxed/simple;
	bh=Tk8yEI3GZqNwKijiJ5yRZYVzXAGwr9hx9JMC1LACDXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IvBtcIU0zzdKBWkehZ0jYphjIeQCrK7jP3JQnumeicPCmlypT3pILyfpUEIGJJwrGCHYXsw6A6TE0I8gcK1jc3kQN/ehZQyXhMwL//pUYML9JY8A3jxqKzagqTQJsqU95ICFQ4GMS8HR5h2/vFbAbOq13QNMyXey9m16RsmB9Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pchy//mH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pchy//mH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45362642f3bso6879075e9.2;
        Tue, 24 Jun 2025 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750770572; x=1751375372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxLpALMzmoxpVe3FlifJUdEQ1NnJF0gckla7VIIchZs=;
        b=Pchy//mHGURHvZZQzAxwJ7NUsCf72ovnz5Cb6/wxXDDQX5Nn64R3aiV2N30CCdKnFk
         6FpczXja2D4/+xgb8kGpab/Fkf5GGC3NLnWgYQRNLP4lUNo/AXbYpkJiFs7GFPaUub49
         zo+pMdfMLGOEvxOpdOY1fd6iwXmcMwbbl7cPpeAKWOSvc9DsNo2+Q6vp3IimhzwQN329
         8ErDd6W/wsYoB12yZa0weBPyX9L4B2Ar4bYpO4sCt1Yu8ExakyvVM78EBsdJjSIAiUwU
         FQev8dffdJtRx6dlSCGkEThTOoru5QPxgbNRycySuV5NTzzufhdh/cSLm4S9KMvi9BMW
         RFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770572; x=1751375372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxLpALMzmoxpVe3FlifJUdEQ1NnJF0gckla7VIIchZs=;
        b=gJEYNKFU+HV5LqljEILig3yZ1lf1MF6TaRZ52Rp9fp8fkuE+lj8YW7nQyjqBAD6i/f
         cCy+2lYAy/lTKae6PCRwYYkxvn7lTi6mEWlCMZNljtpKzbJklT11clD7Ff7n/84X7mDK
         Zn3MxAilkLUQ3+ve/UFsYgKj45M/+MMFlUfCrLGi+dEvxl0SiKAIABaoL5Ttlxs2iCPp
         oDxk2HdBeiH8Ttre3Hoi7GEzXC/vIBKYxtLO+v9qIyJS49+u00aFe9e+jYFHdsm1kQ9e
         TJ3rSaI/euPhOJ2K2d2Q0KE5B4CN0jp7LNUuwOBdvXvnQvV52hynIUSF+tIC1XFQksgK
         br5A==
X-Forwarded-Encrypted: i=1; AJvYcCVvm5+TDg17kkQ0KaZ1fi29Yq2lCGfTIAeTcW0OfccSVX8frDMZM8Np8MbchNxfbkarsoVuBFy33KBBMb/GmIExmmIAUA==@lists.linux.dev, AJvYcCW96Mj2Mm+aeGqtIoys4ulDff3wjj/tIBv3oQYPqvPw0VvJpIRWd9QvD9eGkBNb+bypi/MG9wCRtEYyCQE8JA==@lists.linux.dev
X-Gm-Message-State: AOJu0YytLhZqixHZc33QuncNnVIIJH7lUXOxKC05cob527nzJLiAuc7G
	qq0ZETjnnViQYxwmY/DZNH7RYZVenySnJ2E0yD2EJd9E9Zwmvae46f7jPZq3MFIAUec=
X-Gm-Gg: ASbGncvGQ17ryFWimgQa/DyM0cE1fHkA9d+rnuInlH/o4ypVyZ/hvXF1VumUWT5IKUT
	pNR8oWjXOUuEdK4qNJYjnKYoPHBoWeHu0m8xnql8QbtzlRWECm0FI7/ooZiRGZCVDQCOyi5NCQA
	eyqQBhKLRoTYfyUqTlw8+yQn5JFHvx6UR0DV7WCaUBkdO/JfV6z7yWtnIsClc+1T2APnl0kbit6
	XyKja3+4iPDPaZGYDxkQ8A76iUOOprMTsEM24zP0tNFQelvdWbgk41eViZFu+DPCy/Fs1yuaL33
	T4IwnjerkwjIfCl/D5GMylEYvlJOsGLp9vAGATvjMwtk77cyYa5FfJfy7KwseML8XIiKv6BoOZM
	1q/yxFegemFNk3sa3VYFJ2xc=
X-Google-Smtp-Source: AGHT+IHsf8cmrP64oRsfpdCr7BlNEA/LhYNMjqGEQaEwBjnK4q7OGcd9CA/AJSrbLZ3SkSDkBXxHvQ==
X-Received: by 2002:a05:600c:a07:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-453659bee9bmr56152845e9.4.1750770571439;
        Tue, 24 Jun 2025 06:09:31 -0700 (PDT)
Received: from localhost.localdomain ([156.208.189.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97abf6sm174024495e9.6.2025.06.24.06.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:09:31 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	shuah@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove debug sysfs attributes active_bo and free_bo
Date: Tue, 24 Jun 2025 16:08:41 +0300
Message-Id: <20250624130841.34693-1-abdelrahmanfekry375@gmail.com>
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

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 93 +--------------------
 1 file changed, 3 insertions(+), 90 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..3e5d522125f9 100644
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
@@ -130,13 +48,7 @@ int hmm_init(void)
 	 */
 	dummy_ptr = hmm_alloc(1);
 
-	if (!ret) {
-		ret = sysfs_create_group(&atomisp_dev->kobj,
-					 atomisp_attribute_group);
-		if (ret)
-			dev_err(atomisp_dev,
-				"%s Failed to create sysfs\n", __func__);
-	}
+	/* Removed sysfs group registration for active_bo and free_bo attributes */
 
 	return ret;
 }
@@ -145,7 +57,8 @@ void hmm_cleanup(void)
 {
 	if (dummy_ptr == mmgr_EXCEPTION)
 		return;
-	sysfs_remove_group(&atomisp_dev->kobj, atomisp_attribute_group);
+
+	/* Removed sysfs group remove for active_bo and free_bo attributes */
 
 	/* free dummy memory first */
 	hmm_free(dummy_ptr);
-- 
2.25.1

