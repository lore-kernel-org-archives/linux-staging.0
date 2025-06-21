Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980F718FDBE;
	Sat, 21 Jun 2025 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750487401; cv=none; b=URwnmV/9zHX9SU59ERQYUU4BrJwP7ICarZMswYJus4zuHbIbi0sM9QLq6pwfnu9pfnTtSAzpRhbBlQ4jyvoJ+xW8YM7w5lkzO3qZC2Nwt/r+slDhor38ZzJvPK75YVosc3eP+wT7ODvnc5WkD1Yc0HMU6Ir4veCC+rywyx3ME4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750487401; c=relaxed/simple;
	bh=+8nxB59T4nNd/zAuaPjugmozXPdx/wYZUcfV2AVIE7k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sm7gZCMrxtyIrw25+y/dtb741NTHPmlUoFbsmJ6KIsBEasLXiLbONCUzE5v/YF+0G58SdIs0NwUNte1k2MlY9H9Fs9JjK02VnlcG8UKAQcN5TcBtEiJXSb6cQHbDGUkxKihQ80rk392jERdduFhD5c+tQGrORQHy1Nm5YSiC+PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQHXEXQj; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQHXEXQj"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so364568f8f.0;
        Fri, 20 Jun 2025 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750487398; x=1751092198; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NkjbtNwR+2HkOqNIDNJiFuWYyKYkGQKZSPa6ldxqxrI=;
        b=hQHXEXQjPFcttE4lNgq45oMQWhswrYliZF72N7b01LfkbuxNT4YQJcrqhlqILothYT
         0ZKxBhdOKmeQB+FMHb+E3T8iVqNBrPhfJWxJfteYGhu4UL8HD3LC3oJQ1V8V7yqw6zRR
         yPXtB/MhkcxwSY66oVWgNjYW7sZibctIv1D48EtQM5/+jCSXR5KwXJY4ASbRnFbGIzuA
         HQBqIj0C3MElCvBRil6tcHVWffTPvwoxQVXpme36CfAXobkoQ86R/MrUwohqBsZWbBQ1
         26TPnpO/HKzR3vaQQI8mP/GPbAUoxZUGOtrR211Lu46P7yD2iR/mNU0StiqUl9WOv6AO
         c3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750487398; x=1751092198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NkjbtNwR+2HkOqNIDNJiFuWYyKYkGQKZSPa6ldxqxrI=;
        b=mzL78rNFMHsuhYDu9lAFtYuJUVYMzlb/wRq/1QteqcK2TUs36jjv5BKiq//kSHeN8F
         OMRMm0UirIvwqUYEKtBmogWLxWj7aAGLyc9W1cmVi3cUkNe329LAnCibkS+j05yTQJ5k
         CoK+UyuZHXCG3aiUDe4FJkP7uNCMSw+cQ0+Tll5OtSC9Y32DPbJmdpE+W+ILZ6HFaKri
         lrOviYUi1PNRONBo2f9014qUgWo5GtrrlMvhek4qsYuv3zYljt5TG22QCeRos2bO5cmN
         DkgaXM5ZB7hkMTNNsES36LVogUQIQaVgAicffpaL+GK9b3WH3GXZthFRWpaqxkHwTJJe
         nH3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUoNUv7glaR0appSopfRP1ExYaaz/bEEnyVY0Rt2FPpxJkRD44TlU9UdNTbsNgaCYszhxQd4rgMchuX9XTFFisgPZNI7w==@lists.linux.dev, AJvYcCWp4NYCzzbHLc0dQlsCTasgr7tcwbtwcgni+W+Jk7sIFBXWwCRpOrBm+fp62IHsibQmsMNzhTgsZX9wX5Gq8A==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywa8huyUmpIt96FTex9TvUpVUZDpCXJK3OjnVf/qRSE7FF0Yr9V
	IQH+pnTu8SyzUxxzcqMJITVNQJGm0W+i5Y/hDQTuJg/Wx7Q1sGQMsy02F+ZbtDWcgYw=
