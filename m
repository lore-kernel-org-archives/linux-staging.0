Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813170
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 12:32:51 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id iu14so6114514qvb.4
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5phIbF0SJjc1xH9SRYu5fVVE6GnlEyVLJ25MTvQm6gk=;
        b=RMkvkOHmjhdP17NNF9xXFBDWDRebXixHvYtL/zYG09ZsIpFem1DIF6bKoozhqZdD23
         AE9dLc4KDSE8hxQBFDLOHi+Jt1h5Dck2uygvm2Q+uMZonR95B3gKv3WOCNLWDb7+I1IJ
         GYZ/DDE+wdYpyeC+GvfTfy0vGsHQP2PnYNropr8WYrsJ2n5KAQZy0eSuUwZlbpgKgLYP
         uz/tcrkrLmr41j3mKvGWx6ccgx5m4acSMhdsfZPWCzSn/MMQAtjMawdCc0Zo+hVCGxga
         ruPy3vVhLt0+NVbwdZpdqT8c/T6s5R+T0QvClbj0cKgMnGyIH9acQakYln3kqajqrUft
         8/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5phIbF0SJjc1xH9SRYu5fVVE6GnlEyVLJ25MTvQm6gk=;
        b=AetKPsJlWiwQ/OwG7gR7Ve5zumVJv0CiIR7qdERDB5c1f7m1HXJnMKACqk3aaxx1AZ
         Auwq0pDH2kg691+QJVBJEB8VStxraBssjhErrkO9B9lJAibOppUIHkn/6EMg7842r8de
         VsEbU/LYhgUdt+BI9EvkMudIixtuYTx8ew0HsgDSidcyXMFPqhI9CXEBMo+OaSNsET6S
         WcRopKcFMigwAC9SU9Z44Gf3ZZMqEtCx78HbCbSSSbKljFyfHXJrFQdf+8oyHTplAQx8
         LqYytJcuxFGB6PoUkx0QurBwBab8rTIdkxhnLMi0+RlBzLeHm8ZuFVdrNI75VU2/pwIw
         XgPg==
X-Gm-Message-State: AOAM531TJLfIjEmjQ37PaS2kNWsx7vtPtjNJGHzZY5exkDFR0ITpcxg5
	rxddNfr+DePLdawNAFEh8VE=
X-Google-Smtp-Source: ABdhPJw4HVWeGXlu9QOMOgyquVblt75ZPUF7a8d8Y+kYW7EsfVl16gHHG6EF8ramsvU3XfSE6B3qfw==
X-Received: by 2002:a05:6214:1470:: with SMTP id c16mr5841085qvy.60.1618230770882;
        Mon, 12 Apr 2021 05:32:50 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id i25sm7602148qka.38.2021.04.12.05.32.49
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:32:50 -0700 (PDT)
Date: Mon, 12 Apr 2021 09:32:47 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 4/4] Replace macro function by static
 inline function in file iss_resizer.c
Message-ID: <5bcb30af75bd8639f8771587fdcca8827b0ae013.1618230425.git.alinesantanacordeiro@gmail.com>
References: <cover.1618230425.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618230425.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss_resizer.c | 126 ++++++++++++++-------------
 1 file changed, 65 insertions(+), 61 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_resizer.c b/drivers/staging/media/omap4iss/iss_resizer.c
index 3b6875c..7d16bde 100644
--- a/drivers/staging/media/omap4iss/iss_resizer.c
+++ b/drivers/staging/media/omap4iss/iss_resizer.c
@@ -30,13 +30,17 @@ static const unsigned int resizer_fmts[] = {
  *
  * Also prints other debug information stored in the RESIZER module.
  */
-#define RSZ_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###RSZ " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RSZ_##name))
+static inline rsz_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###RSZ " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RSZ_##name));
+}
 
