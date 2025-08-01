Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFDC428B511
	for <linux-staging@lists.linux.dev>; Fri,  1 Aug 2025 16:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754064062; cv=none; b=rrASuBG2EYbKoazPDZhri96M+OTLiwKUVUEQOgl+nwfxXzttJe1E+9T+OZbncAl77S7Gi2RR/kK2ZB/+IC+FbwHul5AZxp7DCewwxtIlfQLMHIseG7KQxR2ZVoImkaggHvUfzWslh7aQ21OLPZeL3CMhIonQgW4U5MuBPy/vhG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754064062; c=relaxed/simple;
	bh=gxbyO/nRf/1euIk2zGL39AVfBifO9dw5pC4STJtJJe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V7wBh+NcqH+PD4y30mUsM8wv5bAAMS5K3MYPfSc6jexl169LAMYGPD+96/f9GctJuKK5MyXNy/M9Z8G872HlvTBsxTBG0N4U6/t98sMpkCtzWPXaMAgidT2s7In1sGoHYPWEfYrsO/rKRTBuTiKNu4KKEE/XK2Po8uDMZ5vmX5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IwpeRC60; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IwpeRC60"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-458b2d9dba5so2790075e9.1
        for <linux-staging@lists.linux.dev>; Fri, 01 Aug 2025 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754064059; x=1754668859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u4xW5Buo0/4Bn0zJX3iGqHwSKxl50sPUyBxGezBYQu0=;
        b=IwpeRC60DvCRG2XCQ5GkqeeQXMia94A3XLtTOgxuM80qu7CYA4RIRUTHpOiRH01QTS
         XvH1xbBivJjuBlP/SMmQnlhfGVjALhxcpB/Z7QMhMCXMUaicp9Fjv7UHG4NQEqvCXqTz
         zwyBsJebViiNXIFoimNbKppDJvIBA1jwaQBvdsezdOewr9d2mSV2XBy5Vk1nOx5M4UKg
         HHZ3o/VxnbgOrJUIQENQKEL0RUxV/5VEW655W53XuS5nsUQ4xJLjcthAylpbTCAnENjh
         OrZnFPWOOac7O4dIF4v/bGQfGewFC5QesFML2gBqY7VLVVxPfR6PjyxK+z9X8jDlsyn0
         Ualg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754064059; x=1754668859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4xW5Buo0/4Bn0zJX3iGqHwSKxl50sPUyBxGezBYQu0=;
        b=t0SUK1xJcABMszSFuvr5L+IqD+/MjgMwxVw2fN5orpZOC/61MxxFuDI2hx7x0RVDB/
         SSddbC3AkbbcTcjNkZK5vyZCdRsu4Xc3CgefFNUWtdZ0sKq1xDhFpbYRL6x6jscwK3kx
         GX8Y+g086A8x187+QIBC3SQi+XsGXveW1Ypaw4lz31tl+itwDe/BUIJSVLoEUgG4fYk2
         Wzz60Y145MnMnAr1pPq8DppZsA0x/ktUJFNvIIm5vN0Feyy5/BBlU1rDelXm+2/KwtJb
         duKHIo9hSjWf2GRbWumfn5KxqTx0PVyhRGZujtEvvCjbTT3+hO5SNOsLA8tapO5+qRs4
         +Frw==
X-Forwarded-Encrypted: i=1; AJvYcCWXpoGIjYrtTEc1GyZjKDC/5b0Y8aHgThP1lYpn/B6eF+xnKqKMAkgD9t0NF9vgBptgnFf0iFm0gTCBsxk4@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr2iQf/XbMgmWd7nRJxOcOjSczcwS/97bL78LEK3rQqFuNjR7b
	U48MwV+rUp1/GsXNEog9yR17KdBA4WLBKcG70YOmYU/k2lsqdhDKTS0J
X-Gm-Gg: ASbGnct6sjftvISU8VhC4/t436sM5Zk2Nri94RWyBw+oijvyg8Q2xDrFxyQg9zE2sGz
	4lTXEh4ghoF4mtylNL72Qfx+JAUnzbt93b5QojuVhEfzfSQV4DRO7NOfgxDYYGSwsJubztPXpsn
	0/MXQQqavW/ghWdcFrmIJ9uEsDgaEy4H4xp5PQAGRoowNr8qxGKO0UGo+TyE59v41kZeQCLAG+f
	82FWaMqwYejSpaZ+5hicWWsOpJZUK8KXP56hqzQui50ATfLmsLowAhI0r3k4EkjsK4g9wMuSZDN
	Sdj/sYuhbmmErgfsRjYfG/VPRXQZhGjqcfRULoDjA6pJ8rXFDpe4279xltbma4kVJNyfCmHAZ9+
	leyg2L0wW6pwMTBCFHRXs
X-Google-Smtp-Source: AGHT+IF9JwLpR1JPS1Ju0IJ8Bt8BrxT04aZO/d6OuQjLQr1C7i8RtgkGdUSbXUCIePYULDMObludzQ==
X-Received: by 2002:a05:600c:8b63:b0:456:475b:7af6 with SMTP id 5b1f17b1804b1-45892b931ecmr101032855e9.7.1754064058758;
        Fri, 01 Aug 2025 09:00:58 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c4534b3sm6249748f8f.47.2025.08.01.09.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 09:00:58 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: atomisp: Fix incorrect snprintf format specifiers for signed integers
Date: Fri,  1 Aug 2025 17:00:23 +0100
Message-ID: <20250801160023.2434130-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are incorrect %u format specifiers being used to for signed integers,
fix this by using %d instead.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
index bda35614c862..0f0d16f4ce7c 100644
--- a/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
+++ b/drivers/staging/media/atomisp/pci/runtime/bufq/src/bufq.c
@@ -497,7 +497,7 @@ void ia_css_bufq_dump_queue_info(void)
 	for (i = 0; i < SH_CSS_MAX_SP_THREADS; i++) {
 		for (j = 0; j < SH_CSS_MAX_NUM_QUEUES; j++) {
 			snprintf(prefix, BUFQ_DUMP_FILE_NAME_PREFIX_SIZE,
-				 "host2sp_buffer_queue[%u][%u]", i, j);
+				 "host2sp_buffer_queue[%d][%d]", i, j);
 			bufq_dump_queue_info(prefix,
 					     &css_queues.host2sp_buffer_queue_handles[i][j]);
 		}
@@ -505,7 +505,7 @@ void ia_css_bufq_dump_queue_info(void)
 
 	for (i = 0; i < SH_CSS_MAX_NUM_QUEUES; i++) {
 		snprintf(prefix, BUFQ_DUMP_FILE_NAME_PREFIX_SIZE,
-			 "sp2host_buffer_queue[%u]", i);
+			 "sp2host_buffer_queue[%d]", i);
 		bufq_dump_queue_info(prefix,
 				     &css_queues.sp2host_buffer_queue_handles[i]);
 	}
-- 
2.50.0

