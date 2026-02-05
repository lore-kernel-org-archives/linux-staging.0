Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DA32367D1
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 23:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770335195; cv=none; b=Dl22DhPcua6rGQvgRkCMm/vl1RFSqYkDfPv35IcgV6OK0g0MfbhlD52Lo4BiTQb3S3RKdCL4ZSExUDS8CTXStuhjUBdzpX0uLX7lgDmcr1wqgEULw8No1hoftReMaGrAyt22wyKS6W5t0pEkrcSavmxwF4kHqBliM+jvIJX6QWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770335195; c=relaxed/simple;
	bh=W/y78jy7X4nuj5V5IpcGtOqeSqAcFoKR80crW8YdxtI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k7S4y+YEKe8M3CsgUXPzHMt7J1POUnnNuWs2vO24Imn+srtx0e1ZzqxwTP8kLannDFjVMgpU8+ptXILkSEVHCkGmzDX7Q+SzlUm+PilqLxK8vI3TtYtzcNgt2Xjpr1EjMs5wrSUV+F/7FPak7h0RFGGg4m3YnXTVrmYM3cBHilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ6E+MuY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ6E+MuY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b884a84e655so230335166b.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 15:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770335193; x=1770939993; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9fEt2B8uF3Xgw1RKagrHwaEXS6gyn2vlWTudLc2umps=;
        b=dQ6E+MuY7E/pd+KK+aCnbg4wYju5C5AZGzj51H7mi3q7E9jtT24b3Dr/jiXwAJZZrG
         dmGCHrQzj5tkCjCY0CpDtYKTBFouaZb40LRmHkn6BQOLcxMY23kgZunB/9XVdOZYwC8t
         gR9G+jRUAiim+ZMXgdCg78vuHnm/yK32JOkCyvuIvhAvawgNwwHPzXnLcebag/wRRgOh
         XD8AC6k2KI5g7C/Vb+FJmg/B1o3319gFgRPQwsBrD57bUaRTfpoCOd214tSZGNElusGA
         4E1bfaUP7TgBpLr7PorE00V2OK8+TBQC3vdCjbNcMUX1aAyKxJOjb6Wc+EBwcaBvL0/4
         yQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770335193; x=1770939993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fEt2B8uF3Xgw1RKagrHwaEXS6gyn2vlWTudLc2umps=;
        b=cKdktSg75zkKW5ZrTvoe9hWuh6bIaIj+IO3lS7y4IK13N9ZBEGeAP8P/3u3DpnZeK/
         2Uu1d9I2Dkd/bbrrKrCGEpYCwtv43LqCvi9hYMzWe7hPSlQu58naIppf6UJowR0QyzwM
         fEFc6f1Iv33wr0Z9GLdyJssJ4T0Z9s3itlYpaxwNt3mXwsYfTOdUG/QeuFcbBjsIikez
         V6bwxQSp1jdc9e+lGRfcv5HuQym/jsW43tgGK+GeUTlXjDbZzoXTXzNzNiDbOlZU4lY9
         cnbYRdtmCmR7y5DhhWe3POAq6HoU/ZbJg4+9cHQ2b9u28VjvXSERJjy0oVXcAg5M8RMC
         gHrg==
X-Forwarded-Encrypted: i=1; AJvYcCVyNcb/+LILmwHTNZIlVPA+H0sxlOn/t81VhV0WZdElOTN/3x33DLHeeyUNqmMYupPmokqDGRFNao3h9pTl@lists.linux.dev
X-Gm-Message-State: AOJu0YwU2j9xhxOeMtUx4ZxBu0CUet828ShEKSiCrUWWijdJWWPBhx8U
	Oyztdcjx1tkHhzDy4m80m5LVztE7/Ui/DcHZJI6M3HodpG+sXkLMtb7s
X-Gm-Gg: AZuq6aIcdgO55vJnXweNOtrhJu0y5TStGvCxIUW0r2nDb4jFUGVdjq+vsU1YeXTWTVI
	nmgTJUrbtxmvT+Whdh9lDF8Y/jgpGOgbNxy4tTHTrOx/Sv3nMCUTAiydQLrAf2oSEvPCrQ4qIx2
	aH08wSzpvK7GZAA3VX1hEnUdWycOftxyCLeH5M6Emfn79vSiw5dh7/vn1rWD09URZyYDQtFDyQQ
	Lfz+7+T+UwEGy2/RbrP7f6On4f/miQ7dDdXVm0JvxWhgDVvyJkwe86icGF1twmzHVihKIRxjpHB
	12SOBY5aIdLCVPSdhPZ9FUei0gfICXe+z90sStU22jOEywXZ6GglWqHVLv+isc+vGhgmzf2JDes
	5kuzPSiazBJOfJfarg1SD1a0WzPqBOYDm9EVnTU9r54BBCmZO4FCFky/3SH3/1AiJQtTFb+yL8b
	sMIJkMJK2sDToT9gxUaM4+6xcj1ZFCuLLr2UDdhVyjl29NiwTOBPTAT3QCRw6aAQRZuZkOr5ua7
	kIeXYc32ymuCOodQmb9bxrq/AQWn2ZUJw2N+zLvPnhPWaUWhqelRagz29hOfA==
X-Received: by 2002:a17:907:d8d:b0:b8a:8537:e399 with SMTP id a640c23a62f3a-b8edf3c0f26mr44373766b.48.1770335193396;
        Thu, 05 Feb 2026 15:46:33 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.od237066db22328bb-tp.internal (212.28.147.34.bc.googleusercontent.com. [34.147.28.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda7a3004sm29501766b.15.2026.02.05.15.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 15:46:32 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH] staging: nvec: use strcmp() instead of strncmp() with magic length
Date: Thu,  5 Feb 2026 23:46:32 +0000
Message-ID: <20260205234632.1964-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncmp() with a hardcoded length of 30 with strcmp().
The bat_type string is already null-terminated (set two lines above),
so strncmp() with an arbitrary length is misleading and functionally
equivalent to strcmp().

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/nvec/nvec_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec_power.c b/drivers/staging/nvec/nvec_power.c
index 2faab9fde..89dd997aa 100644
--- a/drivers/staging/nvec/nvec_power.c
+++ b/drivers/staging/nvec/nvec_power.c
@@ -207,7 +207,7 @@ static int nvec_power_bat_notifier(struct notifier_block *nb,
 		 * This differs a little from the spec fill in more if you find
 		 * some.
 		 */
-		if (!strncmp(power->bat_type, "Li", 30))
+		if (!strcmp(power->bat_type, "Li"))
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_LION;
 		else
 			power->bat_type_enum = POWER_SUPPLY_TECHNOLOGY_UNKNOWN;
-- 
2.43.0

