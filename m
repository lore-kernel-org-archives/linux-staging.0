Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15DF320E
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 12:10:42 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id g20so9709524edw.6
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+YYK4vy259MFhr5syvwnMVIGmoB/m/01LjYdYR6zHbo=;
        b=OFGsGWd+TJQk2Rg81s7SRN7EQf0lKglfkAW4B079wNdWeyzha85aIFue/NHsviVZ+J
         6ay05JBd8VcwZ2hLEnL5YtYVvZccBRASgFbEZge7ce2xrjvrVw0uvGxuFwJgFOlos6g+
         OZM+kvcCfM/ISazrD7xhUKazsRqdc9wHlAyqP+Dw2bJEtcs/IDH8CPHfPIgRTFb3J88s
         50z3eg2H4ErTHA9B5wTDCLIDLYQ1tEMe8UyBY5Z2hTsLUDoU5+4JNBCy+1c7fEuTWnHE
         r2MFv5aVzs30mI/SHsxRAJmdvdMXfclngTRfvqqVkOtI71e2USJP9RH9U3+5FtRPO4zE
         WvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+YYK4vy259MFhr5syvwnMVIGmoB/m/01LjYdYR6zHbo=;
        b=RFX3gSk7203V3gWHVMxhtPkAFBMLtJex+usfXMG2U7ZiBYGBHR2nPCGpwRcUFJSRUX
         CtPkn8RfPZ6yOQOSaP1i4TG5yheH0v4JMffb8S9EQoyC4z1nGDayf2aQ1Rzd0tjfSGWv
         9VRQI45iH7G99OxJL9k0nHmMuCYS3cGCP/QSqdsarzElcFH2YFoOVMwUYv+PThXIayAm
         O3NIJvX3tExHe/zdFspQ8vrhAxBd/3gQLnIzCIecmanX1x0KqO419MG5Q+mt6xeADyDx
         1szVaV8F/x77Xf/0KlYVjFChwLrooYGeTFG5yLsZoggE4wkSlPOuAs9DeBGASmy35keK
         WfYQ==
X-Gm-Message-State: AOAM5321Mn6drcv29DJgKAPUMnToSE56cZeX5OBMdTeZNbcEsfYxCS29
	c6kiia8cWVfVGyGMsv9p5ig=
X-Google-Smtp-Source: ABdhPJxcOj8Ad1mmGtO9rNI7z9DkpThgUe4k1yRqCC+CsGPDvAZVCojKnwhqdkIjc7ALYNI+f3oXNg==
X-Received: by 2002:a05:6402:35d6:b0:41f:95b8:a945 with SMTP id z22-20020a05640235d600b0041f95b8a945mr7974772edc.40.1650024641079;
        Fri, 15 Apr 2022 05:10:41 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709063ad600b006e8867caa5dsm1626114ejd.72.2022.04.15.05.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:10:40 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 8/8] staging: r8188eu: check firmware header existence before access
Date: Fri, 15 Apr 2022 14:10:23 +0200
Message-Id: <20220415121023.11564-9-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415121023.11564-1-straube.linux@gmail.com>
References: <20220415121023.11564-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We should access the fields of fwhdr only if the check for firmware
header existence is true. Move the affected code into the if block
that checks firmware header existence.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3:
- no real changes,
  just the pr_info() -> pr_info_once() from patch 7/8 is different

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 7ee72236c7f4..8b5c67780a7b 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -251,14 +251,13 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	fw_data = dvobj->firmware.data;
 	fw_size = dvobj->firmware.size;
 
-	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	pr_info_once("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-		     DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
-		     le16_to_cpu(fwhdr->signature));
-
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
+		pr_info_once("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
+			     DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
+			     le16_to_cpu(fwhdr->signature));
+
 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
 		fw_size = fw_size - sizeof(struct rt_firmware_hdr);
 	}
-- 
2.35.1

