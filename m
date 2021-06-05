Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772170
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 02:09:08 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ce15so17276728ejb.4
        for <linux-staging@lists.linux.dev>; Fri, 04 Jun 2021 19:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lkNfGy1F0k5RDq7SvWZFsIErKoDT4IMXfAXGU4u+NcM=;
        b=C1YtPn7sDDgG+AcANfGdKZPHQMkCdfHqsy/0Pmo/EYYSiqDuT+ylyJkWym8CjuknVA
         TBhBKN/u8MhxcHEvYLWtD9iehYp3B5qaBttb67NPwUFqRydzZY/C7NjkEwuCfKT1lcCu
         mnT0HPrzjmSxFSRfNbUN3kjd5n7nhKpfIh5fUdXRFBH2Kv0NZeHBdBQ4tZ2XiLMWsaDm
         CvbXqglTQTgzUmWc645pfhBGNSuSZoULFCOnImCjbg6c8jq2xuiGzGlW/Gbnp+q88duy
         lhgBcJnWH53s3yCFxPB70AG/ZJ/5mcTApO4FUOUgXbwcvaQSMS9c/VoeuWVnXbgNuC2j
         SMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lkNfGy1F0k5RDq7SvWZFsIErKoDT4IMXfAXGU4u+NcM=;
        b=dfRT/LvX0fUskKohCK+BLJyEDP6PfZiAiQALCkr5prDOMKeNuxZnGIx1TT7+MUUQcZ
         Lu8Ezc092Nda6H68OwRv9nmAnRN7sRImqbQcs6SqiDdpNZtvz+QRaYNW8+9Ww7XjkSqR
         NFpBzCoUrgiqVWaPcCrsSgDSD8B6Aa5NecETGtwV/CFvh08oOqDMhcmODXDJVRKn0znf
         s2oAE21jMVMlHqF4t321iqTol7oz4NGY6MKvqT29oDkypYDiXAIjtmOWXFxKZ1jAU3Lb
         M33Q5A7lpKFolKstfCsSe0sVZt6txe5YPkbRWqVwnHkBALazshcDwTKb1HadSqntoTiv
         tYyQ==
X-Gm-Message-State: AOAM531uH64G4IbFAroxcNmzFgsxF2YeYmLFxHbO8oA6aWAOq2ZR+cgb
	vT2Jv6b720jP9qPoa+NnOsI=
X-Google-Smtp-Source: ABdhPJwvdsYRpYqsHonCA56Y8k350JpsKIxHU6vKvqoz24zXqCN1egvhUkXUXds68gyR7KSU5nfZlg==
X-Received: by 2002:a17:906:6c88:: with SMTP id s8mr7119605ejr.129.1622858947301;
        Fri, 04 Jun 2021 19:09:07 -0700 (PDT)
Received: from linux.local (host-82-59-55-132.retail.telecomitalia.it. [82.59.55.132])
        by smtp.gmail.com with ESMTPSA id gz5sm3496232ejb.113.2021.06.04.19.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 19:09:07 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 2/2] staging: media: atomisp: pci: Remove unnecessary (void *) cast
Date: Sat,  5 Jun 2021 04:08:55 +0200
Message-Id: <20210605020855.1065-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210605020855.1065-1-fmdefrancesco@gmail.com>
References: <20210605020855.1065-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed an unnecessary (void *) cast for an argument passed to kfree().

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1 -> v2: Added this 2/2 patch.

 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 5301cc014c7e..e1a16a50e588 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -363,7 +363,7 @@ void sh_css_unload_firmware(void)
 		unsigned int i = 0;
 
 		for (i = 0; i < sh_css_num_binaries; i++) {
-			kfree((void *)fw_minibuffer[i].name);
+			kfree(fw_minibuffer[i].name);
 			kvfree(fw_minibuffer[i].buffer);
 		}
 		kfree(fw_minibuffer);
-- 
2.31.1

