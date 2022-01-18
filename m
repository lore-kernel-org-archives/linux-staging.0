Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB1168
	for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 23:06:00 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id q75so586098pgq.5
        for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 15:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to;
        bh=Hmwr/NvAL+svS57T9uxuMiXf8YJx8mtgioZKYfbMWac=;
        b=BaFC4GCONEYspssy1GYPeTrMNDkEWVXKVAKOqw11b2bH5ij+Bh0ZcVZbIsqSHsX3Qr
         VrvkcDgelRGHD04GNSeQ0EawjnuSS9Sp6OTDcXsq37iiAC2I8naWSF1c+9wsh9n3YcWY
         3UUa0zb2PG4/5oVgSbmFHG7VXw9wZJeB6DaGJZ8weyAX2Yc+1eyx2+cRLXOAg1q7/ZXD
         KL41pPLB6TArHpxRyXvcNKB9PRLiEm2cvYeQvn9tuNFja0Ns0l8vokrywxaaFURf9BFa
         zO996iFxIxH5Fi5k0TWEzkOL3CE9Pj1dwf1j4lCF/0pFPFt8ppVxSJOGfVXIu+R4ihfH
         F/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to;
        bh=Hmwr/NvAL+svS57T9uxuMiXf8YJx8mtgioZKYfbMWac=;
        b=QA6wKnm/WCOSJNfSW+iNScBH6h/rZ6oWB85Z26yXzYpA7t29zTyoRn4+JXB7AINJ5E
         HZJGjKi44ucm1B9fMmgbWk7DcvKc6pShFq/UzqPgPtl7hEKKrd+vNtBIyeHFwqr8wdM6
         8ewJchuVvGIw+MldNi22/rK5daxYvrmW+agqapjZEDBW7UanRTMS+2I8PhIjFNWSYFXn
         GegM+OOFRZ9/j66f7KhnO3z3P0M3IM4fZEoRbxzhNlDjiVPHxrvMMwkINvaE74QtuqVn
         OBEL8uUmEKMyrdrDQVHd0w1GxQ/dUDuAlzcKHWTKXBmX40CSt5z2ML1PIvwscoccB+Rh
         vhbQ==
X-Gm-Message-State: AOAM5327XsaVkBF+hoFL76zkVeBU3Dcmcl1xoiwwNQd24J+EwFeTyEO5
	AzOUrmmPDA+hQKjTfIrAWJo=
X-Google-Smtp-Source: ABdhPJw921ktYTKfD/b2cs4LS0dFFhpk51eulzdZ6obyPw2URyw/MnnVlyi5JrOouALyMeIx+POfCQ==
X-Received: by 2002:a63:b10d:: with SMTP id r13mr25084906pgf.257.1642547160571;
        Tue, 18 Jan 2022 15:06:00 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id t8sm15305456pga.15.2022.01.18.15.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 15:06:00 -0800 (PST)
Date: Wed, 19 Jan 2022 12:05:55 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] staging: pi433: validate max bit_rate based on
 modulation used
Message-ID: <20220118230555.GA4961@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220118230312.GA4826@mail.google.com>

Max bit rate is dependent on which modulation is used. Previous
validation routine only took into consideration min bit rate which can
lead a misconfiguration of the rf69 chip causing the packets not to be
sent/read.

This patch enhances that input check in set_bit_rate to account for
modulation values and their respective max bit rate

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/TODO   |  2 ++
 drivers/staging/pi433/rf69.c | 10 +++++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/TODO b/drivers/staging/pi433/TODO
index 63a40bfcc67e..b9e6c01a02e0 100644
--- a/drivers/staging/pi433/TODO
+++ b/drivers/staging/pi433/TODO
@@ -3,3 +3,5 @@
 * currently the code introduces new IOCTLs. I'm afraid this is a bad idea.
   -> Replace this with another interface, hints are welcome!
 * Some missing data (marked with ###) needs to be added in the documentation
+* Change (struct pi433_tx_cfg)->bit_rate to be a u32 so that we can support
+    bit rates up to 300kbps per the spec.
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index f4ac17adcd83..d60514a840c2 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -229,9 +229,17 @@ int rf69_set_bit_rate(struct spi_device *spi, u16 bit_rate)
 	u32 bit_rate_reg;
 	u8 msb;
 	u8 lsb;
+	enum modulation mod;
+
+	// check if modulation is configured
+	mod = rf69_get_modulation(spi);
+	if (mod == UNDEF) {
+		dev_dbg(&spi->dev, "setBitRate: modulation is undefined");
+		return -EINVAL;
+	}
 
 	// check input value
-	if (bit_rate < 1200) {
+	if (bit_rate < 1200 || (mod == OOK && bit_rate > 32768)) {
 		dev_dbg(&spi->dev, "setBitRate: illegal input param");
 		return -EINVAL;
 	}
-- 
2.25.4

