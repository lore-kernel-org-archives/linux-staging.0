Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1D423BCF7
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 05:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773033398; cv=none; b=sQdIxt0R+RQ5ljxh3+fN61gr5j+WxKer4a70AQong00fhOfuklUTB9eOu952McjgADcOyip9ArWMwoZywKCvf6Ge5MwTb75zTmY52wxhZDQAxh2CN3wnhHwfOJ2AxqcWqrNbEtDS1K6lIWUtP/im9AgljB1tcR9M9UBuu8hUNjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773033398; c=relaxed/simple;
	bh=ziNW58pbE5O9lL1fTYc0E4nEdRa4tRa1LCT9/iUxah8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EGgrBSDyi4pDUCTWx4xfXJbJh3mPDBoCzZo1YRTfHovjmq3raz1pS3/wFJteuxoJam534XowzYSvEN8MKl9XoG64Ng+8bJ05OeipgV40nNcKUOGZMBt7b9tRFX9cZpWxs2XIo0ublkb2PhmJdBWgqbG9lgHeT3juPTRFmdXipfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJbla6rl; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJbla6rl"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso14903655e9.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 22:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773033396; x=1773638196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qTXAkbcXJnxR4hrKwUmC5EZTE4mROqtv/YFJQcRT4FY=;
        b=GJbla6rlmlnpawuHagivjwawGxXt6bKZ7gVHPsNy5d9LUeDtFkEPF7JKBXJqLASUws
         YLSZituNtfm8rbvN9g1xDefsyLPhERCrt/TLbmcS6PieVEgXqSp+P1cr9DAS7Sf2ZAGL
         7Udf1GIkp8Nx0/GkrLCKwLksFwj99BrQCuxlNrf+dZQEGb1Lr+MQKZSTGMX5N7NsLmMs
         Hh3jkCM27xdTKUxMz8fy8km/pxQgaZIzMJJA2k9aj6lgbO8Hfz0hy4leTIUnnUK1Z4v0
         3l4I/TALiyYmwcLoAbeesES/yFV4mMNyQP2TrePGuJkKNLFM4MpNu447a2SygPep1B9y
         VQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033396; x=1773638196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTXAkbcXJnxR4hrKwUmC5EZTE4mROqtv/YFJQcRT4FY=;
        b=b5XJyQJCjbU27m/raGlITnYWiER/PA/OPtQqJeLGqHsDTEqZ5EZxWpgbfdPFZv8gDV
         QIHgmaiD38AEV8kSyuoC/AaBeeButvF53rvpaeTDpI3CmojG+NfVA4tODd1KxzPF2DHf
         cV39Gt9L0a0/oXdV9/gCniVAVTxttpIca4mJeclEPnzE5fkawg39aDysl68z0TIo/ddl
         tyTmzLM3gLwTryFId5PsFjKuPnXxaIVrL9C3rbRqaLsUkiYcKBXnE7Gf2fMpfasu78ko
         +EJqQwuNNBkvr3R4bVMZECX5gN4KxeXxPt4QCSA2DoLzQPC1AqlO1ibaiNQ4CkWPlxRM
         SgLw==
X-Gm-Message-State: AOJu0Yx6igweN/eqBz9ISI4RR76UJ6VJVQv5izH7RIr92Qr4f0ZNs1uP
	fnaT/FHebVgz98OjFsokat2JqgP48vG49s2cFXTK7YE0ffJUWxBn6jiH
