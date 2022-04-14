Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9A17D4
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:43:53 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id u15so9178058ejf.11
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UqSU6uGvzefM7JqsLVkp47vheVpreBM8RRaia816jV8=;
        b=EPhy7/ZQXKLEPglQ9Yf7BZJg6s4m0VoAeydJ8uetqwmPJkMPW0qIKvJPGEozN6rXhh
         zyuuilCGrBMBf1ixfkTEA8b+SX2c6ibg0Aykjpl2XN6xMCR9U08O3IjiEN07Zp3+meGl
         d5b1N6r5ThgRE1pjcSjhXhKVdazk9hncQrFUMCeBhNPQ62DCSQr2kfeZqKMRmRSuaCgS
         Rkz3lg2wlheg88U7MRcNRhUWfpnQpmzBuvpoZoME7oa+rwU6Q1wlkNtOmLd2BZMWl2f2
         uZ8ITrN4hNmdwW2KxCr8Hq02Tnn6cJ/fOhKutv/9mIFXg9RaMnphybn8JOqn5ZZhpach
         thWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UqSU6uGvzefM7JqsLVkp47vheVpreBM8RRaia816jV8=;
        b=pOLtBRqWR4M39pvX5iP3/kvT1QwO2GjlPe+okJJChaT8mmSi6E9VHcBiD5YDj0Jz1q
         o2vBdTTInurf0jAGPPNlGCVT7bkqws8SKk7d+c707dbkPQ7xkmnOH6WZ6oc4VrC8n2X4
         DFR8hk/n+2EggbVhvBCEnJn15B92kXK8mpIrl+RN7P7dk5dUB0ffvwkhaB8HFQB3JZxV
         pWbf0WyVVoQLM+fDnRRwYuT+Zc5AVPMPgVUBSqRKV0ow6BhQxi1mF4+z0SGyG1s6kYk/
         ggqaETM17T9RyZDWcoovd08To4zY4hE9HRVC5Pl09n81k0b5NQfMrpMj6shavtCk+Iz+
         CUDg==
X-Gm-Message-State: AOAM5324ZdwUORWW0l7wQtxZUc99LG9C7Ufhp7UkqQCPzglOc2t1T3ad
	TXAgaIaiEYltqKvZFMRuIGY=
X-Google-Smtp-Source: ABdhPJwsbeir2WfwtRfQ2AKmGoQyu5tVJfNVyMmQ69tQEtA+fV69250Ivp0T1qS4N5lXuXJN5/oxoQ==
X-Received: by 2002:a17:906:b107:b0:6e0:a25a:af6e with SMTP id u7-20020a170906b10700b006e0a25aaf6emr1755104ejy.359.1649933031568;
        Thu, 14 Apr 2022 03:43:51 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm821318edt.34.2022.04.14.03.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:43:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 6/8] staging: r8188eu: always log firmware info
Date: Thu, 14 Apr 2022 12:43:21 +0200
Message-Id: <20220414104323.6152-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414104323.6152-1-straube.linux@gmail.com>
References: <20220414104323.6152-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local static variable log_version prevents logging the firmware
information more than once, e.g. when the device is unplugged and
plugged again. That is not necessary and complicates the code. Remove
it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index cbc4980bd938..64963507a346 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -239,7 +239,6 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	struct rt_firmware_hdr *fwhdr = NULL;
 	u8 *fw_data;
 	u32 fw_size;
-	static int log_version;
 
 	if (!dvobj->firmware.data)
 		ret = load_firmware(&dvobj->firmware, device);
@@ -253,10 +252,9 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	if (!log_version++)
-		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-			DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
-			le16_to_cpu(fwhdr->signature));
+	pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
+		DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
+		le16_to_cpu(fwhdr->signature));
 
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
-- 
2.35.1

