Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890011F91E3
	for <linux-staging@lists.linux.dev>; Fri,  7 Aug 2026 01:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786065915; cv=none; b=gdqmOVPAsaxFeGxcW1eRdfC1S7vO+RGCssEj54C36BVP8RoTtE5qzwyACScgvSfdI1vQKrKTJQc5YPQfKXBgqMcIs7QL8hvqoN7ZeFi1pfcv966TgRw5uMttQ4LYj/nH2Z8Ac+kOk/mXs1LKqclcIhwI6w7d/aRQpAyhs7IbglI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786065915; c=relaxed/simple;
	bh=M/pt70KtCs+icKAkrRpWwBPECuU1ngaL++gWm6DOHI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iALfzCtXitigzFxVub49cz9LVHcklYFLley+04cRnIGLQnS77VQn6Dp4Z71lDb2cVIRzPhdo+ZSXoYUsEIMW72Th/zdrYR3NcuRnd6EvFirbQSqcUD0TTwOHzzGMCkl0hDpYJ/MjzlKbKnwnuIx8IcNii/0Lsd+tcpurRVq0Gmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f2RBRAVQ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f2RBRAVQ"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e9eaf04bfaso1113786a34.1
        for <linux-staging@lists.linux.dev>; Thu, 06 Aug 2026 18:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786065912; x=1786670712; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qa69CO0lFAMCF1EBY4SDQqVVF+TJtQeI64kkaeeZHXs=;
        b=f2RBRAVQzjts6DYgPG6YbZJ+JkEzvQDwV3bwKA+XyttXzT9gR0RpOeziZ4sq+OHlme
         L2OsJjRDs1ND+UQg4KekUzUotOD7ubkOwzEaRkKMsvcxAa8jWbHETDzk+3snIdaVn019
         M2lfyhyodBbPgCxoH0OaOtR9GXtaS9ctMK9oaG6GYSHf+uL79RwCT4WwGDNbKXDMxl/O
         hdx3mEDuSPKsqChJZwgu7aSQU4U0z2yC+D3wLB7XYJCIu/3zKI9e45CdiGVJB18lUgdY
         xhuk+1vwjqBgd6XjOFroPfvxDkOo38/JKdKCB0wfpkqXGi6v0pgEYfZ0dMajgtKYOtI1
         4vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786065912; x=1786670712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qa69CO0lFAMCF1EBY4SDQqVVF+TJtQeI64kkaeeZHXs=;
        b=BJuZzNFaeBi0eFPIG2qf1VK7fZfYV4M2ScWfnbmlz/qtStdnlcZ1yF91oImd24DDHj
         zyWIlMI/TTMgU2x8ev+2nRwjHy+4bkQZtQTnfLMSRo1IE8cHlAYSPTShAQOaGdYEZIEh
         pq1oy1G2wEMRGM2J5R1hhnQQjWLYSeDshQBVJLjtn8eusMydoatga44k8sIGGqVoLos1
         JPcUheMmmcSHYmrMfC9h/VMUD8AMvzm1IrupDGMaYsFJLNO/4UZYbOHlqIriap4JFEUI
         UFuM3yrTDcIc4zCsIPf9Y4uWQMNJmoNs+yGRltserD7/01nrU9FJpJelKl5HVbDiNfu5
         loNg==
X-Forwarded-Encrypted: i=1; AHgh+RqQCLoscDLKFF7CbsFHup4Rp+j0O3o9MuwICcAQs9ppFxY8B4CgievSWOGgja5DMt3MQtTKuBFyunERd9dN@lists.linux.dev
X-Gm-Message-State: AOJu0YxPkyfksprk7dZZfi8/gm7pbnQCU02cAMX5sHepe6nXRnFR7Oj1
	G4LVUhz08zrk9tqHGBdCLj11uHQoYd9/kiU6Wat+UFYYa4lYT6Kq1dA=
