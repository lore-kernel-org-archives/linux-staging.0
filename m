Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88439DBDB
	for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 10:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554487; cv=none; b=RUZmgjJi3evV9CUxSYskmOa/Yu+1BVAhKjWNGax9sooSjbC857HV8r66F6fI0Mslyao1p8cf5dDbFsXsBJDZ1luLBGmDRgzout3FP9dRwoirhp+Om5XM2aPqjiZQ+9j9x+WVyF/M3pkJ656ptctZd2J5oJUkvRYXaPoOEneIDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554487; c=relaxed/simple;
	bh=LfbBcOkgclaJzGAlsyhBMLCYtMUkrCClYpL9RNeMdwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fiWI9ZykbuS6dUZ9fStNgWTsIzsqba9K0CE+hGNs1BPIe9TWxeLmVXQs9uhUW5LnwPj2lK0D9W6TEF9XqZeUqo4XTNLCOpz//qoM6sA75GEYy/NK221veNMV7dXaCbZA5R2P/J35TGyJXEDc9tkWSelMyAkf6w78jevswL7vVwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=L1umQ4vq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="L1umQ4vq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4926f8e02e8so7761515e9.0
        for <linux-staging@lists.linux.dev>; Sat, 27 Jun 2026 03:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782554484; x=1783159284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bw0B482fnjgsRq3zHufnszUQfIBwVQW6z7YiwuK+gVM=;
        b=L1umQ4vqHZTIDT4lAXfk7Q8Zjie2XWoUTD/4TjxIrPR7FtCOm1zbuldQwawKrd0t+s
         BwiCc3aAXbCiiN1T+ovWIO/CNWB3QUjsa4vlQswMhqdnRU5LSsvf4EQqSoqtNzzfhcdI
         3NKeWMS5PeFkvSVdU5kiowzxja0FZqQWu7706pXqIp50ws58pNJNUKcPAe2SiNLHs1Ug
         qnjgL4a7+GADKb71VD0sG6YUgGwf7VUr1Q61+ZAPmQR+kcYbYitJJgvCXUoFZdhjz6x/
         rP7OXO1qG9Mknn8ZfhuEsDgEiaFlEyPHYFWtWWw/WuGHJ/1I75ncGI8iqevCHLbOQSi4
         OQfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554484; x=1783159284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bw0B482fnjgsRq3zHufnszUQfIBwVQW6z7YiwuK+gVM=;
        b=WsnJxMepi1yeWpMY5Q5lXHn9silDsFtbD0fADSXk19DuZvGTcUIlxuU3BEimr+4Krr
         FGg8dbI2oDXXzximcm77x9UbcWsmc/QD1rRtpHuNmtS8JM6Ni7C4Qgeb4osr4BsHTiTd
         YRfLd0UBgw9w4H56olwYRSNLfVjgBK16hpUCWlRO6A1VvOZ9qVK2L3eJJ5L5R9VeKMpq
         gIoS+fqPh6HrffU2nQIEgKwt1Kp6sEMDVOWWYqN78OIFyovlxKy8ed0IPwa/0A+rbQ2p
         hMszOFy4+lj0av8Bm2u3gso47tmQO3RgCmx8da18/VdxQT2q7EnAT4kIt++cEs7eIAs4
         pMpg==
X-Forwarded-Encrypted: i=1; AFNElJ9yac3PuLUdZVw3IbA882kXknCUudkoX3QJ5vA44qL7HYjo08s5Zf0v9emmvfQVLAU5RMCAg2hARXQWxpM2@lists.linux.dev
X-Gm-Message-State: AOJu0YwUQsI4WeRsgl4VqbO7OGDjFIz9O9I8+WxMIELbYTwo/P4EQLCO
	CnsnTbdCKnLyEYAwK+IWDMcJKKjr9BPn5p+ivPak5tv5/if4SmxT7HRLkvcS5GhC+M/3
