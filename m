Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D5615DD
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:39:16 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id l7so8706493ejn.2
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MKr6+nokaP5roHlN/q4ijMaD9NBWjAMlhiHPQJ7ZvGk=;
        b=oniU/Uq3TeyE1RRKqecnWnMSlfxvLzAYhLrtXrsQi/DbEJVioabJ68fJ2fzEAONfv3
         PTXE5o7eZtavasDpjuVTRgMYiIZpJXZw9fxA0pj6VxY/1+ZzSrYTGi0n9KnS484YReGC
         VYzLKA4w48x2iRhJAbiI8zOq5Xj3fYPoxJsz54bx3LiuJAxzIGT3U0i/9pADtcUxs9AZ
         +yu3p+XsitFpkVf/42TCGBtTWUrOdBUd6QsNK+dKakZNr+Vl1a+HSvQiUQWzx2v2AFfQ
         o+gdFAJd8lFQKksN8onibvaSN65QbQWy1AQzNBkq0p1fRf/FabGKIq6Q8xfJ1ZZ0FW6I
         xeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MKr6+nokaP5roHlN/q4ijMaD9NBWjAMlhiHPQJ7ZvGk=;
        b=B4nseiy3p87hGltG+eL5Fc7MIG2if0d5s8Sh9GeBpqGbYR9oronWOYFiLO3FRpW+3n
         fglY19eNBhMaMhOska00ZmSHLXI7s2IRBO4BkfZjNfp875N2JjWvy+ZPOnHISz2+pX5d
         oKxJUwuvZThqmMyifQbVEosTng5yOJZJKSyf3gAaxoRBYkLSaoWmrz/CMhReR43jzTtJ
         RiPoMn1OsLVeAYBWb/Ylxt0qJBOlY/xedZ0+LFegV/lG6Li5QKxDCP8jxnLqLlljFTqF
         btPwunL8c+JBxz6pMf3hnbz8ALWnj4buOl3n1Ki/42lG4kWJnwcalBrM7O5O2PsQ5myG
         CWSw==
X-Gm-Message-State: AOAM531H9ya/H0NO66AXKelIZMExabqpZs5rA5JmvdvSjfjLyIKtHmkV
	jPPog0ilrnGDFq8rfxzBHGw=
X-Google-Smtp-Source: ABdhPJy5szr413gn7qjTFI6nqX63l6W0BasX2s06CfKfEkZH3jn5PKE+Z7W4opnLFE/sl6D9g15jqA==
X-Received: by 2002:a17:907:3f25:b0:6b0:5e9a:83 with SMTP id hq37-20020a1709073f2500b006b05e9a0083mr1451660ejc.659.1649925554546;
        Thu, 14 Apr 2022 01:39:14 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id ah13-20020a1709069acd00b006e8a0b3e071sm418138ejc.110.2022.04.14.01.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:39:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/7] staging: r8188eu: check firmware header existence before access
Date: Thu, 14 Apr 2022 10:38:53 +0200
Message-Id: <20220414083853.3422-8-straube.linux@gmail.com>
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

We should access the fields of fwhdr only if the check for firmware
header existence is true. Move the affected code into the if block
that checks firmware header existence.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Do we need the IS_FW_HEADER_EXIST(fwhdr) check at all?
The header _does_ exist in rtl8188eufw.bin and it's very
unlikely that it ever changes _and_ the header will be
removed.

 drivers/staging/r8188eu/core/rtw_fw.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 64963507a346..c58bce1a1856 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -249,14 +249,13 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 	fw_data = dvobj->firmware.data;
 	fw_size = dvobj->firmware.size;
 
-	/*  To Check Fw header. Added by tynli. 2009.12.04. */
 	fwhdr = (struct rt_firmware_hdr *)dvobj->firmware.data;
 
-	pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
-		DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
-		le16_to_cpu(fwhdr->signature));
-
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
+		pr_info("%sFirmware Version %d, SubVersion %d, Signature 0x%x\n",
+			DRIVER_PREFIX, le16_to_cpu(fwhdr->version), fwhdr->subversion,
+			le16_to_cpu(fwhdr->signature));
+
 		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
 		fw_size = fw_size - sizeof(struct rt_firmware_hdr);
 	}
-- 
2.35.1

