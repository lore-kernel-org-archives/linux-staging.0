Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB2446CF;
	Tue, 19 Mar 2024 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710830681; cv=none; b=Xb2KOT22B/FR0zUdOo+1gk9bLSK3PQkLOU51CPWU8csATZxg/OuaNoTEHjKwIo8YpUo7yeaT1QzvDIaG4UIBqk6C6Sg67ky2X1NN3twY5OyC2QGPanVgmNxLnjpmMpD8ZsMEXMomOyp/C62iK60CQE+0ji8WLtr3tj23T876y2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710830681; c=relaxed/simple;
	bh=G5NXt+isqIKV5SadklumM8eTj8Eic3FZJmFPj3vaZlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AS8CA3vx+VZVPYu61K/XQjcETiwql6JSXjBaRhQkaafkUReqcNOBHBrUEi3w3ornFY89uFNw0nOEW3NDc1yKuDwRCUrkn7QPPPBNvF3grJpmngRIwItnWZy93/RII4f3IBFdQIAurTzdl1j02+VJYbvz0GVWD2hj86L3JAaKfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iwp/olvU; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iwp/olvU"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso4862217276.2;
        Mon, 18 Mar 2024 23:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710830679; x=1711435479; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tD48G5pyPRHERbwtZMvRnORykfrZperd6+wvK2jM03E=;
        b=Iwp/olvUewp19etc55a7kR0+t69K3CrLuktR0EnYiGW2SYtIxqZig/KIg4JMalGzXJ
         69gsdTWissaTq8U3vSQmRICWQ9HpWj2Vy1ZymOVvTLthgcavEqo8lLnMEejt8dzv0GQB
         YyetZqQfUd9ReQumC03dU7yvRdTICEbxTNT4ZnL7kjSMALq/4GYiGrwvosHFcLMs64WQ
         80PHD9vhhHZU1e8k+knCvIOhjO0pzF3xPI2f+9X2YMWXl4TCF7inb1xya44s7BxPeoC3
         yGU1/7+H6txTAvkP1z24h3+fyuDPXKlrQMf3HagV5v/0gOB6yBjHCz/AcVyZY8jEHVjy
         IImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710830679; x=1711435479;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tD48G5pyPRHERbwtZMvRnORykfrZperd6+wvK2jM03E=;
        b=S0/SWzdDQuonD4ejeapKKJXxVdkMrsV6+RuA8JhsaA9l/SRUNjDKh7KzL67C2nk9sp
         Nroxt9PfBhlV2PUuFVbShmkV97YZcrB7uh2IX31vyYw1ozD/MmKzPoVFj5kG/kcFdtDo
         JBpLqmO4UcCTnQhfzV8RPjeVGgZHvuguQqFAN9vcl97ELy09CE6luiFKkJgvpSRAXkBN
         2cHUKYNBundvEn30n2Sd5y/mWkNuHsvgjUl+0+OZCEsyD52xKjXtaI3Gv6q/r0yvGvp1
         N6rTfw7X733mXSZ409DhnQjD5JVUCkegTRIfyv72X0QwkzEB4kUeETnSXwCtvOr7DewB
         DtaA==
X-Forwarded-Encrypted: i=1; AJvYcCWyuBmVggJcN/iukjcAEiAoT07sthN5E2HsJr5bWmBcHMrBOMLNK+NLlE93lxJn7pw+EVBBqSnOvNyKCrN1noW2mWWQkjUJhNdYugpY5g==
X-Gm-Message-State: AOJu0Yxfn5UuDfZLzFzF5IMWWxQrohhMDEJ++HzreUtk+jgaQu7aMTzE
	HkZBikeQQwv4CkSif1eCDPQat2zglq0QzPZYe4kWZKjTXQM6my3oVxa8UC1w4hU=
X-Google-Smtp-Source: AGHT+IEjtFw6MADKGJ5daCrR6LVa+5tNozEx2auo/2thb69w8E4TPzHkXW0YnW8lv4NVwDwW7HfTVg==
X-Received: by 2002:a25:868a:0:b0:dc2:1f53:3a4f with SMTP id z10-20020a25868a000000b00dc21f533a4fmr1169119ybk.5.1710830678851;
        Mon, 18 Mar 2024 23:44:38 -0700 (PDT)
Received: from MOLeToid ([102.244.37.246])
        by smtp.gmail.com with ESMTPSA id hf21-20020a05622a609500b00430b74c1661sm3994884qtb.97.2024.03.18.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 23:44:38 -0700 (PDT)
Date: Tue, 19 Mar 2024 07:44:33 +0100
From: "Felix N. Kimbu" <felixkimbu1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] staging: pi433: Correct comment typos in pi433_if.c
Message-ID: <Zfk0UfLh3rRf6qDv@MOLeToid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Correct typos in pi433_if.c comments to address the following checkpatch checks;

CHECK: 'interace' may be misspelled - perhaps 'interface'?
#13: FILE: drivers/staging/pi433/pi433_if.c:13:
+ * HopeRf with a similar interace - e. g. RFM69HCW, RFM12, RFM95, ...
                          ^^^^^^^^

CHECK: 'ebedded' may be misspelled - perhaps 'embedded'?
#71: FILE: drivers/staging/pi433/pi433_if.c:71:
+ * so we have just one rx config, ebedded in device struct
                                   ^^^^^^^

CHECK: 'reenabled' may be misspelled - perhaps 're-enabled'?
#650: FILE: drivers/staging/pi433/pi433_if.c:650:
+                * irq will be reenabled after tx config is set
                               ^^^^^^^^^

CHECK: 'pendig' may be misspelled - perhaps 'pending'?
#926: FILE: drivers/staging/pi433/pi433_if.c:926:
+               /* during pendig read request, change of config not allowed */
                          ^^^^^^

Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index b6c4917d515e..81de98c0245a 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -10,7 +10,7 @@
  * devices, basing on HopeRfs rf69.
  *
  * The driver can also be extended, to support other modules of
- * HopeRf with a similar interace - e. g. RFM69HCW, RFM12, RFM95, ...
+ * HopeRf with a similar interface - e. g. RFM69HCW, RFM12, RFM95, ...
  *
  * Copyright (C) 2016 Wolf-Entwicklungen
  *	Marcus Wolf <linux@wolf-entwicklungen.de>
@@ -68,7 +68,7 @@ static const struct class pi433_class = {
  */
 /*
  * rx config is device specific
- * so we have just one rx config, ebedded in device struct
+ * so we have just one rx config, embedded in device struct
  */
 struct pi433_device {
 	/* device handling related values */
@@ -647,7 +647,7 @@ static int pi433_tx_thread(void *data)
 
 		/*
 		 * prevent race conditions
-		 * irq will be reenabled after tx config is set
+		 * irq will be re-enabled after tx config is set
 		 */
 		disable_irq(device->irq_num[DIO0]);
 		device->tx_active = true;
@@ -923,7 +923,7 @@ static long pi433_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case PI433_IOC_WR_RX_CFG:
 		mutex_lock(&device->rx_lock);
 
-		/* during pendig read request, change of config not allowed */
+		/* during pending read request, change of config not allowed */
 		if (device->rx_active) {
 			mutex_unlock(&device->rx_lock);
 			return -EAGAIN;
-- 
2.34.1

