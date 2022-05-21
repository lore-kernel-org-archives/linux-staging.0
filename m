Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EAF28F9
	for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 12:53:45 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id 11so7356583qtp.9
        for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 05:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=DE/WToa0e5XYlV1QXXvzcE1ao0/d5STyFLpJOri88qc=;
        b=kHvYoXKLcNGtqh6+CqpQmgUBQ4Ejzk2sjSNRF5NaSapKWg0H3zGrgnEDKGniT1xM1m
         j+MnQYeJtCRV7I/gHv8+h7dTizohynfhL4BmYxpDAdq6xc+W0nVgpow5ekbYW4ZoVuxI
         B4khJO3/M2RtBVeezoi0CTwaCNEpWbD2x8eoMXwAanXwRvzMIVlYhYElYjNRpwVXEfl0
         G5iEYRiust1kp46aESktXFzoM+TFmvmvL2Qr+1/UeTWJNS9P5wfQmcjMt7xeKDhXn4je
         hoL73fJY1+9UspigUuXkGt8hrCNpHH22ofDueJwGMBltCS3CFNnsGKtlMozP+NFOB8aC
         bN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=DE/WToa0e5XYlV1QXXvzcE1ao0/d5STyFLpJOri88qc=;
        b=WwXJyacwrSTTnoi7jKmLVnhI4WbZT0PZZ5W0WQXe8MNFnvNX5JSThsjJj+gKEGf7xO
         WDwqminmiRMUSV9Su3dbGH/yTMDdVQdxc1fJw8JDkv88VRfm2fclnTtr1miBnSr+jpfD
         pCf23f3DtLwiZsV6pvdEstuW6O2/qzaUDJS4j6N6+ITmcjaCyL7ZHKdhK1NPDfVstE2T
         yXScbWVSz9l97yo9sFAMlW7j5L304PGXe/yN7iHTF8ZPhBT5Dc6aoi8CeljNCREVnvFb
         nBF4jpU6yJY5iKwrlNUzPKCWHYGKjG/SWBLTcQBwR1BVbHzEnWFBcJUQGDHvK3o001CN
         CxpQ==
X-Gm-Message-State: AOAM530Jue5V8+Jbpnqe+HPDpyim/d2c8kDzYQ0YMnV+FS969p44Fa7H
	Z3Ggr+s+J3HpQQfEj3YG+Bc=
X-Google-Smtp-Source: ABdhPJy9/3Qcn1P8r3hcgv6xlr+ig6EwRIHDfOTu6g7nSrtOwjPk5tp8RSaHAISsfXO4RNLQk9M7Iw==
X-Received: by 2002:ac8:7d07:0:b0:2f3:c5eb:61a6 with SMTP id g7-20020ac87d07000000b002f3c5eb61a6mr10881514qtb.231.1653137624518;
        Sat, 21 May 2022 05:53:44 -0700 (PDT)
Received: from Sassy (bras-base-oshwon9563w-grc-26-142-113-132-114.dsl.bell.ca. [142.113.132.114])
        by smtp.gmail.com with ESMTPSA id g21-20020ae9e115000000b0069fc13ce22fsm1323278qkm.96.2022.05.21.05.53.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 05:53:44 -0700 (PDT)
Date: Sat, 21 May 2022 08:53:42 -0400
From: Srivathsan Sivakumar <sri.skumar05@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rts5208: spi.c: clean up dynamic debug code
Message-ID: <Yojg1nXXTIL3G82l@Sassy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've condensed the three dev_dbg() lines into one as you requested in the
previous patch thread; and sent them all as a singular patch.

fix the following checkpatch.pl warning:
WARNING: Unnecessary ftrace-like logging - prefer using ftrace

Signed-off-by: Srivathsan Sivakumar <sri.skumar05@gmail.com>

Changes in v2:
        - Condense three dev_dbg() code lines into one
---
 drivers/staging/rts5208/spi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/spi.c b/drivers/staging/rts5208/spi.c
index f1e9e80044ed..ea736a73e58c 100644
--- a/drivers/staging/rts5208/spi.c
+++ b/drivers/staging/rts5208/spi.c
@@ -460,10 +460,7 @@ int spi_set_parameter(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 	spi->clk_div = ((u16)(srb->cmnd[4]) << 8) | srb->cmnd[5];
 	spi->write_en = srb->cmnd[6];
 
-	dev_dbg(rtsx_dev(chip), "%s: ", __func__);
-	dev_dbg(rtsx_dev(chip), "spi_clock = %d, ", spi->spi_clock);
-	dev_dbg(rtsx_dev(chip), "clk_div = %d, ", spi->clk_div);
-	dev_dbg(rtsx_dev(chip), "write_en = %d\n", spi->write_en);
+	dev_dbg(rtsx_dev(chip), "spi_clock = %d, clk_div = %d, write_en = %d\n ",                               spi->spi_clock, spi->clk_div, spi->write_en);
 
 	return STATUS_SUCCESS;
 }
-- 
2.34.1

