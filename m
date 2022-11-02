Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE62F36
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 20:03:28 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id kt23so48147511ejc.7
        for <linux-staging@lists.linux.dev>; Wed, 02 Nov 2022 13:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDnrSW+2135+Xqb7eTyI0FY4hstVp+d9eOCLWyHr250=;
        b=gCvOUF5kPz358SzEWhcIlHuAGTOF/oPvE9is9fj0H1d5LVVPLp+tJcHtlKKYGafmm5
         kKPmZSM6PCXwG4zAF5fh2naeS5xI4vbk+9vBEfV2fqu0RMFXtL4UL7fOTMDCijqoraOQ
         NGpG5OjEIHg1j3ma9noCF4Q8qROcR8JLSmH5Rgh6hE4vipunr8aS2bVfPR0cPBLJIZjH
         3b8wsxTJwYrIaBLWqvFwlv4J0hF1m3PCuwkmGhYg/LM1qU2sPm1aKRECFkTNDgzwCF9n
         XKEB50M3PWfXe8HFnJevp0nBSGgvN1ykspoF3TAUZXt1/8kHmke4UVB58mOu7FQOYb4/
         EbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDnrSW+2135+Xqb7eTyI0FY4hstVp+d9eOCLWyHr250=;
        b=XQUyf64L1FtwyFgt5zjBeDqDCNp58MaAhrvqmFyDFqRtxdzZTc18NiYkNu4iwYZnr6
         OCrDoHuNUZ3ghKggPS7Ay0IioAmR067N/vwE+vKAisaWl9Yat1o7wgddd3/7qKyJrz1d
         Ap5/YnUVb7Cia4/ctIhre/1y4EKMmo7QDw2+THlmhEI0nfIA+Cmldil4xeTZmi3dOHn3
         A8EcFZVSrSBKBZFZU91ZQW3+vZp2+j4zWQ76jjworBk4fs1IdjLFj+3WWpVPNO41XTHr
         klYhUBXCRTnUyPH+GIAJ9SanyXYtd4BjM38pMM03X/W809OkSbijDoNBf2ASxTxXmAMW
         220g==
X-Gm-Message-State: ACrzQf06F90s0AUoTYUGCDWriz/nmlKSTWU9Tp7e09bkegwdNhD+rq3o
	0KFQ3MIoRH1kmW2FsJQn2uRI2LheOv6ZzQ==
X-Google-Smtp-Source: AMsMyM4mrW5FGAdWh0XXYf6GbrwWeEVYGtq6S+ZebIemMpHR0alzU5UP+UBv46vWVo3qw/K7+NJuUA==
X-Received: by 2002:a17:906:8a57:b0:7ad:69fb:3a with SMTP id gx23-20020a1709068a5700b007ad69fb003amr25232087ejc.179.1667419406921;
        Wed, 02 Nov 2022 13:03:26 -0700 (PDT)
Received: from ZBook.localdomain (86-90-194-80.fixed.kpn.net. [86.90.194.80])
        by smtp.gmail.com with ESMTPSA id o3-20020a170906768300b0079e552fd860sm5752239ejm.152.2022.11.02.13.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 13:03:26 -0700 (PDT)
From: Jerom van der Sar <jerom.vandersar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jerom van der Sar <jerom.vandersar@gmail.com>
Subject: [PATCH v4] staging: rtl8192e: space formatting fixes in rtl_cam.c
Date: Wed,  2 Nov 2022 21:00:58 +0100
Message-Id: <20221102200057.397-1-jerom.vandersar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y2IbI8ib5+k+bVRo@kroah.com>
References: <Y2IbI8ib5+k+bVRo@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a few coding style issues in rtl_cam.c: two times lack of
spaces around binary operators. Some other warnings still remain.
These issues were found by scripts/checkpatch.pl.

This patch helps clean up the rtl8192e driver in staging, making it
easier to read and maintain.

Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>
---
Changes in v4:
 - Reverted more double blank line formatting fixes to make the patch
   even smaller.

Changes in v3:
  - Fixed faulty dot at the end of the patch sign-off.

Changes in v2:
  - Reverted some formatting fixes to make the diff easier to review.

 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
index 41faeb4b9b9b..41bff46d1b3a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
@@ -17,7 +17,7 @@ void rtl92e_cam_reset(struct net_device *dev)
 {
 	u32 ulcommand = 0;
 
-	ulcommand |= BIT31|BIT30;
+	ulcommand |= BIT31 | BIT30;
 	rtl92e_writel(dev, RWCAM, ulcommand);
 }
 
@@ -107,7 +107,7 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
 
 	for (i = 0; i < CAM_CONTENT_COUNT; i++) {
 		TargetCommand  = i + CAM_CONTENT_COUNT * EntryNo;
-		TargetCommand |= BIT31|BIT16;
+		TargetCommand |= BIT31 | BIT16;
 
 		if (i == 0) {
 			TargetContent = (u32)(*(MacAddr+0)) << 16 |
-- 
2.34.1

