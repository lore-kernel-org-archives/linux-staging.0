Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6A8302770
	for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758311775; cv=none; b=sDktnQi3nIVcpPVXiz0ZtwsUf774tseuHWqcxBJVK95wGQnD10f5QLPfEJ6Np//gRFWR047PyxT/3sYC2qTfENiyO30FpOirnUC91iDBC5vzUZFDz4zx22CjvpWnGTgEk8xYFNoBc6qW69FVKP9kzNBrsaMESrik97JT20ZGars=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758311775; c=relaxed/simple;
	bh=h7sweuEsEGlPSYr+1OEUZsfHCl7ayvbSe+dikNXkK/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KJDTPxmvD6G9nspiAj7QofGAuuhV9BwI4oAx2+rTSOBW2B94l/Og5t1ZHWEEGc7fY0SWzGwfcbleoWN1wW7uERhCp8DAyydRpHRk1POSMLr54ODK22/ZMSBDazxbFm/cDggXwqAD2tS/QerSMxEjmpAq2LKZUfSQzCBp4vOKYjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdd+FA24; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdd+FA24"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso19372065e9.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 12:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758311772; x=1758916572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llSNvslw2CsU40qpSC7jOlhETQzQ9c1QPwEF6mALsL8=;
        b=cdd+FA24hQCx0/nyrF8Z3aeK8OE4tGF5MmI0P6aloJfy+xDthjXTwlqE+EX5Ekk5yD
         vs4VjLhDR25eQQK5Q8Qk301HC6cZql/juGBqhv5iTcfApViKGDYJYMrUhHFEIl96Y2md
         MqnxqF7Shn12leKh0I4HwfUtmc0x+C77Wfr37MCAdACkQ878CgAbLwA2GoEeoMb6G6BR
         X99ZyFHkDqVXdE6iUsU+UsRGEZYcShWedZldRsgaK2U24cBlAZhVJD5WxXdZRNr6/uaK
         caz7sXc6cHyr8ow+CFVhEWHZnEZzIiN2Z5BH7Pg2sKf6pPFw8BoM9TwW1aFykXArllt4
         OCFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758311772; x=1758916572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llSNvslw2CsU40qpSC7jOlhETQzQ9c1QPwEF6mALsL8=;
        b=tmt/FxGEDxIuRQWtJV01frVb8Lm2u5SD01ySkb5z5qNWVokizCMBGTpiPYs0g38AQf
         7TNoc+gRdeM1N1txHY4Kjwa46chpyvPguPoTrdzGjMjcDa0acLyIb/zTd5zgP6i/V2rq
         tlX/DHWQobVRkMSVNhbwiKAeiXgVvlNFI+2HUNEHd26XPiZxEZq85tyQhaIb4GbNKAKL
         AdHzAhcEeDYr4rfpxKvfUHg+vk2ugVMZPlZgBydVvWngPcC6u462WlXIYOL1tmSZp2x/
         N3jaRcraZwOcmpM3TNvO6G/OTGW791dZnv7KoNolcdw878bRtwAOgSxjS99m0cYGIO3Y
         3X7A==
X-Forwarded-Encrypted: i=1; AJvYcCWSCuTSbisOJVmJSm1U/DP6HZoEUGH4fB6K7I/GsTdKvr/7KsksRVTQUsRjxTgWhuGja+RTzTTCtFfgoRz0@lists.linux.dev
X-Gm-Message-State: AOJu0YyxGPA353+Bn8AnVR9e9JcZy2sknNLVOoKW0ETH7ozOdjJCMAGU
	jHUCq1yzkx7ZZGaGwD7PBXe90y9DVdwoD4oDkseNg3B7dkikNlWY0rAT
