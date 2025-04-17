Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812E01AA1C0
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849978; cv=none; b=HyNBKTlw2ldrk9prpcQQyolOifqXr3Xgu2l6z2vzAv9JJPxWfRDNf42GhFY4A+qwLaWmaBZnkNbbcY76P21nrGkKUJriSVX4H0oq8CTh82RrW/bOOsgDRKsqxXc0z6e0nEPqCnzCV9u5Izx4wUA1V4r8MwWxBuB0Hz/5fKiBjFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849978; c=relaxed/simple;
	bh=RSie0nXMjQWozJafxINypzZFt8eO2DZf7eBuhaP0m3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YVV+Oa4BnCvWMrGFnNa+fEu39JK1SCM7Xbe8VUCNaG8uokBRXUrVk2X2Rbw5ZCzJQPmJ7AxavnaQMZFk/fkPfWgR4GEVISCsXMiLrMa5x6i2cJJOCzyNrYdJBE0m/ztnjKY+GhxXi7fEut/qhtFBkU6ivtd4G46z1apJI0+sS1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=epOgHLso; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="epOgHLso"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227cf12df27so2013795ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849976; x=1745454776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KbTAU01u2d1Fyhrvlbrvk8qe32/1uE4Mm7IabxHd+o=;
        b=epOgHLsovxSnpG5+4OgHvxNY0twe634EqCHoTXYo7OdZffk3PhWxUyvb9cpQpCGgyn
         o3izsjdhYGBRfGV/qNgRgYMG1fx8DcZKGaDeNOzmbs69F/e2wKKVMqu8CBEP+K+nOi4s
         0BnDe9O5tF9Q39AnvIzOos4ff7nHzelqwtg24ykqLxlYLiLz27dDDYab9zuEE4JiYGDL
         5xvmQcHDn6/kotGPocHMCIOSw1sgRzXJdv6hx2R+BJ9KwsAvY4UKx1AuRTALy+u1oWa4
         IM9Zxnm35vZXyPQqBjuGaJQKNOL/GyBBSzrSxCwUNcxsa75k0x5YXRUZ9lz+ufgCwimc
         ozQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849976; x=1745454776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4KbTAU01u2d1Fyhrvlbrvk8qe32/1uE4Mm7IabxHd+o=;
        b=DFwF0iUXbtrA+OFWnwNAmkKKDxMGSOdSN2JHm+LhxUzgA3Y7mt1mZ62p+POZglLR+M
         QXr6LguRu6BuHMtuIMQJpiWVDi4wUF/UKHjjlfAK1KZuapTNq/NpkK45t5jpmR/EMwhp
         28GCx611swoA2bJv47o5PpVGDUYMkQPCRHhCbeNWFdzEw8+48qa1lD50LMtwaOiyG+pp
         cDTuGbnWGK+xV/TEH9ibVw8ylRFOqZ7NZEml0bmzeMHFQ3bRwRW6lIyilH86zQIPi7ul
         G+MLDcaUS8RJlK79cmkDu03k218lhGgDe0bVumt4Ubgo6zI5UJoBobOhfZnFt2idRmAn
         WSiA==
X-Gm-Message-State: AOJu0YwV71KxK4aX4wVrGM8CnwqhkKotaO13ajq73QRU34rT30rxQB7N
	EYdUuCet0vu0+ed999Cs4fVaw/P8C5FMok5nvgVXzQGdnlCrau7zf4IVIxgLRA==
X-Gm-Gg: ASbGnct7crfUIy29aZxckKUpn4vrUaC/7I0sHpHdCUHKFc7Qmr7KKRD44kAdhqTqUYQ
	qRTnCRhz3+QAL9MVG/diyKh+N3Nbhcxju2YDDN1oGee3r1QWSW8FtsFJLtAKBnPb75WC9BR//8b
	wMtGihXSZeaOZ6/vl0UEJGvj1XqGJhvgSkD30wCC/wam26E+Tx8MWCG4JIEsEhr5ZKcXv9J7f7a
	/i0ewWMy3SyYTphlDrBztuqOOQ3K6TLBKR0DtU3M6FgKs5pmWaNPWUdOSsE82yTTacIZcuEvG47
	HXl0+zDcaPb9yszTchNyIJRxygH5ICkhplRW1yvFf3R7b+x9z9nGnO6iTCaBvGU+p7u6AcJUQcX
	kHiLjUQ==
X-Google-Smtp-Source: AGHT+IEcWsjwkmEqreAgK2pRvl/J7AlkiLFzOj18jVxrfcqpZ/SNiQIRA61+XUt96JpZw8TvxC8aAQ==
X-Received: by 2002:a17:903:1aa4:b0:223:3eed:f680 with SMTP id d9443c01a7336-22c41a3f4d3mr12051875ad.18.1744849975707;
        Wed, 16 Apr 2025 17:32:55 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220cb76fsm1564843a12.30.2025.04.16.17.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:32:55 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 06/18] staging: gpib: common: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:34 +0000
Message-ID: <20250417003246.84445-7-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
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
 drivers/staging/gpib/common/gpib_os.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index 029590f95fd3..87329d35ca47 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -2038,7 +2038,7 @@ void init_gpib_descriptor(struct gpib_descriptor *desc)
 	atomic_set(&desc->io_in_progress, 0);
 }
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *provider_module)
+int gpib_register_driver(struct gpib_interface *interface, struct module *provider_module)
 {
 	struct gpib_interface_list *entry;
 
@@ -2054,7 +2054,7 @@ int gpib_register_driver(gpib_interface_t *interface, struct module *provider_mo
 }
 EXPORT_SYMBOL(gpib_register_driver);
 
-void gpib_unregister_driver(gpib_interface_t *interface)
+void gpib_unregister_driver(struct gpib_interface *interface)
 {
 	int i;
 	struct list_head *list_ptr;
-- 
2.43.0

