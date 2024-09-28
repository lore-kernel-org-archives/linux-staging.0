Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281AA1E519
	for <linux-staging@lists.linux.dev>; Sat, 28 Sep 2024 17:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727544254; cv=none; b=U9xpau4gPPIWAT6qIZV/JaWQj/jA5a3wkIihah0qM0j1UzruTtpVzEvLVnnaX/lusiXupBuNOk5VV8/i/6y3CZ19dcacZDad+AdCy92qzbUEKsPcwG4501VWRNEjzZBui6ay4h/T8/YknNhvYi06GdeCeLDR3Tbhm87fnU4KEHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727544254; c=relaxed/simple;
	bh=qlD4hAYezzRfMJSVTKMvcaprQkVTpNx1pCXkIvcQKXo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yqz71JQchlSoQ47VvzIjp0pkkKsCdrTmi9zui9uT7VhFr9egvjc+usE+ut09y7UMaHy0JIn/I6FRljmh1b2/LhDEzgaGAcCyCHMvebtDoOkuamcwpXBlqMS00Tgu4ETikR7zkvRRFqW5aMMoisbSB8fEygClSAIF+4zTZqOMIFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QwWP681U; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QwWP681U"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a99e4417c3so271970585a.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Sep 2024 10:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727544251; x=1728149051; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YFbHhEntad0YRkHRniEw4Op6jqg3FVPKb/3C0+dPTjk=;
        b=QwWP681U8DAj5yokvVWSTN8CvC1NPhFOH6nXl1paJ9wxITlp+ppDxsF2vqcmciYm4I
         005OGYNfdDn+4AQqaah80fL896HSycmGBny7DA/lb+414woXeDqkTHJnx7I38yOT4Cb9
         fPo3Fut/B1ESCcH5XPiLP6m6sj71U1K62P2Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727544251; x=1728149051;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YFbHhEntad0YRkHRniEw4Op6jqg3FVPKb/3C0+dPTjk=;
        b=Qf88BQSwIserBc61kDzvHW61wox4GawvlycAFgClj7CX+UhvUBdmnBKtrz6c5x58Lr
         tHQLK278OMcuTJa+UtqeJ+I/zpdbtNYT6WLuZb4RX6fXwPD0WpEMQEnqcOJXDnJgev5A
         osAj6qj5wbqJ8L9iz0elCqZZUBZ60YYvfBq0pMCb6LUK5xblm7UC+g88U2Br1uGo1euY
         96oR8uFQXLm13YhDGINGEMB/mPmcurWMx5XU3VgcaYBTy2rpdanpOHJU3XYhnUw3k6hl
         q60u3+sQydIgxs1tI1A1EzVM5nfxKOIpS+k6p7HgpDrGV/gWD1Zt66AdRi3Kd3dU9V0w
         5FUg==
X-Forwarded-Encrypted: i=1; AJvYcCWY3twduK8dnM3ty/PuBDFpXW65egkXO9XaCaplqxMe+gz+gh7CVYtx7fULLbFGK5pnr/1zJ2j+gwwAqvNR@lists.linux.dev
X-Gm-Message-State: AOJu0Yzugb1n6gQm+OS7ebYxK7bI8akWwyVX1CiYARIGBvS8VOCKQe6m
	+4EDex9NaJ4oaILbaxdgiRXHIMjXtCtvQE7uiuMwX64yAhZDmaBa+9h3P9PTPg==
X-Google-Smtp-Source: AGHT+IH5Q56DnLabPE84rAsJDRreZzkbe2cLbv9f5se3Te8mZWhOiHBZCEcJotjViuL7j8ic39Ib3g==
X-Received: by 2002:ad4:4d03:0:b0:6cb:3da9:b8ac with SMTP id 6a1803df08f44-6cb3da9bbd0mr78224976d6.3.1727544251157;
        Sat, 28 Sep 2024 10:24:11 -0700 (PDT)
Received: from denia.c.googlers.com (76.224.245.35.bc.googleusercontent.com. [35.245.224.76])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b68311dsm21437756d6.122.2024.09.28.10.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Sep 2024 10:24:09 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 0/3] media: static-analyzers: Fix 6.12-rc1 cocci
 warnings
Date: Sat, 28 Sep 2024 17:23:57 +0000
Message-Id: <20240928-cocci-6-12-v3-0-53fc5ed20be0@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK07+GYC/3WMyw6CMBAAf4X07Bq2lEc9+R/GQ9lW2APUtNpoC
 P9u4Wj0OJPMLCK6wC6KU7GI4BJH9nOG6lAIGs08OGCbWchSqlLLFsgTMTSAEhTVLfbUOW2tyME
 9uBu/9tnlmnnk+PDhvb8TbvbnJiGUYCrsrHKNQW3PNAY/8XM6+jCI7ZTk/1rmGqkxVleoa91/1
 eu6fgAO4B8b5QAAAA==
To: Benoit Parrot <bparrot@ti.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

This patchset introduces fixes for all the new warnings introduced in
Linux 6.12-rc1

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v3: Thanks Andy and Hans
- Fix patch description
- Fix build error :S
- Link to v2: https://lore.kernel.org/r/20240927-cocci-6-12-v2-0-1c6ad931959b@chromium.org

Changes in v2: Thanks Andy and Hans
- Replace max with if
- Fix style in subject
- Link to v1: https://lore.kernel.org/r/20240927-cocci-6-12-v1-0-a318d4e6a19d@chromium.org

---
Ricardo Ribalda (3):
      media: ti: cal: Use str_up_down()
      staging: media: ipu3: Use str_down_up()
      media: atomisp: Replace ternary operator with if

 drivers/media/platform/ti/cal/cal-camerarx.c    | 2 +-
 drivers/staging/media/atomisp/pci/sh_css_frac.h | 6 ++++--
 drivers/staging/media/ipu3/ipu3-css.c           | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)
---
base-commit: 075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
change-id: 20240927-cocci-6-12-4c571bc8e9dd

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

