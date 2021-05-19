Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16EF70
	for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 19:39:40 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id k19so11064888qta.2
        for <linux-staging@lists.linux.dev>; Wed, 19 May 2021 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=02LE2Ct4623xELUCtUAbj1uXOX9qcsak7FEg/dNML6A=;
        b=dzfDU5azfxRNJBTqHYG8or7QUfom7Bu1BO+LfG2VWEDP7d5C7BLgyjBJpD0anJp0Ng
         3RBjBIuVcTRvCP0rq/fJk/A3IBXQQZml5+Slp74VHkrFyk2p4+sIffz0IxFOu7osZ8wn
         WFd8zC7EK0gZ6+7d5sTjs6X/5GnpheehKVNLjV07k8e7vrI9ZSevlrOqD7B7SOlP6cLS
         bSHX/NVngabjLm5e8Tj+Xqvsgi7KGVnN6gpAtkAmaTfM/HwAB6ijZwHdlZLgepKO/KXU
         vLm6Z4ItCEQee67s6+rfvv3dKAG+DSTFfJc0tAw1ozQ8yd8O8yflZSRefiCuGdAkNyAJ
         8M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=02LE2Ct4623xELUCtUAbj1uXOX9qcsak7FEg/dNML6A=;
        b=rVW4vKSdlNvI1rBgR15GZKbNMVatI2riMx3Ux8V82LKZ7XZFg2bYAxkLn9GunZvnj9
         TaVeOsC/6Fha2y6zwudtqVlGZDmYZz66U4/HWEhS5epPvDazxQDDIlrFCShyvGw5lLnF
         HmDTEMF0Y6DOmQHJ+77uQVID7Y6FhJvVZOpMTzyTUNdz2rN7RRtdKIfQ1GHBLbIHsRs5
         Fln1xZA3yq0ppqSKxyG2ffd0nA7A5OtvbtmarDCOVyhklhNjzW4HFzzpReFmwixBEbb8
         7mF4euKmdE2uKkfhnSCIn7i6alcXYVzf167UeLyeBmmuwVi9eVSC140EHCSQkIf8abHZ
         CdyA==
X-Gm-Message-State: AOAM530eBjywfD8npAB+CDlKGpmdrTiMpgIJ2Ams3DeRQjrXsC4lzKzN
	PiO65xExx4Iauvqxw23Zdbo=
X-Google-Smtp-Source: ABdhPJwN55plgQPAvjtWPUvdAgqqHiW+O3bkKZ8Bz/1z18i4usXndqMUBllGpcoyTFCIeZS9EN18Bw==
X-Received: by 2002:ac8:5205:: with SMTP id r5mr1241881qtn.305.1621453179751;
        Wed, 19 May 2021 12:39:39 -0700 (PDT)
Received: from ubuntu ([191.96.170.47])
        by smtp.gmail.com with ESMTPSA id w14sm279832qts.83.2021.05.19.12.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 12:39:39 -0700 (PDT)
Date: Wed, 19 May 2021 12:39:38 -0700
From: Philippe Dixon <philippesdixon@gmail.com>
To: vireshk@kernel.org
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: spi: add blank line after variable
 declaration
Message-ID: <20210519193938.GA7131@ubuntu>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the following checkpatch.pl warning:

WARNING: Missing a blank line after declarations

Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>
---
 drivers/staging/greybus/spilib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index 30655153df6a..ad0700a0bb81 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -246,6 +246,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
 	xfer = spi->first_xfer;
 	while (msg->state != GB_SPI_STATE_OP_DONE) {
 		int xfer_delay;
+
 		if (xfer == spi->last_xfer)
 			xfer_len = spi->last_xfer_size;
 		else
-- 
2.25.1

