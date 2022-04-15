Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12163320E
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 12:10:41 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id c6so9706014edn.8
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oTYVhYWSzKwAMLeflfz6kIIWiCkCWj7eP186JTpFtoA=;
        b=PJOu5zElcuDrXbf8hOAmTWjYyGseIHiqbrS+V1b1DpzwvELip1pxqjJ2BBTGc5b6gk
         ZS98OfOE7wopGOwS+nJtU4kKPv7DswCCoCjXjJjn2/ao9p+uELfGyxwv/GcMPdYbMb4T
         gfuivYBzfkasFoKkrjOH+UIUjQWKmJeFOWMgA4EIapT8qip+x+W2MM4/uuDVXIKkARCe
         JWCh+eRl/dl7Kt8ilUx+dLt90BpuqjugRDom87xVrLhV4irL71lH3ijBCFTII8Hb54NL
         W0cO0H4OLprKcBsMwpJQwAIqUNzIqqF1eNNN5cYSAsRknY9OgppSRQZqqVfNO7L3Lc+4
         HzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oTYVhYWSzKwAMLeflfz6kIIWiCkCWj7eP186JTpFtoA=;
        b=g2UGhcnC/Pa7EX83hd+dpucF32ZKFSoxNhM+8UXceuMnVyJQ2qh1Pjn0bAASEhilxU
         uRAk/tzVOEh5Q4VCUCiBcZuJ5oxmeE6Q987oq5PhovjXHQMRLQYxDm4/ZjsQQygM+UCZ
         CEgOhQhuUhNltM60cEEcsjp805/2MiVljUHBVn2KGsp4/g8ccBF+wyjHSKLjsiQp8dVt
         1KzSiQZDyH8Hzs0F2zhAS65uAPTkr5ecX9F3YARg6+ED5ENK3rez8kfhDeSMIp2cF+yP
         9RV9VUgbaihtKackZWoJYzgSjKtYP1kGgwKdmXJE1zzQu+wt1yOBDgSMz57hJG71YqDi
         9jPQ==
X-Gm-Message-State: AOAM531Rlqhud0mByBcz8sgkvyu8NCIF6rYZlIAl5RGn7EJdDybVIcZn
	4zRoCKeDwBQxaLI9+GAQrEo=
X-Google-Smtp-Source: ABdhPJyBxROMVGQaY33pMHG3ZmIew8vBTdfu5ydjPsIMpCCQdAArrdXf5H9QMfZFDzqXHIYOOU+vmg==
X-Received: by 2002:a50:fc89:0:b0:41d:83d1:9df3 with SMTP id f9-20020a50fc89000000b0041d83d19df3mr7811095edq.19.1650024639443;
        Fri, 15 Apr 2022 05:10:39 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709063ad600b006e8867caa5dsm1626114ejd.72.2022.04.15.05.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:10:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 6/8] staging: r8188eu: remove variables from rtl8188e_firmware_download()
Date: Fri, 15 Apr 2022 14:10:21 +0200
Message-Id: <20220415121023.11564-7-straube.linux@gmail.com>
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

The local variables fw_version, fw_subversion, fw_signature in
rtl8188e_firmware_download() are only used in one place. Use the
assigned values directly and remove the variables to make the code
shorter and cleaner.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3:
- no changes

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 0279af37719a..c102aba099f5 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -239,7 +239,6 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct device *device = dvobj_to_dev(dvobj);
 	struct rt_firmware_hdr *fwhdr = NULL;
-	u16 fw_version, fw_subversion, fw_signature;
 	u8 *fw_data;
 	u32 fw_size;
 	static int log_version;
@@ -256,13 +255,10 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	fw_version = le16_to_cpu(fwhdr->version);
-	fw_subversion = fwhdr->subversion;
-	fw_signature = le16_to_cpu(fwhdr->signature);
-
 	if (!log_version++)
 		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-			DRIVER_PREFIX, fw_version, fw_subversion, fw_signature);
+			DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
+			le16_to_cpu(fwhdr->signature));
 
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
-- 
2.35.1

