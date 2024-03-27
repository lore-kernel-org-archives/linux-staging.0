Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85A323773
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521124; cv=none; b=jRiBa2w6hUVd5M60P/8NbS+g8509WAZTdfBkWq18IZ2wzM60sULPRjqS2bVaZHti99fg+7/4u+z2DDogHnloUW3JZ0F0DXqitb7v2M9JzlY6Ckyvt4tt5DIPGzD2m/wH8JOKsb6poxyqd0q8ywoho8QruQ8wukZUQb7qW322BXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521124; c=relaxed/simple;
	bh=LVtD0MrdI+Mg1oSTGtaKkQKlCvBSZCpoIbcQgD7fo88=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SFyN8q+WbX+GcfXp3Abz8aPMpVVAV1CogCSDxQxqRQ6jzYkwSE5Y08/4oKOTzv2rpC9doMNZu/B8moc5oFkc+eUZXMt+kWi0sy2raPT+c4yjTa6/HMItynRoWC0J8YHD2D2cOo2o+yusbNzzGH4SZa8A2rtv3nuUQiIZUbBWt+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnZmTSOC; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnZmTSOC"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-513d3746950so7964166e87.1
        for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 23:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711521121; x=1712125921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMhP10tsZ8Q8ucD5kE8dCkCWtaV9oISDHd7XaeWfrBI=;
        b=AnZmTSOCaO+WMWdcZBxvuLBTgRZKHHsWYVI1L9oPPAdoF5FIkZhh+E0mqMIE+n4knf
         yYAoJg0KL3CIVhGJqs+vz2EH7D9z4Ohjj8GBr5H4msbYX3FMTOS16cn4C1d+4RmpxmnR
         N6jw7MfbqU1Cn7SLrJRyyJs1UCfpDz3mUi53BSY4jBtRk6IAr+xvqncB842d70tuU9/4
         3Lx1A94XRB1pyHQr1q6MHc+Y6XOWmtqvTHjhzNWgOxUB7vGGrlHCS6AxVPWE5bcFTYh3
         4QcrBfGg2NvtNgH3utOHycPoGj3+Cnnud/9884xWR38teKTDLo7Mu1AYSPus8TwW9qKj
         RNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521121; x=1712125921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kMhP10tsZ8Q8ucD5kE8dCkCWtaV9oISDHd7XaeWfrBI=;
        b=l04kceok/9g7eipwi/2PqtQCffJtRZcXv290Gkkw2oTH2RSd6L31oKTk3OIuMnGoGz
         WAqzMB0oeSQQ2RKObMKxmy9V+ToBTVq2RmoSX3xOkJoP43g85HJZd2kAWnVXZkKmtbl7
         gm23J6w7hYK35oiBXgruu9bJL1TDe+N2EMPDyof6UuNGdIMhtBTVW/eR5gR3Xr+NTWk7
         vHpOxhlyIEXZLTNSjCXGeYNSih8dyjkfr/Dw42DmtMlu7oFl2EFWZE23SMqJDS8fCol7
         6wZu6zT1rHT3dIQtlSKA4OF5qEXIEPk2YYBWKQIKYszbuJIN4g4IOVF8k9K1YnvOlVra
         YpfQ==
X-Gm-Message-State: AOJu0Yw74tXRA9UHGpyQQ62h52cSa02euIZS3EfZwLTmOtF4rS89+8Hi
	yuouY/Eg36lUnTz1mEA/QLmUh2qLZIWw2VVvI9oY2MEYtuoNofDP
X-Google-Smtp-Source: AGHT+IHQyGd02XsZG4w/RI5rbhK3c663LjTjeSI1CPeknUDDI126Lsv69fxhT9YI0vQRVD823Q7cLQ==
X-Received: by 2002:a19:690f:0:b0:513:23be:e924 with SMTP id e15-20020a19690f000000b0051323bee924mr976794lfc.59.1711521120864;
        Tue, 26 Mar 2024 23:32:00 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c139600b004148d7b889asm1121360wmf.8.2024.03.26.23.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:32:00 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] staging: pi433: Use headers in appropriate files.
Date: Wed, 27 Mar 2024 08:31:54 +0200
Message-Id: <20240327063156.96307-2-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327063156.96307-1-ikobh7@gmail.com>
References: <20240327063156.96307-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure rf69.c directly includes rf69_enum.h.
Move rf69_registers.h from header to the relevant source file.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 drivers/staging/pi433/rf69.c     | 1 +
 drivers/staging/pi433/rf69.h     | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 81de98c0245a..0c12b31c4642 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -45,6 +45,7 @@
 
 #include "pi433_if.h"
 #include "rf69.h"
+#include "rf69_registers.h"
 
 #define N_PI433_MINORS		BIT(MINORBITS) /*32*/	/* ... up to 256 */
 #define MAX_MSG_SIZE		900	/* min: FIFO_SIZE! */
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 5a1c362badb6..bf802f097310 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -11,6 +11,7 @@
 #include <linux/units.h>
 
 #include "rf69.h"
+#include "rf69_enum.h"
 #include "rf69_registers.h"
 
 #define F_OSC (32 * HZ_PER_MHZ)
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 76f0f9896a52..dd6fa8af9b9c 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -9,7 +9,6 @@
 #define RF69_H
 
 #include "rf69_enum.h"
-#include "rf69_registers.h"
 
 #define FIFO_SIZE	66		/* bytes */
 
-- 
2.34.1

