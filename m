Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D4243B6E4
	for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 10:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787826491; cv=none; b=nc+XFWXT7C6LEzBm++8wSize8kI1LtKaHm28UPEhw3YD4pG1i5m/AUHG5dVenwaEEHuEbuyH9Apnt1oRfI5VUj5iigAzvwFbjuChXq5R8hUBtEyDcjzF4aJk0YBOqI9kHCYXp5NuV4RAqrfkg4yOux/2C9ZfskiSdgzcbvsgxlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787826491; c=relaxed/simple;
	bh=9rcIiHoXuCF9JwHBMxzaTJMEufQkYFV2jYyzTDRy+58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EPAp9J4cPfI2fkWwUsJyVIKE2pMtzy32C8+meiXzpLotVGiLHSbgcpQd1q35xBVTH2i5lX+rBCCE0orrVkMtHr91BzI3ezhJVuHyp1xuOKbSA3IC9Ih8bNdbjCyipdzbyn3k1UB5p8d/8f4T2uA23ME3AkyKqRwFE7yIlGUHvN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZS/9vzJy; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZS/9vzJy"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39f20d19895so15766661fa.2
        for <linux-staging@lists.linux.dev>; Thu, 27 Aug 2026 03:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787826482; x=1788431282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ualYSohemnoWJ/GOUjcQjUHW3U25L/3jHKxpRF7dY1E=;
        b=ZS/9vzJy/jlcsgSRXWpzyE8uJrTooVjmGMQNij/Lbd97x7vgo+NtTOFklD6Zseoqge
         DCh+iEjoSbrUL1FpyYtgbqMJ5/etngvccnDJuimU8EZg4MH2V+2ifeW89os3IneQG4xz
         1QLYepAgp1HthLkbkqKbEgUjCWLt0UIUuR1xLPBhB0GWdPw4IARXwDmwwTaxzefV6WKA
         ZURt9MpZGMXnRvWOCNxS0twlHCYu0cxX9o0z9GJ998Oori+JvpF3C/qgGz0mo0j+c/Ej
         1AhAxbphZrIaBp/JrfmJjz8tjCla55FgusLj+MJk4fonLBiACw6/maKE3GILanZCsI6x
         4Pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787826482; x=1788431282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ualYSohemnoWJ/GOUjcQjUHW3U25L/3jHKxpRF7dY1E=;
        b=Sz86+eqcUKYagwRS1TL0vSXEL27mCyL6IXHe9DIuUGlV2YsQMS/uhlWvPViKjVVzZw
         V8PEe/qJpmC1S9kCLNqjRgeoMNx32DuCD/kFWMNWkx+J9g00xy0T8GwVm0nBCMlc31s6
         ZpyeNDvePyHz48bceFjwiY9gvDsxwL2B966tme1Fxsvo9I4epeGns3wO2TAo0MTeT4NP
         nltmulIBB0ZsoQGEzjIlz/RQDt7JrP54s6wsBZMpwRblFAYIicYp53vNuv2bLmkzFyaO
         t2afTfaTZFELYGxLi9P/3dKXl0sSdQWrDtRnND6L7AAoeKs57ZwlKw57PYQWmGB2CVPU
         ZYlg==
X-Gm-Message-State: AFuF++kNtiPV9JPa3p+tUNmHE+5B6HJR0IMbGEz4kRPrMhY+2s/rjApg
	+bUdIwqGk0U0coogb6Qrj/xJuJCBn8d8NhAWp58K6zxSZ5cnPqgBndMX
X-Gm-Gg: AR+sD11NJe8Ijs1vFz1kEvFVU+NfY51sM/pjJzVK+m1UGOjzkM5DTFftm5C8+uN2fpz
	u9Y3iM0mOyeeLIXykJYjxVMEgVmOvk5uRx7y+ypAHocrEpXgQX/LBsWLvY8DSflMC1sJYKWqDIO
	HL2H19tyLultO1NOkZJDXOk1CZpVKn2r/90uzENcWpgTz+DB4jMJz5D0aPcYcqeSwC7bbsI2uVa
	fSwGQgcLRePPZNnv9Qw7uShl7MWEnEgXaLPNqklgB6rL+AUQztJsH1759gL7Ym5B9ErZtMChklc
	lcuQxEuXGErd12x+XZfxEfkT/C3N0tSPC/8ecpq882ySorYI3cmj9XvdR1Ok0VyH0A2uShE8mT1
	7Djf75qi4oR9b5PhwrMkObNHcltIGXz/Tw+JgmvOZ4OEFfGT2BzlpJSTgc+n3UHESvX3ErRFEVa
	qjK+Rs7JS89BpPhr4UhPEaAKdtWqWABrYLl9iBTYctgUxXuAjJiCmoLZFIANQgPW6FvX9utnbb+
	XdVVg==
X-Received: by 2002:a05:651c:41cc:b0:3a1:9562:732 with SMTP id 38308e7fff4ca-3a1fd4592b6mr34616911fa.1.1787826481631;
        Thu, 27 Aug 2026 03:28:01 -0700 (PDT)
Received: from localhost.localdomain ([94.240.188.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a26be2ad2asm3764971fa.24.2026.08.27.03.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 03:28:01 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH] staging: vme_user: Use str_enabled_disabled() helper
Date: Thu, 27 Aug 2026 13:27:07 +0300
Message-ID: <20260827102707.23965-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the hardcoded ternary operator with the str_enabled_disabled()
helper function to standardize string formatting.

Reported-by: coccicheck
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index c695ad9b4ca2..9447c00bc013 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -26,6 +26,7 @@
 #include <linux/io.h>
 #include <linux/uaccess.h>
 #include <linux/byteorder/generic.h>
+#include <linux/string_choices.h>
 
 #include "vme.h"
 #include "vme_bridge.h"
@@ -2458,7 +2459,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			 geoid);
 
 	dev_info(&pdev->dev, "VME Write and flush and error check is %s\n",
-		 err_chk ? "enabled" : "disabled");
+		 str_enabled_disabled(err_chk));
 
 	retval = tsi148_crcsr_init(tsi148_bridge, pdev);
 	if (retval) {
-- 
2.47.3

