Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D950D30DD2A
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782231601; cv=none; b=NoU+o25DqjloS4uxh6fMnwOt07JxvBp+PnfGKJsmuU+HNAGseO6Nda9PBsx/nlBSI++xWzM1vL4kLGb4OGT79B1CVIrd3rahqrXwDA7Z155rxwxDLqWc2SmRbCsw10vqMzFkSMu8qR0wlOCJSgXc4/Pt5yLwtFrdQYSIuEUnIis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782231601; c=relaxed/simple;
	bh=KbhvhiJ9oYDFyAYrf/1T3qoaMqdMG5aDtJjmWGYZyiM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S4m1O/exZvPl/NMjZPIX42sfrOIwMN/QVc1Zj+WGkkDrdcml6oOTKrPy1nLun3ebNsk5gYqi/IsN1doeJ07AiVZa7YeNzO/K7uS5T3TAdGxC8moi0UYQp+YF10J0IEa0BvBr3TOsGFdmNEh3P75tz5iIdGY066WKIqLNGCaYHTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G3A1lNeK; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G3A1lNeK"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84540eb70b2so81031b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782231599; x=1782836399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ux92+0KuLcLOz+MrBvdfR7vfqXXCbnZjpkWpSF4gH4=;
        b=G3A1lNeK/oYcPvazLNXB5C146nerpfjU0ioud6jCTVjYJ+Mw35pJU69wVo6L5ycumf
         k589TZrzyD9VyqWiyTYz+4UewOub3Ax+Mc6yoiX+EI5t1l6uqEWlsydn3Orad9clA6pj
         cV3vOZ+EEh75fYQ4azX1wYQhlWARqve5BlCsdrnACR224iJiQQHOOam/mFCakhwzPMia
         6ZRXl6rzVEP8IQKqB8UMXMjvhnqpCuYM8XAo+FOVVXcgviTtgFmz/dkFeFZyfa2th+4m
         WSRygX+bwTmpw8Q/i78UR8POZM08JkMsil69bFkztWRS50iCXwlAaKy7I9YJVR4jQdX3
         bStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782231599; x=1782836399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ux92+0KuLcLOz+MrBvdfR7vfqXXCbnZjpkWpSF4gH4=;
        b=qHm3eSGy0hZ5L0O2KuOxU4mDSKCIBgV2IWKYEWUD86UUk40TqsQIbvL9bxC5fVIHve
         MG6tsFkjZd1s+mLkFjAtbN8C4qY/GYT0HNcKhxQLtdipmWUO84tQzycqkefwMTAShutR
         BSHMpk0kVKHQgV1E5va+kkr+jJuqSPa7SpjwWauYDdFlq91+JX7gSKc0qQ5pvsS3mcXU
         30M89uYtb2wZhjR1cLe3YXQsXLXrSjjIzXObBXndRC0ijjmSL0gVR8GNuzocRSc/dzeX
         wbE1UHZLmj+L6XUpL4M7minIA55n3nW/DWY2etZl8IF3TC+dinFXX2nKUykumxHpiWEf
         0ymg==
X-Forwarded-Encrypted: i=1; AFNElJ/LuYlYb4dUM4HG3TR03fwa/tSc5mWKQkatyaOqVa5lZF9vSemjpVZPFHBegKSR+E2Tp3FMszSM3mqoJyHm@lists.linux.dev
X-Gm-Message-State: AOJu0YyCR5MzTqtInm6xPSO5OoWDGV76kapZXgaNPsDMgaWcqhY5ImY+
	H8PteDlOZfqUbXePzwWcUYwPYNHgJzXPumi/5FjFm68d7XV6b9fu0Yp3vySrlHoL7HM=
X-Gm-Gg: AfdE7cmZza9zBPbow7zOtYQkeJkMIRNrTmZ54bZuTgcbT+FooGAZrDcYnYEdijSNPxh
	ur7xktZzgK9sku0FkbNMsOSW5mSTvjH0gme0OiCuMsGdTqtHPTHfCDcN82JhmXgHyECi5YX5sX1
	adNN0uLdXRVHDrXALC/GT7Bzlk6h+J9WjmBZwKiMXPbzEHdjUqnWo/yMN47MEH2fUbT3G5cQyN6
	uWcKSmrcBc3Ngdc8jbgmlmnrTEgQ+EFyd2c+vpdsFC3GXPJoylWWlzOT3TpOGKmNOQUPlstrfMC
	a3OErowN7q4+NrAeG2E3E7AvOaTOn+5S+W2kStQbBRq/3eU3w+sQqHBD5CPcHdRfsf50rdRPOJT
	Qwy6FGuAozjZMkjWHDZ5CiqgNZS0F8TtO2LF7VbzbCE1frQXDBcdbezSUqPr0LRNbvJX4fYYM6b
	2FrkjEnrK9e7MikYgJ8h49f5uw83tfg7Lvzvh/glM0Fg==
X-Received: by 2002:a05:6a00:181d:b0:842:3841:fdba with SMTP id d2e1a72fcca58-84562457a42mr16373185b3a.6.1782231598957;
        Tue, 23 Jun 2026 09:19:58 -0700 (PDT)
Received: from kernel-dev ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8f9e9sm10904122b3a.17.2026.06.23.09.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:19:58 -0700 (PDT)
From: Aditya Chari <adi25charis@gmail.com>
To: gregkh@linuxfoundation.org
Cc: broonie@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aditya Chari <adi25charis@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unused function declarations
Date: Mon, 22 Jun 2026 18:34:53 +0530
Message-ID: <20260622130453.63786-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtl8192c_translate_rx_signal_stuff() and rtl8192c_query_rx_desc_status()
are declared in rtl8192c_recv.h but have no implementation and no
caller anywhere in the kernel tree. They are leftover from when this
driver was derived from Realtek's shared vendor codebase covering
multiple chip families.

Verified via grep across the full tree that neither symbol is
referenced outside this declaration, and confirmed via a full build
of the module before and after removal that no warnings or errors
are introduced.

This addresses the "find and remove any code for other chips that is
left over" item in the driver's TODO file.

Signed-off-by: Aditya Chari <adi25charis@gmail.com>
------------------------------------------------------------------

Changes since v1:
- Rebased onto linux-next as requested by Dan Carpenter
---
 drivers/staging/rtl8723bs/include/rtl8192c_recv.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
index 1f86654f0..b63625ab4 100644
--- a/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtl8192c_recv.h
@@ -30,7 +30,4 @@ struct phy_stat {
 /*  Rx smooth factor */
 #define	Rx_Smooth_Factor (20)
 
-void rtl8192c_translate_rx_signal_stuff(union recv_frame *precvframe, struct phy_stat *pphy_status);
-void rtl8192c_query_rx_desc_status(union recv_frame *precvframe, struct recv_stat *pdesc);
-
 #endif
-- 
2.53.0

