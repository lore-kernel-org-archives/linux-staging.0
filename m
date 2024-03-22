Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6A47779;
	Fri, 22 Mar 2024 14:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711116671; cv=none; b=WXfYrR0oVjV+A2CzFt7tNT+JynpENE+OS7k1W5Uef4f3P4hafbkL6FOKC6dgsouKfuUmgBuMuhxEuSuInc8vygPyaonUH+jF5ECJ8J8KZVBERAUtz2aKJk2QO7x+8BHSszO3Dh5rudJI3j4sUHnGgDNgchRySjS1wgpDUD38WwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711116671; c=relaxed/simple;
	bh=K5uPUA2OyjgCFH8me7FwNdu+bR7wyQUyYW7gljhoZMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pzDDXrJvfmKgUyMfo4kGZPkfU7STtC6hppbJRPp4VO1P7d+0u1JiQ/I51+i27b4Rm3INOHc8OGZ+UCSpK5fztfE1rDjDk305tmKOO0AxJ0jZbr1aii0yn7+P/HIIxQ9aELViY1WyRGfUNrGQBDzpRK80G1L7bn6bafqwHc8t04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbwG0i0H; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbwG0i0H"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1e0679b1562so17514405ad.0;
        Fri, 22 Mar 2024 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711116669; x=1711721469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3h6PneUm3Z4gvfwV64qLMOpLiMWQad8Wzjqdi//Xhw=;
        b=ZbwG0i0H+6Bl7nE58X4/ctpq3+Z7EDf/XcwbnJxq2CAfPtlYtUKoGZeran+8mw0e/i
         1Ka9zvXnYmck12XWwf1ysLPFfHfVnScMcBjJq1fERwlMH1Ucp1RD77EiCI1v5/8CB+3G
         niZwldJig1B3fDCGRjEbfCqCrt6cW3azF8BTN0NiJTgfiNt8c/prfelJW7Bs7+IJ48yy
         C3HW80dihO01qkGOqjgMDXxVybRe77+3BIu4OzURP9TDWctIi/VTBL2eaUZbzaeWUq83
         4LtDQ4LcLI/ZXuKiESOfQkPDKJejl4eK+jPgVEepFUUmDlfIv1XM0F5Q0g8h36AfcehP
         CBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711116669; x=1711721469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3h6PneUm3Z4gvfwV64qLMOpLiMWQad8Wzjqdi//Xhw=;
        b=lhGta/qEC4Q/QtIp5bJF7uxwZ+gDJ9m5+TTpgMJuTXCes+zVUwHZjCO1vxJXn5SxD/
         H6jWAp7/Cr+RHc1S0snOuw0gkYyHtkMStoAiAnj9rrQXKc8aI8wIggn/oUHZ1Unufg3N
         yETXYyI+6EkFtIf3tjWjzaQ/RldNR8si4zdWOnujXpzmddR9x4A2acirlxyKrdkXgPKR
         7qyq3+1xWEDUXUWMLik1rK3av/7Of406Td4lk9UrqZKX2Ive8KGpxuz+DqB1hfck8wBh
         QHReYCoh2gyTniwgLkmpua1ZfNobbB7YsNAi+nM74hYlKQwlDYsVeqRZ5rQvLp44ck+N
         TS+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV++FBmHVpKJ8HLA8ONfFZKi1RFKXikrXJpDav9NSrIogZUnd1X9/CRKvv5weSyB1zGwYpiFO9808yLNI4t66SweUa/FBITjsR92DMB3ab5xzXxyn4RpwCH1wveCT6tZdcrykxI0MJc/g==
X-Gm-Message-State: AOJu0Yw6d/mOA/RL7XU8y4luos9Kg0BNWSXqEXgCwodK4hC+vnneZgk0
	enUtagZ5JahrpcJmOYCLqQwIslUr35MvHaQ86GWpfMdTD2muFRgC
X-Google-Smtp-Source: AGHT+IFiJEAMOip5wmA1PHPsOgaVcNDNXXYBiJuEfiSe2wtyjN7SbcnsNVnLyI2KCgkn7iUft7ndkQ==
X-Received: by 2002:a17:903:11c9:b0:1dd:a16e:dea4 with SMTP id q9-20020a17090311c900b001dda16edea4mr3075150plh.67.1711116669312;
        Fri, 22 Mar 2024 07:11:09 -0700 (PDT)
Received: from Ubuntu2.. ([14.139.121.51])
        by smtp.googlemail.com with ESMTPSA id kg8-20020a170903060800b001db8a5ea0a3sm1956577plb.94.2024.03.22.07.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 07:11:08 -0700 (PDT)
From: Chandra Pratap <chandrapratap3519@gmail.com>
To: 
Cc: sudipm.mukherjee@gmail.com,
	dan.carpenter@linaro.org,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Chandra Pratap <chandrapratap3519@gmail.com>
Subject: [PATCH v3] staging: sm750fb: Replace comparisons with NULL and 0
Date: Fri, 22 Mar 2024 19:40:31 +0530
Message-Id: <20240322141031.2776-1-chandrapratap3519@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2024032208-blunt-ferocity-22f4@gregkh>
References: <2024032208-blunt-ferocity-22f4@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace '(opt != NULL)' with '(opt)' and '(*opt != 0)'
with '(*opt != '\0')' to adhere to the coding standards.

Signed-off-by: Chandra Pratap <chandrapratap3519@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 04c1b32a22c5..c4b944f82fb9 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -926,7 +926,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		goto NO_PARAM;
 	}
 
-	while ((opt = strsep(&src, ":")) != NULL && *opt != 0) {
+	while ((opt = strsep(&src, ":")) && *opt != '\0') {
 		dev_info(&sm750_dev->pdev->dev, "opt=%s\n", opt);
 		dev_info(&sm750_dev->pdev->dev, "src=%s\n", src);
 
@@ -1147,7 +1147,7 @@ static int __init lynxfb_setup(char *options)
 	 * strsep() updates @options to pointer after the first found token
 	 * it also returns the pointer ahead the token.
 	 */
-	while ((opt = strsep(&options, ":")) != NULL) {
+	while ((opt = strsep(&options, ":"))) {
 		/* options that mean for any lynx chips are configured here */
 		if (!strncmp(opt, "noaccel", strlen("noaccel"))) {
 			g_noaccel = 1;
-- 
2.34.1

