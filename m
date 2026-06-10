Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFC6349CE4
	for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 18:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115840; cv=none; b=dOA4TP+jnAC7MSQArrob3gxnPeCoHgpG8AS9hfN3aEPn0OktnTSe8EkzYyI1o9XxvbnJrtxgAz0kox66PvgybkQ5TRCHZfhH3Uvb9kJhFm8kZtBuGHfWWwdtTH7uy4TjnJfVzU5y7+C/RzgPnUTbtWwz3agCFddKlC6CMqd2Jms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115840; c=relaxed/simple;
	bh=2uQYG0+UxIGPrJJoDURKujx8iY/HU5qavKxT/c6bm2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jkiuuXp/gkQkXc+nC++PoYiQ1sTLOx+kBSvnGeR7wuHhbMe2Il1VpgiE3SBES6WqQ8aJjZ6PnHorjaNHZrLOTZxbKN6CQ3fwT9J/JKAFkvlKjDl4bAh4tAnkSTihRWCaYKPCcs3ZRJsD2RZ04aJGsOr5Q0LbY4uCntNfRK2pmkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcNs/x1/; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcNs/x1/"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45ef4223be7so3943851f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 11:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781115837; x=1781720637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwl2CxOhRSpVYfaOipOYrbFt3AnGc5jte9ni5QIriGM=;
        b=bcNs/x1/NEAsvRYRu2G4WDpVH2XJZprBN4DweeBuuX6ywLWq20swDkB/jjabciLUKx
         CeyKvlrfhAfm9pRCT6WZxQjQxc3yhHHzUPa1oZbf3OoRaAFH1R9DYtITNdLVlzsI1Tr8
         BwKy9vWqCsnxAKB/fBnxrWEpR/+eRN+lYtJuhnesZWjyhyIvtrrN7nvQZUSCpvDJnQQX
         wCs65dU7A78tH6NKvgCc2sJZ7v7Rz0zK9kb7/cgWauHT86dnEieY/rsRUgxu3WDUMTf9
         EhUM9amKUu2dQOEfhMDcGTxxHEecoLYrdCY4oj0CKUnqgTzs3mr/dYGtHqDvOe9WGEHE
         5RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781115837; x=1781720637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwl2CxOhRSpVYfaOipOYrbFt3AnGc5jte9ni5QIriGM=;
        b=cGTjwiK9DqYXTOM0f0BXt9nj/iwB/U+84odosWL5Rx+l4F2GGAcQN83gfgekRlfEl5
         ZOn9XWqHI1o85D2BVp6LAFRB36iZxKk3nTV1oQx3vJGbaGRSyJqqqCcaM4OjkMpWXjFP
         dES53erGQoeWnD91CjVlgsaxJnoPaAuM1ER3I09DwMfns73U1a/Cdyw+2uonc4jcZB8z
         RR4elsaiDnCbdiTMv3Z4nRdE3WgHpIO0zuA152cILV2uIFSE0DEMpOiQyP5fJ5VMky6w
         wVyAuNUWF5+TkCPkoErsv2E26Gd0e/S78aCXHpKV/9DYNBVzBi+V7MLuhl2R+jonp/j0
         wh7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+UjVYM9FjUJNDDA6Or56XPcTwgYtB2kZZODZLQ8vdtZzKw6SCFp/KRp9aT5Wb7wr2JcfgYC2yHFZqHB8qg@lists.linux.dev
X-Gm-Message-State: AOJu0YyPITxlD3M8bVowbsPDSk+c9Rv/XYI4dZU7eKrHtFqxn1ppM2qS
	XmANlrPwaZXbCRmWHd6g8JnT74PV7qHPze1+/+6owsSveveAni7gNvIUC+cN6vTQ
X-Gm-Gg: Acq92OE5gbjhAXEp2yRh+EpzRiNoNj8Z+vNej+1O2q+P9B9THi3aBbUD+HwTeLIhd3i
	J80HZHRQc6dGPDGfzzO6Zzt8FTJ+j8bPvZySetHzEXZDQK2VpRVYwZOg26yPMhWj/71StF4F7SC
	kq6O3Wllv7OyfCj17EVJeBSppvNV7GS5U+Ghlmx76WggNpOhU7c9q1y7x7+EgCZVplBd/NE4CwC
	kW2AxMg+ztROwlhhAdJaJxSSDdojqxEUiFGmAdsrhE4C6b8Itfx3wWFiFKiDOkQIGQvghI5kcPb
	2QMpl7FfqSSCId1jYh4c0KMbibDcm/giALvhzFvp4sqZuaVka74sSvcQBwvaZ+GWcCpCnpLWRva
	HJ/S4bhV0FjcS1Tvg3mJlql7P+fRYDejgBFj/zYAfWZ04z40HZw+3AL7wWzrU9jBVFc81yWlA6g
	OMTHOu9ObfxbmReSDnsdIjGLDytJygHmPG9xZodcWWdrixCFavoCnRpN1D0aJT6XEd0F6VeHckq
	z/B1rjWRNEKSC6Vogbd2NvcY5OxvMNrB4zKmw==
X-Received: by 2002:a5d:5f91:0:b0:45e:edc8:d440 with SMTP id ffacd0b85a97d-46056680e18mr12031063f8f.1.1781115837178;
        Wed, 10 Jun 2026 11:23:57 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d50732f0d071ef8c240021969f.dip0.t-ipconnect.de. [2003:d5:732:f0d0:71ef:8c24:21:969f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f0a43e9sm73075615f8f.0.2026.06.10.11.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:23:56 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH] media: atomisp: gmin: Use str_on_off() helper
Date: Wed, 10 Jun 2026 20:23:48 +0200
Message-ID: <20260610182348.217892-1-mertsftl@gmail.com>
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
---
 drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index 4026e98c5845..322eca4a3755 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -13,6 +13,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>
 #include "../../include/linux/atomisp_platform.h"
 #include "../../include/linux/atomisp_gmin_platform.h"
 
@@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
 		return 0;
 
 	dev_dbg(subdev->dev, "Setting power state to %s\n",
-		on ? "on" : "off");
+		str_on_off(on));
 
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

