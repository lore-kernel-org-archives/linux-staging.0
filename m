Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6911D27D77D
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 19:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764183660; cv=none; b=KCA3oWbEckLvurlgGLq7DD0X0NKQNCOGcu0XeeJP9ZRUlgiMtg9LGM13bMEe9cE8l0ulUzK5laY7wAx6wcYSneBIjMxqt7AMen8I45+A7Efra2VOtS6Z5scrssve3CGtGzJXRjUnTutcZ3x0bc789mnDlyNRHFopGoT6oHRjyBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764183660; c=relaxed/simple;
	bh=BGo71SitEPWVhYqtjLnWis5t1q4AdHwCwZUqh2i5jSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=raxndWo65v65E1Dt2QvaBD257egvB1SC/G/gzk2qO6TPOEQk6O/RUGGajaQjuBj27E1zKvkZlB4Ge4cONVhahKbxXUvQQQ3bCRwNKOlRkAhB8sR5j25XIrJjT0DYFJHKdaFTSCO6gR71rYATQh9oFomCkf1avQtEipJu1MB13Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJFVLT/X; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJFVLT/X"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7bb2fa942daso6434b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 11:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764183657; x=1764788457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdAfofPkZqBP7fas8//QaNlK+QG5oYJgN4CCWeJps6o=;
        b=mJFVLT/XpuwgyiOi6Igb/VlCySVJ9qRCJOzdMGVgw0YBMJwrUIWXXYSIM2Y35rptG6
         Zh2trDz2jrorhWsZgzjApWkywyRRMtXTByaDxTfjpVJlneond2Sb9Yto5Mc5OP/e5pYm
         pUAJQt8SS7rOBr07UxSBpOriRpE1JpSLQ/8isG8DpTIh5ZIRwDSJAabX6aLjPHuOybDs
         rh583JQVaVgpwM/Ta36vOz0yZILFMD+vj9TzxvIk4/Jw6A5NHkyg+1ICvKx/GEpjtI9F
         6Q4Oo2Xo7KlHILURhoO2T8SxsfANwM+RbYDI4XroJtbXrOFWY3zUWE3GXpnJBK3IRw5s
         KMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764183657; x=1764788457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdAfofPkZqBP7fas8//QaNlK+QG5oYJgN4CCWeJps6o=;
        b=YRgVbViDTMseqhEFX9Rep5qf9F8PDza+U6CDAicNXh2KpiBXA52rSfpjn1XguYw3RT
         detU3i/gx4MXkI0kSxuxLdEc4Uj69z/XrzV9ub0Dv64Nn0M8F9bPmRepzcnNz2LyhYUh
         J3JDZSiQjiOUWUdR+Mkm7umwbSBnEZdpK1RxizbToIMoGzYU0pQhVoE/ZH3mhhX0kbhH
         DxJQy6pkH4vm0jq/QawAvboMzPLG4mjmelTAUBWWkchnrFxe4xcDbWJUGQUioxi5UByB
         RdxYMZkoimhARuMGfnkHsac8phZJpE0r47vqKjb/mVcc+lPeV0RTN5104wLAow9HEtXZ
         FujQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9+tU67FoM7Cc/3hxN6qdkXlhoUE3p4GA4rB0oB1uIl5/4fp3gRqD1a0C+McemM7e7t71JItkiF72HWUbj@lists.linux.dev
X-Gm-Message-State: AOJu0YwK69q/bzOOEypUsvRMi0eojhuNWBsvkjR4XHZE/81ob6+p4H7y
	Afqsduux7LqIOjMgg+6iObCOeSevpleLDPclxGNdUTePmsIjcezhKUvR
X-Gm-Gg: ASbGnctilhah1Lo5xurMD1hrR5njakxe23u/jJr4W6HiLct5rb3aT6pYC/RBO/PquxL
	4Ej4xrFojZE+jLFbP4gaoxRLfFV/GZ1/yxfTT0x6g42GbsvZ1PF1XqOLit+qrw1Zr0XbhvGkRiq
	pgJ2xCuNvkuWHQzGuLw3FZwQZk5E7dBvXOZ1k2nsgqdLYl3yu56L+amjY1GcRY1y/NUWHBIl+F2
	UZ1OHC0judm9+jdzb6UUCgw2BZ2+GD22hbqvTrbuiu1xLaxfv3Z6cxL0XxNEHB/e8Gxzkfr1U83
	nDhKe42bL57mxy23w7WdQTzrRJL+HhvsIqjYEdWvOMPkn5IqtKNvUYXwzfuuJD8CtbxnAEYsw8s
	Wm/RD3vlQdgx8sQjkDylgcZ8S7295QPXKLr8l8oz59JKzu3HkILIo2Sm8CkPqd1ztbGxzBkkMBh
	jYqkyIWiXKD2fKUA==
X-Google-Smtp-Source: AGHT+IHU+aXAA0q0Iz7Eeb8GCZpYyoyccizXCz9DRoBSI+UPrt3ldISBrusLfd+O3KCjNgSZPWLuyg==
X-Received: by 2002:a05:6a20:9184:b0:342:8c38:ec2 with SMTP id adf61e73a8af0-36153f618f1mr12615631637.1.1764183656362;
        Wed, 26 Nov 2025 11:00:56 -0800 (PST)
Received: from Kai.localdomain ([106.222.235.6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd76129de4dsm19925972a12.36.2025.11.26.11.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 11:00:55 -0800 (PST)
From: Ayush Kumar <ayushkr0s@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	hverkuil@kernel.org,
	ribalda@chromium.org,
	abdelrahmanfekry375@gmail.com,
	santiagorr@riseup.net,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kernel-newbies@vger.kernel.org,
	Ayush Kumar <ayushkr0s@gmail.com>
Subject: [PATCH] media: atomisp: coding style: Move trailing statements to next line
Date: Wed, 26 Nov 2025 19:00:26 +0000
Message-ID: <20251126190026.37436-1-ayushkr0s@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).

Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index 11d62313c908..5ead15dd7f84 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -875,7 +875,8 @@ ia_css_process_kernel(struct ia_css_stream *stream,
 
 		/* update the other buffers to the pipe specific copies */
 		for (stage = pipeline->stages; stage; stage = stage->next) {
-			if (!stage || !stage->binary) continue;
+			if (!stage || !stage->binary)
+				continue;
 			process(pipeline->pipe_id, stage, params);
 		}
 	}
@@ -3045,7 +3046,8 @@ process_kernel_parameters(unsigned int pipe_id,
 	/* Call parameter process functions for all kernels */
 	/* Skip SC, since that is called on a temp sc table */
 	for (param_id = 0; param_id < IA_CSS_NUM_PARAMETER_IDS; param_id++) {
-		if (param_id == IA_CSS_SC_ID) continue;
+		if (param_id == IA_CSS_SC_ID)
+			continue;
 		if (params->config_changed[param_id])
 			ia_css_kernel_process_param[param_id](pipe_id, stage, params);
 	}
@@ -3600,7 +3602,8 @@ sh_css_params_write_to_ddr_internal(
 						    IA_CSS_PARAM_CLASS_PARAM, mem);
 		size_t size = isp_data->size;
 
-		if (!size) continue;
+		if (!size)
+			continue;
 		buff_realloced = reallocate_buffer(&ddr_map->isp_mem_param[stage_num][mem],
 						&ddr_map_size->isp_mem_param[stage_num][mem],
 						size,
-- 
2.43.0

