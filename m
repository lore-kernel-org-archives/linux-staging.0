Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D68C1EB1AA
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 06:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997698; cv=none; b=i2orFfmP9LyFkTfaRO/8FH2Ow8/xdcZF+fFccSB5qM9/eWcpSWNZlbdqjV+zg6eW0gs3iywDtcJ+jgtk5Rn6y/04KmTIwul7LqXWeThe8hyV3AXzIXDaDW8U/NASFcsxaIeuxJAJOcqNZETHoHkPvmr/UdeSUql6SVEolOQSJE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997698; c=relaxed/simple;
	bh=VaK3fKqcOmXN3mYxwSRwH7hBWOIOKiIvaobLGWq1OHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bRrABTZ51s9/s8ITqziMxGt7eAmG0u1QI9uqEdy9hGo6mbTuVWksMnMPVeRKIpzxzmuvzvfE2spdBWAw6D9BoxAO4HYg/cv+uoiQs375SvaGNvKqfAyXgoI6gGal4ZQssduL6mHzqg9g1H+QxZl+CQUR9TEu5/Kot2LqUdpTGFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eWkDOv5Q; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eWkDOv5Q"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-47cba53479aso968475b6e.0
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 23:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778997695; x=1779602495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVCHuHOtEYmbunnuxniFzv+yhpYhRK5hiaxeyHyp0XY=;
        b=eWkDOv5QqrvKxsGxKXX8qfdD4nM6TWWSgEB5Q/PPvq4/Cx1aduoUxV9a+zQSHKdVmv
         7UUm5T52u37XJDv1H27DvLQqWy30/kQeRQb32wmvr58Ef1Iasqo3ruA/jBYxW66gZ+zD
         AD8jdD7g7ErJE79GFHS8xaADrSZahnuG8j7a3ykxh/9hXWuxuqTIQTlx6H1Dnd7N+RAe
         DjobKQ36tEUt79qv5UrFC2Q67GMuxsSvVXz7IP9iyVrlGu+hg6/NUypXqOqw2pcsKlxU
         Su7FBf5OHHnQfOPQTetC/Viblu7pl8L/ExMnY/reDJybm6c/R6XKKR9YVoY3GMh+7XcL
         EG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997695; x=1779602495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JVCHuHOtEYmbunnuxniFzv+yhpYhRK5hiaxeyHyp0XY=;
        b=TNlYRLvzBZqNkRU7ZPdiL6/BIgr4I0GOVPGZ8EAjEjkVyoN0w6Mb/JKD3Q52CMado7
         6tNch/oZ8aVt87kBaKJ+hhbbhmVXFAXvPrXVs6fT/CRwY+08BptTDrjg3LKzx/aILh5M
         6jJMwLgZn1Qg7VOrwd+O4Reyz9IJiq+D42VBBrrxLVa0bFAJiYpZKZ78JEs2/suFWHnS
         qK2S7c53/uAIgZdnv29CuvYbtGsvqHmlvOLqKD2IsDy5POBAfJ/sQXmyzIVYiQuzZU0/
         P/ilnfZOo6N+7ncviXn1qMee8gyW76KjFVCQM0Ia9ExpMJyZeGO1jd4p3YeP4pnlTZBQ
         /MJg==
X-Forwarded-Encrypted: i=1; AFNElJ/iD4e/FsUrOeBpKwRNt/1Ss964/cu1XgQgYdZUN08sbLsPGVHvHH9QBxUTfNkkJrqtNA7bhE6dCQXICkoD@lists.linux.dev
X-Gm-Message-State: AOJu0YwvYF3a40Lpo00Q+mYG8ZuU1l6fQtAgggFPsl7e9prUqr/zKevU
	XTUcQ9cpU7VA1BylqJ5rFU91NhCYda85TMJZotTtiovVrWJnhnfJtA6F
X-Gm-Gg: Acq92OEEhaYx8WHVzO1M+VNMkRtDmbqBrXzMiHapkqu2L2FgSGYuZQ8ZkYxsiUzVXDJ
	Xov2/Fb2tTHbROiWYNwScyi9iRzopQ49wr+4KTZozeXqlrndBujajVuW5Ks9wkm3S7uViWZ4Jhp
	PgAoRpGnBkvne4NF4d3Ky6Hst/deEeLMixgtysRL9NnaSOM8dDsGnb8RIKb9UyB70X8d1H8qnht
	OyU2LVQnJ4pf/0y/hRaPp7Q5YGL9RH8JL6W1QFAeZvk/bT04xJRZuWqHAFy2m519W+qwsLpudI2
	R/PFd5lEFeJaCThaBTuIJjISL+yCt1rF3H+bRGlGSPb+DHR1IvWzEsRlAvoCVPRR24Y66c80dZq
	W6Fp4pwEf9coTSYd722VnC7e5QOa2lbKFH0V27UQzUsV0DRhuOrIFOa7nJymAaTcDzaZGbpmP2/
	/nPhHIINt5JZlOXFwM6MJuLvE1ThFTBU1xn70ORVD78w==
X-Received: by 2002:a05:6808:67c1:b0:467:1880:ffc6 with SMTP id 5614622812f47-482e5760341mr7257824b6e.32.1778997695039;
        Sat, 16 May 2026 23:01:35 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:a314:9972:40f1:1f4d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-482ee5349a5sm3397433b6e.15.2026.05.16.23.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 23:01:34 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove redundant comparison to false
Date: Sun, 17 May 2026 00:01:19 -0600
Message-ID: <20260517060120.221278-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Repetitive comparisons to boolean values are error-prone and visually
noisy. Clean up the codebase by removing the explicit '== false' check
and utilizing the logical negation operator instead.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_params.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
index fcebace11..bcd84efd3 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_params.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
@@ -1466,7 +1466,7 @@ sh_css_set_morph_table(struct ia_css_isp_parameters *params,
 	IA_CSS_ENTER_PRIVATE("table=%p", table);
 
 	assert(params);
-	if (table->enable == false)
+	if (!table->enable)
 		table = NULL;
 	params->morph_table = table;
 	params->morph_table_changed = true;
-- 
2.43.0

