Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0546A238E13
	for <linux-staging@lists.linux.dev>; Thu, 12 Dec 2024 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734020601; cv=none; b=qeObeVFlEc5scZANL0d3AgamC/bk+MdJE7KIyWNezYBTn/JRJgoC3H319Pm/SQe75JX7nTxiM4jrlXiSb4ZP2C06oyhmWhacdkkBHPLUheaVtoXOaEDJ1CG1Sb0KmL9K36InbBE7+XfoXa+EbcuRt67mXzyZ9iM8YBFYzsBAdTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734020601; c=relaxed/simple;
	bh=IzklbWzy9pJje/+zq7AmwrNbl70oVhHVRnM3SQomDbM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aaJEVuUOhzCDDRrPnftejGlu1ExXJbJkPwH2hcxavNfiq1Y2X1C7B7YlDfKHALZlCtR28SGCwjvZG94jr8yUWcMQ2aX3rtJYMrItAhOXGmqAZhhni1OUc2JizIijIoqS+bo9IMsmvA5trI2cnnkydgUZ9tQSJc8++WsE6OP8iLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbV6AB2V; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbV6AB2V"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fc93152edcso692005a12.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Dec 2024 08:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734020598; x=1734625398; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bq/tKrrwiZQZ2snWS/YijPFN2wQqiF36DpzF3YYYeY8=;
        b=CbV6AB2VF1ZpgA8BpN4DTghjVdjVPbkisJvR6gZW2kJq0+07ED527W/lnIsi8qFRRT
         waGO6w4NPp0lOV2Lu1znizJJmKqJ5HfGtQO3lNOFROAa5Ad0SH/C5cZGunkveiYnUUVV
         M+HNZafCZeTGm3EVcCYuQ3/M2FTVKW8ac6Sv8HDToCDY+dmv94e9RXEibJUx96/12UAS
         4adPQmVEvLhOg/bBubEl9EvniOLc9mgR2a2wvNEPVo03aO2gUTfR8EzJZwI9U7lm+5B7
         R3buKP+64GXDEDbnKwJxb6la9rR7/RnP68KlKuBaN5nW9aQgwd99TLhbKvEYrj8V8pXo
         sSZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734020598; x=1734625398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq/tKrrwiZQZ2snWS/YijPFN2wQqiF36DpzF3YYYeY8=;
        b=l/GoMFAvuNTZJhfV9fAGaO2wcDSDq8YFMfEJ9SDWQUEIfnJ0ZzVl/5DEIVvM+0Adtv
         L+8IFaT1843t8Q/AJdKtKCUgZECsUyz4jpA8M+AzB3TOtf6PGWxzZcdofKVF+2Jq62iV
         bcqH5WK+enRw9j2Eoju/ORBuYuVqp72CqwAE+zceDh/opnlQdN2OmTbnDIQ6qMsUbnSr
         XGTq02HIkKrKa/pLz1el7oyM2TeXt/ictwVbxSe3jPIpqPRVTMWT+zSeTq9dWRTLCmqx
         Nmbpi+ANwdISiGt+UD0Ebgo9G/jze7EqprSlR5cB+J+y69sHPZpcwu9B9qAswjNBjSWE
         F2JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMSAu9ecyGEQFUUULm4Ewq3kJ4XjiEgvkGwjbryaxDv6yLqijGfGvHXQLGp1bcEzcGAZCbINHVPpv/yAqa@lists.linux.dev
X-Gm-Message-State: AOJu0YzNvKyaoewQzyej7ggekhX+q7ilpr+pUaS4NHCXb96nScgWhFpB
	6S1dMloQaa5XyKu0yhQDrx3N6Gg7whyL1/37nagdePSc4VLR7VFO
X-Gm-Gg: ASbGncsYAQnKErK+BRxaVExdhQ9RkQqCEP9WDakX+pscOuRWnNROUbzYJ2gtiORKZgN
	RoLcKgzz9GUQXWker33Ha4hczEDmpjCpTZYes9qilydk8L2UN8rCshNHGaG5usfFINCuc+GO+b5
	bVvDDnujfO9AN2cEeL+AEiFv65RAe1KiIufTdKm0jPi/Yb/rB+N+E/FgIjNYXo9+ImsjYVfjfgF
	lSP2DRL7iDeDuqlnIQUxSHE0RDBbTAGaOnKBzOBckpivzTOZaSGZlOI00S3kzEQOmos1A==
X-Google-Smtp-Source: AGHT+IFDSdz3HsqecrqzbH4bwfGPjStZ3BmAF/QNIlVOG4Eq1G9A0y1LMHnGeH2BBI8c3HCpEQbfzw==
X-Received: by 2002:a17:902:fc48:b0:216:59f1:c7d9 with SMTP id d9443c01a7336-2178c87873emr51058945ad.19.1734020598109;
        Thu, 12 Dec 2024 08:23:18 -0800 (PST)
