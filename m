Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8C418CBF6
	for <linux-staging@lists.linux.dev>; Sun,  3 Nov 2024 21:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730669198; cv=none; b=BCSs3O6Y0DbsVkNr/Xmj7DddY46QKIAY3qoaM3E6XcrHehOTuDrf+M4wVyObzIjn919lMsQEi4nqG2Tn9CktZD0ZkQ7aUIAxzCQ4TqdVbN9jk5N1CCthwxhkVNPujVyLtMJ9tOIW4dbFXsDW/FoouDz/2j8nmJrvzhZMzH56nlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730669198; c=relaxed/simple;
	bh=GnOIAECmVwiT8+ZXSM9/4gaR3PBUUO7ucq0L/jGUvhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRLy4xy85CzQE6NenREaUPFY2w9ipxQ8udboB93uECSDtWcyLUszE3zzuR2v+xRnHlk7tNxWSoXHFzMU2w3Mj3m/9i+0+4Hhbk5Uye/3sTS9c83enuP2afTPo3udeZ6yToYSSxEVsGR/bVDrZtkDxWX0Qn1TvuCG1M6KmIottRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDZK+YwD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDZK+YwD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315abed18aso29044355e9.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Nov 2024 13:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730669194; x=1731273994; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jed53pgUVzCUOul7yhZEbquQmhu+DNb2Fp6Ww01czCY=;
        b=HDZK+YwDErpEINCzuMft44GjGXG3oxsAK4aW9SnV1KttxdXDBU+iyDj6ciXsPNWRmG
         5lMMCRJcXWwPgzlIpDyJip+h4xGRxCu9nc5WZXmwOhA0OLQDmVu/WJy9xyUctAl7SDFX
         u+Vp9rXDkNfQdWj4qP7ZDVHCc4K9fT2QfYTBbLO1R/BoC4HnJpvGeb+bWqwu86nzFExJ
         pyusdJnYclUMw162F09hlahBcaO8+3YGZgTK6rBps7QXvyQ7tDscDUOrQ376GnnAdCZt
         V+lXZFV9n3Osb66ZLGJQdAGyhzohlSifCsctjodaUjxUeEcaZr07oGNpArr3DkTeYlCW
         D/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730669194; x=1731273994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jed53pgUVzCUOul7yhZEbquQmhu+DNb2Fp6Ww01czCY=;
        b=PDIKSJFEhPp65iIoAmDeHG3SCTmYjQZhBw3nfk55+9YG4+aYaSVw9BE6ZZd5jSUfxu
         P+rp6cdtZc8NyXb9NVm6kfDfwB70d9sFPCNBqU4MPIB8epr0SSfBIqKbp4apVHNpbEza
         XblZnrah3zDEGWr98uRJxLl3wM2a0iNFOAWRoOfmf+zU2mQJldEpWbHepESGsXwUtxH3
         D8mHspYXLY1LClYIZR5LKQA5aaCW+6lIWQislROrbp5yGP0Dd+JY4ie5/3vJ68XbSM+I
         EEaODTbjbE0DYglN+8NpPJxsMsvXgnhdapA38ib7mkeUJ6cSBVQzeL3tbChtFjAgib+c
         R6nQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0CrxFSgDDoqVHC73QycyqRPPwyA5YL05giKvZJ7K0NjHLXSs/clMbHXnUAqOS5ApafHPh+7q9LGjCRunP@lists.linux.dev
X-Gm-Message-State: AOJu0Yz57bjdAojMOOuJhBaFIlJnwEOAzSHypswIJoVIf7oM3pCeu0ag
	Z4lKQTPxWIfl3KCm0fb0Bg66oe6k2PZ61HGhCGSeV0UxxKaLB4ej
X-Google-Smtp-Source: AGHT+IEfNq5tYWaFk8cJkbi6Qdpav8ARRd+uBLPxYzWYy3g8I0SKf2qM2YjYARIIoNsGlRFWGo203g==
X-Received: by 2002:a05:6000:1a8a:b0:37d:4a7b:eeb2 with SMTP id ffacd0b85a97d-381c7a6d600mr7981934f8f.35.1730669194110;
        Sun, 03 Nov 2024 13:26:34 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd910718sm166150385e9.12.2024.11.03.13.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:26:33 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 05/11] staging: gpib: Remove GPIB_DEBUG reference and update messaging
