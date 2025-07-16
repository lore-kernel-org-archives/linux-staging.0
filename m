Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F6A20C00C
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 05:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752644043; cv=none; b=PHwKCz9aBmmbV8e+tmjRHyABZebrIA4yaVO6cIfrwtUJ6FS/yz+yChjkC4Ph/PCFxyt/EU/lG4y3PJh1EsT1Ekwj4ozudw2dakomulHQZNF3HNl1vf+qvrBQUXDFW+fcxZV5IdO0zy6P5M65EqH2DN/MlxWqwsaoRIy9cY3gx8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752644043; c=relaxed/simple;
	bh=cNufzzX6p5FF5CERPxqcBZVe+aNnOCr7buWvHeVDuhI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MoOHHkBkSFwxCpx+Hm/9sUdRa7n01wUOj9DFZieX3oZfp6JJPB06uD6teP7wCpFNVQw8FfVRRE7UwonbVESmugqDWkZboINzT7pQM1xviRznG1has63iuiNJFqvQ+LRiW/nhJR/5lKECjQx1gOXDYXXXxakzC952FyN/GdMrRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGpZ9VoE; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGpZ9VoE"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-2ebb468cbb4so5377134fac.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 22:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752644041; x=1753248841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDOgATEAUyP9K9p3Zv+8JK2XjaYGa7N1hnSZCjzbOK4=;
        b=RGpZ9VoEIQbM7FM+qsS0KIzYX80dk1RQ+xPTC8/DlerHVrplEP1F8QUUZzpHscgOoi
         TCdsZSZS+b1dT8TZneDbRBy87RXe6421qrebcpeWQTm8uiiodgLNPQD7qixYPa4xejpk
         QIOrxlFPkmT387W6FUz/f7URdHBscazDyAZ+uC3L1J9nl2sORISKp5ORTjAvSq/KI5Xc
         vNT6B+J5eFLDF+B9jkkf8bSihhZManEyDYbbv/FMkRLuIJh0mBn78hg+6JQy7YkkMj3O
         VxwEtibOW8EWrD5+EuwsA+a/gpkPbGUwiLWCNH8Gtv3hawnUhpCf1lqmdKHfvloAQo78
         wD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752644041; x=1753248841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDOgATEAUyP9K9p3Zv+8JK2XjaYGa7N1hnSZCjzbOK4=;
        b=p7TZTG2zBM0fEK4fTbDH3dmIKKkQLVIydjz6vg4NM3UacYRy1iki/j4rUacgYlWyZA
         fILzgScFW0NIuu91PdAer5m/H+4WGbktTHF4lda9lQVpJcolOWiUMHHfp1wHuMMsfeFE
         yhcseoX/CDcJHzd0Whb4ge7IWfiD2uvBg+w/sp4k6D1NxF4HKs8i3r+WPu/tLXSl8tzU
         ndIsSPekOvcwJ1qW+djYZJBlbCZSWdd4R/+RMKIuRcaWJj8PqSYwZUtd8DQ/ultNye2X
         pNC26+z3qGH3LoihbZNdjZF2VGJQ11izeyIqs8eQbNaaY/W6kjuY1rTeKYIG9WWPFktG
         UVtw==
X-Forwarded-Encrypted: i=1; AJvYcCUYrsKMvoSW24V+Lgu9tVA01Akqq5nAfD2zMKbpznKLqJDMM8nQahEikFXAQ21h2SM65+aZTvw/QIwptJef@lists.linux.dev
X-Gm-Message-State: AOJu0YzH8WvkOramwYSlOmBjQPD/UBKaw2rGOan2Eh2qHkPvDPNYTuNa
	rw88yeyAVYCxPWH9U3Lf+yxXIzYemVUXiOIQxAgOSGz6O10STZsjB1HQ
X-Gm-Gg: ASbGncs5nmVea3lT+JVvaPPN9NrOFc7etEHj3RhlWo5P1KSUtAD51qNo42loSBBYSNH
	4RrSXekSVhufLmkH0VjWlsas0mJGiCc9HwZ+jFi5F1UT55y6pF7AjyjxMcjIC7XwKPbtKzFbPb9
	Q9fyTFOgiY2AJVMXohT2fPHvD5+6Rn0DVfsrFy0nSlpp0vfjdy5kDl9j81vAZu9RAmeNBIXSfEK
	pfiS/euzHQyN2fIQq9d/jmZJAxHI003LLV9guX0Xqp2BC8QUSOS+uDZ1aUeLnjyxUyBXwHSi344
	8FTNMmQbkTMGmGj+0eibHklOqlbw4L4WHlf0S7mFOs485Jyi8hiZZWTXnM4ryQnU2lXlGAmzvQc
	mZ1zSmvk97NkqPUEpVc0c/i2/DbaQIYpsogEL0rmmZqeGKJ63/dbbFxyhbWdOcK0=
X-Google-Smtp-Source: AGHT+IEnm99PBrpBHs4oYnFow6Mgz95xNrN6nf2+8ISvAgjCFhRJlU6vc1cCjJgEvegnil1ol2/Asw==
X-Received: by 2002:a05:6870:1cb:b0:2ea:87d7:5a35 with SMTP id 586e51a60fabf-2ffb251ccc0mr1172559fac.36.1752644041309;
        Tue, 15 Jul 2025 22:34:01 -0700 (PDT)
Received: from localhost.localdomain ([181.161.11.224])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff8ede965fsm1264461fac.40.2025.07.15.22.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 22:34:00 -0700 (PDT)
From: =?UTF-8?q?Ignacio=20Pe=C3=B1a?= <ignacio.pena87@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: dan.carpenter@linaro.org,
	Ignacio Pena <ignacio.pena87@gmail.com>
Subject: [PATCH v3 1/2] staging: sm750fb: fix function parameter alignment
Date: Wed, 16 Jul 2025 01:33:56 -0400
Message-Id: <20250716053357.64711-1-ignacio.pena87@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ignacio Pena <ignacio.pena87@gmail.com>

Fix checkpatch warning about improper function parameter alignment
in sm750_hw_cursor_set_pos function call.

Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
---

Changes in v3:
- Removed the const declaration patch as g_fbmode is modified at runtime
- Split only into alignment and naming fixes

 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index abc123def456..def456abc123 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -125,8 +125,8 @@ static int lynxfb_ops_cursor(struct fb_info *info, struct fb_cursor *fbcursor)
 
 	if (fbcursor->set & FB_CUR_SETPOS)
 		sm750_hw_cursor_set_pos(cursor,
-				       fbcursor->image.dx - info->var.xoffset,
-				       fbcursor->image.dy - info->var.yoffset);
+					fbcursor->image.dx - info->var.xoffset,
+					fbcursor->image.dy - info->var.yoffset);
 
 	if (fbcursor->set & FB_CUR_SETCMAP) {
 		/* get the 16bit color of kernel means */
-- 
2.39.3
