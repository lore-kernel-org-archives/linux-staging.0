Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AE92980A8;
	Fri, 11 Apr 2025 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361692; cv=none; b=GyqVsEPxh1Nq7ArlcptIYC//qDeqjaaZOJ+Q893GogxuAYj7uN58iaPDJ/FZc+sYVPnfI+lU4hJJw+w+1/fzqcziJWv9YnFPdES2HT/De+//QXe24TLqAf/moPEMni6uDjZew4lNKyEmh46CpJYPEJ4wIvxcI32ViEpUwv+KR9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361692; c=relaxed/simple;
	bh=KyprIQ1opyL0FHE3sPCvabhtO9sp9Wx9Bf3O/mgmCHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UnNsl+JmygiId3+2zTOMScd6138jaZ3QJExeYare6aMjEoWWjUaK0oYqpUYoN3YjF/GYDQEgfe+SIq/MFBm/GloQUG61uylST+aeCsdAvButpEK/Igy4DLxDBybKu2oQNr0KajQJEhTa9ISVsSPUzTRndOq0CXZviOXig+AvtXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8YcFC5n; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8YcFC5n"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso1022301f8f.2;
        Fri, 11 Apr 2025 01:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744361689; x=1744966489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz/eRrE6itGPGVxaacR7mXYGhUWJFoHHWj/Si1MrSR8=;
        b=h8YcFC5nvaMvrrtGPeNLoAm5qLwPqsb7S+NnZPlVQaJ7luvuh+Wbej9kXajNYA+U6Q
         b69hqIcOmsN4wss9edV18k2lSh8P1BhXSyIifDzXZbBFeSnb41j8p+ANR8YaR0nlhK3f
         VQvd7rT0qCuzxtiLAcIkYwSoP3h8cGB0xRp0EZ9NqDQ7f25NUVSlmCfr8vlz5ml2rHir
         4LEr6AC0ntLORbP2aeIqY08VSJzSiAmqUW3yVUW3mFJL+6/oe0gJJ8Chot8l9qcM05TY
         lmIzlNObQ/7WCI64XZSTlaVTHAunnzLXW0jwAduAdUZZ/f6CLChZLzlr8ca7Tl3fyIhZ
         OVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744361689; x=1744966489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vz/eRrE6itGPGVxaacR7mXYGhUWJFoHHWj/Si1MrSR8=;
        b=kRpUaYlepHuJ+VCNsMhJNNEGaFEY3dVJpUM5xPJSMb8yb5VtFRIbNSQpHiEaAWq1fm
         Nu/lK2ihKWr2oKFB4CPl6AGnIk+at5zrL4Tg4gNb/B20WaMOtO7zznl729DdlZCePvr8
         /+bM1q0UhCE6HfDtfWNRS4KNYfEled1LVAI/T5z8IkikZV6be0G88peifQfvgir3iu40
         hiOmwc05PPMJXXBUtbNRoWb5LNXlyyRUNEDY7d/xugM1QvyHgR2PB9tLFc4pOP/U+w09
         6vBUTlfB35w3UyO18RjBye9y32Rq/FJlqhS8W0rrXGIMdFA0CEkhZ2LKQSXQF0nzXN36
         H1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNuzJ/KjNAFT4IxGVHuoU6Q2szcZzvLp/dCiRN9O1Nu8p/dDx8frhlsbmJfWz/Ta9NUCbXWAhmMKq7@lists.linux.dev, AJvYcCVROTKKags0Zef2hmeEZyTqdCVTWc1FvucxafLOzyptJ0eUPgPSLkvjaeoK6KltQsX2b6nSUCO3GFepjFO4@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8/vghPugkK9+ZH4OhD8RUb1fJUTtu8ULnjdbUmy09JfD+6lEO
	8wq0u6VaPZvo7KcLr101oj7Y0bSIS9swxZJ+3q/S35k8Uezn7en3
X-Gm-Gg: ASbGncvkC6f/fX0L8yOGe4NjAeAcv7I86FcY7PiIj2OPe98C3pHzh2I9l8953eZClq5
	znkER0TL1oKjL7EQjBADwszHTIZ5wkCcyZdYoK6YzrTFUdIGEmmDtY6oqj75/EdxQITecHAf1dC
	eXY6hHqoxszjnbaT7meutLpXFqKU9MaG1F5ke4N1+AerGXlKGriZf8C4TtCV9JhNYO+dU2Jslet
	SFwBF+iR0K5hliUi3CjSFUGZPHEoJQI5gFoVn0iGEI9WOfHIcPmeQ89ZM3QOObj3Skf4cpvtju9
	K1UGxkyDPLA8CVdVHiHkZSR5sQyZVUiE2buY5g==
X-Google-Smtp-Source: AGHT+IGQ1mfH6C1lv6nPAfeEQxxFNgqLIGSJ8pGCODJSkV+yOQ2XrVh0Z4UA497MoeC2lYlZFxEDvA==
X-Received: by 2002:a05:6000:4024:b0:399:71d4:b8 with SMTP id ffacd0b85a97d-39ea51f56a4mr1364349f8f.23.1744361688920;
        Fri, 11 Apr 2025 01:54:48 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecb8dsm80867345e9.7.2025.04.11.01.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 01:54:47 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Use boolean false instead of integer 0
Date: Fri, 11 Apr 2025 11:54:25 +0300
Message-ID: <20250411085425.44177-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the struct definition, adaptivity_flag is defined as type 'bool'.
This change replaces the integer literal 0 with the boolean
constant false to match the declared type. It ensures semantic
correctness, and aligns with kernel coding conventions
that prefer true/false over 1/0 for bool types.

found by coccinelle

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 97a51546463a..1e2946a23beb 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -56,7 +56,7 @@ void odm_NHMBBInit(void *pDM_VOID)
 {
 	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
 
-	pDM_Odm->adaptivity_flag = 0;
+	pDM_Odm->adaptivity_flag = false;
 	pDM_Odm->tolerance_cnt = 3;
 	pDM_Odm->NHMLastTxOkcnt = 0;
 	pDM_Odm->NHMLastRxOkcnt = 0;
-- 
2.43.0