Date: Sun,  3 Nov 2024 22:26:11 +0100
Message-ID: <20241103212617.13076-6-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241103212617.13076-1-dpenkler@gmail.com>
References: <20241103212617.13076-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change pr_alert to dev_alert

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 69 +++++++++----------
 1 file changed, 34 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 4c580137043f..796c3a5be545 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -68,11 +68,8 @@ MODULE_DEVICE_TABLE(usb, skel_table);
  *	      At module loading:  modprobe lpvo_usb_gpib debug={0,1,2}
  *	      On the fly: echo {0,1,2} > /sys/modules/lpvo_usb_gpib/parameters/debug
  */
-#ifdef GPIB_DEBUG
-static int debug = 1;
-#else
+
 static int debug;
-#endif
 module_param(debug, int, 0644);
 
 #define DIA_LOG(level, format, ...)					\
@@ -366,10 +363,10 @@ static int one_char(gpib_board_t *board, struct char_buf *b)
 		DIA_LOG(2, "--> %x\n", b->inbuf[b->last - b->nchar]);
 		return b->inbuf[b->last - b->nchar--];
 	} else if (b->nchar == 0) {
-		pr_alert("%s:%s - read returned EOF\n", NAME, __func__);
+		dev_alert(board->gpib_dev, "%s:%s - read returned EOF\n", NAME, __func__);
 		return -EIO;
 	}
-	pr_alert("%s:%s - read error %d\n", NAME, __func__, b->nchar);
+	dev_alert(board->gpib_dev, "%s:%s - read error %d\n", NAME, __func__, b->nchar);
 	TTY_LOG("\n *** %s *** Read Error - %s\n", NAME,
 		"Reset the adapter with 'gpib_config'\n");
 	return -EIO;
@@ -412,8 +409,8 @@ static void set_timeout(gpib_board_t *board)
 	}
 
 	if (val != ACK) {
-		pr_alert("%s:%s - error in timeout set: <%s>\n",
-			 NAME, __func__, command);
+		dev_alert(board->gpib_dev, "%s:%s - error in timeout set: <%s>\n",
+			  NAME, __func__, command);
 	} else {
 		data->timeout = board->usec_timeout;
 	}
