Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74FA15ECD7
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135044; cv=none; b=DQNP5CKnLI40BtXvGmDi6Aotk4PoAFqpNyNlP/J3H/H2+wl909OXJXVHTesLWLjkK4iVQksI6X16NWEDqTjeeSzyraHqHLwQOPwSK52cUMbn46HWK8/AOOC07PBDVfWcBU37bB7bM+NqND4FcZ0cAh6QGsMEi2u8Lsey59NFR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135044; c=relaxed/simple;
	bh=BvqQ+CBpYAAVznTR42OPdLQU4WD8pPMFPt45Xuh5A6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V0o8Kvm3UpQ0A39KrqCmJuC2e+WoLOJ/gvlE63Uqq7wJlrbBhcHmgGKCLt5dULn2AdpUpWY4dUCz+BIZBVRyUP+u3VRrYllFhx099DK03U+G564OktU2tc5iGy6ZGZcA7dvo5qshB46WHYslm9V4KxCtOCR91RS0+0YIzOUbPk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHQQg7sZ; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHQQg7sZ"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acec5b99052so214192066b.1
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135040; x=1746739840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqUDyK3vGEqizw5TTGXv8tq5hFBthnGAWaurTJpA32Q=;
        b=JHQQg7sZRnjkbtRtdJ27t+lWObQhTXOEUv+HRJzDLUonALoDnvjZWxYhJqVs/FgA9b
         GuO95gFHhqj6LSIuwEaGT1XOvunjE0XDz4aTD9aK5CiH1ekOGicj5Y4zySH41LKG/hAy
         JNwo0o3sLVc8clVSxGZoehlK0DGGkU1XWDDHPwnoVm5IsYrtw8wyDcZywgDy1MjpHnzE
         OdvlaepJW1eF60Zji1wHguSsZBxP4Luwuji2hewiOLTqb2YZgmk3Wbni7wtSIX01aOrm
         XaJ3cpUmsjzf6tbUgrASmKlzViTwmC8aletLvAPJ/JjsYMepOPyHIsyd/hNMGlbHJhZ8
         bSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135040; x=1746739840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqUDyK3vGEqizw5TTGXv8tq5hFBthnGAWaurTJpA32Q=;
        b=FWAhO0vacRZySCucZgqrwhuM6wpgWKEHrQSMAv7befWQoFx9VmYwhtgrDo1q4y+uhe
         cTZBJkIc1b08cCGeO9lrt/j+uw1EOqm9SO3V9OrG556zeL6gXZLIy6kZwzFOAQv2LOoN
         o0zOEVNZszIOeGQaHfyJyCFQ4W0myhngBL9QU9iYRWzXJzvKNVqouvEEvljBboS6Wbjc
         jPXRKoXoZAmddntBKyqDNaFBt/jqGbpMRlXrsKvd9Zk6OK4kO2W2NNaipQjBFkXtEjqY
         LjDaXa0YzNjyoTHqYlXQZQ563SrTYduX54QjHcRJ0WCYJteWMh5Sop4oZQYFmWkq/DqE
         M35Q==
X-Forwarded-Encrypted: i=1; AJvYcCVezPgBBH1WoiaZT0xoRlS/bJG6PI5xxLOiIMt6rELW5C8zGii/ByrK42cHFIR8g+M8wpNF7X9DsKYLmLQc@lists.linux.dev
X-Gm-Message-State: AOJu0YydLgNqAdHNqKRS33t6OSz9RLG5okBks2ISpQgwuKkYzSKa4RI5
	ztE60TGFK4D1W13cSHByr9FRI4eAUk5Ha6KSNDYyDNUs8sYK3RA2
X-Gm-Gg: ASbGncvF8uFmst9GQsvc0T2wNV2eSF8ooISyIgbEQYUIKadEUsgQRKmFFmqsLnvwel7
	Ptn88Fs8qq7Gn+5H16dpEn6LMT6LoYJ3eGLOczgpfW+TQqE3GZVKh+PNer3tC18ejpAPfvdoTzs
	BHxS+eBkhnTry/JkjPgtc3RSfdOtS/SHkKbD8mfcvIyeSVJNk8+9lQY4LGt2207DeMsgLmhLe9J
	5R3O8NFm/7ErvOatstfeeU5r8mS4VDDuSmqXxIqKf7dYiOwj8vjjbg9+AXlpMFW7600F/T1kV3k
	FBatSVhAHN+bCJOtAevoDWa3WLmwMfWH/X14G7yvVw7loqj2S4ONzcD6Y5E8B/BVhV2prS6ZSFT
	6TUlbuKvEz+0uNDEJlnrBIPWo/f54r5luFgXjJnUyrlmAb+A+e5aqNOPU6LfM/3anmo1lDvR6Ks
	ROeQ==
X-Google-Smtp-Source: AGHT+IFen8NAa1gYV7IYZQFGgbEo+TNzKU6LwekucDQLxNs10VoAkrda6K2y1ptlUvY1rZ+ftPX/bQ==
X-Received: by 2002:a17:907:728a:b0:ac7:d7f3:86c6 with SMTP id a640c23a62f3a-ad17ad3a86cmr59649366b.9.1746135040050;
        Thu, 01 May 2025 14:30:40 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:39 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 1/8] Staging: gpib: agilent_82357a: changing return type void in int
Date: Thu,  1 May 2025 23:30:30 +0200
Message-Id: <e902b9d53283d350e6f97399dd3fea646fdb5d88.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patched FIXME request moving the return type from a void to int.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index da229965d98e..ce2d3850ba31 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -754,8 +754,7 @@ static int agilent_82357a_go_to_standby(struct gpib_board *board)
 	return 0;
 }
 
-//FIXME should change prototype to return int
-static void agilent_82357a_request_system_control(struct gpib_board *board,
+static int agilent_82357a_request_system_control(struct gpib_board *board,
 						  int request_control)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
@@ -765,7 +764,7 @@ static void agilent_82357a_request_system_control(struct gpib_board *board,
 	int i = 0;
 
 	if (!a_priv->bus_interface)
-		return; // -ENODEV;
+		return -ENODEV;
 
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	/* 82357B needs bit to be set in 9914 AUXCR register */
@@ -785,7 +784,7 @@ static void agilent_82357a_request_system_control(struct gpib_board *board,
 	retval = agilent_82357a_write_registers(a_priv, writes, i);
 	if (retval)
 		dev_err(&usb_dev->dev, "write_registers() returned error\n");
-	return;// retval;
+	return retval;
 }
 
 static void agilent_82357a_interface_clear(struct gpib_board *board, int assert)
-- 
2.34.1

