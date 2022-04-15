Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13713215
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 12:10:41 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id t25so9711422edt.9
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8KAY162R6REHgBPdBqhvvmTxa6PH0xoKVGSpUfSsZF4=;
        b=KfccGz9UIICu5SzHhnvSz+16pHm5dm8jmnihk9YkYRAv9ABjKX5Gazz1WfqSSk9v5O
         A1ctedVvVu6udB3vCVaj13TreytRJlIxbXtwtEGPbbB/RHTB2jTXOe23E/7b1fVB8CuV
         ix1pAqivV7GdXnruLgK9CECcCuYF4IlOl+K7/mB/vdCM/kSyx/X7lgKNX1JkvUvNlrt8
         Bb1kndCNaRchWyTffvipqMwtMHidL9h4HIZM3NWgnpBPJg/QXuQzcxTrKfNeuF3itN6R
         cgqWvzYo+f7VFzzWctzokrnDTrsB73RVDLRWA2FAQvobepzmpfbRNIUIaTe05tLCztEk
         4Yeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8KAY162R6REHgBPdBqhvvmTxa6PH0xoKVGSpUfSsZF4=;
        b=3WuxAgUgjQ+v1aliX1t8WBd6gPAOt9WmyLSN0Q+x9akzmY6RGdiY/TbKzLmMVwl6NS
         I2t9mJSaOcdzd0xpAkAexQZBvfg7skr5nqAUWbzkN2jSEkm5h0UnlHeHyQdH5GxGNA3j
         84Go/Eh8y0+1mBPKzq3ITZGOfIuZT1DLLCbz2+wYaqhI8Om8y80pJCZV5vF6527S5WKl
         xp1bF3Nf21eAb+P6rulkrJ6DVC7bvH9I5vNlKkkOJ624rTcNxPKrDGO/iu1eLhqwS/EB
         zptkySjyN23zQQvzldCOujwetnF0I6Exg8/eUp7x89su7Ykgs+YKcW48Q0W9qWqtzIGl
         /vNA==
X-Gm-Message-State: AOAM53240FevjTxuabzuTGcA+xJqKfHZViXN86DMMKC1Dsllpd68w52F
	CNNZwrioWk+VCmbjzsPr05E=
X-Google-Smtp-Source: ABdhPJzp+eY7lyQyNnnPvE7g/Fr3nWkXH8WYAEr0BptQnA6xyL/897xBASEi3KHTUZ3eiHKZQ19xag==
X-Received: by 2002:a50:a408:0:b0:41c:cdc7:88bd with SMTP id u8-20020a50a408000000b0041ccdc788bdmr8064984edb.399.1650024640201;
        Fri, 15 Apr 2022 05:10:40 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709063ad600b006e8867caa5dsm1626114ejd.72.2022.04.15.05.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:10:39 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 7/8] staging: r8188eu: use pr_info_once() to log the firmware version
Date: Fri, 15 Apr 2022 14:10:22 +0200
Message-Id: <20220415121023.11564-8-straube.linux@gmail.com>
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

Use pr_info_once() instead of a static variable and an if statement
to log the firmware version only once.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3:
- added back logging the firmware version only once, using
  pr_info_once() instead of a static variable and if statement

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index c102aba099f5..7ee72236c7f4 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -241,7 +241,6 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	struct rt_firmware_hdr *fwhdr = NULL;
 	u8 *fw_data;
 	u32 fw_size;
-	static int log_version;
 
 	if (!dvobj->firmware.data)
 		ret = load_firmware(&dvobj->firmware, device);
@@ -255,10 +254,9 @@ int rtl8188e_firmware_download(struct adapter *padapter)
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

