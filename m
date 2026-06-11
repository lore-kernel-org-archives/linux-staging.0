Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1051C347BC1
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 06:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781158470; cv=none; b=QnOPxqgEEoEq6ezgc9j1E37MVOkjggkVHdAHMOldJGtmeVzVedTZaFNJ/6atG3JVcpbdCn2AQPtK8dlDUQ3SBh2n0pUQLxuRKeGboOnheX/bStaFOBsesdof2U6DLzaxgbpaALqaNGEjx6TLM644NvNUJ5WJgdLmu1COrAlHnfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781158470; c=relaxed/simple;
	bh=ZfgJxhiXGAMiDs2dI9HeWzbQGt/5F4/ByJE1n7rDnMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=au3Mj0oJtX9rQ+yXlxJJy2Scx8DeNSyts3cDNrbDx4nGJqin4udyT/GCoqdVkGJ1ROQ3rMek/RqI2tyFeprmZqoZ1T4jbI2PoNlg80KdP718ybCt3kcD2eR+ED8m263CvnHVRgOZeGYizaCF4AMIqVf7cyS28Ge6v8JWiI5zWSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKhfzMYv; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKhfzMYv"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef4223be7so4158792f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 10 Jun 2026 23:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781158467; x=1781763267; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TLceGIgYtQktvlq3SjtOMVDSRSFyQjcK599lhjYa9E=;
        b=JKhfzMYvRw/ECoLtJVAPXAMFfiyR6EVx6sOKQNjbiI4/hO+kBXTr4TyXbJfstVqdYS
         t4fDJyzEzQoFAoep+dJILMq70YqxUD+W78viIHgd/h+pVJeG+yXrypF7J9nYyd8/i6Or
         IpVw2DzzxObSf/tD0p3g/2JQJFgqUg4OlQ0W7FAUZ7NyT+P8q58JEmAyY5/vqYUS76Hc
         pyBzBLW4Y6doIq3ih/cyDNoVA0rznpxXfR4qHQ7YzdKx5FkxNlVcnPuDyia3cYc3+vrO
         6qyl0gHanXyWDznlEn6JmgKSbOjZPPy6h5fOLJw7tNIaVpmf/px8hlYzLfTQkGExYtls
         xgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781158467; x=1781763267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TLceGIgYtQktvlq3SjtOMVDSRSFyQjcK599lhjYa9E=;
        b=BbWZJuZFN9KFjmJ6LgCy1Qze+kNxELLeOIqV9yMoSX9K4e6MPtFg5QeoPMEZKC24CV
         1zfK1772hpncCRVABHVLEmMa0u6rjwXLlkAbWkq+LQQo52wvuKV2JTvp3DLS1okrxA7W
         6UJjYcFobuz/t560Jpb2Nmp3PscpSpxGBZ7NMwsiFPC3Ji8laE9bfJfbPz23RH+c+dBY
         IbluuajvRp4Xa5FLVXeg4MIGUPaHXwQobIb3+/q7CXRHwIUGC1NeMte+0b48FfnVBzzG
         drcUs1WL7XFcOefA3VoQRzKKFD4lZ+TaT1v8nekq9l0JITVEqHvBeR2MtbZ0BKU+cs6r
         LP5w==
X-Forwarded-Encrypted: i=1; AFNElJ+WpxM3jorT7cR+A440X2yuXbhscxeGqtyCnbE+1zLCd/XpVBvIouuajmxD6pggZTNaOrqjnks3Smi0Rw5r@lists.linux.dev
X-Gm-Message-State: AOJu0YwXehB0q0GKdG/9DOmQIgYm/H2QQ3/H5IOluk93EKYU2WLDS+HI
	zKCB4oWvpZiJrwpOHLAOapHwsc/XSNq6OkaAECxw0IjVMRnLaPN/fivI
X-Gm-Gg: Acq92OEb7RR6TpHAhCvrii+GhH35lTJl8rzdkK/6aOyzEMiSdbcqKmKOPD2GUkEnXZc
	krBJG9zSQs+e7givRBOoHUhrQBEb8/zceU6hdENO6oKXh0/fVZC1RU7odK5jacKJ7syfl+p2Bpd
	ii8YvB4dMGKMHp665BrmXQfx9FDqg+8PDmhMk+t9M2rtUJ7sCU3dizCvbUkHC6y4WtMmxvCHrto
	Lbc6ctuIp9CPXb5MNpivOdbqyw7yVM03VSrhP0grkXC+DNIQuPk144tq/61rrpkFoxH7j0yKK2M
	tP4hBbuymPbQxpH6NoDuWl8hF13/mUdqjHHV8BwuLW5v/wNRa15JoX2qt2GlBE+eZqsvWZqVD2y
	V8gc+nhU6RX0hHhkqkiXE4vFUPjuUOXV32jAZTIEAFw1SvQLAFfOvaGyhfOnV+yiu4RAusWHONF
	rzW8J/hT4QaGGupnk0HoFA/7P+rb8UROJuM+uKuOKq34IkUVVR8JV0eTT13epEgHqJnwPTRtzg4
	7R5GDIvGVHPeIL88k6dhpcZ3awwDaUKSckwblvh
X-Received: by 2002:a5d:5f47:0:b0:45e:ea9b:edfb with SMTP id ffacd0b85a97d-460677cb174mr1805311f8f.39.1781158467136;
        Wed, 10 Jun 2026 23:14:27 -0700 (PDT)
Received: from workstation.speedport.ip (p200300d507395eb363324778b2a2e5aa.dip0.t-ipconnect.de. [2003:d5:739:5eb3:6332:4778:b2a2:e5aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm61047792f8f.14.2026.06.10.23.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 23:14:26 -0700 (PDT)
From: Mert Seftali <mertsftl@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mert Seftali <mertsftl@gmail.com>
Subject: [PATCH v2] media: atomisp: gmin: Use str_on_off() helper
Date: Thu, 11 Jun 2026 08:14:17 +0200
Message-ID: <20260611061417.11747-1-mertsftl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <aipI6J4kDWESZgtA@ashevche-desk.local>
References: <aipI6J4kDWESZgtA@ashevche-desk.local>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
Changes in v2:
- Add a blank line between the system and local includes.
- Join the dev_dbg() call onto a single line now that it fits.

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

