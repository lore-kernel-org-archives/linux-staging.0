Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFAF2CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:34 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id z9so20372724edm.10
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/FEXdLRWkr8s5N8muAUD8OFsfgpGqsfzOv/whEnmPHk=;
        b=hKdUfZ+6woF+YMdbwtSPUR83LPfHHKvkCDIWATpBlka50qBT0KtKHEQU0+d8saF8ns
         Ld5lf8VKJP+toJvKXjz6u/nofokSMv/UAQ3i9nST4gFX0BnbWVaTdgbrciHZSj/a2B6S
         2FCgL8yUjRa8psVJ+ahmqHBN/TWDHRDzGH4jK0E9CT9oqMXqvOcHrhfpHXgFWDEs+nK6
         LFsldtZniBCn08+RxY8M9xe/k9zwEJIS0bNZH7kGrL5CjWIALVMUvepC+n5OoVyNTePH
         PKKfbwSrCjkou7HbvRLKUxVjb3yds9GQVs2UIuKdzdHdJ7ZN99sD2ALWBIbxWmOmkgoc
         B8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/FEXdLRWkr8s5N8muAUD8OFsfgpGqsfzOv/whEnmPHk=;
        b=du4/Rt3DwzNw3ZiYmX51gDj4x0n0brNFKSasEcvr37rokSzbzpaLY4CZ8OYRtWxDN1
         UeERS6iYXqevmozmd2TMFmcZKv5b1D4SNK4sy5U8T8wv/Tz0XB0JV+UjVzfKoD3zlP4x
         RVt5rSSJjAFRNOsUr8uxzULmm6licmoWM+sMSoNQK5daNS3X9a5y1ov4W+aJDxv8gTt4
         yWPkFT/dJ43oJAfTg9A9lcsaacwVBUuO4KURlRZ4jqfSofass85bg0lqEQc2jxh1k/4b
         CzHuitmDzZq5M4+J033rk5Gide14gJVncKrQtpffH/e6naQ4WuTb39ldwqLF6Sz1Fviw
         bL/Q==
X-Gm-Message-State: AOAM531eixMDvEvShDU+NUFp7tSf9m/ykZPlAtYBvtnR8rPcGE2Qpg+W
	zpKSfRo7eiDQaz+g4hdGc+A=
X-Google-Smtp-Source: ABdhPJyu6NCY8XuNeO6fA3IbOZ5BGd3zNnHKKLMCs28tfnNbKiMJBWlf9mCRbjwLpmeh/M8qcMUtYw==
X-Received: by 2002:a17:907:386:: with SMTP id ss6mr7137507ejb.101.1641551793369;
        Fri, 07 Jan 2022 02:36:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:33 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 07/19] staging: r8188eu: rename parameter pFirmware of load_firmware()
Date: Fri,  7 Jan 2022 11:36:08 +0100
Message-Id: <20220107103620.15648-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107103620.15648-1-straube.linux@gmail.com>
References: <20220107103620.15648-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the parameter pFirmware of load_firmware() to avoid camel case.

pFirmware -> rtfw

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index bd7f3dc5878b..5c1da9dd179b 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -508,7 +508,7 @@ static s32 _FWFreeToGo(struct adapter *padapter)
 	return _FAIL;
 }
 
-static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
+static int load_firmware(struct rt_firmware *rtfw, struct device *device)
 {
 	int ret = _SUCCESS;
 	const struct firmware *fw;
@@ -530,15 +530,15 @@ static int load_firmware(struct rt_firmware *pFirmware, struct device *device)
 		goto exit;
 	}
 
-	pFirmware->szFwBuffer = kzalloc(FW_8188E_SIZE, GFP_KERNEL);
-	if (!pFirmware->szFwBuffer) {
-		pr_err("Failed to allocate pFirmware->szFwBuffer\n");
+	rtfw->szFwBuffer = kzalloc(FW_8188E_SIZE, GFP_KERNEL);
+	if (!rtfw->szFwBuffer) {
+		pr_err("Failed to allocate rtfw->szFwBuffer\n");
 		ret = _FAIL;
 		goto exit;
 	}
-	memcpy(pFirmware->szFwBuffer, fw->data, fw->size);
-	pFirmware->ulFwLength = fw->size;
-	dev_dbg(device, "!bUsedWoWLANFw, FmrmwareLen:%d+\n", pFirmware->ulFwLength);
+	memcpy(rtfw->szFwBuffer, fw->data, fw->size);
+	rtfw->ulFwLength = fw->size;
+	dev_dbg(device, "!bUsedWoWLANFw, FmrmwareLen:%d+\n", rtfw->ulFwLength);
 
 exit:
 	release_firmware(fw);
-- 
2.34.1

