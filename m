Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61E226CE07;
	Tue, 24 Jun 2025 17:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750784875; cv=none; b=BX9wLlWHv/pZY+POpkvsn6pqMc74ffrFUaqg5IY5W/NCT5IKPJdNBroNaGMUER8+GNbhhIiF/bwIMrF11G0I3VRNMrdYghdlaqNZcegXKyI6J6wtwt7rKYMwFpDk7ujKe8wcgfinr+ObPap16zEfFMmY4+IDlag6JCa9ZEXv88E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750784875; c=relaxed/simple;
	bh=BdK48HQUVgROYu/fdurM4M1jjaU5V16794q7R5cWk6w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Z7ISZpCDvJ5CbTtFEpI9JmydArJr1Cpcdw3UuXA9Uh6EP7hBKYrVXaoUuEO2MPIIdDbJPcfUc/YWW+2CK6/D5Zp42EkBSfGOhfKu30gcm3UDRSzbJ7v4aeVivPcLl7TKq0S69sFNoc8SE9D7b9Fag4T7OZ0FQPao6Zw/uXidD4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aeyvkkh4; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aeyvkkh4"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so983267f8f.0;
        Tue, 24 Jun 2025 10:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750784871; x=1751389671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ObyXLI84Z31XYxnK3+dlbESL592RBP6HyileFe6Fn4o=;
        b=Aeyvkkh4H4T1uR6Aych1w/TZuYItuzGqDH+KeRyY4FTkYOzK2PhMyzm4GlXvC3Luw7
         nZUDgZsM+ADneZ/KqNV/IGx7aYrZlHqi2Y5p7PGVgyZ2aBnWgIEgovV5+a5AbmZMKLBc
         PJpK82Cw6c0HaUpYJiE38prDIrbvXkgnZRnqdoYwUYh+Td2QkEQ6i/ISpJu88k3Vho11
         tLhivWU9nDIHznRk4h8hygjtWSqV+qKJN99wGO1POhFlTrGnhuq5QD7QqO1ERntzLdHM
         d2ZyusxREkCY3IobohMOKi9hxcuqCiddVzGKkiuqjkP3MAR/E6zuE5f5M/TO2v4wS8an
         TNbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750784871; x=1751389671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ObyXLI84Z31XYxnK3+dlbESL592RBP6HyileFe6Fn4o=;
        b=pc40Lgy7QSv/9m76i+ZAP2yFyVNNkvgfzn52E3vOZNL7n98XcfvmDUTelGOssoRZJ3
         pRIbDB6sbS8q4Ey0U2gUxjuvolsfzjl6z6j40IyxyaP/nhYsREA2C+c6xn5U+5Pp1vhB
         6w1MviF8KXxoxvXYtUgqcN2VMePhVQNCCWpD1WJQv3oVcZjZLgUPTH5nLpgqjPoGCPR8
         x2Me54q6NCZFnEdaQijx9cgI9VSFNrQjYx2MSCsfvsKIs4Jr6StL1MYGBgxbq8nxJ4/t
         tpobWA/PHxJrU/wP20er0JLgo2tq9gniQCiZdQZjexkzemY15UlleE1aYP5xiYoALsUJ
         8T3g==
X-Forwarded-Encrypted: i=1; AJvYcCUXcrv5RdH8PhAHN0ArF3azjZvHGklVL2iH42z2kRIZpRMOLCZJU/0DwsPKNkCngQAR/KCWsH+O7p8Hlkq3cHBf38dEGQ==@lists.linux.dev, AJvYcCXBZkuj3HMv4TeG32EsGrFQV+O7XsvQnmg3CUDKBLtpIHTwLoV1ayDXsIj6nfvYsEdU/V/moWcYuL6/5gOhhA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxeX/lD0uyqcmHJflBEHVlp9COGSjPfSZqjteydhehlhI7OeJux
	kzTX1PcutG5utU4UqvPMmjnQtohwNNhsnWEuOTJCrD4jdemSN5Gci7e9
X-Gm-Gg: ASbGncsa3CyOCka42jlWBgEHvlxyF84bViUqY40NwVTmDyRvkT/WWAK+Y4xdg41e6wm
	6PJqZnW1rps5O3az6Bsx6cmPntOqPP+X68Av10q1+WutbfkVfm3morgIzBdaTaOaT458UdxGm4Y
	CeLTTiVwqYJ7SDajArKP8MRTgrkQcHsffNwUYWSSSIUM5TwIM+C5G7OL6hPT9nfBzg1u7uToSzK
	VS2sh49Dsj+GSQIMOiupU2YZXCTZvXTXsQDp7if4Tl4Jv0QeXl7zzkqNDRWzBn1wEq+RnQbR6Hn
	e2vQ5TdfZdXyLPTrzTvmJBsgezQ7XlkELhC2tK6AUNPkYwwLe+Q7WyFAsgzO1Ey5vkk0vkHUSvu
	0YTHKxeyEpK/smvzq+l2H0Vs=
X-Google-Smtp-Source: AGHT+IG77uVXEH4AozCewSC0hVaIbZ+qEmV5cR5amypSmBksZVMTzHgWCpQNQvVj528NQr+Fd6jmog==
X-Received: by 2002:a05:6000:2010:b0:3a4:dd00:9ac3 with SMTP id ffacd0b85a97d-3a6d12e428amr5303702f8f.12.1750784870707;
        Tue, 24 Jun 2025 10:07:50 -0700 (PDT)
Received: from localhost.localdomain ([156.208.189.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80ff8d9sm2410172f8f.70.2025.06.24.10.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:07:50 -0700 (PDT)
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
Subject: [PATCH v3] staging: media: atomisp: remove debug sysfs attributes active_bo and free_bo
Date: Tue, 24 Jun 2025 20:07:46 +0300
Message-Id: <20250624170746.47188-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sysfs attributes active_bo and free_bo expose internal buffer state used
only for debugging purposes. These are not part of any standard kernel ABI,
and needs to be removed before this driver can be moved out of drivers/staging.

- Remove active_bo and free_bo attributes
- Remove group registeration calls form hmm_init() and hmm_cleanup()

Suggested-by : Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
v3:
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

