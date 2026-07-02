Received: from mail-lr2-f2.google.com (mail-lr2-f2.google.com [74.125.230.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7CA4ADDAA
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 13:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000585; cv=none; b=bPnrVKPm5HUX5dnVwOxPS59DnOmMFjM2zpN4YedEgDvmWHe7oaak1w3kKduowuor6Xw4EauX29v8yOxSPccL72xxjePjm2WQHED45P4vBYsHK6XoSMhilagDqYhT+5muQKXNtHV5zSOGwOsWOpmaxtB5Xmt+mQSoA3njoeqKKfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000585; c=relaxed/simple;
	bh=BfrxHYuUlb5DTUkfLTDPjkNjucBPhZj68vtPs+di8C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7uFZVeTAjMexRVcc16iu6jBT+G903oPF9gBFHWO+E8/EpGnMh0J6rQ5NKskmFpEyVmKqXNIT5u/EaupJa/0igMTC6TKaZIXFgIVvZY51PvvnPn3wnqrlfHEwFW5A+VwF3KpqiNKl86UPb0s12d0INfbg8LSxXGA3IRAJGXKBXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLouY1Cd; arc=none smtp.client-ip=74.125.230.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLouY1Cd"
Received: by mail-lr2-f2.google.com with SMTP id 38308e7fff4ca-39b430545e3so1171901fa.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 06:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783000582; x=1783605382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9TmNXT3Wq8aMPD04wKa9UiOCYJMfbSBZuVN/NXn9rA=;
        b=QLouY1CdcLKIAOErYxCsyum0IoNfR4Aa49c3jaaa+gx1yA5eBsoUGhf+FnMxwjgCs9
         H5G/cnkz/peBEvdiDJ0m5SvqJFliYXfA1mnfb0jtGgqjkqz1OIFySFpBiup5LBHRah/d
         hRENYugzkJhR7ZugQxpIMQZtHVf9jUMe2zgbNqJePTGenEhKKZmpFIuiGbG1msQ7O3Z5
         pcw6ZaNhDU6sUrk7W5F7ULg5SuSoodKEQYCMloTdg2hcYbP8g1OLY3S5e3wQNCKHR05x
         Olo8YZH5tSg4NCcgiy4tlKyl3WkdBEWsfcOhmCK5jIupebohv/AYBWzLpUrbjMiWxd97
         tjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000582; x=1783605382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y9TmNXT3Wq8aMPD04wKa9UiOCYJMfbSBZuVN/NXn9rA=;
        b=SMmLpjNkpPYEmygToNhziOB7cnx2x7+33y3yxtH1fMdqQvesKNIssXH4m8+i2MMKeM
         JJeBKBZhL3BEFfMN7/oBmZ2g2Lri2wsRMHXCeEA6uxp0Pj4FiBr5ozxS9vzC/TqEGy/T
         ziMLCHfpaJekQ0aWrO1/ja7R+u+UNMjhb5aafRJSbDOvDfDwB2nvTNVlk56q/FFrGDQj
         io8A29FVLwrL4Me3jmp61BECaBdhLnSrfqmt9a9IRf1Hfh/UA77ZzVnuyHfiEV/ya7zH
         FcNeRnNLMtf6F6VYUEQ6Yw+QUMj71RSyGDIHFARawPJAxI6qaZsYX4fT/hGEkj/lhJFX
         8zag==
X-Forwarded-Encrypted: i=1; AHgh+RoURlMBx5o3DQJZbGS9agOtGwA/ShRh3slvk1DlAq7PK+/2JZBFsttOw8WaOP8lyyqgU3k6nDGsvTZJMmvH@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/p1cqH3A6Bg/Ipwxu3YpvVWWkisqGmTmifUWLIYpd2IwNvFZb
	cU52xav+gjGLETtIznPv2TgdtYzr1viMY6yKVAoE9nNzW0AFQ6OQkeRedgsQT+1qTRo=
X-Gm-Gg: AfdE7ck7jRPeO15TrqzZY6V0thQzLQoCBRs6k8OhUxcgnMW3D19IXO1eyfHZyVM4HW9
	nKMndxOGvwjf3o2+izzHAtt0Idz8+Fvv/LunFBaVIJ1N+9BQVhR2d3Da65tunzAXUltkZzmLQZb
	yetO6gUz4dlFuVhgmETcp/0fw2wKS1OSITzCot7AZ14QykEbZlSK659yCqUWh9Oo61loS1lG4d3
	L4yS762hp8s1uuzf6RmCvR7HdNv5bebmzSFaXZczHP//3qBtSAskyeRvHhoM532w4fZ6Jy3OaNf
	pjJYvuSBaTFdJY3HIUZ8FVs4qmnDRFk8eCjJQUi09Yk5b1oJ+3PfXaJyPbZqNnrKvDTVG/JF6fe
	SMksOV5RJuRBl7TNBcDL3hYsbswat1683/G1mau+Cc56vjsUHFw8g95fXXc2ibiYd4sZc250UPo
	BDvd15mFr0
X-Received: by 2002:a05:6512:1194:b0:5ad:6989:ab36 with SMTP id 2adb3069b0e04-5aec8005b33mr1591640e87.29.1783000581724;
        Thu, 02 Jul 2026 06:56:21 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89919bcsm720820e87.11.2026.07.02.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:56:20 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH 3/3] media: atomisp: fix block comment formatting in ia_css_timer.h
Date: Thu,  2 Jul 2026 16:52:30 +0300
Message-ID: <20260702135230.19030-4-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702135230.19030-1-bohdandmarcus@gmail.com>
References: <20260702135230.19030-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix block comment formatting issues reported by checkpatch.pl
in ia_css_timer.h by ensuring block comments use '*' on subsequent
lines and aligning them properly to conform to the Linux kernel
coding style guidelines. Also, remove misplaced Kernel-doc tags
from macro definitions and correct function signature formatting.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 .../staging/media/atomisp/pci/ia_css_timer.h  | 49 +++++++++++--------
 1 file changed, 28 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_timer.h b/drivers/staging/media/atomisp/pci/ia_css_timer.h
index da752834adf4..2e555b39bc25 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_timer.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_timer.h
@@ -1,23 +1,28 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /**
-Support for Intel Camera Imaging ISP subsystem.
-Copyright (c) 2010 - 2015, Intel Corporation.
-
-*/
+ * Support for Intel Camera Imaging ISP subsystem.
+ * Copyright (c) 2010 - 2015, Intel Corporation.
+ */
 
 #ifndef __IA_CSS_TIMER_H
 #define __IA_CSS_TIMER_H
 
-/* @file
+/*
+ * @file
  * Timer interface definitions
  */
-#include <type_support.h>		/* for uint32_t */
+#include <type_support.h>       /* for uint32_t */
 #include "ia_css_err.h"
 
-/* @brief timer reading definition */
+/*
+ * @brief timer reading definition
+ */
 typedef u32 clock_value_t;
 
-/* @brief 32 bit clock tick,(timestamp based on timer-value of CSS-internal timer)*/
+/*
+ * @brief 32 bit clock tick, (timestamp based on timer-value of
+ * CSS-internal timer)
+ */
 struct ia_css_clock_tick {
 	clock_value_t ticks; /** measured time in ticks.*/
 };
@@ -38,24 +43,26 @@ enum ia_css_tm_event {
 
 /* @brief code measurement common struct */
 struct ia_css_time_meas {
-	clock_value_t	start_timer_value;	/** measured time in ticks */
-	clock_value_t	end_timer_value;	/** measured time in ticks */
+	clock_value_t   start_timer_value;  /** measured time in ticks */
+	clock_value_t   end_timer_value;    /** measured time in ticks */
 };
 
-/**@brief SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT checks to ensure correct alignment for struct ia_css_clock_tick. */
+/*
+ * SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT checks to ensure correct
+ * alignment for struct ia_css_clock_tick.
+ */
 #define SIZE_OF_IA_CSS_CLOCK_TICK_STRUCT sizeof(clock_value_t)
-/* @brief checks to ensure correct alignment for ia_css_time_meas. */
+
+/* checks to ensure correct alignment for ia_css_time_meas. */
 #define SIZE_OF_IA_CSS_TIME_MEAS_STRUCT (sizeof(clock_value_t) \
 					+ sizeof(clock_value_t))
 
-/* @brief API to fetch timer count directly
-*
-* @param curr_ts [out] measured count value
-* @return 0 if success
-*
-*/
-int
-ia_css_timer_get_current_tick(
-    struct ia_css_clock_tick *curr_ts);
+/*
+ * @brief API to fetch timer count directly
+ *
+ * @param curr_ts [out] measured count value
+ * @return 0 if success
+ */
+int ia_css_timer_get_current_tick(struct ia_css_clock_tick *curr_ts);
 
 #endif  /* __IA_CSS_TIMER_H */
-- 
2.55.0