X-Gm-Gg: AfdE7ckEhnXPYgYwy1t2rHB//anx2DYWvK0aBUg5r3SjvCCJ8cbtHYHuJyw5IFituTC
	u9b6rFDCAYmRB1HDsXVni77WaBKtR2xRhUwx5KS8OaH79MhgqvVupv1REwlj7E7zsDjOLEkbNOW
	wNsnYbqISbUC3w/UF17dfGTgRKqxu6VX1CHXONCq81krukHoXfr45CFSRiXg4dWRnZ+RViMcFPD
	OjbBghtTQXZNhEKOC2j6X4reTbhk+wJM5I2JB8AypOdAeOuJAFaTf/+GYT0xzVWtJeOH3/Isys+
	UEHZVOGxW2/NC4JrPUkRt5IYMKv/JAK85K0clciCb1tyEQo076a+7NYNGfIQfyTXkYN3KbIcCO7
	3wvP55tv0FunHP+9Ly9d04wZP8RSAxMnm2vnL5vLcbOky8935I9ctX0UQGouPYD05natv8OVhJ0
	tCYF1V8HWQdfSnD1w13YIFOU/bUYXWdIuQgG683MN3sUpob8DqozasxE0AMnryL3KBuP6b0v3Qa
	xj1D5tP5voA6MushGZ6/gmRS/kuvbKLM4k=
X-Received: by 2002:a05:600d:8445:10b0:492:710c:925e with SMTP id 5b1f17b1804b1-492710c93fbmr28918935e9.19.1782554484366;
        Sat, 27 Jun 2026 03:01:24 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49271465f35sm69047735e9.9.2026.06.27.03.01.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 27 Jun 2026 03:01:24 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: hansg@kernel.org,
	andy@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH v3 2/2] media: atomisp: bound DVS 6-axis table dimensions to the allocated config
Date: Sat, 27 Jun 2026 12:01:19 +0200
Message-ID: <20260627100119.97650-3-doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627100119.97650-1-doruk@0sec.ai>
References: <20260627100119.97650-1-doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_cp_dvs_6axis_config() allocates the DVS 6-axis coordinate arrays
from the stream grid via ia_css_dvs2_6axis_config_allocate(), but then
uses the user-supplied width_y/height_y/width_uv/height_uv as the
copy_from_compatible() length. The reallocate-on-mismatch path also
re-allocates from the stream grid, so the destination is always
stream-sized while the copy length is user-sized. User dimensions larger
than the allocated grid produce a heap out-of-bounds write with
attacker-controlled length and contents.

Reject user dimensions that exceed the allocated config in both the
ISP2401 (t_6axis_config) and ISP2400/else (source_6axis_config) branches
before the first copy.

Note this ioctl path (S_DIS_VECTOR) is currently gated off by
2b7eb2c5dc72 ("staging: media: atomisp: Disallow all private IOCTLs"),
so it is not reachable from userspace today; this hardens the
disabled-but-revivable path.

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).
Found by static analysis; not yet runtime-reproduced (Intel
Baytrail/Cherrytrail ISP hardware required).

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Assisted-by: 0sec:claude-opus-4.8
Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 04e7b2e03f34..ea543025fd9c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2630,6 +2630,14 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = t_6axis_config.exp_id;
 
+		if (t_6axis_config.width_y > dvs_6axis_config->width_y ||
+		    t_6axis_config.height_y > dvs_6axis_config->height_y ||
+		    t_6axis_config.width_uv > dvs_6axis_config->width_uv ||
+		    t_6axis_config.height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					t_6axis_config.xcoords_y,
 					t_6axis_config.width_y *
@@ -2682,6 +2690,14 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
 		dvs_6axis_config->exp_id = source_6axis_config->exp_id;
 
+		if (source_6axis_config->width_y > dvs_6axis_config->width_y ||
+		    source_6axis_config->height_y > dvs_6axis_config->height_y ||
+		    source_6axis_config->width_uv > dvs_6axis_config->width_uv ||
+		    source_6axis_config->height_uv > dvs_6axis_config->height_uv) {
+			ret = -EINVAL;
+			goto error;
+		}
+
 		if (copy_from_compatible(dvs_6axis_config->xcoords_y,
 					source_6axis_config->xcoords_y,
 					source_6axis_config->width_y *
-- 
2.53.0

