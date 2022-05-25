Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC452A47
	for <linux-staging@lists.linux.dev>; Wed, 25 May 2022 06:05:47 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id hh4so16283906qtb.10
        for <linux-staging@lists.linux.dev>; Tue, 24 May 2022 23:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=ZLmsI3mFDmtOtF3aT52i4MAWs/hALcyNzI74HA0AHXU=;
        b=nW5NkqlXQqJQSkIWq131BVqt9j5lP6Vh2bxie0rjYK2YPa3xLWnTVOiL+snKfXPxco
         Ha0w5XgZukM1po5iYj7B5jXXzFcZ7kPHUwyczDtjJtmvR1ElM59sCWRiMYUltN5X96jg
         6Y/7djVpJ6GgscmokreryJvB03okmPiy6UXFcDkcFlTK8aW0CRmsuImJlttIa9u36TdQ
         fXYcDJ4Nkj9T0fJItIIKSg34GTEA8u6FnI6MqOG+NRUzYY6WvUydFbAcosL2QuIJ8ChR
         /iEwn6yNqiBUBsWCW5dKHJDGObRvgGWNmihlyxyTP1F+fGkGC8EiOlCEVMP/P9V4q3GJ
         buqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=ZLmsI3mFDmtOtF3aT52i4MAWs/hALcyNzI74HA0AHXU=;
        b=YA3+6UemHyq1p0qYqDA9q1YI2ZZBi7sOzk+LfOySIm7q0/Ep82Gnm1cecS9M8M5xfa
         0yZlYK1+ZUpsb5S7KfMmuan3xtZpUaTB4P5/DcuoJdp4zur7uwKrY4z06sunW+sXJ2A7
         wfcjCGnKSOGE0xHsQntgqHtdK037dBIoU2q9ijBe1VqyUBv5ADtKLotQBnk5ZxSRbVZ9
         ukzwva+KYFPUYOaom1vuF849dwiYZN0MrCOFuhXEbM/Xv89XmjCdVn2PeUKIZxosaDKV
         FU1Ej957REvenHjenZOgfe9uW9UR941APdRM9ddoLHAyNHoEsv4TH13/IetxFnwyGscs
         YggQ==
X-Gm-Message-State: AOAM532ZzoIC884pJ/8j9YvszHW4K5rXlCVCvSXRNBhnWm4JBepZtdhw
	cweVBAD7R4ZuuPkJB9yhVNg=
X-Google-Smtp-Source: ABdhPJzosTULADrwpgytKjBnG14NrIocdJqp3oU360L+0BI1Dz73+N8+mjt+C0N4hLmQvJiMRdlcTg==
X-Received: by 2002:a05:622a:cc:b0:2f9:e34:ead7 with SMTP id p12-20020a05622a00cc00b002f90e34ead7mr23351217qtw.581.1653458746699;
        Tue, 24 May 2022 23:05:46 -0700 (PDT)
Received: from Sassy (bras-base-oshwon9563w-grc-26-142-113-132-114.dsl.bell.ca. [142.113.132.114])
        by smtp.gmail.com with ESMTPSA id cj23-20020a05622a259700b002f39b99f689sm954363qtb.35.2022.05.24.23.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 May 2022 23:05:46 -0700 (PDT)
Date: Wed, 25 May 2022 02:05:44 -0400
From: Srivathsan Sivakumar <sri.skumar05@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: rts5208: spi.c: fix codestyle error in dynamic
 debug code
Message-ID: <Yo3HOPPKnWHez7ES@Sassy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

reduce number of spaces in dev_dbg() code
format the commit and changelog more clearly

Signed-off-by: Srivathsan Sivakumar <sri.skumar05@gmail.com>
---
Changes since v2:
 - Condense three dev_dbg() code lines into one

Changes since v1:
 - Remove unneccesary ftrace like logging
---
 drivers/staging/rts5208/spi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/spi.c b/drivers/staging/rts5208/spi.c
index f1e9e80044ed..e88fe1a998f8 100644
--- a/drivers/staging/rts5208/spi.c
+++ b/drivers/staging/rts5208/spi.c
@@ -460,10 +460,8 @@ int spi_set_parameter(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	spi->clk_div = ((u16)(srb->cmnd[4]) << 8) | srb->cmnd[5];
 	spi->write_en = srb->cmnd[6];
 
-	dev_dbg(rtsx_dev(chip), "%s: ", __func__);
-	dev_dbg(rtsx_dev(chip), "spi_clock = %d, ", spi->spi_clock);
-	dev_dbg(rtsx_dev(chip), "clk_div = %d, ", spi->clk_div);
-	dev_dbg(rtsx_dev(chip), "write_en = %d\n", spi->write_en);
+	dev_dbg(rtsx_dev(chip), "spi_clock = %d, clk_div = %d, write_en = %d\n",
+		spi->spi_clock, spi->clk_div, spi->write_en);
 
 	return STATUS_SUCCESS;
 }
-- 
2.34.1

