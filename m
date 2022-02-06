Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B442F23
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 18:58:58 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id s18so21191064wrv.7
        for <linux-staging@lists.linux.dev>; Sun, 06 Feb 2022 10:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D1XGDo7HWBYqlIqWiIbQqMrJ0Zd1l02kRDCl5/xbN/E=;
        b=Kdm5D/r38tPmeacBocAQqjmMHMH/diSFSp5O4m8liTUwABbg5i2BPMEfqPIcAlsamz
         yypWEbbga1Hbh92mHAN7DcHS4sDoAyuRcD6L5yP0krVJq0+Klwyysh5sStL1wG+mNAwT
         HTwk9kQRguKlaAqfGQ53B+diRmwiiOVSRLzG0vcVBgBz6PTvI4g6oIrlXjKVvNXpCsn0
         zRqPVyoPzp/dsNeyoDAInBt+1D8KkpCNJVpr7OK1T4eCBRN9ZOuqFiQ/zKPvkzrDIomM
         jjnAvAh4D3OFnJj9aYEGtZB8BgvA7bFXpONQwpRoXj2nFBJhyPIhp5UZTNMl60iudCF6
         7bZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D1XGDo7HWBYqlIqWiIbQqMrJ0Zd1l02kRDCl5/xbN/E=;
        b=mrxkDWh7avXfg3H9+bQ4j8zjPZsgnHLnUTqJwHIb+fvmLlu1MiTFNWknVaOfwsccFw
         /EIYtfrDSZxv6lZwVZXo/oV+B508xSPbUF3QhWXQ5HcDSi7AXcXsmvKnz1BLuyAvacNR
         NmDlzTjg6oYDOthOcw+XyBDHgfj7idsf16wsXutaUYhDjf5si4MZ2UQgnJ44Wq2fRoqS
         gN2OZA1IPsce4k3QivI7ZhahAOLmRIwk8pHEVJQ7dHodIg9pAVtPH/9/wIg9BZXnG4fX
         Yomj9Di/zuZN40nrHFwVaOMwG8ICWTiPjO31MlAa0nZSXKDJ0h4IRdnt1hgt0TrCGgzO
         ulaw==
X-Gm-Message-State: AOAM530TK+jNlUFHsOeOXqTjVpZ0IlHXJ6+s7h0z7et4XTo5XfdxC8g4
	iEP1rC1qbrV90AzfhxiLFbs=
X-Google-Smtp-Source: ABdhPJwwbd5/AolYOzqZ6pAHSDpsUDxjmIcqRaDKWBU+u9WWNliS9a0giPbbPdTKY/wg40OAQ1ev9Q==
X-Received: by 2002:a05:6000:1144:: with SMTP id d4mr2580636wrx.716.1644173936560;
        Sun, 06 Feb 2022 10:58:56 -0800 (PST)
Received: from localhost.localdomain ([141.72.243.13])
        by smtp.gmail.com with ESMTPSA id j5sm7498008wrq.31.2022.02.06.10.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 10:58:56 -0800 (PST)
From: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
To: mosescb.dev@gmail.com
Cc: andriy.shevchenko@linux.intel.com,
	gregkh@linuxfoundation.org,
	joe@perches.com,
	kitakar@gmail.com,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	tomi.valkeinen@ideasonboard.com,
	dan.carpenter@oracle.com
Subject: [PATCH] staging: media: atomisp: Use GENMASK instead of manual masking
Date: Sun,  6 Feb 2022 19:58:30 +0100
Message-Id: <20220206185830.39360-1-mosescb.dev@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a GENMASK macro available in linux/bits.h, for masking.

Example: GENMASK(3, 0) = 0b00001111 (same as (1 << 4) - 1)

Signed-off-by: Moses Christopher Bollavarapu <mosescb.dev@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 1173be0e72b0..a345fa1d7de9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -40,6 +40,7 @@
 
 #include <linux/io.h>
 #include <linux/pm_runtime.h>
+#include <linux/bits.h>
 
 /* Assume max number of ACC stages */
 #define MAX_ACC_STAGES	20
@@ -1913,11 +1914,11 @@ void atomisp_css_input_set_mode(struct atomisp_sub_device *asd,
 			    &asd->stream_env[ATOMISP_INPUT_STREAM_GENERAL].stream_config;
 		s_config->mode = IA_CSS_INPUT_MODE_TPG;
 		s_config->source.tpg.mode = IA_CSS_TPG_MODE_CHECKERBOARD;
-		s_config->source.tpg.x_mask = (1 << 4) - 1;
+		s_config->source.tpg.x_mask = GENMASK(3, 0);
 		s_config->source.tpg.x_delta = -2;
-		s_config->source.tpg.y_mask = (1 << 4) - 1;
+		s_config->source.tpg.y_mask = GENMASK(3, 0);
 		s_config->source.tpg.y_delta = 3;
-		s_config->source.tpg.xy_mask = (1 << 8) - 1;
+		s_config->source.tpg.xy_mask = GENMASK(7, 0);
 		return;
 	}
 
-- 
2.30.2

