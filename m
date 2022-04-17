Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B2E258A
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 17:54:54 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id t11so23482410eju.13
        for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9MDV0/SfYE0g/BRQSyONptj6V2+VN8KUp8JOekp0ChY=;
        b=dNV9jqlDcvOWKoI9yIR6gNroK1LPp2f7YPSy7sxp6ufMs7u6+8ERSPWJ7o4SWo7Dca
         VJF5X9XZakL7ETn2B2fECY3tKAptRbzBPHTTNi+DNP5PU7rFLs1+VRJ7R4edgzQ9AAyc
         Qvbilq/0pXwTjv/AIAeyl/aPh5jJ8oY253uis81SCI+VmXqobrZEK39LxIRgYWAHCvNK
         qGtbdWi6A/GaOU+dGQcmS6VFLbFktbdJXdHLji0zNq1X+ruyGWj9Q0BdCFGm7oSEN3Sh
         /hrhbUNhTLZ8pVL6CyqqNCL/aWzF8uVjAtL3X4FIpudX/Vf0y59mFXswWIWd1VwSp888
         D7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9MDV0/SfYE0g/BRQSyONptj6V2+VN8KUp8JOekp0ChY=;
        b=N0gWkvzKgzJicvznkDc5VtKzqVDVgY0+tT6KoUmEyHFPQS9MyZeSJHrpfCdk5P2C5D
         90tIw84Ve2weh/swQTthEkCHPeISWV1TBK/H4HjLjoZmSJao4hOlQVMMkKZrQI7KwIJQ
         s42syCMsJkhOeFfKgFW1Uz/UinxrkST1zFFsD+ostDiIm9pf+U/saB3YFd47LTkvJu/f
         sP6c3WuEzwpfgVEWnZeD6eRVAsaFui1+78OSA3IZN2NmCWT/JzoxmuXubtMtvJ02Q6lO
         3DF/pnp/Z/ZUVQJAGekPqC4K2c17NMvCEe9nHLLNlOQdjFvBMGDGkiNkpFxoJeF3Xi9y
         A1FQ==
X-Gm-Message-State: AOAM53195W1kd30aqa/mV8KOHNMlWqkr9srrdRuIjCVYDG/7RNzhgDQ7
	aYMlcC0xODsr1SQcn2ShGxw=
X-Google-Smtp-Source: ABdhPJz9wj2GiUC4EiQUAWFDal6IptWIYB4nGu0JskCND41prKDeVnyt02JT+o235OQIcosEHNbnBA==
X-Received: by 2002:a17:906:5006:b0:6ce:3762:c72e with SMTP id s6-20020a170906500600b006ce3762c72emr6396051ejj.30.1650218093041;
        Sun, 17 Apr 2022 10:54:53 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id jw12-20020a17090776ac00b006e87137194esm3719409ejc.150.2022.04.17.10.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 10:54:52 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v4 7/8] staging: r8188eu: use pr_info_once() to log the firmware version
Date: Sun, 17 Apr 2022 19:54:40 +0200
Message-Id: <20220417175441.13830-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220417175441.13830-1-straube.linux@gmail.com>
References: <20220417175441.13830-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use pr_info_once() instead of a static variable and an if statement
to log the firmware version only once.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v4:
- no chages

v3:
- added back logging the firmware version only once, using
  pr_info_once() instead of a static variable and if statement

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 7fa985cc787a..7c0653bb3bbc 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -246,7 +246,6 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	struct rt_firmware_hdr *fwhdr = NULL;
 	u8 *fw_data;
 	u32 fw_size;
-	static int log_version;
 
 	if (!dvobj->firmware.data)
 		ret = load_firmware(&dvobj->firmware, device);
@@ -260,10 +259,9 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	if (!log_version++)
-		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-			DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
-			le16_to_cpu(fwhdr->signature));
+	pr_info_once("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
+		     DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
+		     le16_to_cpu(fwhdr->signature));
 
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
-- 
2.35.1

