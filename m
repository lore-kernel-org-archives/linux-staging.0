Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658687B
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:39:15 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id u15so8620158ejf.11
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UqSU6uGvzefM7JqsLVkp47vheVpreBM8RRaia816jV8=;
        b=fJxEecFFxrOn0EueDfzfdFYNkDi7VyjFuEqZA68NnzPDC5IOQ4sffH4hGLLmq+v6JF
         bD2CrcrYFhseb01NvTx9njFY+1/vVGY8a4gcV33l7BgBHnH77viHZowL9By7aO7rRWxx
         SSFAqSdbLT490hWUKaUMDqIiRsYj/FIW8+98fPf5xE5Pf18m7B85JkUPuKFOxE1X7Oq0
         mKQEaQD4TFRaH5nZpv8RgQD/1bZfuXOIbZFoIMXcL7jtIhNyIDghw2Ndf8y14DNxvunv
         VqmejS60wgWOrpaEOLBXXX6JG2g+qOIDthLzSnWeVMhSFQEmvMYREiArRbS/EVYbfyA0
         8G7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UqSU6uGvzefM7JqsLVkp47vheVpreBM8RRaia816jV8=;
        b=f3J2ameDptADPcPGWicwfRCr24hsFviNlMuADbk+rdHcCrzl/Tcs5O7QCdjQgGKwKP
         TfS9xi4ijaQ828RnKMUclTn/Pf1szzy6FU0QAkylHP1DzzJuJ/9eLwC+MvtJdPG36ZGJ
         6pnGxnBrvGovoAWKlhFX9r+Tg8Zli9DR0uRT8QfOGR0e2jHfLHhz8YBd4lVuhgH+tzCm
         dW1BTfrlYzJf5iMffr4ENo5eT4IeV1yg/sS0BlZT2yHvrSyOtc+mcgUBfBQT0y0xVdlw
         7W/7OzM2AGcGsvz56Y/EsWIrqO5AxXgObsBQAMnw1bxvb9slA6WOOOFVk2lGLljL1yoN
         KSEg==
X-Gm-Message-State: AOAM530gS0VGE+gWFqHn6zXQRiiIH07FIgiIRqnOIc6oSCv4M9BHOsDa
	u7BIBZM0lws+8tmUoW7Jop8=
X-Google-Smtp-Source: ABdhPJwpaGNjqIdCer8Ui1XN0n5nWE6nuXkwc31+cYETm/IFNZdI5z9zF3n+PWmvD1dljt9eHeVfCg==
X-Received: by 2002:a17:906:c091:b0:6db:62b6:f4cc with SMTP id f17-20020a170906c09100b006db62b6f4ccmr1413652ejz.607.1649925553721;
        Thu, 14 Apr 2022 01:39:13 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id ah13-20020a1709069acd00b006e8a0b3e071sm418138ejc.110.2022.04.14.01.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:39:13 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/7] staging: r8188eu: always log firmware info
Date: Thu, 14 Apr 2022 10:38:52 +0200
Message-Id: <20220414083853.3422-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414083853.3422-1-straube.linux@gmail.com>
References: <20220414083853.3422-1-straube.linux@gmail.com>
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

