Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A8D1A3029
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781162964; cv=none; b=quODTiobPh4AEStjAgCXYJB2FV+1fgsPhM79hLtDj6a+QUZ75haqR7lvFvwxuT3/hQNZWjboq1yr59zBzcpOrGSAFxGoU4iHbFtYi10yuCBoEcYfjcrMfGpF6hWcn3nuUx2vhx+LLCtNoWhkrp9Uf6X6+ScoSZybKoSAxIfUSpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781162964; c=relaxed/simple;
	bh=zTZ9Os93AQKT7+0fhNo6c0IbMZasjMPF3/fzgYRsXzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bojOlcjOzDJrU2mbaLTAB+qpUebP9NAmU6QG5uYsiSos/ZnGjVmTHdhNL3iya/duNgC4Qu0CJyADHIgSxrkBTje4lAgmBuK3UpU4nnN3/EXta5+xfvN1w7S9h1qy5GFy2Q4GFGDpn8PC6EFBvjopjZ+F0zPYuOgyMOpcz5kUpwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aub1Uj5h; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aub1Uj5h"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490ac357c55so79657115e9.1
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 00:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781162960; x=1781767760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kLWj6In0UlvucvwDBHBjq5i6uLvtSDMxHxfyE/vi404=;
        b=Aub1Uj5hz7VJYH85t1ThBDm6f4ei82VmOZ2g9Pxx2GqhE4+ajwGp77yZZ9aeN7r+Ui
         uKJ48HhzmlxgB1NTVeCu49fPfspUILe82JRANCOQXFqXODCB088HLAm2d0k3RnaAXnuC
         cm1gm/644WB1g1PE19KZ5Pg0ps3cHE3qxORyAfoKEy1A51kQ9zoiHi34g2GtXfcMyMtM
         fvd6xMosVc4mHfbxpCMnO9D0UDAI846+O0K90R6njV2WccPIRPizTL6NDV2nSwx7QDzD
         veIXRYdFBH4BMMmZ17hRf0fL6jTfMR5uYZEmg5YoOeCJxL27+bAHelEsRDft/hz9p0BQ
         R0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781162960; x=1781767760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLWj6In0UlvucvwDBHBjq5i6uLvtSDMxHxfyE/vi404=;
        b=TflRGOo5qfh1SvBHIf0Dclo2AwNHYms88ktj7WxgK2NspuGxqzL5QQtztIi+erYlQE
         jWMjQ8GF3F8uDZlF6F+YxxXPY3Rdzhio+CD1wJytSNlOVrd7A+vMO3E7BOWGF/WpPg5N
         auq5M2X25+xdefryYW4e4azL/MONDc+/KVRoausj5+lQLxtVI/BAgIn/Pc3dKGaLSlSA
         8CNtA3LMZqzlEd078Jt/yaxwR8HeGLCr1XfV0lv0pNFqg2GLGXEJ98TV4ixENqKzCtNr
         oBC56RUCOS/Mr4aH5ncjl+EEWtNtS4EuLYupoqRwwmB/T99UXk7byCMRYz1eKrFdQNQb
         HUVg==
X-Forwarded-Encrypted: i=1; AFNElJ87ZNNm5RAGWWYKwK+O+DLsnRYaGtyJmDoGB0KSVpM90BG3V3J16ND/Dr1V7dktVf0hZSmKc8fHYMbasH99@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/NxqfT9b3Mqpo8q39jZ59W25oqKiyfjw9WSr2Twdg87L1x+NA
	cCmFdEv4TxNNFDfrt7kFCP0rTH/AirKUeYxuWwZmEYpbGl54LZaEl03b
X-Gm-Gg: Acq92OEARIv+Z7v/hyUvYhGR38afv6Qe6YN4q7CpQzf67ATqTHKxL/0vAGBcwMMzxQ/
	KXSECjbmS/KGG84BoTTti1HsPpZkYkNoNDJGAEMGs5Z5KCngln27tWIyADwTwWxLgWBXEYGVi9k
	hlVYW7fi58Dy0g47fHjWqqNdMIAt1VnBxYLqJd0cGyE4FmVv2LgIG4QMPESYxs9jVugUdDhy0oQ
	O9HLK837n4s+ckGvCjTldlIsDTrDkdiUDBRVXo+ktjaTq/XgKxZby1Sbh84oFmnXFLH23qFrGXa
	/yYwb9KYE77NdNI88DBXqyVR/l15Y0FLifRg5Dako+xSdrCK4ma2K4bGY7Wqb48dq5g21tEOCHn
	ybknGbRGQfA54DKjri1Y++pyMp5tPfAsiVriezaH3X9/8CQpRHLm22R61ULUSpJd8/0uP22gc0F
	LdWSpK/Js6a/5e5iWBkxm9N4I2C4rOOhbsiyArmxp5iUmdmicgLcJ+U4nX0SblsAj8WLQKehUQ0
	KiAGLMM0NNbH8wGViCYLoafyjKrckPBAINmaoyH
X-Received: by 2002:a05:600c:570b:b0:490:e19b:bd99 with SMTP id 5b1f17b1804b1-490e5628910mr12983235e9.30.1781162960308;
        Thu, 11 Jun 2026 00:29:20 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d507395eb363324778b2a2e5aa.dip0.t-ipconnect.de. [2003:d5:739:5eb3:6332:4778:b2a2:e5aa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e5314dedsm30487825e9.9.2026.06.11.00.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 00:29:19 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Kees Cook <kees@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH v3] media: atomisp: gmin: Use str_on_off() helper
Date: Thu, 11 Jun 2026 09:28:52 +0200
Message-ID: <20260611072852.20777-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded "on" : "off" ternary with the standard
str_on_off() helper from <linux/string_choices.h>. This improves
readability and reuses the kernel's existing string helper instead of
duplicating the literals.

No functional change intended.

Signed-off-by: Mert Seftali <mertsftl@gmail.com>
Reviewed-by: Kees Cook <kees@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
Changes in v3:
- Collect Reviewed-by tag from Kees Cook.
- No code changes since v2.

 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..cb60cb3fab48 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,8 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
+
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -916,8 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 	if (gs->clock_on == on)
 		return 0;
 
-	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+	dev_dbg(subdev->dev, "Setting power state to %s\n", str_on_off(on));
 
 	if (on)
 		ret = acpi_device_set_power(adev,
@@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		gs->clock_on = on;
 	else
 		dev_err(subdev->dev, "Couldn't set power state to %s\n",
-			on ? "on" : "off");
+			str_on_off(on));
 
 	return ret;
 }
-- 
2.54.0

