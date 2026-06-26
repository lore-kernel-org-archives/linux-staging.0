Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC23FD139
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782492050; cv=none; b=gurh4zObG5iifXuD06TSiHr52I9dg21Ucc42cwukoQXapa/fx0sb68L27G14OOr+gLaYdPeLOZypRHumpnvIdJQHuWTL2xpWEWwRfAPUsBhx6VKKCkb8XRCsdoJ6taBSaRfaUgwNbVPPYMAt2Dgrt0ouvlutcQp1vTDl/Dul870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782492050; c=relaxed/simple;
	bh=UwXDGYiHTT+NP61sZf6/dV8Eae6ADHs8ZXHzIDrEooY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VVaONYwfS+UhJzU/XT1lxJNcnvMIHyyYPFtNXPRyth2MsrdCWsl0qJXroDJg3n2sTrxhXCEw9aor0cji1MJGvVyLJbiMf9syrsKKsXaqwdasjQZ8QweUKpMITLQ3FA/Erv7CXmAQ1dD+BsMfyx/W7rCNEl0vnWnD6q478WnNc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai; spf=pass smtp.mailfrom=0sec.ai; dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b=VEGTwlsy; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0sec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0sec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=0sec.ai header.i=@0sec.ai header.b="VEGTwlsy"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-46066e640easo663424f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0sec.ai; s=google; t=1782492047; x=1783096847; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkKeguPCV6xh6Jx7E/CjDaoTlE84LE6Cz+7INAskaJY=;
        b=VEGTwlsyiLcGSjNSB8IAgehHPcYG+hfPb4jezo3tS5tz0gUJt42hTiLa7SOEmuauFi
         p3rNZ6jfKm1JrEBHxJ8DUdiE8MA2JdHvxzaO7G74YqwknaDPLNQhHlhCDDiKEZpNzLKz
         zEl9qvoaHPxYanItDdoeN2xuToF/FWrXlFggyU2hZ7yrA1asBc8jrgHYtwYIURbthqy5
         f3ZZpTqdC46x2h6AfAAT691uP9iNq+xubLP+sQbq3bc9Bnt8nKREv4vhl9e5HkauxH94
         XUgijdGNTBGHueVWCFftGMeUl8/lkz0Fhu8F17QOAr+jaaQFmRKlWmIuKXz9UrZd010U
         EgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782492047; x=1783096847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BkKeguPCV6xh6Jx7E/CjDaoTlE84LE6Cz+7INAskaJY=;
        b=THDkMFC7xcS+c8tIfmLxP5AChayyddB4UGyQC5VTtJlmRZhPrH3cvTzK14NG3Y9/8m
         uv2+srPqjBLUBdffTmJMb4abiubxeF7iP75sp2oBEPivfvzv0VqFfMbJuUL8PtgMrKZ+
         2EiS94FHcYVmXVcefNaVDZjJdUeHrCeTqhd27ufIa2E6Z4OsbnNVBgNNI84xjBTnFojW
         wJQtmprUQG1diql/eaSOnevrdPKLEAX0hwyFsf6XJfJinch00/PfAyBLfFtEO2VTNJIN
         eGcVE+9pMfjB56B1wfFRDfhyAALCIjQhhDSUGouSgXA2MDTmTudjREtDfzp01gPRkC8q
         yK+A==
X-Forwarded-Encrypted: i=1; AFNElJ9UupObUeifGX3JSEL+t8DH0YCJ1xAmbcbwUfFCbv2iK28f2azJvAisvXL9loe0xuYoJN0kxLx+v3J81sJW@lists.linux.dev
X-Gm-Message-State: AOJu0YwGNMtJCxUqt9hOBMP8OvG/Wyv295JV3z7oVtCrjTwkKw2vrdgi
	zSJ/eUb1otRCST7CzPlstBhLRcZhWHqHir9K5wTs5le+U+6yVGpqYkY7E1PmccVopl4H
X-Gm-Gg: AfdE7cnkQ8bLV5GhUCdPBgsjpAljEePmO6SUdsfNyPAzOwCIp0cCraf3xZptCTzSI3W
	DIAGHSwBEzu6IJBsYYScBQjgzybt3IB5IAjz4c4HMeCAbTSpM1LV6FrjfwEJZIp1VWoBY1hIgTM
	4RUc8U4Y1Iokw/ylnTHVRPNzsxTcie90B3rXz5OeiJLQe6vaMBRP+ekDS1MKJXrHl5+WvALjBcr
	ZEWJiD0OhD3utPOoXFkAOFiGxHss4/owL7GVC33lI03EHV9Vmq3f7LNeXrLcXghI12n7VeKICGs
	rwUFH4no66qByaREK3sd37G/ZRpKsu+lXrM1Q2UWPzYngLm75vJ8UEyefhjhKZLhSQnxEuwEnet
	OwNGjgFeGHdZPDsN8cML6nGlwqdRMqg7kx4UypvpKeKJAR1XUT8fVRg9+JynfyqgvEicqrXZIzG
	iY7kCnPofR8hpGDhUYDc45QDLepnmOYE8VslKnTjEZgHH5SQv7tiAOVNvr8l+nJfYOrX+tkyW00
	f8v3s13LlHE93GBUVYoMlUl5o9Cyh9bB04=
X-Received: by 2002:a05:600c:3513:b0:492:564f:5603 with SMTP id 5b1f17b1804b1-49266850086mr113445575e9.14.1782492046745;
        Fri, 26 Jun 2026 09:40:46 -0700 (PDT)
Received: from PeakBook-Mini.tail8e484.ts.net ([178.197.218.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d998esm25393443f8f.24.2026.06.26.09.40.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 09:40:46 -0700 (PDT)
From: Doruk Tan Ozturk <doruk@0sec.ai>
To: Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Doruk Tan Ozturk <doruk@0sec.ai>
Subject: [PATCH 2/2] media: atomisp: bound DVS 6-axis table dimensions to the allocated config
Date: Fri, 26 Jun 2026 18:40:42 +0200
Message-ID: <eac817f13eb90ee3b34b4afa9b1739d67ad48f7c.1782484857.git.doruk@0sec.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1782484857.git.doruk@0sec.ai>
References: <cover.1782484857.git.doruk@0sec.ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

atomisp_cp_dvs_6axis_config() copies the DVS 6-axis coordinate tables with
the user-supplied width/height (t_6axis_config / source_6axis_config) as
the copy_from_compatible() length, while the destination is allocated by
ia_css_dvs2_6axis_config_allocate() from the stream grid dimensions. User
dimensions larger than the allocated grid overflow the xcoords/ycoords
buffers. Reject user dimensions that exceed the allocated config in both
the ISP2401 and ISP2400 paths before the copies.

Found by static analysis; not yet runtime-reproduced (Intel Atom ISP
hardware required).

Found by 0sec's autonomous vulnerability analysis (https://0sec.ai).

Signed-off-by: Doruk Tan Ozturk <doruk@0sec.ai>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 966b84402..b04d3f3ca 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2632,6 +2632,14 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
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
@@ -2684,6 +2692,14 @@ int atomisp_cp_dvs_6axis_config(struct atomisp_sub_device *asd,
 
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
2.43.0

