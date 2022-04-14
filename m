Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7826B15DD
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:39:12 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id p15so8661182ejc.7
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SVFAJRqd3IbNMgTMyXPpJtbL2G7uewgHBXHJSIvHW0o=;
        b=VE8YjlWUKgkchXEYuJVz5rbZ07MGhtaOwGwA7HmAK6bA4qU3xj3YGDjn5/smmYiB8k
         Ww6zgK7ju9y67TXHRHkeP4WmDgrVXT6+wOGLMkxecOTp67SPIRE912TGf+houWsc5UUs
         WSLE4Imqjecg+cA/1ijEc4pcjlnZ6kTeRtBRbb0Oi3NxQntbt4y8CkQysj5KfGq+9C6K
         u5IHgpOIO+rheL/+MLVVbLJtxcrpoCUS+18MPYbJ4tuQzCqfty/3sJqC1G8BNBeLYTVr
         kJf6tAgwYi6gmr2ZU1R5bRbYfPsdQ0RwCMhdIyn8vUlzNqyhv6x/0v0o0upbB/dJtUd0
         0nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SVFAJRqd3IbNMgTMyXPpJtbL2G7uewgHBXHJSIvHW0o=;
        b=oZoOKf1YPJ1ISSoCUq7t2NhsHZWOreDg22l8SCsGEVAfL/NJxCoNiqfdJP9xbarJfu
         k4bN9ofWDrCvMFnR1YSXJGhi+X00xn33VDib4QKpjAM6ML2JO3/SGsnfAlofXfXr4t/T
         k5AjcGk/UKh3h9xSrP7L8mVu/gXLe+GCFETI+n20E63/aqDGjMeQXSABHmgdWDXKgz9u
         MmB8hpvWDEGnCFLR/CKZi+X6AXM2xe0t/06tuiWFQCYH/urVCZdgEysO8QiLQI5QNt3Q
         FYd6b/0EeJPTDBEk3BUFTtVp4bimbS3eL5ertHEfxGXmHhzt+MVTGw0FqQUz2ZWT2v6k
         acxQ==
X-Gm-Message-State: AOAM531OcwZ4UGjt3lJwdi7jEvl5j6XOvvZ5CezlkRYlANneD+pKSQ9T
	Gvs8CTApsOn/2wG2MUKsXK8=
X-Google-Smtp-Source: ABdhPJwE+55knosR+8ffRZiPRdSADpNTwIDEQtqd4XoJx0T/1fPU6tA7ZE86xbhsWXT7Ga3knjR1zA==
X-Received: by 2002:a17:907:2cc7:b0:6df:b76d:940d with SMTP id hg7-20020a1709072cc700b006dfb76d940dmr1407774ejc.742.1649925550815;
        Thu, 14 Apr 2022 01:39:10 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id ah13-20020a1709069acd00b006e8a0b3e071sm418138ejc.110.2022.04.14.01.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:39:10 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/7] staging: r8188eu: rename fields of struct rt_firmware_hdr
Date: Thu, 14 Apr 2022 10:38:49 +0200
Message-Id: <20220414083853.3422-4-straube.linux@gmail.com>
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

Rename the fields of struct rt_firmware_hdr to avoid camel case.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 48 +++++++++++++--------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 323e0c634c4e..3da52a1ba23c 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -9,29 +9,29 @@
 #define MAX_PAGE_SIZE		4096
 
 #define IS_FW_HEADER_EXIST(_fwhdr)				\
-	((le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x92C0 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88C0 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x2300 ||	\
-	(le16_to_cpu(_fwhdr->Signature) & 0xFFF0) == 0x88E0)
+	((le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x92C0 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x88C0 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x2300 ||	\
+	(le16_to_cpu(_fwhdr->signature) & 0xFFF0) == 0x88E0)
 
 struct rt_firmware_hdr {
-	__le16		Signature;
-	u8		Category;
-	u8		Function;
-	__le16		Version;
-	u8		Subversion;
-	u8		Rsvd1;
-	u8		Month;
-	u8		Date;
-	u8		Hour;
-	u8		Minute;
-	__le16		RamCodeSize;
-	u8		Foundry;
-	u8		Rsvd2;
-	__le32		SvnIdx;
-	__le32		Rsvd3;
-	__le32		Rsvd4;
-	__le32		Rsvd5;
+	__le16	signature;
+	u8	category;
+	u8	function;
+	__le16	version;
+	u8	subversion;
+	u8	rsvd1;
+	u8	month;
+	u8	date;
+	u8	hour;
+	u8	minute;
+	__le16	ramcodesize;
+	u8	foundry;
+	u8	rsvd2;
+	__le32	svnidx;
+	__le32	rsvd3;
+	__le32	rsvd4;
+	__le32	rsvd5;
 };
 
 static void fw_download_enable(struct adapter *padapter, bool enable)
@@ -254,9 +254,9 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	fw_version = le16_to_cpu(fwhdr->Version);
-	fw_subversion = fwhdr->Subversion;
-	fw_signature = le16_to_cpu(fwhdr->Signature);
+	fw_version = le16_to_cpu(fwhdr->version);
+	fw_subversion = fwhdr->subversion;
+	fw_signature = le16_to_cpu(fwhdr->signature);
 
 	if (!log_version++)
 		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-- 
2.35.1

