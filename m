Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A078BEC
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmfzpK3H"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cd68a0de49so1849545a12.2
        for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 00:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703320325; x=1703925125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltOi6r7fK9bfySPLwaQJXbTwu4MoVyIkyF1mw73/wow=;
        b=WmfzpK3HSuPcWxu+BXUJtGfFGTpk+LiB1QO55Fn5F5+6kSgAYwlf33OT+EOvPFnNi8
         iBPAOoUvjIlcWVSps93NR5UbopxlAZfJRar1j88txQUvEWmrVJuIpzom+tqRBxidzl8N
         9NFLjrr4CLHaL0wQdbfzqquKRODQGy855CE+LSIzW6LQBDFSxn0G0IBhu2nvjvq9ZUoM
         C4H2LoUOh7OtEoncscsCNXivnXAFO5PXZid9o8+8Gj7F8pG96tROqpB6VbBcnw15YuvQ
         xEkWWGSKyDcS2ZnHgz5gFtsCVWTaJPirn8WpQnWEJipJ6050Kzos3tel4ImbZJYuHj09
         jmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703320325; x=1703925125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltOi6r7fK9bfySPLwaQJXbTwu4MoVyIkyF1mw73/wow=;
        b=JLDyvhE9OD6lsQv/M8gB1afgdZKCopgwu2nylKRLR9lny6655CwpsSVXAnvgmoHPlD
         9VsGgwFH1T4f4cAXNP6YAg/42LNtxoU/ttid7PI8DcSAhKPf7lHBlSQSQHdVRNrdTu6q
         xactg2fpHQq/oKOVUnkNmb+AQD+XrBEY7PBn0S8OteFsMnTl+HZNIZzkPCAYw1glS6nZ
         Mx9Xlijtgl2GD6XUkkydzMSx4M7sjNyhdPHEkXmwMaJs1MBaS40TeUwxe75ZHGcGzMAs
         iR/xG7d9nOETnubcqAcm7RD/jnr+KupVnB9H3EJ8mLZUKZAD3rO8UtuNe7/dEkjW4tY7
         WTOw==
X-Gm-Message-State: AOJu0YzelShTQsG/qPW7CKbjV+Kd5/yJvqDQ5uKrbIg4DpMNtgJ0vBnZ
	vHgjUShYPP62YlFKeCcWO8L6aKVcI29AaA==
X-Google-Smtp-Source: AGHT+IF9s6B9AwwFBmikLvuFCZBc0WaXkD1epFSbGhnrvs9lMnWisGnxqwIEE/DC5z5Sax9vGjvWhg==
X-Received: by 2002:a17:903:41c9:b0:1d0:6ffd:9e06 with SMTP id u9-20020a17090341c900b001d06ffd9e06mr2270306ple.88.1703320325330;
        Sat, 23 Dec 2023 00:32:05 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id g15-20020a1709029f8f00b001d3e33a73d5sm4558658plq.279.2023.12.23.00.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Dec 2023 00:32:05 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/isp/kernels/hdr: Fix spelling mistakes in ia_css_hdr_types.h
Date: Sat, 23 Dec 2023 14:16:57 +0545
Message-Id: <20231223083157.84090-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in ia_css_hdr_types.h below:

'''
./isp/kernels/hdr/ia_css_hdr_types.h:60: paramterers ==> parameters
./isp/kernels/hdr/ia_css_hdr_types.h:62: Currenly ==> Currently
'''
This patch fixes these spelling mistakes.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
index 175c301ee96a..ecc98686f5cf 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
@@ -57,9 +57,9 @@ struct ia_css_hdr_exclusion_params {
 };
 
 /**
- * \brief HDR public paramterers.
+ * \brief HDR public parameters.
  * \details Struct with all parameters for HDR that can be seet from
- * the CSS API. Currenly, only test parameters are defined.
+ * the CSS API. Currently, only test parameters are defined.
  */
 struct ia_css_hdr_config {
 	struct ia_css_hdr_irradiance_params irradiance; /** HDR irradiance parameters */
-- 
2.39.2 (Apple Git-143)

