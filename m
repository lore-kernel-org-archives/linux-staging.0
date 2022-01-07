Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8359F2CA1
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:30 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id q25so11819086edb.2
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=okGzmf14e86UQU6BO3rbed+LRlBp1j5DltJ6EEYherw=;
        b=MRL0Z7pOhn9la+SogT2T1MGdTEJH439FaHQIgz+kq3DVrd41NoKbpSeb9pQ4c+DkJa
         HZMfO5VkAuSJqy+KvxDwjSSdcH58NN/aiK7zIOLOcTxtenrbrKEdrgzEIQ1UMvfU0A+v
         SwJV7nNMNWNVjq+crThnN/BEeZREyaJFY33oOgqfra8gi4GQsevKzS7eICkcgbNRiIEm
         2JFREtF6Q7H9ecw0pV5XU8pbxsSBvaK8wW5KF1P+BMzbs8kit183tsvUBQSxSJ28QlUP
         TfERqSlr/Di4+wf3w5GQSaYdQT5duCtNeoQNqsEbQnvoPpTmbpLp3tH/a09PafsQRsIj
         knYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=okGzmf14e86UQU6BO3rbed+LRlBp1j5DltJ6EEYherw=;
        b=4Eh36clW7PFj39tFT2hD0rsmmYrWX0yRU/xPjRf7CgOPIKYH1SHC+18Sfs3YrBz5zK
         1c+cJr2A7aUy6jw+Y3wvoEcpwF/buUNBtzwpSLYU3OVeDyERIal2hRr2hN5au2xqKfMU
         qIOWyvlwp9aciL9mUiNydQB37PWulk/SZpeHE4ME1jlbHp76LSB+KAd0PmO5VYBVzmPC
         qer8k6pq4s/aSGI9f7/vlr1OLh4RKNuDeXA6wd4zQvQgz8iRgEcavOAu4wjlMbsF2S2y
         4R1fS4kluw4/YwWklBZ43DEiax2++PJjyCS1Or119m/1XJ/EsztwwCZUrAG+wQlxFfDy
         t3BA==
X-Gm-Message-State: AOAM530L6ZKvx8YhgcmqtK5A/M86CzQRuJIjY9uo4WLtWhBDCU13Zsem
	kjzCdaLU5q5mmp2d70URt+Y=
X-Google-Smtp-Source: ABdhPJw9+9yqXDvwLU8H0MmBWVfEZqL1/lWsh60xek+ClSo1VjJuXTeOeUBwjFM2PIRwydp6j8CB6Q==
X-Received: by 2002:a05:6402:4311:: with SMTP id m17mr62756811edc.110.1641551789001;
        Fri, 07 Jan 2022 02:36:29 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:28 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/19] staging: r8188eu: remove Firmware* from struct hal_data_8188e
Date: Fri,  7 Jan 2022 11:36:02 +0100
Message-Id: <20220107103620.15648-2-straube.linux@gmail.com>
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

The fields FirmwareVersion, FirmwareSubVersion and FirmwareSignature
of struct hal_data_8188e are only used in the function
rtl8188e_FirmwareDownload(). Use local variables in that function and
remove the fields from struct hal_data_8188e. FirmwareVersionRev is
not used at all, remove it as well.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 11 +++++------
 drivers/staging/r8188eu/include/rtl8188e_hal.h  |  4 ----
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index b818872e0d19..20e4a12801cf 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -550,10 +550,10 @@ s32 rtl8188e_FirmwareDownload(struct adapter *padapter)
 	s32	rtStatus = _SUCCESS;
 	u8 writeFW_retry = 0;
 	u32 fwdl_start_time;
-	struct hal_data_8188e *pHalData = &padapter->haldata;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct device *device = dvobj_to_dev(dvobj);
 	struct rt_firmware_hdr *pFwHdr = NULL;
+	u16 fw_version, fw_subversion, fw_signature;
 	u8 *pFirmwareBuf;
 	u32 FirmwareLen;
 	static int log_version;
@@ -570,14 +570,13 @@ s32 rtl8188e_FirmwareDownload(struct adapter *padapter)
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	pFwHdr = (struct rt_firmware_hdr *)dvobj->firmware.szFwBuffer;
 
-	pHalData->FirmwareVersion =  le16_to_cpu(pFwHdr->Version);
-	pHalData->FirmwareSubVersion = pFwHdr->Subversion;
-	pHalData->FirmwareSignature = le16_to_cpu(pFwHdr->Signature);
+	fw_version = le16_to_cpu(pFwHdr->Version);
+	fw_subversion = pFwHdr->Subversion;
+	fw_signature = le16_to_cpu(pFwHdr->Signature);
 
 	if (!log_version++)
 		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-			DRIVER_PREFIX, pHalData->FirmwareVersion,
-			pHalData->FirmwareSubVersion, pHalData->FirmwareSignature);
+			DRIVER_PREFIX, fw_version, fw_subversion, fw_signature);
 
 	if (IS_FW_HEADER_EXIST(pFwHdr)) {
 		/*  Shift 32 bytes for FW header */
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 8134a173ea07..9133f3b0acc1 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -162,10 +162,6 @@ struct txpowerinfo24g {
 
 struct hal_data_8188e {
 	struct HAL_VERSION	VersionID;
-	u16	FirmwareVersion;
-	u16	FirmwareVersionRev;
-	u16	FirmwareSubVersion;
-	u16	FirmwareSignature;
 	u8	PGMaxGroup;
 	/* current WIFI_PHY values */
 	u32	ReceiveConfig;
-- 
2.34.1

