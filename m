Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9226D2CA5
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:41 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id m21so20659819edc.0
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HXxYbv8QQ5Kx3Qo8hWix546ZTepBJTXTM4k01UwT9yQ=;
        b=eYxnUX/ZyYeCKYVS8AOqsIsP47Nba4XSCGTCVbsghBU7nlmfgkYEjomA9Z/Za3p8uP
         59DiL55muWNe2ttxXb93+SSo3d2oR+yVzIUvHFNOy2Mw+qKCr9bf2GrwJJQsgjf7ZoNR
         UuftKZWVMs6GRBnG7WMS7wdfswOI30eKMPfvtrdocxulqCF91ccyUqwFxBaBNYnAMBVL
         MqETL+GYgDtTkSoh1wrxzDFS0U467UQeBzdQby6C+LbeBE3/oV2M+s52PEPrSRTE5Jnn
         oLejpocGJKHOgGm1rhqReUCCRumOoj4aU20JM9QjuTXGlmEKaONjk9maunzRNlyxetz+
         QeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HXxYbv8QQ5Kx3Qo8hWix546ZTepBJTXTM4k01UwT9yQ=;
        b=Ut77Y7lhuM18Il6BmFGlPkqsmIJVE4imhpKo13y76EXpnJwYOPnPiU2kdu0YpniCP0
         FTTfeMB12eTVbQVNiMqVf+z7tfo840bST3hiTet/H2lTIl00ZDu+OZU1O3Ke0InQe7nR
         0sAnSqVXsRYm4awHjqewPEKj0iAmHzrbkUDpuUS0Bsj0NTrZvUjFlr9KITo4y5l56Jp5
         VrEB33Di4X3WjtD/fuaBgL1/5Pz4S/mYiaZFO+tg2kVkpsdhntKkk3LrtTcf3WxKUImX
         t0L+uHLO5PsZIl3hhxLYVeL2yBZXEluBNat3ndHgDWrlSAePE5GDyHwD/wddBmqM0h/q
         CFmw==
X-Gm-Message-State: AOAM532mqDBrT3g9FPnt98YO2uH7tHrJ4GpQEdWJBB/giP2nFw99CH9j
	qA4iNF4pmfqNY8niiyRaPIU=
X-Google-Smtp-Source: ABdhPJyywgqS+1mQIZYbDpEHxXLXK7C/MUHEvFNiPTJ/bizl9rKby1B/U0eRNyoiipESiu6QfFLPOA==
X-Received: by 2002:a05:6402:1e8a:: with SMTP id f10mr62279748edf.52.1641551800035;
        Fri, 07 Jan 2022 02:36:40 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:39 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 17/19] staging: r8188eu: rename pFwHdr in rtl8188e_firmware_download()
Date: Fri,  7 Jan 2022 11:36:18 +0100
Message-Id: <20220107103620.15648-18-straube.linux@gmail.com>
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

Rename the variable pFwHdr in rtl8188e_firmware_download() to avoid
camel case.

pFwHdr -> fwhdr

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 15e8dc0b9a37..c2112df0ac82 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -546,7 +546,7 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	u32 fwdl_start_time;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct device *device = dvobj_to_dev(dvobj);
-	struct rt_firmware_hdr *pFwHdr = NULL;
+	struct rt_firmware_hdr *fwhdr = NULL;
 	u16 fw_version, fw_subversion, fw_signature;
 	u8 *pFirmwareBuf;
 	u32 FirmwareLen;
@@ -562,17 +562,17 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	FirmwareLen = dvobj->firmware.size;
 
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
-	pFwHdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
+	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	fw_version = le16_to_cpu(pFwHdr->Version);
-	fw_subversion = pFwHdr->Subversion;
-	fw_signature = le16_to_cpu(pFwHdr->Signature);
+	fw_version = le16_to_cpu(fwhdr->Version);
+	fw_subversion = fwhdr->Subversion;
+	fw_signature = le16_to_cpu(fwhdr->Signature);
 
 	if (!log_version++)
 		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
 			DRIVER_PREFIX, fw_version, fw_subversion, fw_signature);
 
-	if (IS_FW_HEADER_EXIST(pFwHdr)) {
+	if (IS_FW_HEADER_EXIST(fwhdr)) {
 		/*  Shift 32 bytes for FW header */
 		pFirmwareBuf = pFirmwareBuf + 32;
 		FirmwareLen = FirmwareLen - 32;
-- 
2.34.1

