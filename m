Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A3B374A02
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199278; cv=none; b=TkQnk8WUtS0ncuVw4tr2XtlakOB3TUaNoIuEQAcPvLF8NqoEbS90Z+7nxhnyAP8Z8nzsC+FrgqYyo5aObCHGqcWHp5TbTjWD49j+fmMz9rtwik/9QNLL+H6ek5WfCzk8UWz9pPMyK1lhJtGuBpb566PadusQCnGbxhNuJv14LS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199278; c=relaxed/simple;
	bh=sTTdJ+a915WjRhsMxkVa81I/Ww6U/l+JAdnO6byk8Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+bpOOrwkusvtzdYp+3hi5S6c2jVPS6VZWZ4wEQ21MnizCVnojZ4H2nVFNMZEzJI1eOoZ2O2UwzTDOS0VdJQ7t1gjKsshdxBsqgqgqwwkVGYUCcY6I+XecfYC77zeDVVrSD2qZQeiSLSVODhRirnuXPW+DipMEJ1V/qrqEVjHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RgpMgTce; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RgpMgTce"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48433fad54aso1183381f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199275; x=1788804075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O14LPPXLUHkibdGlwfhv5IQQ+lgmVBBTlfYVPR5q/qg=;
        b=RgpMgTceVSbCz4skyqXN3Zg8w0bNMtGFbbcHwbkrVg4IR0OhlVkvzLt/ovtbWvkuvr
         1QazF1Fe2CCnYuqahEDYak+P615PCjWTv7UOOFt62PDSOIws/+d9iGSmKu6tIn78gmPP
         z/zNb2gpeYpFdbn0Wj4/WGAuAzie627Cc0lRFuFeDpG0iVMOjHcHo8i7mLPTulO355B/
         Se3UlB8Xh23csKt0N4yJtftX6fWZ/D8TA8x8f7vpRw/mpnE3MlgGZ6Lc0Kibg8AWcHHc
         28JNwxhSfo8eUIeOZ7iAj5H4ld6rAPuMbhrYJR2u6spbhabF/yfk+RapUpoOukeOnlB9
         1LOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199275; x=1788804075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O14LPPXLUHkibdGlwfhv5IQQ+lgmVBBTlfYVPR5q/qg=;
        b=IpETCBMPaF/SfIAcRmoGz5qKz3Vm7HMeu13Tu9zyUrQMTG+lEu+kwkLmd9ejKbxrkF
         6mGsYa6DDMXo0t0/CpJibCcx8mqOZ98LZ2rKpEgWIvb2nkLFqUNeRf3K1h/cKc7paC1Z
         cah8/RVyiL00ApzYovwAxspTZAsTp6D8Rz1GuOdvzlPfhEl2JOx8utpTO01XljN6SdLP
         JA1lD18l8JY6BD4mqlh6BRQhpiqK3oW647/aYM29zEeF7qpAi0RqszVrKWihqV4t6Zfy
         +c5o5JE2a4eHPoGLt56xtRWcdumO3RFDXz/l376zZ7qnJs8NjfPJvT/nQVtQcHEYhPar
         ljFg==
X-Forwarded-Encrypted: i=1; AKwUvBwrSYfEl8oUrz99DDAWD79dCqwJaIm/LIxpPlS0+1eW1sD5H+DJkUAGtKWYR0YtZ299YPDa09UI1/n4DuzM@lists.linux.dev
X-Gm-Message-State: AFuF++n7z4gTECBJPIEU7etlw7iYo5Sf6haIQeyPW3dVxkzNTldQIgdW
	nh5uceDudjpkVyUQUJYFapoqX1zeG08y9E/EhWvbdQgQ1rLwpv1mUq2i
X-Gm-Gg: AYBFou3bzq3qhGLL2EbDO+owVt7RBL5CsjMZOfdqkG0y4Kw9KO/ACtEKwVtfxttW9Vy
	JIT0v+pCuHvbtq8lK2paz0Y6d9d9RxOA3tPXUUIVyVQeXtzUqlJeaph7l+CfKnjZemnF4b2mFSm
	iJ6okYms5REBxF5vrf6mMumbNyz7xeNA+OBKGYmgDqdIt5TGZ9+VPxdr3qaCwXy48BSHLFikYeO
	VO2A7+kfZxaSsovE7LI/sNJwqAyhGgyEUhMXJ82Qyn8t4UblK9DXR1crpP9vQjSXhl2FCTk+2Fp
	GB0TGrGGLPqaOx1H77gDVJ8WrFx8HJbiAT8sBUBzke4QhZ/dIws1J02a6+SGTfHyoiYAFWLxzQH
	0on0kmVxHcFNoHJJ0pLtsyMGdiYoWkprL1MP7ccu0OV62tlTcWrZGM3soXsqkHm6saRIRPfLrs8
	0XC7KejwirzZm+8NuljmI7CfJeCcrthF96xN9bCJEPjYJSQ2aWGrt9OrjpI6AYtvIkp3f3uJXgW
	cP8slB1mLp7tzvrfs2PhJF8dRvenxjqYDsBqEfreT8=
X-Received: by 2002:a05:6000:64a:b0:484:3310:710d with SMTP id ffacd0b85a97d-4844102ad9amr4771790f8f.25.1788199275336;
        Mon, 31 Aug 2026 11:01:15 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:14 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v5 05/16] media: ov8858: Add INT3477 ACPI ID
Date: Mon, 31 Aug 2026 20:00:50 +0200
Message-ID: <20260831180101.3109854-6-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may use INT3477 as the ACPI hardware ID for an OV8858 image
sensor. Add an ACPI match table for that ID.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index d45659bd5dda..e48902d517aa 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2017 Intel Corporation.
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/device.h>
@@ -2087,6 +2088,12 @@ static void ov8858_remove(struct i2c_client *client)
 	pm_runtime_set_suspended(&client->dev);
 }
 
+static const struct acpi_device_id ov8858_acpi_match[] = {
+	{ .id = "INT3477" },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, ov8858_acpi_match);
+
 static const struct of_device_id ov8858_of_match[] = {
 	{ .compatible = "ovti,ov8858" },
 	{ /* sentinel */ },
@@ -2097,6 +2104,7 @@ static struct i2c_driver ov8858_i2c_driver = {
 	.driver = {
 		.name = "ov8858",
 		.pm = &ov8858_pm_ops,
+		.acpi_match_table = ACPI_PTR(ov8858_acpi_match),
 		.of_match_table = ov8858_of_match,
 	},
 	.probe		= ov8858_probe,
-- 
With Best Regards,
Maurizio Casciano

