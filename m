Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF162FB4
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 19:39:28 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id b9so1796786ejc.13
        for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 12:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9kKFsQH6/8hsrP1bGpKk+mHFKlheH0dIynAVi3jusF4=;
        b=tvM+rvReBkNjP4kDXka/o+BhrQYdZwaxNKNsr1AWehp+Z4W9YEUnz68g/bc2DBOJ6y
         fMLGcOf/peTNoZWFX/Oho9Z6YIRGkWnWMLvgXlJCTWsprRzI3Eu9Gs5QPlsUQ9O1/yCP
         osSkVL8pqdyg3XXwkKXX3o5H+MzJjv1ECJUS4/127nxJ8+O8oGfxVbNPUzfvi810apmK
         hPxBqogrZl+DLH0O0qZpSKtrHAqDld0ZcEXFbVu1POcYEB2/GRYKVAs7IlKB9lpxqUwP
         e0htykQd1AouWp0Vn2kMKUO/uMj680JWC96VfuITsXTGpKNDvcnM+qco8q6+tBPayMTz
         EZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9kKFsQH6/8hsrP1bGpKk+mHFKlheH0dIynAVi3jusF4=;
        b=MJ7e3ZbihufbKI6nYvtAn4Q/UKATrr8R21FPV0lt8A+Vcmb4tE7T50P4DW3Im6tSKZ
         Rs3egbyzVcJKRDt1L77gPQ47ZOE9KaWbGT45gA2r/13o9WN3HKwyZawnhp7yG3bL1lKG
         +gCnkOUdblzwovVY7AIY9i5KbxRAUdz3CipBbVikRQMA2kOlC7aYUSqS/BZQzTtACu+A
         x6wKnByv8LJ8BWvq24JOXGs8JB+XnSZJh0OzWNX8kBbBEMPrcyCmMA1mC5lPddjApBVa
         dRMKJPcFDuchJDscxc77pEeMD07mti6EwTyZJJymuDowoKrqRTfI4tlWhfYO2/j66Hko
         grYw==
X-Gm-Message-State: AOAM532B864xnbcZ1nUBqwoiE5tp+63wa3uyTK17bKZaPO5Bk60fu3So
	R9Ct43URH+9LoDElCNrqZkg=
X-Google-Smtp-Source: ABdhPJwQamej6okxRqBXrf1AurvxV094DH+VNTHHnz83l1S/Gpu1LPlZQr18x5jN6nFU3c1ESySzNg==
X-Received: by 2002:a17:906:7c4b:: with SMTP id g11mr5632032ejp.461.1622144367423;
        Thu, 27 May 2021 12:39:27 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id p25sm1446593eja.35.2021.05.27.12.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 12:39:26 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: media: atomisp: pci: Remove checks before kfree/kvfree
Date: Thu, 27 May 2021 21:39:22 +0200
Message-Id: <20210527193922.25225-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed checks for pointers != NULL before freeing memory. If kvfree()
and kfree() are given NULL pointers no operations are performed, so
there is no need for the above-mentioned checks. Coccinelle detected the
second of the two unnecessary checks.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index f4ce8ace9d50..5301cc014c7e 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -363,10 +363,8 @@ void sh_css_unload_firmware(void)
 		unsigned int i = 0;
 
 		for (i = 0; i < sh_css_num_binaries; i++) {
-			if (fw_minibuffer[i].name)
-				kfree((void *)fw_minibuffer[i].name);
-			if (fw_minibuffer[i].buffer)
-				kvfree(fw_minibuffer[i].buffer);
+			kfree((void *)fw_minibuffer[i].name);
+			kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
 		fw_minibuffer = NULL;
-- 
2.31.1