X-Gm-Gg: ATEYQzw38CW+jqiIbRMUISms7c3PKJi8yYgdU10Kb2WwWEISr2gVp5ShrkQFDXEXne4
	5/7iGlJG7XVsfaVjqGxjxbf6oTTwHCLMcbUfFtwr47Onollv+R99q5u9rigNgYZvKS5VQdw6x75
	DFy9S5UCTeBFUeYcibsi45skscB/ROJ2slIfNDDQ6ECqNayp9LXkaI7uQKhD7wGVeczjLG30jqX
	fwViYxbxqnMtGM9ajU4WXbo/JsB3QUczcGXMZM6DmlAlo1qElBNYrvyij/1kuQAIU4H8mT1ugGX
	Xxvnv/RtHSXDkDJP3wxd78JnewTXvxNpfvCZ7fx3nFlv1xdHg2QbiiCIYcaJRg3dj/rneihoSer
	EQGDuWDCFHefk7PQgOW95e91n+znJx1wFaRK25tVufDYi64LqEkZtSSug8wMtPGWJpbN31qgbqp
	1HyG1gQ/XZG3/V1t6NczqTbUrxcdGU10s3SvwmGSo9tieV/eJSPRaW8NJ1FqItStDpYj/H9XFxA
	jGVl3+u2YNFZLNpqqQGbVTKUkqkidgy99AQ37J5ATd0Yw==
X-Received: by 2002:a05:600c:470d:b0:485:389b:ee5f with SMTP id 5b1f17b1804b1-485389bf08bmr54289985e9.2.1773033395683;
        Sun, 08 Mar 2026 22:16:35 -0700 (PDT)
Received: from sinandev-VMware-Virtual-Platform.localdomain (92.40.212.68.threembb.co.uk. [92.40.212.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485245dbd87sm94443285e9.16.2026.03.08.22.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 22:16:35 -0700 (PDT)
From: Mustafa Karamanli <mbarancemkaramanli@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Christian Gromm <christian.gromm@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mustafa Karamanli <mbarancemkaramanli@gmail.com>
Subject: [PATCH] staging: most: fix typos in driver_usage.txt
Date: Mon,  9 Mar 2026 05:15:58 +0000
Message-ID: <20260309051558.614246-1-mbarancemkaramanli@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mustafa Karamanli <mbarancemkaramanli@gmail.com>
---
 drivers/staging/most/Documentation/driver_usage.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
index 2fa8dea1da4d..f1b6977f4543 100644
--- a/drivers/staging/most/Documentation/driver_usage.txt
+++ b/drivers/staging/most/Documentation/driver_usage.txt
@@ -101,11 +101,11 @@ following components are available
 	   Userspace can access the driver by means of character devices.
 
 	2) Networking
-	   Standard networking applications (e.g. iperf) can by used to access
+	   Standard networking applications (e.g. iperf) can be used to access
 	   the driver via the networking subsystem.
 
 	3) Video4Linux (v4l2)
-	   Standard video applications (e.g. VLC) can by used to access the
+	   Standard video applications (e.g. VLC) can be used to access the
 	   driver via the V4L subsystem.
 
 	4) Advanced Linux Sound Architecture (ALSA)
@@ -121,7 +121,7 @@ The driver is to be configured via configfs. Each loaded component kernel
 object (see section 1.3) registers a subsystem with configfs, which is used to
 configure and establish communication pathways (links) to attached devices on
 the bus. To do so, the user has to descend into the component's configuration
-directory and create a new directory (child config itmes). The name of this
+directory and create a new directory (child config items). The name of this
 directory will be used as a reference for the link and it will contain the
 following attributes:
 
@@ -129,7 +129,7 @@ following attributes:
 	  configure the buffer size for this channel
 	- subbuffer_size
 	  configure the sub-buffer size for this channel (needed for
-	  synchronous and isochrnous data)
+	  synchronous and isochronous data)
 	- num_buffers
 	  configure number of buffers used for this channel
 	- datatype
@@ -229,7 +229,7 @@ packets within one USB transaction. This renders
 bytes for padding.
 
 Note that at least (2 * subbuffer_size) bytes for isochronous data or
-(subbuffer_size * packts_per_xact) bytes for synchronous data need to
+(subbuffer_size * packets_per_xact) bytes for synchronous data need to
 be put in the transmission buffer and passed to the driver.
 
 Since adapter drivers are allowed to change a chosen configuration to best
-- 
2.43.0

