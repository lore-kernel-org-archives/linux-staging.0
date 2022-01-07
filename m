Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971E42CA2
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:35 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id k15so20288121edk.13
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sHgEc02003j/l+0ICwvAEWZC5UXs+c6EZrUwzuX4CsY=;
        b=oGrqaKS9otfm0x16F8I8+0Cg0wqIp0xrodazwvQN4Us4ucUKfio8S2LFXuRH8OAUIC
         RhPTwRlLl722XvEEPTv/NTAxnMP61nlHMP4JFYXXWwk+l6j91XdN0TCvVaU+5faUzmo9
         y293UkLLL9FZoPPpyrDs560gYGzbM9MjKp3ve9fSs4ftJJilMYj0SXRMDbfYsTPnF8mM
         smpQM8XwmKqZ7W2Z105MfMqXQ9FgrNq0vxkvmqEShH9cXVjd112Reuwercra+DKKKgCR
         /JM89uJ4AmQ9wqNaq7CbRdrcBcagiDgnjGbRDoeNFj0oWTDIlYFGWgpGNWoPIMvbYyAH
         M26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sHgEc02003j/l+0ICwvAEWZC5UXs+c6EZrUwzuX4CsY=;
        b=CijCDyBug8JKHX1pUjGv6LUrmBjpGFiHiU03PAgc27UP1AzUxh0ts8/nl/IMhHG3UQ
         37exYd19o73b898JKsts+Sp5P9kWfrtYhbo+ejb18DsdXJSXx7OLZeAxpJgkaffpOXhm
         Xj77F2bslYBLFzzBib5KIPg7qWLNf0Zf+Nk/WK7sdnU/02MXgnSDRzqHe1KOYK2d/vOu
         FZKvbcWi0ZJJgrmlS6NJq8+figYEqcjpj9PdU3mOFEdzlFtBH2Mt/y/OtWnkYvOY06Fl
         LmdkyPetA43OHjju0/rc/zXzikyAte+5QK2iLQuvHDSrSt10YbpEzU8xcbIboUXYwsLb
         Y2eg==
X-Gm-Message-State: AOAM533qkpN0feqaEAz9BA9MmZpv25oktAoE6yu3Chj6ZjVaCsr8XCoP
	A2ypIAheFnQcGMmXlgy/3ZY=
X-Google-Smtp-Source: ABdhPJxX1X+VMdJOXI03+wSMcKfArtJ/0FyESFO+jXuC52iiuB5mTIqdkF4rrhU4s89QoAhxuSjrWw==
X-Received: by 2002:a17:906:b30d:: with SMTP id n13mr4177890ejz.511.1641551794021;
        Fri, 07 Jan 2022 02:36:34 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:33 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 08/19] staging: r8188eu: rename fields of struct rt_firmware
Date: Fri,  7 Jan 2022 11:36:09 +0100
Message-Id: <20220107103620.15648-9-straube.linux@gmail.com>
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

Rename fields of struct rt_firmware to avoid camel case.

szFwBuffer -> data
ulFwLength -> size

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 22 +++++++++----------
 drivers/staging/r8188eu/include/drv_types.h   |  4 ++--
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  4 ++--
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 5c1da9dd179b..ee684b37ff91 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -530,15 +530,15 @@ static int load_firmware(struct rt_firmware *rtfw, struct device *device)
 		goto exit;
 	}
 
-	rtfw->szFwBuffer = kzalloc(FW_8188E_SIZE, GFP_KERNEL);
-	if (!rtfw->szFwBuffer) {
-		pr_err("Failed to allocate rtfw->szFwBuffer\n");
+	rtfw->data = kzalloc(FW_8188E_SIZE, GFP_KERNEL);
+	if (!rtfw->data) {
+		pr_err("Failed to allocate rtfw->data\n");
 		ret = _FAIL;
 		goto exit;
 	}
-	memcpy(rtfw->szFwBuffer, fw->data, fw->size);
-	rtfw->ulFwLength = fw->size;
-	dev_dbg(device, "!bUsedWoWLANFw, FmrmwareLen:%d+\n", rtfw->ulFwLength);
+	memcpy(rtfw->data, fw->data, fw->size);
+	rtfw->size = fw->size;
+	dev_dbg(device, "!bUsedWoWLANFw, FmrmwareLen:%d+\n", rtfw->size);
 
 exit:
 	release_firmware(fw);
@@ -558,17 +558,17 @@ s32 rtl8188e_FirmwareDownload(struct adapter *padapter)
 	u32 FirmwareLen;
 	static int log_version;
 
-	if (!dvobj->firmware.szFwBuffer)
+	if (!dvobj->firmware.data)
 		rtStatus = load_firmware(&dvobj->firmware, device);
 	if (rtStatus == _FAIL) {
-		dvobj->firmware.szFwBuffer = NULL;
+		dvobj->firmware.data = NULL;
 		goto Exit;
 	}
-	pFirmwareBuf = dvobj->firmware.szFwBuffer;
-	FirmwareLen = dvobj->firmware.ulFwLength;
+	pFirmwareBuf = dvobj->firmware.data;
+	FirmwareLen = dvobj->firmware.size;
 
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
-	pFwHdr = (struct rt_firmware_hdr *)dvobj->firmware.szFwBuffer;
+	pFwHdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
 	fw_version = le16_to_cpu(pFwHdr->Version);
 	fw_subversion = pFwHdr->Subversion;
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 2dd5ebaaa921..388822dd325d 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -117,8 +117,8 @@ struct registry_priv {
 #define MAX_CONTINUAL_URB_ERR		4
 
 struct rt_firmware {
-	u8			*szFwBuffer;
-	u32			ulFwLength;
+	u8 *data;
+	u32 size;
 };
 
 struct dvobj_priv {
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index b65e44f97826..08d719822062 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -789,8 +789,8 @@ int netdev_close(struct net_device *pnetdev)
 
 	rtw_p2p_enable(padapter, P2P_ROLE_DISABLE);
 
-	kfree(dvobj->firmware.szFwBuffer);
-	dvobj->firmware.szFwBuffer = NULL;
+	kfree(dvobj->firmware.data);
+	dvobj->firmware.data = NULL;
 
 	DBG_88E("-88eu_drv - drv_close, bup =%d\n", padapter->bup);
 	return 0;
-- 
2.34.1