X-Gm-Gg: AR+sD13UW/NEkrtJHI8Jr7wiuXyTKmjodr+9pf3FKenDkdlWFE40Fx25j2MZTDOh3vE
	TSM6vzosv/o0ka8LM3x4jGslWeWN7XENg3SBYGNGDJx7tHQUIFlXpL7OyXp4s4E4wsxBUt+aCnu
	BCsuqrUAVXXqIgmDYx/K5TyjaFrSvkhpQZvMnXrcg3P004eOaI/gfriyuhX19LfEL4YZwfZEQlv
	fs/rMK/1CGGzB4PZGKkVUsojrh5VkIkLuNeozsAEFty2lL5sAoCEcjjpMkKaqPniFrkPtLYsNHF
	c1sQn5D03G8mK9y1fZY0t+5d+xRxvC7PqSOr4vlhUK9c7wvYtpvkYg2aJY1AV68u53cCIEcCouB
	YDYmCie603bZLKM+czgs1FylxOhQ3/fSXaNSBO1FtRJW7RiZN5C7gxjJBz6NdC9lhim7IzrPZRF
	K1Hnq0aQ0JkUpZiJAV1ZNoIcbzyBjug++U+P97oRnSpvHWY6kLEyZExJnOUTJlJPv/ibmiDJXPt
	/WJa5RWfeSHumz3fuomTbwRxXtb3FBQciqbvW/5D8/havByCEryhkZb
X-Received: by 2002:a05:6830:838e:b0:7eb:9464:ac2e with SMTP id 46e09a7af769-7f1e5e321camr11474920a34.11.1786065912320;
        Thu, 06 Aug 2026 18:25:12 -0700 (PDT)
Received: from lone (69-5-138-1.icsincorporated.com. [69.5.138.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b7700desm229386a34.18.2026.08.06.18.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 18:25:11 -0700 (PDT)
From: Som Tripathi <tripathisom142004@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Som Tripathi <tripathisom142004@gmail.com>
Subject: [PATCH] staging: vme_user: fix bounds check when vme_get_size() returns zero
Date: Thu,  6 Aug 2026 20:25:06 -0500
Message-ID: <20260807012506.579588-1-tripathisom142004@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vme_get_size() returns zero on failure, as its kerneldoc in vme.c
states. vme_user_read() and vme_user_write() assign it to a size_t and
check the file position with:

	if ((*ppos < 0) || (*ppos > (image_size - 1)))

When image_size is zero, image_size - 1 wraps to SIZE_MAX. The test is
then never true, so the check does nothing. The following statement,

	count = image_size - *ppos;

wraps the same way whenever *ppos is greater than zero.

This is not an out-of-bounds access. resource_to_user() and
resource_from_user() clamp count to size_buf, buffer_to_user() and
buffer_from_user() clamp it to size_buf - *ppos, and vme_master_read()
and vme_master_write() reject an offset greater than the window
length. What happens instead is that read() and write() operate on a
window whose size the driver failed to read, rather than returning at
the check.

Compare *ppos against image_size directly. The two forms agree for a
non-zero size, the new one is also correct for zero, and both wraps go
away.

Found by reading the code after Dan Carpenter listed this as one of
three outstanding bugs in this driver; see the Link below. Compile
tested only. I have no VME hardware.

Fixes: f00a86d98a1e ("Staging: vme: add VME userspace driver")
Link: https://lore.kernel.org/all/aj0WWwiOzjLGbY5z@stanley.mountain/
Signed-off-by: Som Tripathi <tripathisom142004@gmail.com>
Assisted-by: Claude:claude-opus-5
---
 drivers/staging/vme_user/vme_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_user.c b/drivers/staging/vme_user/vme_user.c
index a472a38ef..0df30a3c3 100644
--- a/drivers/staging/vme_user/vme_user.c
+++ b/drivers/staging/vme_user/vme_user.c
@@ -213,7 +213,7 @@ static ssize_t vme_user_read(struct file *file, char __user *buf, size_t count,
 	image_size = vme_get_size(image[minor].resource);
 
 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if ((*ppos < 0) || (*ppos >= image_size)) {
 		mutex_unlock(&image[minor].mutex);
 		return 0;
 	}
@@ -255,7 +255,7 @@ static ssize_t vme_user_write(struct file *file, const char __user *buf,
 	image_size = vme_get_size(image[minor].resource);
 
 	/* Ensure we are starting at a valid location */
-	if ((*ppos < 0) || (*ppos > (image_size - 1))) {
+	if ((*ppos < 0) || (*ppos >= image_size)) {
 		mutex_unlock(&image[minor].mutex);
 		return 0;
 	}
-- 
2.55.0.windows.1

