Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14733211A
	for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 22:32:29 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso4239512wma.1
        for <linux-staging@lists.linux.dev>; Thu, 13 Oct 2022 15:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cmLu5/VoD+O0UJu6VoLDdnrtTxKovAe8n1SjzXtC2Xs=;
        b=b7DBr9u1eaqWEAbv5Qbg/QNyboll+gHJXOnlDd/6Sb8TT8U/oXq177K6ef9HL9aVG5
         BHgyrWvnsWEi8CyoZp/n26mA4xSHw+GJEPPTlRnMC4tSuGw9fbTn78ZiOaAr1abfApHR
         zHaGplBXSq2rjsdJ9dCMEhdVT70dXV+6peKRPS8dConrKaRvWemUfWGUOHFwFN+wZ4jx
         6T9Nhf871eCwS5xD//AJxcL8R5yb5bWGtVu30oShYxJPVdiqzd8EsKWRN9tKMnMLDZ42
         IGelHqUbnJA2+bK7zHhRlAew2xZDRAZWc4VvwGyDNJOEhY4ujRO7Ss2SHwdbk0DAXpiU
         Z1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmLu5/VoD+O0UJu6VoLDdnrtTxKovAe8n1SjzXtC2Xs=;
        b=4BkyI7jMJOptigreVHLcqzoBm26PfQaO0MzzXoCE1CzIDjcxCjpQIFNRw30WG0LvUu
         ZUnSaKZEVxAOHP3hKQ/EBG+ZkuJ3Fv2DFWaaKhSgqM+SS8qC0+LRZ7Q44M5Dl9LNhCee
         YKkDz9Tz7FhRZMGHru/xvQ1iILBPywGYU+6e1fJ8UsMIFCWAsQwrg8WDRhuvcgAm/Evc
         hLtZrX6prioDBDt+iaQd+uUvzawhs2x5HCBpzF6mJjd1L4tZrm2Wg5onrToJEqBuhUIL
         8TPpu7bThGQhsI0ECedxPYAmd3AVcfGqqqeHqglzl/OZq2ccwM9KHITzPx279f9ppUOv
         KfqA==
X-Gm-Message-State: ACrzQf29+7JKcRkLyUH4moaxJfAlesfeAmsa41XkkdAILQx0JLYaPAk1
	wYsRMzkJTPKRA2dT5hSYl9w=
X-Google-Smtp-Source: AMsMyM77thVePWoPhfex4il6b5GCYPnvQuwIdmlHmgZi42gv3PuduqSo5xmO3eAT9zGfb65CVQdWVg==
X-Received: by 2002:a05:600c:19ce:b0:3b9:c36f:f9e2 with SMTP id u14-20020a05600c19ce00b003b9c36ff9e2mr1394145wmq.110.1665700348341;
        Thu, 13 Oct 2022 15:32:28 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id j28-20020a5d6e5c000000b0022cd27bc8c1sm726789wrz.9.2022.10.13.15.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 15:32:27 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: Fix spelling mistake "mis-match" -> "mismatch"
Date: Thu, 13 Oct 2022 23:32:27 +0100
Message-Id: <20221013223227.129440-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are a few spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index c72d0e344671..90f25cc22227 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -3288,7 +3288,7 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 	if (!IS_ISP2401) {
 		if (sizeof(*cur) != sizeof(coefs->grid) ||
 		    memcmp(&coefs->grid, cur, sizeof(coefs->grid))) {
-			dev_err(asd->isp->dev, "dvs grid mis-match!\n");
+			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 			/* If the grid info in the argument differs from the current
 			grid info, we tell the caller to reset the grid size and
 			try again. */
@@ -3344,7 +3344,7 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
-			dev_err(asd->isp->dev, "dvs grid mis-match!\n");
+			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 			/* If the grid info in the argument differs from the current
 			grid info, we tell the caller to reset the grid size and
 			try again. */
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index fdc05548d972..b36cbde7036a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3180,7 +3180,7 @@ static int atomisp_compare_dvs_grid(struct atomisp_sub_device *asd,
 	}
 
 	if (sizeof(*cur) != sizeof(*atomgrid)) {
-		dev_err(asd->isp->dev, "dvs grid mis-match!\n");
+		dev_err(asd->isp->dev, "dvs grid mismatch!\n");
 		return -EINVAL;
 	}
 
-- 
2.37.3

