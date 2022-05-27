Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EF57C
	for <linux-staging@lists.linux.dev>; Fri, 27 May 2022 22:53:52 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id q15so7015058edb.11
        for <linux-staging@lists.linux.dev>; Fri, 27 May 2022 15:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=hP5/xUyD7yW6cvIyRkoeePUvJc0jXic9WcbLUxigB40=;
        b=RtFIrUQp2WIbvXh5KekjWJD1NIOKq8nVs0YGApK2nMqngdwnUMYAJIVoTtFBRRNUou
         IaLblgNvd1QTfcDLwS+kesv/ZORUtM10mjGRwyVPqZE8OBSgsVQEBospFrzBKgQ8Y0bv
         lK4l581kiWyxxVu4C4t2NviB/6LVaEdBpuoTYuEoEtoYZb+4tsoOSi09kyDT64iz9a0n
         N1BFixAP2vGL86aNDvt7K/dcjjVc1DAxORMLPy4BDD9NM2Btt0OX04n3UAwHDwSZIdnA
         mb5y1M07KfoGtwHUuJW6LXO9gckrEuDiIBiyRgjS60n8FI9GRFhjOcHzELlYIzUCC6PB
         mp+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=hP5/xUyD7yW6cvIyRkoeePUvJc0jXic9WcbLUxigB40=;
        b=aK3j849CTOMho6y1/81M/ZBxLV4tlVpHStvKx8D21zAsXQp8gIGzs7dzIvx/wYQiKK
         lRAGEZwt7JsHeN3V2NDhlHLG/1qrBlFyRCBxPLSxnYolxESscLXvqU0OSm4k6cmXlXed
         lI8OP8uNjdPBbXC5UZZwGDIU5gQGbOUOyTUB4EKS/kKDFe9H9dknDx5tPuVUigJ1ymj0
         knDwScmq9KpXoiIb3CqzMSKewjyMHlf4s9dxzqUEHEtcSSzYvffpNNY+yXhbHWV9w9t6
         iRdPEoixkovuzJKEZaFd7+GQkLRn8joJWBrVXV+WWy4OEU7ny2ggMowH8SlR3zb/g9hc
         XFCg==
X-Gm-Message-State: AOAM533Vwe0O9qUHHpNBqx77bQzaUMiDKg6oOrTlW3uxCUiTnrPWacRz
	8ii3HpbYXO22aEsGCN+ty/U=
X-Google-Smtp-Source: ABdhPJw3+sf7/q9knV+x05CL4/Yby+9GQ2EEHXSBNOh+rlPfovbZlZoz4hpOgUN6SwECEi0pU0J/3A==
X-Received: by 2002:a05:6402:2712:b0:42b:476b:6c71 with SMTP id y18-20020a056402271200b0042b476b6c71mr34964679edd.413.1653692031032;
        Fri, 27 May 2022 15:53:51 -0700 (PDT)
Received: from nam-dell ([2a02:8109:afbf:ed88:4971:2aa6:72b5:e75])
        by smtp.gmail.com with ESMTPSA id n24-20020a170906689800b006f3ef214e72sm1816390ejr.216.2022.05.27.15.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 15:53:50 -0700 (PDT)
Date: Sat, 28 May 2022 00:53:50 +0200
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: sm750fb: fix camelCase function name
Message-ID: <20220527225350.GA220436@nam-dell>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change camelCase function name sii164GetVendorID to sii164_get_vendor_id
as suggested by checkpatch.pl

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 6 +++---
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index 029d9acec47d..e0c7ff3352bf 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -15,7 +15,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 #ifdef DVI_CTRL_SII164
 	{
 		.init = sii164InitChip,
-		.get_vendor_id = sii164GetVendorID,
+		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164GetDeviceID,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164ResetChip,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 73e0e9f41ec5..3da1796cd7aa 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -29,13 +29,13 @@ static char *gDviCtrlChipName = "Silicon Image SiI 164";
 #endif
 
 /*
- *  sii164GetVendorID
+ *  sii164_get_vendor_id
  *      This function gets the vendor ID of the DVI controller chip.
  *
  *  Output:
  *      Vendor ID
  */
-unsigned short sii164GetVendorID(void)
+unsigned short sii164_get_vendor_id(void)
 {
 	unsigned short vendorID;
 
@@ -140,7 +140,7 @@ long sii164InitChip(unsigned char edge_select,
 #endif
 
 	/* Check if SII164 Chip exists */
-	if ((sii164GetVendorID() == SII164_VENDOR_ID) &&
+	if ((sii164_get_vendor_id() == SII164_VENDOR_ID) &&
 	    (sii164GetDeviceID() == SII164_DEVICE_ID)) {
 		/*
 		 *  Initialize SII164 controller chip.
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index d940cb729066..ca330f6a43e2 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -27,7 +27,7 @@ long sii164InitChip(unsigned char edgeSelect,
 		    unsigned char pllFilterEnable,
 		    unsigned char pllFilterValue);
 
-unsigned short sii164GetVendorID(void);
+unsigned short sii164_get_vendor_id(void);
 unsigned short sii164GetDeviceID(void);
 
 #ifdef SII164_FULL_FUNCTIONS
-- 
2.25.1

