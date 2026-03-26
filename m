Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7372B3A16A2
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560907; cv=none; b=khRZn2/9h56lA6Zp9tC5gnr0jaOw7ZdEwVpg7Lc/1S8QuYjLPEXakG6g94GLfLbU4oD7QBZ9XrWAtMfFVt0lG5SHAzAQ913TamwRQ300EtLJrNwWE5PT1aZ3OXvDUDS+Tpm9HJKwaDL7SN+QLeVYj7LFXItEi/X2dKqOjDO6XOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560907; c=relaxed/simple;
	bh=wsgHtGMsL0z+O6CPRZuHTu3FEglSadQqIuS8210B1hE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W9HcKfAY3G6/3XMvn1OEO5gpmluj7X7gmV4M64nasS2/14EKr8lj5CRlAzAELnurtvbjxi8MAA2xRCOw4sehMEKvdaoJIM7PyK7oEMeB6cX/hKR4uRYfLlxjP98lN5hp0H6claGBbw1BFHlW81xJ+c7qw/C3rY+eeDVYbRnNE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWn82jT5; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWn82jT5"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so18095245e9.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 14:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774560903; x=1775165703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8VUbdY2qRvrHENEWIeYirIdqjJOGNjoUNh/2XerUPo=;
        b=AWn82jT5FYJBuh3garKGaGU9EdPzpGdV3RGMAHKFbjtG41J63jq/gaffF4ZTSrrGCj
         Ppi+z4EGrWh17Os7495UTk9yANaWddH6Pf3rsaHC1JXVfh8BtjC5aqu8ttAZftn5tMwt
         KikX9luWA4pq2bplok52LreDp0kmM1wEXtkPWfmwCQQpu5N/f10Jy5LNLAqn/E7vfwD9
         G7HuQumIebMVxwt0Qg1Zja7pgYpdIzgFUMPxShcifyO5JBJtwYYau3QKgJXhE10xZE3m
         omhFoPfffS2tNm0nndOGt/Wm8IyXUGQun+OQ3yNwxrLqgQWtbyhbFcBsuFzBbvnNaN7r
         NTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560903; x=1775165703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E8VUbdY2qRvrHENEWIeYirIdqjJOGNjoUNh/2XerUPo=;
        b=aIlZmCmp3abEKQTfH8ADkwjqlChuQ13L8x+9+oskFCSbcz19keQBqEUwTMqEpuPi7E
         ric38bW9cu6R8Ei85bECHyWm69r4i7QEDcUdlUrN0oFp73b90cwjuPwvLlCHDzy0qucg
         iLFBqlGvMExp0rSxhfN5Pycu78sHXlxvbYF2FOiFsZT+tg1Is/akIsd3s6rwZVJ5RuXX
         cPGs72Y6rq8EPxqCLGHV+9/FKBFF4yOVp1sczlKEPkfla4FXuwR8eKu5/5rUrBBTdREL
         P6CDPg2LZ6v10jJpYkQms1njNGvLiGJ9dmdtCIxliSr9VSg9TTscKc+dkEnleosrZkOy
         DYxQ==
X-Gm-Message-State: AOJu0YyDCQMg38miZf3+y+AYe3vSPVFkBtG78UfQeuZn/gezHpvda/1x
	29is2wRi7Q7cn+XoYduNyXcUPmMIWD4Bgk7+cl7eqWS58vjnqFfBSoHxcp2ccbMF
X-Gm-Gg: ATEYQzwWMcE6MoftSOOKIJ6EKXQEQvdffWhdfXVsjBTQx0KOVI2QXnIldhP5aMw2lsP
	YBPPyagWRZ7EQiNIgDz8zt5fieK59VV1ReMu29uAufPqOW4kKGKuUgqUPldsvXVG/a3UDgTQ7AO
	F+FarBgJz8rpqBzE0ZuYeVOik4uxpBLJLlf70VSg1V8YeiA+WH1JmTTTt7aP99Ol8pg9+e4NSFh
	vUEtHLFzlxN2brixaeh6X5pMFPdva6KdD2popcC7XpBCA/TdF6HCYKji2Pw580lsOVluGmk2u5H
	20c8n/EHSM6ldSSDFnMI5FOvUSA8fVKmpqevDE4M/6Plr+RglAwibY7v14Qwxg6/ICm5tuHvXcF
	0klhk0wp49SBF2gtGPuULKxsCivyrVRWIarw64RMjjE15+dLoqLDzPQIWWZ2rmq4UZripD/SmCc
	JDnnHsSdhTACBpCMzUkXXmgrgZ0nHFUQvi/kvwlzEhnYnxdw==
X-Received: by 2002:a05:600c:4ed3:b0:487:2b7:18d1 with SMTP id 5b1f17b1804b1-48727f0eb50mr3476355e9.33.1774560902310;
        Thu, 26 Mar 2026 14:35:02 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1855:4ab5:5c9b:17ff:fe26:9b2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c7cec3sm51106825e9.6.2026.03.26.14.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 14:35:02 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: media: atomisp: fix loop shadowing in ia_css_stream_destroy()
Date: Thu, 26 Mar 2026 22:34:07 +0100
Message-ID: <20260326213442.876745-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326213442.876745-1-azpijr@gmail.com>
References: <20260326213442.876745-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nested loop inside the IS_ISP2401 block incorrectly uses the same
variable 'i' as the outer loop. This shadows the outer loop variable
and causes premature termination or skipped array elements.

Change the inner loop to use a new variable 'j' to prevent this.

Fixes: 113401c67386 ("media: atomisp: sh_css: Removed #ifdef ISP2401 to make code generic")
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..8d8b82dc59f1 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -8192,7 +8192,7 @@ ia_css_stream_create(const struct ia_css_stream_config *stream_config,
 int
 ia_css_stream_destroy(struct ia_css_stream *stream)
 {
-	int i;
+	int i, j;
 	int err = 0;
 
 	IA_CSS_ENTER_PRIVATE("stream = %p", stream);
@@ -8223,10 +8223,10 @@ ia_css_stream_destroy(struct ia_css_stream *stream)
 					sp_pipeline_input_terminal =
 						&sh_css_sp_group.pipe_io[sp_thread_id].input;
 
-					for (i = 0; i < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; i++) {
+					for (j = 0; j < IA_CSS_STREAM_MAX_ISYS_STREAM_PER_CH; j++) {
 						ia_css_isys_stream_h isys_stream =
-							&sp_pipeline_input_terminal->context.virtual_input_system_stream[i];
-						if (stream->config.isys_config[i].valid && isys_stream->valid)
+							&sp_pipeline_input_terminal->context.virtual_input_system_stream[j];
+						if (stream->config.isys_config[j].valid && isys_stream->valid)
 							ia_css_isys_stream_destroy(isys_stream);
 					}
 				}
-- 
2.53.0

