Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213D486349;
	Sun, 22 Jun 2025 06:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750575252; cv=none; b=m1dmWVLGPhgzdYj0/93E10ztadh8PFPhfY+Ipn0b1jhrflrFU84hZliBkbfwpWRIGYwD5Z9OcFdzgnMI1TEbKqu97WC591DS9Ml2NL5E+XFJHXvleNsUDLFwAw5up2KDPjCuJYxbrr+sD4qmFqzd4X3kGDQ8TFwI3Qqa4zlr7gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750575252; c=relaxed/simple;
	bh=y+V1uFlm7MNi2yr+Kq0y/HSDVPLN1zc1MGZNQ695iXc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UzaM4wnxlS4Kn/XRyNmB7DqZvG3L39p7lVnTWRE3uXrphps2WrNMFtomwPg5UQDLGjFNfhFZM7pdo3txnMMiCHFdMCGaq4Dv/5s1ayuJT0B62QjzjVwlG8TZPEoVh6Qw5Gk4tGrh5tPxvCpz78h87zadLPNPE+xIbgkrkf5uH6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VIoPH3NT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VIoPH3NT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45306976410so922525e9.3;
        Sat, 21 Jun 2025 23:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750575248; x=1751180048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKQhZ8dZeOW7ZtXU8mvGFMoD5xv3BUDMxbPdweeK0AI=;
        b=VIoPH3NTkL6ojbqEoCcd+spDafyHlvNBpqqz4IOs2zoBQg6YUaYw7Uj5f/rjf7vjLy
         8fFfRI+zDN24+7pSuzHVRMQmGyMU+GadvUVb9vlYjtHH7D+Nq4SH87LJmW6w7ZtvXE6x
         Fm5mkVbyQ++xVft7HVyMT8bMtj/wXEUBIDIQfs/ZMUSh8/gpLKryS6OA0S53+QdHpp49
         V9vZA/M+kAH3EmB3nd5cDmrlu5i2imZHygJD5sTP2gVioU25fd+FrGGFGJNvhkw5hqP7
         kcYtdT5UyjC6Gvq9lrYXgYUPxarH6CS+2fbMv0mGkPGz629yo1L+5TycYMPs7ujaiYHn
         RLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750575248; x=1751180048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKQhZ8dZeOW7ZtXU8mvGFMoD5xv3BUDMxbPdweeK0AI=;
        b=OLuKvyNdG/E9jy58pT6gFymXK0Hp3kBjrXjU0b+lCM9g4hABznw6B2W4FK5Ods/wOO
         hueOKbaueIlNjWbCYpVqTo2yKIIK1ulovb5WKONJbZjb02bMC7d4Q3wDzL/t2pm3g6vz
         mvMf5YAdk+LtdxbLqraSmgHpgQzxZZJFuzQ2VHW6OYfOVQjsGZNfCTYAvNJ1rgsfKKJD
         19EvoS6a2q2OGXihOShyWPkOxKXX6rwhdXHL6ycZScB9TzyWBeQg1bgCDD6XJiT0ACV3
         J6jVCNGVyJgE8qf5mPprSOsZxMsDqPwgEzbTtSVUZ9SVLbTr/W+SUjx+D/qqsfqwx6vr
         p3Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUg2jhbIoWHlthSCJmbxiWWfKaFTCyCaPSEExueGZnWB1Tw6sf/DmspSlqzsNC2hNwOmo/8qIraRXNonuoeJIL3Qjqb6A==@lists.linux.dev, AJvYcCUpfgttD23SGJ6cvzI1wpkbDYlevrOPM676T8aUImC57AAwMmvP1Kj7IX8tGfPVJM0xqzsz3TT4MQH6w/v6aA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhfel9nAtyK55C6/f8n7dVkWG7Te0DSHNE8kNDzMubfJYIoy/2
	FVnK7p066pxEgGWJQZMvKq4nGSh1DngNTQDbLllFkBmKoyEID0i84PXD
X-Gm-Gg: ASbGnct2+IKLj40Ocfr4YP71nTjbVB+yKWW3RVT64NhROxeKylYa/anzu/5FI1dSMn1
	f2vCcvbR7a7kjeUR17B8CZr40c+nA5uzv95bEK/MyHIowc+bx+rj0yl090pXU/qAy6p5A0VFNgr
	OQXwQtm04FzmYBdzaePbNd+7N9RO7vEGNl1oi/Atxtb4U/JjoL8mt1qSu5YDdrBGK+Nt5RTrzeh
	/8OYTUYwsqwhXhX8B0Qaq8f3sigg+GKV4J4kwbQy5LZgj5GcYFJVy6iB9oqLrnn4Bc1DcKOqex2
	ylHVRTUOBnNSly+510mEO/40Wmr66Ct3GMsF7JGQ/1QaQO+FQCHpPYPpJKZ+H+flsQNBd9yNwZc
	FUvUusOXtvO9umLRhVP3XrhDa
X-Google-Smtp-Source: AGHT+IExP4WFR6DFGR0lMKjyTFJaG5ZsU4nOX8iA3vhlq5spPOb76BvedsWJNEMS5tZZjqcVc+b98w==
X-Received: by 2002:a05:600c:524b:b0:439:9a40:aa27 with SMTP id 5b1f17b1804b1-453659b8b23mr29407995e9.5.1750575247520;
        Sat, 21 Jun 2025 23:54:07 -0700 (PDT)
Received: from localhost.localdomain ([156.208.241.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f17c35sm6497432f8f.31.2025.06.21.23.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 23:54:07 -0700 (PDT)
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
Subject: [PATCH v2] staging: media: atomisp: Replace scnprintf with sysfs_emit in bo_show
Date: Sun, 22 Jun 2025 09:53:40 +0300
Message-Id: <20250622065340.184048-1-abdelrahmanfekry375@gmail.com>
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
v2:
- Change the place of ssize_t offset.
- Addressing a possible change in behaviour if sysfs_emit fails.
v1: https://lore.kernel.org/all/20250621062944.168386-1-abdelrahmanfekry375@gmail.com/
- Convert scnprintf with sysfs_emit/sysfs_emit_at in bo_show func.
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 25 +++++++--------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 84102c3aaf97..b5d0516e36dc 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -37,51 +37,42 @@ static const char hmm_bo_type_string[] = "pv";
 static ssize_t bo_show(struct device *dev, struct device_attribute *attr,
 		       char *buf, struct list_head *bo_list, bool active)
 {
-	ssize_t ret = 0;
 	struct hmm_buffer_object *bo;
 	unsigned long flags;
 	int i;
 	long total[HMM_BO_LAST] = { 0 };
 	long count[HMM_BO_LAST] = { 0 };
-	int index1 = 0;
-	int index2 = 0;
+	ssize_t offset = 0;
 
-	ret = scnprintf(buf, PAGE_SIZE, "type pgnr\n");
-	if (ret <= 0)
-		return 0;
-
-	index1 += ret;
+	/* Changing to sysfs_emit changes the behaviour if failed*/
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
+	/* Direct return of accumulated length */
+	return offset;
 }
 
 static ssize_t active_bo_show(struct device *dev, struct device_attribute *attr,
-- 
2.25.1

