Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C2015DD
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:39:14 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id s18so8762692ejr.0
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HMcu7zgQS9k0Bz6hvTLZm8qcxNG9rHsrt5l+a1uteew=;
        b=HxxLqMTpDnGghlOJCrI6VO3kHrRfInik98yusjKYaUCi3PDZAzBVo7Cmyqj9l/M9vI
         eM7XVIgzkTlb8JUdACCp03XO2lX9kUsMcyJ8o1ENHF07lM6tKA9RsQkHi+3Y/o7gkO1e
         ZIJnoAcz/dnvPjbMpJaJulo125qo0mTYoh+l06i/zlm9R8BZCRhJuVmV500t7CY/lLUw
         k5pRX/EQAZxPHDsj0Z4l4gXX1OvsRbXQ2FbeH+d+eGjlu/grZkoaNVlpe8MIW+LN3QLX
         RbRcd6/hFa6/KXqubsywYOCC73ogDUtvKdJlnddbohT7ikSZTkLozY+mOb26PZ9BqSyl
         tGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HMcu7zgQS9k0Bz6hvTLZm8qcxNG9rHsrt5l+a1uteew=;
        b=SwtpeRVbUhcFXPdUPjSniemXpf+xtf+g+DyLLHgn4gvMZpi4V+Ex1IJs+Hsj+qYKCg
         loG6TIPvqq84KkNnoTrGaN2zVhc979zCHUK1jLc61TGzEGivSKgOcbiyaxSD4qClnpJe
         f3yFgQGk5a+klkc+NiQGIii6Dvc/Uw8kMNLVoRq3dv2k/Tp1JW/V1YgjBF3K02AjBWNm
         rvYmgfBON/gQd0i6cJ3YAE/D7F0tIlG+qD/vjm3X/JhUcc3dUl4AnUnTmYyE1sdRrEr3
         8jqbqgoQXp/LAHeZv1Z4j1HuazNA/7mZpThCVuPTC/VRLMTJ0rzEEpb69QvZiUT/CHZu
         1P0Q==
X-Gm-Message-State: AOAM533gw7iCieDVkEqe/qg4NGO+yP29qE2gVtMuGYlVzZOCkW2dPUqg
	IR1rYAkuJ2DnQbTR4iExISs=
X-Google-Smtp-Source: ABdhPJx2hyNJ1+jIf+8bbw/F8ew0aElmPrta6mWMlt6UVwiX2Bw7bpuKF5a4nXYSP4kd//T4qqNPXQ==
X-Received: by 2002:a17:907:d90:b0:6eb:557e:91e6 with SMTP id go16-20020a1709070d9000b006eb557e91e6mr1318440ejc.376.1649925552933;
        Thu, 14 Apr 2022 01:39:12 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id ah13-20020a1709069acd00b006e8a0b3e071sm418138ejc.110.2022.04.14.01.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:39:12 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/7] staging: r8188eu: remove variables from rtl8188e_firmware_download()
Date: Thu, 14 Apr 2022 10:38:51 +0200
Message-Id: <20220414083853.3422-6-straube.linux@gmail.com>
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

The local variables fw_version, fw_subversion, fw_signature in
rtl8188e_firmware_download() are only used in one place. Use the
assigned values directly and remove the variables to make the code
shorter and cleaner.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 94526064f29b..cbc4980bd938 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -237,7 +237,6 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct device *device = dvobj_to_dev(dvobj);
 	struct rt_firmware_hdr *fwhdr = NULL;
-	u16 fw_version, fw_subversion, fw_signature;
 	u8 *fw_data;
 	u32 fw_size;
 	static int log_version;
@@ -254,13 +253,10 @@ int rtl8188e_firmware_download(struct adapter *padapter)
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

