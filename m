Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0AB13E03E
	for <linux-staging@lists.linux.dev>; Wed, 22 May 2024 16:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716394742; cv=none; b=XvfNR8R16E1toZxhK4aHLDtOEQ5QUdRQZJ2kIF8/DiynmMFCPxD4CDkdeh8FmecyxO24L4pC5PMaxMwMIMr6GK3OkMOvxREy0b89PqzNIS/0C1DGdYSFlYmXlL2nBMK0GmT4SdgmjuYtrD6o2nZndE6pt445S3CYXSkfSvimnRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716394742; c=relaxed/simple;
	bh=oxFKEohBMHZV6yUy6/LmAq6oKk+NBVtVEkNKhy9XKdw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JWP9kw2j8Dh4vDFF1AQo9rbWz3qSHxinfJZTMtrGeindaAFnbjH6ZMj7TYL4YCFxujEwdlStE6tYmLEaKCU+zQEF+7jW15h2ykgnvo/YseX9CDZpvTPqFzzMpA6+SQ1/NnGbXvcMRNc0ePNuC/ExCvXE+F8WBRW3Xekd/I3AkrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2eecof+; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2eecof+"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f4521ad6c0so1510715b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 22 May 2024 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716394740; x=1716999540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxJFeH3HiDVDkh3oGTnmJjc83iwNoljE8xuAzbGV+Os=;
        b=J2eecof+KkHAhtPTsmJ7VmYBAZSnEYjFrF6+HQ8iy7PGZhHzhs1bIP19QFXOt1VnbQ
         4LkFx11qfVSHYbIHETpZYQ7YVHVwln5EKzcLrrPQ+04BlhQeZF2OLizn9hyALeu8WLz1
         xrpVWa9lGR0vVypAitcPGsXutOUdfFVyYMtteXlI/TgPCPALSEoGfk7PtCyhl4TG2GWc
         qbhqG1kvH4CE3JnUimygzWiucjb/roz0IqPeDzuFibg7qF70V0bqm3E47bnuHaSDRzXm
         bMvvqtmfDG6njGF56Ofv6VK9Ax9ql8YoG1TuSandf67b6auwBuEox6hFVSQrbULw/Csp
         eeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716394740; x=1716999540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AxJFeH3HiDVDkh3oGTnmJjc83iwNoljE8xuAzbGV+Os=;
        b=cuvd66NPR9KZ6WTH6PUg8n16WfaeUjAx7ZEV9fNVvVSWcxD8V65FBtDObVrt5zlZfP
         5Drr/XIXUNWA940gzENRzPjNoNkB2g6V9ATT1yEixoB+P9um6pJhW7fRyZxDU9LGPCO9
         DRuAwOaxnm8M9yr5/URNNfKFqmwA433wupAlvLMYl0szv9lFCk6kc7gXYPFzEcsStxC6
         6LjF4V0nE+J12lb0iHsjgENO0QA+SC0VUy/9Yc313qnJiAgYrLPg/2xZwVqrlOhhDSWn
         eUvng4NsB2Ya6rrZl0xf3GhC5t43WoYxTIO/CD8garr00WY533Ca4LyeDmqLQi427Huc
         BYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnBRbAx5EYlxwfTs03bp4UTySH/AafL+tbrOMW6yRcMe6yyX65Sf0pQX09B3Qvoj5be952sjawgSERj0ERB4QAXovBQGrE8I27VxS13w==
X-Gm-Message-State: AOJu0YyeQtB/b3pwteT+kybmV/sHqXKjMXVpYMeQEouAhkdDHJwZVAXc
	5YQyJz7Z9sEH1YGxt52U9EO7rv9GzsDTPw5c2kL8+M4WsdXrnbMN
X-Google-Smtp-Source: AGHT+IFq8ysxXZEYoiEQCycaIHWjUas3IvhCA3MXSebOQ1xZkLZ3iAY7gzl1s8SJPwLz1d+Ssz6COQ==
X-Received: by 2002:a05:6a00:2da9:b0:6f4:d07a:e7f0 with SMTP id d2e1a72fcca58-6f6d61aea62mr2506918b3a.27.1716394740296;
        Wed, 22 May 2024 09:19:00 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2af2969sm22531958b3a.152.2024.05.22.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 09:18:59 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	andy@kernel.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media/atomisp/include/linux: Fix spelling mistakes in atomisp.h
Date: Wed, 22 May 2024 22:03:30 +0545
Message-Id: <20240522161830.57434-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported misspelled coefficients and vector in atomisp.h. This
patch corrects the spellings to increase readability and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/media/atomisp/include/linux/atomisp.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/linux/atomisp.h b/drivers/staging/media/atomisp/include/linux/atomisp.h
index bbbd904b696a..1d11a9579587 100644
--- a/drivers/staging/media/atomisp/include/linux/atomisp.h
+++ b/drivers/staging/media/atomisp/include/linux/atomisp.h
@@ -201,7 +201,7 @@ struct atomisp_dis_vector {
 };
 
 /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
- *  arrays that contain the coeffients for each type.
+ *  arrays that contain the coefficients for each type.
  */
 struct atomisp_dvs2_coef_types {
 	short __user *odd_real; /** real part of the odd coefficients*/
@@ -741,7 +741,7 @@ enum atomisp_burst_capture_options {
 /* Digital Image Stabilization:
  * 1. get dis statistics: reads DIS statistics from ISP (every frame)
  * 2. set dis coefficients: set DIS filter coefficients (one time)
- * 3. set dis motion vecotr: set motion vector (result of DIS, every frame)
+ * 3. set dis motion vector: set motion vector (result of DIS, every frame)
  */
 #define ATOMISP_IOC_G_DIS_STAT \
 	_IOWR('v', BASE_VIDIOC_PRIVATE + 6, struct atomisp_dis_statistics)
-- 
2.34.1