-#define RZA_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###RZA " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RZA_##name))
+static inline rza_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###RZA " #name "=0x%08x\n", 
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_RESIZER, RZA_##name));
+}
 
 static void resizer_print_status(struct iss_resizer_device *resizer)
 {
@@ -44,61 +48,61 @@ static void resizer_print_status(struct iss_resizer_device *resizer)
 
 	dev_dbg(iss->dev, "-------------RESIZER Register dump-------------\n");
 
-	RSZ_PRINT_REGISTER(iss, SYSCONFIG);
-	RSZ_PRINT_REGISTER(iss, IN_FIFO_CTRL);
-	RSZ_PRINT_REGISTER(iss, FRACDIV);
-	RSZ_PRINT_REGISTER(iss, SRC_EN);
-	RSZ_PRINT_REGISTER(iss, SRC_MODE);
-	RSZ_PRINT_REGISTER(iss, SRC_FMT0);
-	RSZ_PRINT_REGISTER(iss, SRC_FMT1);
-	RSZ_PRINT_REGISTER(iss, SRC_VPS);
-	RSZ_PRINT_REGISTER(iss, SRC_VSZ);
-	RSZ_PRINT_REGISTER(iss, SRC_HPS);
-	RSZ_PRINT_REGISTER(iss, SRC_HSZ);
-	RSZ_PRINT_REGISTER(iss, DMA_RZA);
-	RSZ_PRINT_REGISTER(iss, DMA_RZB);
-	RSZ_PRINT_REGISTER(iss, DMA_STA);
-	RSZ_PRINT_REGISTER(iss, GCK_MMR);
-	RSZ_PRINT_REGISTER(iss, GCK_SDR);
-	RSZ_PRINT_REGISTER(iss, IRQ_RZA);
-	RSZ_PRINT_REGISTER(iss, IRQ_RZB);
-	RSZ_PRINT_REGISTER(iss, YUV_Y_MIN);
-	RSZ_PRINT_REGISTER(iss, YUV_Y_MAX);
-	RSZ_PRINT_REGISTER(iss, YUV_C_MIN);
-	RSZ_PRINT_REGISTER(iss, YUV_C_MAX);
-	RSZ_PRINT_REGISTER(iss, SEQ);
-
-	RZA_PRINT_REGISTER(iss, EN);
-	RZA_PRINT_REGISTER(iss, MODE);
-	RZA_PRINT_REGISTER(iss, 420);
-	RZA_PRINT_REGISTER(iss, I_VPS);
-	RZA_PRINT_REGISTER(iss, I_HPS);
-	RZA_PRINT_REGISTER(iss, O_VSZ);
-	RZA_PRINT_REGISTER(iss, O_HSZ);
-	RZA_PRINT_REGISTER(iss, V_PHS_Y);
-	RZA_PRINT_REGISTER(iss, V_PHS_C);
-	RZA_PRINT_REGISTER(iss, V_DIF);
-	RZA_PRINT_REGISTER(iss, V_TYP);
-	RZA_PRINT_REGISTER(iss, V_LPF);
-	RZA_PRINT_REGISTER(iss, H_PHS);
-	RZA_PRINT_REGISTER(iss, H_DIF);
-	RZA_PRINT_REGISTER(iss, H_TYP);
-	RZA_PRINT_REGISTER(iss, H_LPF);
-	RZA_PRINT_REGISTER(iss, DWN_EN);
-	RZA_PRINT_REGISTER(iss, SDR_Y_BAD_H);
-	RZA_PRINT_REGISTER(iss, SDR_Y_BAD_L);
-	RZA_PRINT_REGISTER(iss, SDR_Y_SAD_H);
-	RZA_PRINT_REGISTER(iss, SDR_Y_SAD_L);
-	RZA_PRINT_REGISTER(iss, SDR_Y_OFT);
-	RZA_PRINT_REGISTER(iss, SDR_Y_PTR_S);
-	RZA_PRINT_REGISTER(iss, SDR_Y_PTR_E);
-	RZA_PRINT_REGISTER(iss, SDR_C_BAD_H);
-	RZA_PRINT_REGISTER(iss, SDR_C_BAD_L);
-	RZA_PRINT_REGISTER(iss, SDR_C_SAD_H);
-	RZA_PRINT_REGISTER(iss, SDR_C_SAD_L);
-	RZA_PRINT_REGISTER(iss, SDR_C_OFT);
-	RZA_PRINT_REGISTER(iss, SDR_C_PTR_S);
-	RZA_PRINT_REGISTER(iss, SDR_C_PTR_E);
+	rsz_print_register(iss, SYSCONFIG);
+	rsz_print_register(iss, IN_FIFO_CTRL);
+	rsz_print_register(iss, FRACDIV);
+	rsz_print_register(iss, SRC_EN);
+	rsz_print_register(iss, SRC_MODE);
+	rsz_print_register(iss, SRC_FMT0);
+	rsz_print_register(iss, SRC_FMT1);
+	rsz_print_register(iss, SRC_VPS);
+	rsz_print_register(iss, SRC_VSZ);
+	rsz_print_register(iss, SRC_HPS);
+	rsz_print_register(iss, SRC_HSZ);
+	rsz_print_register(iss, DMA_RZA);
+	rsz_print_register(iss, DMA_RZB);
+	rsz_print_register(iss, DMA_STA);
+	rsz_print_register(iss, GCK_MMR);
+	rsz_print_register(iss, GCK_SDR);
+	rsz_print_register(iss, IRQ_RZA);
+	rsz_print_register(iss, IRQ_RZB);
+	rsz_print_register(iss, YUV_Y_MIN);
+	rsz_print_register(iss, YUV_Y_MAX);
+	rsz_print_register(iss, YUV_C_MIN);
+	rsz_print_register(iss, YUV_C_MAX);
+	rsz_print_register(iss, SEQ);
+
+	rza_print_register(iss, EN);
+	rza_print_register(iss, MODE);
+	rza_print_register(iss, 420);
+	rza_print_register(iss, I_VPS);
+	rza_print_register(iss, I_HPS);
+	rza_print_register(iss, O_VSZ);
+	rza_print_register(iss, O_HSZ);
+	rza_print_register(iss, V_PHS_Y);
+	rza_print_register(iss, V_PHS_C);
+	rza_print_register(iss, V_DIF);
+	rza_print_register(iss, V_TYP);
+	rza_print_register(iss, V_LPF);
+	rza_print_register(iss, H_PHS);
+	rza_print_register(iss, H_DIF);
+	rza_print_register(iss, H_TYP);
+	rza_print_register(iss, H_LPF);
+	rza_print_register(iss, DWN_EN);
+	rza_print_register(iss, SDR_Y_BAD_H);
+	rza_print_register(iss, SDR_Y_BAD_L);
+	rza_print_register(iss, SDR_Y_SAD_H);
+	rza_print_register(iss, SDR_Y_SAD_L);
+	rza_print_register(iss, SDR_Y_OFT);
+	rza_print_register(iss, SDR_Y_PTR_S);
+	rza_print_register(iss, SDR_Y_PTR_E);
+	rza_print_register(iss, SDR_C_BAD_H);
+	rza_print_register(iss, SDR_C_BAD_L);
+	rza_print_register(iss, SDR_C_SAD_H);
+	rza_print_register(iss, SDR_C_SAD_L);
+	rza_print_register(iss, SDR_C_OFT);
+	rza_print_register(iss, SDR_C_PTR_S);
+	rza_print_register(iss, SDR_C_PTR_E);
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