X-Gm-Gg: ASbGncsmLiKEz/XWF8wRyH2SLuUkcwbSbiayQLZa9LoWjQuyxJ71MyiZ7sGmrLUBgSs
	TUtGK9oBA67zAQVFGKPUwsPGJHhuByuJL0PuxnWMsM8MY++9oQZcQJ4twJqhWMUe+Z8XdKNZNyd
	zETf7PGXLY/0Vqxw96SrNCtsel29iyl1qzTSzEiqCfGbFjJkfjlxnFkCgy9IdkyuGliB+B3ecXx
	Amlt/aQI8YU40bO1BL6oRheUWQU0d6PzBt8o51MVT2FTWJYjAZTS8puV0DXJItzc65IxCf3llfJ
	lZFAEKQzpuqFbwdSIGM3YkiyO52hkfhm37I2GubWk22rW8mogRLJ6sEiptV6VbCUvwh8TJk7kD0
	0+Ml8bZTHKmJ7hwzdY2c3AD0=
X-Google-Smtp-Source: AGHT+IE/hg0M6sQ7nkl4Ba9kld0aQ2r8UvzDVcYS3F+oasLbyx+jmasGilFbARj3pfUJY1NIUWai6A==
X-Received: by 2002:a5d:5f4a:0:b0:3a3:6e85:a550 with SMTP id ffacd0b85a97d-3a6d12a1d62mr1739186f8f.5.1750487397581;
        Fri, 20 Jun 2025 23:29:57 -0700 (PDT)
Received: from localhost.localdomain ([102.46.244.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d1391sm44165945e9.9.2025.06.20.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 23:29:57 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] staging: media: atomisp: Replace scnprintf with sysfs_emit in bo_show
Date: Sat, 21 Jun 2025 09:29:44 +0300
Message-Id: <20250621062944.168386-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert buffer output to use sysfs_emit/sysfs_emit_at API for safer
PAGE_SIZE handling and standardized sysfs output.

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 24 ++++++---------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..cae1fccd06af 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -37,51 +37,41 @@ static const char hmm_bo_type_string[] = "pv";
 static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
 		       char *buf, struct list_head *bo_list, bool active)
 {
-	ssize_t ret = 0;
+	ssize_t offset = 0;
 	struct hmm_buffer_object *bo;
 	unsigned long flags;
 	int i;
 	long total[HMM_BO_LAST] = { 0 };
 	long count[HMM_BO_LAST] = { 0 };
-	int index1 = 0;
-	int index2 = 0;
 
-	ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
-	if (ret <= 0)
-		return 0;
-
-	index1 += ret;
+	offset += sysfs_emit(buf, "type pgnr\n");
 
 	spin_lock_irqsave(&bo_device.list_lock, flags);
 	list_for_each_entry(bo, bo_list, list) {
 		if ((active && (bo->status & HMM_BO_ALLOCED)) ||
 		    (!active && !(bo->status & HMM_BO_ALLOCED))) {
-			ret = scnprintf(buf + index1, PAGE_SIZE - index1,
+			offset += sysfs_emit_at(buf, offset,
 					"%c %d\n",
 					hmm_bo_type_string[bo->type], bo->pgnr);
 
 			total[bo->type] += bo->pgnr;
 			count[bo->type]++;
-			if (ret > 0)
-				index1 += ret;
 		}
 	}
 	spin_unlock_irqrestore(&bo_device.list_lock, flags);
 
 	for (i = 0; i < HMM_BO_LAST; i++) {
 		if (count[i]) {
-			ret = scnprintf(buf + index1 + index2,
-					PAGE_SIZE - index1 - index2,
+			offset += sysfs_emit_at(buf,
+					offset,
 					"%ld %c buffer objects: %ld KB\n",
 					count[i], hmm_bo_type_string[i],
 					total[i] * 4);
-			if (ret > 0)
-				index2 += ret;
 		}
 	}
 
-	/* Add trailing zero, not included by scnprintf */
-	return index1 + index2 + 1;
+	/* Direct return of accumlated length */
+	return offset;
 }
 
 static ssize_t active_bo_show(struct device *dev, struct device_attribute *attr,
-- 
2.25.1

