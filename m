Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3EE2550D5
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151114; cv=none; b=L8YVGNAqhyESquKZ/9ig609B2wuSyfgCX0OhNNP2GMDiBwsk+JEb1HgGnWnQ1GMaLshXX6ILg8IAhKaoPDCBePSZuVNuNyOQCSy5FMGD+umZh6lgjuUryskHrxPca/5GOCCDBTlZlfvQ4IjOATXVqhull/3+mE4meumHbLbSkC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151114; c=relaxed/simple;
	bh=oM57btuNW3ekRvgTbROwRISV6vnniljWeMeAhyibHMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTSIS+CUYGs2+xxT8yGAkB7ifhhrYCFfbdBBMcOBmIBJOBJSZ95wIo+VB+yK2fnUeAXD/CoIi7vphr5L7QGaS75lzE6QTdO0D2JD38oBDk2AKz+/G/PREhL4aEaPLuBq+MxeDJe9O/UpxJB5MGgkWlhaxtSkkxwNMlYJY22Z+Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=LoRbPdeG; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="LoRbPdeG"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so4629441a12.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151111; x=1744755911; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJII3lwxwEP6btEtokn6sH1x6OEQH5WFvfcqyI8vPWg=;
        b=LoRbPdeG6yZh31XIE40mxuczLveAWoPtNeIU+LWuLfuNskorgQGl4xa6BSWAJBnuw3
         MO+rtjMfkAe+Y+RExuV799HazIW3IqxEU0VeQBghXiqmYGa/54jPIr5EUa79t1SbSN+a
         IYPuvZfVuN/SPEcQeaHJD9y7jJ5TC3Uty8axfcHOoN1NM3PZu2l0zH4X5ssLuH3TBCcJ
         Anqnhqklz836RTVxIXPfAGnlZxuaogDGVNFWCgbkfUhC0kC5kup+RzgbdnU99HXJ5tVi
         ZMcRpdp5LfDj+eV8GRKVwDlUWad6L9O43s+Hxe+5O1eZ/Vx7EKfXe1gu3fO9q0jiJQQ+
         Cing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151111; x=1744755911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJII3lwxwEP6btEtokn6sH1x6OEQH5WFvfcqyI8vPWg=;
        b=Iix8+SKP2iewhwFsFWM/stssFCYpBOQaKiGg6kj5l5T1ooyENPnOtAXs1I+QK2pfY1
         x3LFpgORnF/AmPZr0oeG3FYlbs95aups8i/tGC5kw39ghyywOQZJgokJni4mQucJMQFA
         SnA0Wk4O9OqzUAbHk1cD/o78yXEvvNDCNs/ySj0GYNO1qcmbm3aBMgDEKU99sqgsETP8
         u/LyPg/63ZQDLyhqUGXsEIRYfkPGfvJazyFE7ZIs3lNUTtfdKtHfBWvWjFbkmt0BoJ32
         UHbMF+kz3anWqaqjr+c3n6ceAv5kIK+XlNxFaV53bZG/jJSqym77GHsdlK3ZwTjhB6Mg
         F/PA==
X-Forwarded-Encrypted: i=1; AJvYcCXvIFW14vn8kCMhVQ8oUwyk4LR3v9jm0dkQAnk122hwwEMu5mI9T8A9mBbfqM8Y033eLa0196AOtki+JytZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8bze3vM3uBk2GmiG+t5lRkkkuhNrVmKdfpjaB3bzeMZM0wj4E
	aoHHvVk1+1hGCToaZiLfcu6yZfddUYyDq/lI5B9Yy51cZnKdNh7oakFipctwCA==
X-Gm-Gg: ASbGncu/TXMbhBgA351sIarFRLmA/+ysrDlYoWzaMmp6JcqJkRyGywfj8z4H5q/p6jV
	jecO2c9npGUIu++4nLZwF+oSOes8+V7EyER0AqcXvx1MuqgyYp7nclwud6gBJpkYAz7+kSWnr1v
	JUeBOASLA3lWXCKvKioP4mbSuZmmhTU8lrfhDyKKPUcyINAnWHoqAPh0us3hewT6eGnRcbt8913
	Z3OXiQ5JqBtPPD78yWAr9ibB4dhx4/yHwRLeStc0XT6azJwNCFMK2gVqDWy6QwScpq9GOUmj11H
	n5E/FPbT+3EfOsbjDsEUzOP4nyccfzZgk+EJud2bOnfUohVGjV99pcxPbikfFImrpeNr2UMG4Qh
	fCXPciCvaOg==
X-Google-Smtp-Source: AGHT+IGGBaJsq6ra1J2TD6QhHEFEL49tTMqBX3rGuKBOfmUq0C4kINeHdNJZOfurJQ52gP0Ji/nVZw==
X-Received: by 2002:a17:903:1c5:b0:223:619e:71e9 with SMTP id d9443c01a7336-22ac3f2e04emr4578645ad.11.1744151111495;
        Tue, 08 Apr 2025 15:25:11 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bfeb2sm105911555ad.74.2025.04.08.15.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:11 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 02/18] staging: gpib: agilent_82350b: gpib_interface
Date: Tue,  8 Apr 2025 22:24:48 +0000
Message-ID: <20250408222504.186992-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 445b9380ff98..3880d4a23eea 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -773,7 +773,7 @@ static void agilent_82350b_detach(struct gpib_board *board)
 	agilent_82350b_free_private(board);
 }
 
-static gpib_interface_t agilent_82350b_unaccel_interface = {
+static struct gpib_interface agilent_82350b_unaccel_interface = {
 	.name = "agilent_82350b_unaccel",
 	.attach = agilent_82350b_unaccel_attach,
 	.detach = agilent_82350b_detach,
@@ -801,7 +801,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
 	.return_to_local = agilent_82350b_return_to_local,
 };
 
-static gpib_interface_t agilent_82350b_interface = {
+static struct gpib_interface agilent_82350b_interface = {
 	.name = "agilent_82350b",
 	.attach = agilent_82350b_accel_attach,
 	.detach = agilent_82350b_detach,
-- 
2.43.0

