Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3AD2609EE
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135046; cv=none; b=DaBXuS9UHPvuCQqID3TgRk0xka787KBZrU9ierAQ/aaQqHQLjK/S3TdMIZVOFPlUkMps7bQcm8C3/Mkp0Wb6ZUfKRkK5Ml19sZ5B4j7dfgJjdLCAYBdrckses0fj/gU4Om25f1OjuqT9+AXBCE2rMpYAWviYFvLKy5+dDLpwj9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135046; c=relaxed/simple;
	bh=fVYrTnV4596MY4xP2V30U8n3S+cujdL2K1rYUrXul6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=vFJxj24SlqExP4r2U6iWnk7JLd6VT1CwA5tiz4diX+7iV8ah7raOIsDPnwZ+Fy2k/9FdZtvzzcWBJZOnBPW2qPJIGlE3dpBQPalwZ2TFcuont0sTyPWo2DSERuc0k4Ku8q07YFIEn6wVMD7jQKN3LaJmVBuffvs0OcSwyYFUkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibyeaaba; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ibyeaaba"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so147921666b.0
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135043; x=1746739843; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++LiMK+jPbWovw+5sDKphiLRP3X5ThooPqXEgIEf/wU=;
        b=Ibyeaaba0S9hRUqE7hqwY7iI1L6xmj8iFeoHWDkEPAuEGdWC0waBL3MW9ZMpGhEcHB
         dX5P3g+mzdp2dx4W7gj1o+yybniHHNIBrX195SQTu6K45HyeqEdsPEYEEgsPBuRaC3F0
         KjxkgcXZVJGJ3A7YIB/19zqXlLCYn7rP965/+VPIszzXa6bngZg8vuEMr+RH2O1vj7ZW
         mFxff8CZ+fIkcuKYelYe0N+Cl3ZmEJSmgA9dCxYQMQ6LC6htypaURjrE7XEpureHbuTW
         HraG6IHaKbPyObcYPRjz5bspRXNg6HIxlTnlT4Pyshsuhm8aJWQXca8PN44rIz3V9INh
         ir0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135043; x=1746739843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=++LiMK+jPbWovw+5sDKphiLRP3X5ThooPqXEgIEf/wU=;
        b=JgPGCp6e7/Yu2w3vT7PmIVG07A+UBO/TqygDE6tuDBJCnsQb5nKDAB19AKfFvwXjwJ
         epJmr/IL1TtMUcxouqdUegTCoxkNooilql8aTrYnVyGql3X9KAVFrYu6dHK8bXfyCObb
         N7hqUCIXDrz8oAU77vfohhnaD+qpCCIhEEpXI/y8IfcnNXA4lMZhjPnoirRXa/jrxtO/
         sYoN3X6ev2wmQp/2BVqz0d4Sml93HvqT1IJDQyYEjRGTP/hETiyVQjdxYxg420gIJDl8
         oqZ+Pb3YHGXeDeFyhaBtdhxuS6kg9U+HNFAkoRQEzbaaDKMG/k42cKGdsGrGRsVdgEyR
         LGrw==
X-Forwarded-Encrypted: i=1; AJvYcCXMVM8GJ3KqIwo7lF02HZOqUgFyvVeQDkxIesS8t0b0hyxK3zknlUdZFbjvNs6CwR4CFoJbbpnw01+wU8ZV@lists.linux.dev
X-Gm-Message-State: AOJu0YwaIXr4jFu+za2I2d8iTOu+F/2Ll9nmzLku/8Snx01uERZHN9wL
	e2WjJJFOJWz8eeW97rSAGhmds10JQlwzNUIU/QpZr4X7Y6ht4ldR
X-Gm-Gg: ASbGncsDCCxSOVh/hiKFfujnDzNtE4C24Ynv5q96DDMFco+Bj0NpJUANuwF1NDYplaz
	O34m7JKq9+Iz0ug1qnelPTWcqySCpuGUecjiY3aUzqn69CjDmOpJDb86Ld0qh0fokIvd9jtmQbg
	YwFBQwy6wRyz6LCexmWIhJqdBwB1m7uavTtyDOsU4bnxDtWQjZ9otB9De46C/06hXjxYjSmrn2r
	7ZflSdHVOjCegUMFAodNfurmDqtw1yInG2MHOCjtBx3eB6TsnkW8tv5CdV9ZwOrY5boL6x8lBjy
	ghNI9DYF25RzTftrMP2GWlp4ZjYyLpWfP5T5AldKhZjmAh0v3CrHCnjujpKCR1fYbeFCHSmE7Yd
	0kfe3Iinb+GnFvjtd3qhqLckseZdALQq79BxPWZqEzQRbbh0wU8W0RiTnoD2rX7oHoLZNSq8ijd
	odkg==
X-Google-Smtp-Source: AGHT+IHGzNWQi9IaRBS+T9Q4dLFoyLyqFwYD3k3LrzonB4SsYe0hPBZHiar4FKK9vFlty1E8tA4Wvw==
X-Received: by 2002:a17:906:478a:b0:ac3:8537:904e with SMTP id a640c23a62f3a-ad17af78ffbmr62529666b.49.1746135042771;
        Thu, 01 May 2025 14:30:42 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:42 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 6/8] Staging: gpib: Updated return type for `request_system_control`
Date: Thu,  1 May 2025 23:30:35 +0200
Message-Id: <066ffcdbdefc54557c690c0c5a663695c198897b.1746133676.git.thomas.andreatta2000@gmail.com>
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

Function `ni_usb_request_system_control` used by
`request_system_control` now returns int.
Reinstated return values by removing comments from previously
commented-out return statements.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 9f1b9927f025..a41e4f472d89 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -1049,7 +1049,7 @@ static int ni_usb_go_to_standby(struct gpib_board *board)
 	return 0;
 }
 
-static void ni_usb_request_system_control(struct gpib_board *board, int request_control)
+static int ni_usb_request_system_control(struct gpib_board *board, int request_control)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1059,7 +1059,7 @@ static void ni_usb_request_system_control(struct gpib_board *board, int request_
 	unsigned int ibsta;
 
 	if (!ni_priv->bus_interface)
-		return; // -ENODEV;
+		return -ENODEV;
 	usb_dev = interface_to_usbdev(ni_priv->bus_interface);
 	if (request_control) {
 		writes[i].device = NIUSB_SUBDEV_TNT4882;
@@ -1091,12 +1091,12 @@ static void ni_usb_request_system_control(struct gpib_board *board, int request_
 	retval = ni_usb_write_registers(ni_priv, writes, i, &ibsta);
 	if (retval < 0) {
 		dev_err(&usb_dev->dev, "register write failed, retval=%i\n", retval);
-		return; // retval;
+		return retval;
 	}
 	if (!request_control)
 		ni_priv->ren_state = 0;
 	ni_usb_soft_update_status(board, ibsta, 0);
-	return; // 0;
+	return 0;
 }
 
 //FIXME maybe the interface should have a "pulse interface clear" function that can return an error?
-- 
2.34.1

