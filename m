Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C838E2567
	for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 17:54:53 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id g18so23490480ejc.10
        for <linux-staging@lists.linux.dev>; Sun, 17 Apr 2022 10:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0hjkhnlwJyVMU2AUpWHdvtIxfINbruD73WC12kbTecg=;
        b=onnNgsfGHFMQxV97R5b5CO0cwjKjy0A3+ZYtLhVYhbEWbgJRw+NLdfmH82ZO42k8Q5
         LZAzbTed4Ik3QmRe3eVUZ03nPBH2iuVx5fxhA5dxRGffZ+Fo+9RC8t8fdCx8Bs0P7RBk
         5tXwSuZzod78rX1A4815G7+jgEr04KWI0LBc7VECrE0h/i8C+XUuYLyO59YHC/e39MHn
         sdskRDvwVvdyqJGSMCJ2RPa9p2DYKzn7yd5ijTzdQ+QcYHjWVtWT0HlHGBtQvfQxKg/x
         pRLj8tgZOvU7tVu88qBWV8wL7g7gRZ7Znz+RlBWCzxX0Mb8Fg04SyFw5M3gF+IxwPoNl
         wQLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0hjkhnlwJyVMU2AUpWHdvtIxfINbruD73WC12kbTecg=;
        b=CkHL7ux0xw1m853ljwr0ifHiICH6FrxBaA1dqCFx3i2sBIgBinB84srva624XueJqF
         NUj5a/qkPJ0Xao3tPc5mJcWFokNSfWzzCp2cMKL0Wtfm1qadvkkXPLY3SRSaHJBCoO9H
         7e8ah3dQphLvB+aoLBTwp+VP8NYzlqxdbSqg9ca4A0z75t7P0GbPJl2dX40ID5BpHOAR
         sH7apWcoEpVBtbKuQxJu45wmLLiCdedd11rChFTV01m/AfHwMxENQM35/iWS+Dec1ACi
         sCV1Ah5c/oCb1IukICgk+SQCeVU15Ml8lRf+G2lszEXxF178eQLl2w0s/jOJaz+raIIb
         cc0Q==
X-Gm-Message-State: AOAM532INEdRb5lqNfKETfjVqZ2ezMKQkGyueQALA7m9B2OGEiCImaWT
	XtxjVu3cKp0qfuvERMu2JXs=
X-Google-Smtp-Source: ABdhPJwRE4TM2Uv9ctJx+uZMtaGNyIBc2VTQiW7EV36qn4EQMF9318gtirSKRpsvEkNiXUdfw3k4lQ==
X-Received: by 2002:a17:906:280b:b0:6ce:f3c7:688f with SMTP id r11-20020a170906280b00b006cef3c7688fmr6248610ejc.468.1650218092200;
        Sun, 17 Apr 2022 10:54:52 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id jw12-20020a17090776ac00b006e87137194esm3719409ejc.150.2022.04.17.10.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 10:54:51 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v4 6/8] staging: r8188eu: remove variables from rtl8188e_firmware_download()
Date: Sun, 17 Apr 2022 19:54:39 +0200
Message-Id: <20220417175441.13830-7-straube.linux@gmail.com>
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

The local variables fw_version, fw_subversion, fw_signature in
rtl8188e_firmware_download() are only used in one place. Use the
assigned values directly and remove the variables to make the code
shorter and cleaner.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v4:
- no changes

v3:
- no changes

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 42b36505cf8b..7fa985cc787a 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -244,7 +244,6 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct device *device = dvobj_to_dev(dvobj);
 	struct rt_firmware_hdr *fwhdr = NULL;
-	u16 fw_version, fw_subversion, fw_signature;
 	u8 *fw_data;
 	u32 fw_size;
 	static int log_version;
@@ -261,13 +260,10 @@ int rtl8188e_firmware_download(struct adapter *padapter)
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