X-Gm-Gg: ASbGncuDOlyCWW766EhcwViURzDs50fdlQsmiexeK59/OQ3g8VapZnktqjTzbMKk4Y3
	qaQYKa4J6xNzyAXzwpkdiZXRTLItTzRDz776HVN/OgJ0UbGEJlm9X6N44DpPer0Q2qLQEScLwDf
	NKtHFl2ES9mc0V9N3z9knknyf9Ss6XfLOf4MRTVt/WgwJk/YPFOcVmurtFNajv9vRZECqSPOixo
	Rja/N/AXPJBTzvduwa853KYx39j/7lPyEGnNUpIwMw2BhM+AgeirXTsq+xJMSiE1cTPOctAXm1o
	CNwJwlQvHFMT2bVfKS/h4RMM2liIl6Z7KW7l1pEWlxGAP7tXSfl6oEyf9okDwkuowxtT5e6qxbV
	8GUPPWd7uITd0eYEdbQ1i82Jcb0ckoEvO4g==
X-Google-Smtp-Source: AGHT+IFcYVfJ+wi2LF4/5toTMUmLRgsE3vKXz3aeW7P2gPLBbkp1ZGcAwumQdy1dQXmI6Iv1rP0I2A==
X-Received: by 2002:a05:600c:5250:b0:45d:d3a1:70dd with SMTP id 5b1f17b1804b1-467f110c297mr36255215e9.35.1758311771608;
        Fri, 19 Sep 2025 12:56:11 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f162726bsm97025485e9.7.2025.09.19.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 12:56:11 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 4/6] staging: axis-fifo: remove get_dts_property() helper
Date: Fri, 19 Sep 2025 22:53:58 +0300
Message-ID: <20250919195400.3180039-4-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
References: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The get_dts_property() wrapper around of_property_read_u32() adds no
real value and duplicates error handling. Inline the calls directly in
axis_fifo_parse_dt() to reduce indirection and simplify the code.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 39 +++++++++------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index c500cb0555b7..21fcc9150d7e 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -502,30 +502,14 @@ static void axis_fifo_debugfs_init(struct axis_fifo *fifo)
 			    &axis_fifo_debugfs_regs_fops);
 }
 
-/* read named property from the device tree */
-static int get_dts_property(struct axis_fifo *fifo,
-			    char *name, unsigned int *var)
-{
-	int rc;
-
-	rc = of_property_read_u32(fifo->dt_device->of_node, name, var);
-	if (rc) {
-		dev_err(fifo->dt_device, "couldn't read IP dts property '%s'",
-			name);
-		return rc;
-	}
-	dev_dbg(fifo->dt_device, "dts property '%s' = %u\n",
-		name, *var);
-
-	return 0;
-}
-
 static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 {
 	int ret;
 	unsigned int value;
+	struct device_node *node = fifo->dt_device->of_node;
 
-	ret = get_dts_property(fifo, "xlnx,axi-str-rxd-tdata-width", &value);
+	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
+				   &value);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,axi-str-rxd-tdata-width property\n");
 		goto end;
@@ -535,7 +519,8 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 		goto end;
 	}
 
-	ret = get_dts_property(fifo, "xlnx,axi-str-txd-tdata-width", &value);
+	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
+				   &value);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,axi-str-txd-tdata-width property\n");
 		goto end;
@@ -545,30 +530,32 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 		goto end;
 	}
 
-	ret = get_dts_property(fifo, "xlnx,rx-fifo-depth",
-			       &fifo->rx_fifo_depth);
+	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
+				   &fifo->rx_fifo_depth);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
 		ret = -EIO;
 		goto end;
 	}
 
-	ret = get_dts_property(fifo, "xlnx,tx-fifo-depth",
-			       &fifo->tx_fifo_depth);
+	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
+				   &fifo->tx_fifo_depth);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
 		ret = -EIO;
 		goto end;
 	}
 
-	ret = get_dts_property(fifo, "xlnx,use-rx-data", &fifo->has_rx_fifo);
+	ret = of_property_read_u32(node, "xlnx,use-rx-data",
+				   &fifo->has_rx_fifo);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
 		ret = -EIO;
 		goto end;
 	}
 
-	ret = get_dts_property(fifo, "xlnx,use-tx-data", &fifo->has_tx_fifo);
+	ret = of_property_read_u32(node, "xlnx,use-tx-data",
+				   &fifo->has_tx_fifo);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
 		ret = -EIO;
-- 
2.50.0

