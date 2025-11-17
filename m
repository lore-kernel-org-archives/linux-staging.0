Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572FD325723
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 09:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371231; cv=none; b=kwd49FpHrW1EbM1FmezKmh+6erQqh4AQVHXEPhYHeJkmSao5Qk08EHSRS1/frEuGCz8QWtVn5KNLnDf1av3GDLIq2RIjkss4lT6N/Q/hV+2mwVULSK2PofMQ06WwEssewrZd8I4FmoInnMrYZOf7TgIKv0qvGEzvqLlBxjw+5Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371231; c=relaxed/simple;
	bh=a4fTU6UP9CkAxvGqAHOiltAIguNyKbg11FCldTLp0Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WDShp2yPHm2Jl1/yOXd8tyoSNiBOoIZG7xYqhMmHwuTLm41noka7oQLt2/zjRyC45sKQobV16yhBHtLmHJZPdspEr4hgHqX3vN+uOqfRkx5lYhRcKA2g3DQrCUtNM9n/JzeywVB5ZCPLaBrJfvcoz47lwNneKIWc7O0eKtkt3hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X91EIWVb; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X91EIWVb"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59425b1f713so178432e87.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 01:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763371227; x=1763976027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rI0HPPCtyp4yu+reKLrbNPX8mMFxoYwB78qpE37DEzA=;
        b=X91EIWVbC466jbEekiZeRcN6JF0uLWWWSZBO/eKHGl4jpEOGj2Sdv1LwJ3TcvRnON3
         Vxe/fqF2CgGuQcAZtfRtiY5FTFU0YelG3G9XUXCkDIqQsgZCO5JPQUDmXtM8IS+wC1dn
         b24CFfqnDfuktOOLehBxtxmSFKRh11F99uW1MAwIm72UpLYiYve1E4yFMVfsV7hw/ifW
         iohlhRfGocetDCToIbaG9OWEXLYbCLMMr8U9/nB1V69OltEQSVhzlPAdoWel9zFRy99j
         xzmGY5wUiVHxQTVe2cn1gONV3ipZTN0jQ+qfo79/SV/earBTYjb8Rk3H91BGc8EZPPTz
         Vx/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371227; x=1763976027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rI0HPPCtyp4yu+reKLrbNPX8mMFxoYwB78qpE37DEzA=;
        b=vaj06uy/daYsxqdfrYEwNRLjFskW1Ra8kxFs86jf2wuY/p59cohOs8Hw/vmuNlhFQG
         dMgmXMcsxAdS5K16O6DJYv+mNBDXv5Yfa9KYQ3L3zNmkw17lsL4U8PZg29+eljrQj+om
         ne2Qrrwr0qwFaaDqLoVldQ/xEerJBmFxqsBVoMbwzN3nBfl5bp81DiwCqGsZmmpq8oqk
         IPnWW3nFU+sviot1EaZFDf5HC4JaJv/HfaKUCzmkbrwVrwIWyVqVbBcgh0dgqHYsRyM5
         SzS1uwJSAaXIXxaMALXBfe+thOfkkUSJoiRTszy3UA0ZG+Wmopeo4LXYOBZZdjwADWiV
         IpZQ==
X-Gm-Message-State: AOJu0Ywdr+8SEUxea5KLomRg7ChOcTqEPUrEi6O+8arwSauAf8m/h1TY
	jxyG4wulZm/+CwbI2FkdBxgQ8/0Qn9zEMekH73MtONxQAPB4VrngYg8sI6BfXH4hpNTFgw==
X-Gm-Gg: ASbGncuwwMm7lTLvJ3cVmlsSqlO/MQI5gFxs6Fj8LH7gAKCTcmF2kRlIt88ZLxobxQa
	55/+kkaUIifgybQy4x5j4ukhRtpUCo1CaGBD01l/Oj/TOv8w8yzhYNYBtW0QAwuOWWRX1YxKvSl
	6IbBPb2+yNdQvqtQmn6k6ttuAV7i1j2FjJ75SzIVd53guiK2ZgzpFDX+yC8ByJ5Yg6kyh1xzNmJ
	ST8Hdh8kVtHUhsPLsoCfAej3Nk6vcQ5BEFMuWWrE7h2K7UXb0BV9fjxzUmuAwhO0nUBL4mFY4KY
	luFpRKzy4rdnTFauob/y8GCdzkIiECSK8KrqFeoM7/6qqFeGO6yjlf57KW4oC4EUk0RiPdRIlWP
	LDANJgviWRHetATxBPKvLmiUPZyrXoB0dkqndUi9VIfQ/c0XaqkDFTxPfI77WI1USi6QQ2Q1XsM
	Ru
X-Google-Smtp-Source: AGHT+IFq3kKYzMuLvm3SBRhlzhFYO0eC7UtndtVPcQK9gTRMA2c/j3bUz2/VXfWYz2KrnKhO1dP6Tg==
X-Received: by 2002:a05:6512:a96:b0:592:f7b4:e5fb with SMTP id 2adb3069b0e04-595847f35f0mr1849890e87.3.1763371226803;
        Mon, 17 Nov 2025 01:20:26 -0800 (PST)
Received: from grimoire ([45.152.181.138])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405afbsm3015583e87.93.2025.11.17.01.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:20:25 -0800 (PST)
From: Adam Quandour <adam.quandour@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	niharchaithanya@gmail.com,
	dan.carpenter@linaro.org,
	matchstick@neverthere.org,
	gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	adam.quandour@gmail.com
Subject: [PATCH] staging: gpib: Clean-up commented-out code
Date: Mon, 17 Nov 2025 12:20:20 +0300
Message-ID: <20251117092020.8473-1-adam.quandour@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused code.

Signed-off-by: Adam Quandour <adam.quandour@gmail.com>
---
 drivers/staging/gpib/cb7210/cb7210.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
index 3e2397898a9b..24c61b151071 100644
--- a/drivers/staging/gpib/cb7210/cb7210.c
+++ b/drivers/staging/gpib/cb7210/cb7210.c
@@ -1290,26 +1290,14 @@ static void cb_gpib_release(struct pcmcia_device *link)
 
 static int cb_gpib_suspend(struct pcmcia_device *link)
 {
-	//struct local_info *info = link->priv;
-	//struct struct gpib_board *dev = info->dev;
-
 	if (link->open)
 		dev_warn(&link->dev, "Device still open\n");
-	//netif_device_detach(dev);
 
 	return 0;
 }
 
 static int cb_gpib_resume(struct pcmcia_device *link)
 {
-	//struct local_info *info = link->priv;
-	//struct struct gpib_board *dev = info->dev;
-
-	/*if (link->open) {
-	 *	ni_gpib_probe(dev);	/ really?
-	 *	//netif_device_attach(dev);
-	 *
-	 */
 	return cb_gpib_config(link);
 }
 
-- 
2.51.0

