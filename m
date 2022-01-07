Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504162CA3
	for <linux-staging@lists.linux.dev>; Fri,  7 Jan 2022 10:36:42 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id 30so18829126edv.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 02:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ae1LT6BYIsSPLNpfnlqvyliKMWS8qhf4JU634dpkwTo=;
        b=q7xk+u8wBWU5G8SPC0uyDBnkTdL6z5bTO98Nz2Au7yFDGLWOKZdX+NvYn8fQi9jJPO
         R7nu8cgsvtg0eaNXne4+10h+/xqtaumbZx91t79NagVQeUdQtUlt+cYrByavZFK12VNp
         O4MWW3v2uc/+muDTvCYuoiDFB+4JzjZpEd3qYHJyS8yW/0Wc+ATF5ySJquI7kf7GUxaV
         j9l1rfCLKBfLkARLgTnPTVwkDUjM2PKOtd2ZOmetemWPG4t/WLQq/iwYsLSXmfIyY4J7
         1qj3fLfiIlA0gHXQrLog+rlUZHK4bFWmFturoE3HVy2HXDulYb4wtdTLXAqEjyveZn1Z
         4PSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ae1LT6BYIsSPLNpfnlqvyliKMWS8qhf4JU634dpkwTo=;
        b=3vXSmsuCkpbDtHKUl8m2OSd4DRyQAcTXxtMDBkmTRR8mYzUq7Wpqd5Yas3bI5QldNu
         upAH+wlrXCESDEKS4EC4SHBS//6btz26/pWde+Y99ri3QvttGBmQVCG0uoNJUHMcb+7D
         zbMblpAIA2S0v4h7gc9dulsaytX0qL28yWzFmQjv8Ij7rerfVuMH7ULjyl3cLas1IS27
         3IYrGNvYoOa646yRk3PdDJ0KuHrd3UirC46aMexMBMQtTvl93MIzFZHI+4XMfWhYZZoe
         hvSGr9ZTxaSUuSz0szfeGhMtFzoxPWEQheyr8oJSukjqWL24djJgC7DNWhYu7donNplv
         WabA==
X-Gm-Message-State: AOAM532MzJNAaF0MTnhbylRznhv4MxG0lkX13Zsp0bDueOlUwHmd2VH6
	ov+TXY1XKhSzWv9SeXFfULE=
X-Google-Smtp-Source: ABdhPJwliMrTzZrYIvx/BNzB6C2naRIlckqLdNDIR7+DWvQ2DFUpk5bLRUZCUUSSLOGDmzmC78NPmw==
X-Received: by 2002:a05:6402:1602:: with SMTP id f2mr8234534edv.80.1641551800834;
        Fri, 07 Jan 2022 02:36:40 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::51e2])
        by smtp.gmail.com with ESMTPSA id v8sm1869857edt.10.2022.01.07.02.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 02:36:40 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 18/19] staging: r8188eu: rename pFirmwareBuf and FirmwareLen
Date: Fri,  7 Jan 2022 11:36:19 +0100
Message-Id: <20220107103620.15648-19-straube.linux@gmail.com>
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

Rename the variables pFirmwareBuf and FirmwareLen in
rtl8188e_firmware_download() to avoid camel case.

pFirmwareBuf -> fw_data
FirmwareLen -> fw_size

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index c2112df0ac82..3c9ddbe16754 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -548,8 +548,8 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	struct device *device = dvobj_to_dev(dvobj);
 	struct rt_firmware_hdr *fwhdr = NULL;
 	u16 fw_version, fw_subversion, fw_signature;
-	u8 *pFirmwareBuf;
-	u32 FirmwareLen;
+	u8 *fw_data;
+	u32 fw_size;
 	static int log_version;
 
 	if (!dvobj->firmware.data)
@@ -558,8 +558,8 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 		dvobj->firmware.data = NULL;
 		goto exit;
 	}
-	pFirmwareBuf = dvobj->firmware.data;
-	FirmwareLen = dvobj->firmware.size;
+	fw_data = dvobj->firmware.data;
+	fw_size = dvobj->firmware.size;
 
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
@@ -574,8 +574,8 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
 		/*  Shift 32 bytes for FW header */
-		pFirmwareBuf = pFirmwareBuf + 32;
-		FirmwareLen = FirmwareLen - 32;
+		fw_data = fw_data + 32;
+		fw_size = fw_size - 32;
 	}
 
 	/*  Suggested by Filen. If 8051 is running in RAM code, driver should inform Fw to reset by itself, */
@@ -591,7 +591,7 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 		/* reset the FWDL chksum */
 		rtw_write8(padapter, REG_MCUFWDL, rtw_read8(padapter, REG_MCUFWDL) | FWDL_CHKSUM_RPT);
 
-		ret = write_fw(padapter, pFirmwareBuf, FirmwareLen);
+		ret = write_fw(padapter, fw_data, fw_size);
 
 		if (ret == _SUCCESS ||
 		    (rtw_get_passing_time_ms(fwdl_start_time) > 500 && write_fw_retry++ >= 3))
-- 
2.34.1