Received: from localhost.localdomain ([101.0.62.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216356f24d8sm85058595ad.242.2024.12.12.08.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 08:23:17 -0800 (PST)
From: eisantosh95@gmail.com
To: 
Cc: eisantosh95@gmail.com,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	"Everest K.C." <everestkc@everestkc.com.np>,
	Kees Bakker <kees@ijzerbout.nl>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: gpib: Replace semaphore with completion for one-time signaling
Date: Thu, 12 Dec 2024 21:51:04 +0530
Message-Id: <20241212162112.13083-1-eisantosh95@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Santosh Mahto <eisantosh95@gmail.com>

Replaced 'down_interruptible()' and 'up()' calls
with 'wait_for_completion_interruptible()' and
'complete()' respectively. The completion API
simplifies the code and adheres to kernel best
practices for synchronization primitive

Signed-off-by: Santosh Mahto <eisantosh95@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 16 ++++++++--------
 drivers/staging/gpib/ni_usb/ni_usb_gpib.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index b7b6fb1be379..70b8b305e13b 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -85,7 +85,7 @@ static void ni_usb_bulk_complete(struct urb *urb)
 
 //	printk("debug: %s: status=0x%x, error_count=%i, actual_length=%i\n",  __func__,
 //		urb->status, urb->error_count, urb->actual_length);
-	up(&context->complete);
+	complete(&context->complete);
 }
 
 static void ni_usb_timeout_handler(struct timer_list *t)
@@ -94,7 +94,7 @@ static void ni_usb_timeout_handler(struct timer_list *t)
 	struct ni_usb_urb_ctx *context = &ni_priv->context;
 
 	context->timed_out = 1;
-	up(&context->complete);
+	complete(&context->complete);
 };
 
 // I'm using nonblocking loosely here, it only means -EAGAIN can be returned in certain cases
@@ -124,7 +124,7 @@ static int ni_usb_nonblocking_send_bulk_msg(struct ni_usb_priv *ni_priv, void *d
 	}
 	usb_dev = interface_to_usbdev(ni_priv->bus_interface);
 	out_pipe = usb_sndbulkpipe(usb_dev, ni_priv->bulk_out_endpoint);
-	sema_init(&context->complete, 0);
+	init_completion(&context->complete);
 	context->timed_out = 0;
 	usb_fill_bulk_urb(ni_priv->bulk_urb, usb_dev, out_pipe, data, data_length,
 			  &ni_usb_bulk_complete, context);
@@ -143,7 +143,7 @@ static int ni_usb_nonblocking_send_bulk_msg(struct ni_usb_priv *ni_priv, void *d
 		return retval;
 	}
 	mutex_unlock(&ni_priv->bulk_transfer_lock);
-	down(&context->complete);    // wait for ni_usb_bulk_complete
+	wait_for_completion(&context->complete);    // wait for ni_usb_bulk_complete
 	if (context->timed_out) {
 		usb_kill_urb(ni_priv->bulk_urb);
 		dev_err(&usb_dev->dev, "%s: killed urb due to timeout\n", __func__);
@@ -210,7 +210,7 @@ static int ni_usb_nonblocking_receive_bulk_msg(struct ni_usb_priv *ni_priv,
 	}
 	usb_dev = interface_to_usbdev(ni_priv->bus_interface);
 	in_pipe = usb_rcvbulkpipe(usb_dev, ni_priv->bulk_in_endpoint);
-	sema_init(&context->complete, 0);
+	init_completion(&context->complete);
 	context->timed_out = 0;
 	usb_fill_bulk_urb(ni_priv->bulk_urb, usb_dev, in_pipe, data, data_length,
 			  &ni_usb_bulk_complete, context);
@@ -231,7 +231,7 @@ static int ni_usb_nonblocking_receive_bulk_msg(struct ni_usb_priv *ni_priv,
 	}
 	mutex_unlock(&ni_priv->bulk_transfer_lock);
 	if (interruptible) {
-		if (down_interruptible(&context->complete)) {
+		if (wait_for_completion_interruptible(&context->complete)) {
 			/* If we got interrupted by a signal while
 			 * waiting for the usb gpib to respond, we
 			 * should send a stop command so it will
@@ -243,10 +243,10 @@ static int ni_usb_nonblocking_receive_bulk_msg(struct ni_usb_priv *ni_priv,
 			/* now do an uninterruptible wait, it shouldn't take long
 			 *	for the board to respond now.
 			 */
-			down(&context->complete);
+			wait_for_completion(&context->complete);
 		}
 	} else {
-		down(&context->complete);
+		wait_for_completion(&context->complete);
 	}
 	if (context->timed_out) {
 		usb_kill_urb(ni_priv->bulk_urb);
diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.h b/drivers/staging/gpib/ni_usb/ni_usb_gpib.h
index 9b21dfa0f3f6..4b297db09a9b 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.h
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.h
@@ -56,7 +56,7 @@ enum hs_plus_endpoint_addresses {
 };
 
 struct ni_usb_urb_ctx {
-	struct semaphore complete;
+	struct completion complete;
 	unsigned timed_out : 1;
 };
 
-- 
2.25.1