@@ -456,8 +453,8 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 
 	if (config->device_path) {
 		/* if config->device_path given, try that first */
-		pr_alert("%s:%s - Looking for device_path: %s\n",
-			 NAME, __func__, config->device_path);
+		dev_alert(board->gpib_dev, "%s:%s - Looking for device_path: %s\n",
+			  NAME, __func__, config->device_path);
 		for (j = 0 ; j < MAX_DEV ; j++) {
 			if ((assigned_usb_minors & 1 << j) == 0)
 				continue;
@@ -492,7 +489,8 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 	mutex_unlock(&minors_lock);
 
 	if (j == MAX_DEV) {
-		pr_alert("%s:%s - Requested device is not registered.\n", NAME, __func__);
+		dev_alert(board->gpib_dev, "%s:%s - Requested device is not registered.\n",
+			  NAME, __func__);
 		return -EIO;
 	}
 
@@ -737,7 +735,8 @@ static int usb_gpib_line_status(const gpib_board_t *board)
 	buffer = send_command((gpib_board_t *)board, USB_GPIB_STATUS, 0);
 
 	if (buffer < 0) {
-		pr_alert("%s:%s - line status read failed with %d\n", NAME, __func__, buffer);
+		dev_alert(board->gpib_dev, "%s:%s - line status read failed with %d\n",
+			  NAME, __func__, buffer);
 		return -1;
 	}
 
@@ -777,7 +776,7 @@ static int usb_gpib_parallel_poll(gpib_board_t *board, uint8_t *result)
 
 	retval = set_control_line(board, IB_BUS_EOI, 1);
 	if (retval != ACK) {
-		pr_alert("%s:%s - assert EOI failed\n", NAME, __func__);
+		dev_alert(board->gpib_dev, "%s:%s - assert EOI failed\n", NAME, __func__);
 		return -EIO;
 	}
 
@@ -787,7 +786,7 @@ static int usb_gpib_parallel_poll(gpib_board_t *board, uint8_t *result)
 
 	retval = set_control_line(board, IB_BUS_EOI, 0);
 	if (retval != 0x06) {
-		pr_alert("%s:%s - unassert EOI failed\n", NAME, __func__);
+		dev_alert(board->gpib_dev, "%s:%s - unassert EOI failed\n", NAME, __func__);
 		return -EIO;
 	}
 
@@ -869,8 +868,8 @@ static int usb_gpib_read(gpib_board_t *board,
 		goto read_return;
 
 	if (one_char(board, &b) != DLE || one_char(board, &b) != STX) {
-		pr_alert("%s:%s - wrong <DLE><STX> sequence\n",
-			 NAME, __func__);
+		dev_alert(board->gpib_dev, "%s:%s - wrong <DLE><STX> sequence\n",
+			  NAME, __func__);
 		retval = -EIO;
 		goto read_return;
 	}
@@ -910,15 +909,15 @@ static int usb_gpib_read(gpib_board_t *board,
 					retval = 0;
 					goto read_return;
 				} else {
-					pr_alert("%s:%s - %s %x\n",
-						 NAME, __func__,
-						 "Wrong end of message", c);
+					dev_alert(board->gpib_dev, "%s:%s - %s %x\n",
+						  NAME, __func__,
+						  "Wrong end of message", c);
 					retval = -ETIME;
 					goto read_return;
 				}
 			} else {
-				pr_alert("%s:%s - %s\n", NAME, __func__,
-					 "lone <DLE> in stream");
+				dev_alert(board->gpib_dev, "%s:%s - %s\n", NAME, __func__,
+					  "lone <DLE> in stream");
 				retval = -EIO;
 				goto read_return;
 			}
@@ -937,8 +936,8 @@ static int usb_gpib_read(gpib_board_t *board,
 			c = one_char(board, &b);
 			if (c == ACK) {
 				if (MAX_READ_EXCESS - read_count > 1)
-					pr_alert("%s:%s - %s\n", NAME, __func__,
-						 "small buffer - maybe some data lost");
+					dev_alert(board->gpib_dev, "%s:%s - %s\n", NAME, __func__,
+						  "small buffer - maybe some data lost");
 				retval = 0;
 				goto read_return;
 			}
@@ -946,8 +945,8 @@ static int usb_gpib_read(gpib_board_t *board,
 		}
 	}
 
-	pr_alert("%s:%s - no input end - GPIB board in odd state\n",
-		 NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - no input end - GPIB board in odd state\n",
+		  NAME, __func__);
 	retval = -EIO;
 
 read_return:
@@ -973,8 +972,8 @@ static void usb_gpib_remote_enable(gpib_board_t *board, int enable)
 
 	retval = set_control_line(board, IB_BUS_REN, enable ? 1 : 0);
 	if (retval != ACK)
-		pr_alert("%s:%s - could not set REN line: %x\n",
-			 NAME, __func__, retval);
+		dev_alert(board->gpib_dev, "%s:%s - could not set REN line: %x\n",
+			  NAME, __func__, retval);
 
 	DIA_LOG(1, "done with %x\n", retval);
 }
@@ -1072,21 +1071,21 @@ static int usb_gpib_write(gpib_board_t *board,
 static void usb_gpib_parallel_poll_configure(gpib_board_t *board,
 					     uint8_t configuration)
 {
-	pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 }
 
 /* parallel_poll_response */
 
 static void usb_gpib_parallel_poll_response(gpib_board_t *board, int ist)
 {
-	pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 }
 
 /* primary_address */
 
 static int  usb_gpib_primary_address(gpib_board_t *board, unsigned int address)
 {
-	pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
 }
 
@@ -1094,7 +1093,7 @@ static int  usb_gpib_primary_address(gpib_board_t *board, unsigned int address)
 
 static	void usb_gpib_return_to_local(gpib_board_t *board)
 {
-	pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 }
 
 /* secondary_address */
@@ -1103,7 +1102,7 @@ static int usb_gpib_secondary_address(gpib_board_t *board,
 				      unsigned int address,
 				      int enable)
 {
-	pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
 }
 
@@ -1111,14 +1110,14 @@ static int usb_gpib_secondary_address(gpib_board_t *board,
 
 static void usb_gpib_serial_poll_response(gpib_board_t *board, uint8_t status)
 {
-	pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 }
 
 /* serial_poll_status */
 
 static uint8_t usb_gpib_serial_poll_status(gpib_board_t *board)
 {
-	pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
 }
 
@@ -1126,7 +1125,7 @@ static uint8_t usb_gpib_serial_poll_status(gpib_board_t *board)
 
 static unsigned int usb_gpib_t1_delay(gpib_board_t *board, unsigned int nano_sec)
 {
-	pr_alert("%s:%s - currently a NOP\n", NAME, __func__);
+	dev_alert(board->gpib_dev, "%s:%s - currently a NOP\n", NAME, __func__);
 	return 0;
 }
 
-- 
2.46.2

