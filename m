Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE726462B
	for <linux-staging@lists.linux.dev>; Thu,  1 May 2025 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135047; cv=none; b=DWcdf/pxTzBI/41hNJRsOvF+levohPUVOicGMxBxS3S/5ITe65oRDSVzibb0nv/ME2oozCFCAgkDy0FnT/Rz0dcWHtw+Jllm7iHhdSFACkmMI0P76TaNiKwJN5v0dP3byL3L/Yesh1+hr2k+OCCadpfAyB1aRKtrG3Hqayx7Eg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135047; c=relaxed/simple;
	bh=pogysvredQamG9rVEP3tCTR6wWcpeR/5OVLS1DDkQPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S5Y0otsYUpbLd3OebasqNh6ZZqVJgayWJ27KTNaiCCUVz9UrtF7TOlb56YkaKnCUkPM3XFzvSFqQtSMU9NflconRM16/II8q510sFbt8QhVIGitkQAWo3b3M6yFzlrb2lnE9rZSfj+VQppNyxAZxmKa2E1/FQehPTzzsWkdVzUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mox7Gnq0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mox7Gnq0"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acbb48bad09so237552966b.0
        for <linux-staging@lists.linux.dev>; Thu, 01 May 2025 14:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135044; x=1746739844; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qQvcKW3MgXdsbNtDQHwk4JjoHG+iRWbqwu2h6X/MKw=;
        b=Mox7Gnq0YeEpnXYGA5nYsvcDAfh5OtuQ/jkSaFjPz97yvThDmvMAdFfCmQ0ro8LzbU
         mw5+l1MZirRnkM8jmSiMVbwlwlBVbIGJLtggFU4bfFCtBiqbNtu1EbcyLQDV1Un7U9Mq
         179warGftAU8/qoaj73qNjmsH51n9MhnRCU12axu0HSoBKoQzOatVXDMzw1p0oeiYWtf
         d4QjJMxmlaLHUtawzuVlS+nUBqYLkVxJQO4bH5NxPAoLGFQHZeYvmRCObnPj21eLeF5O
         QIHHuLT+Psk3vBUu6jOgpgGf6iGHmiclscVnrJWGcpup/OHvfIKU7IsBWvO3umOvXmBs
         BEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135044; x=1746739844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qQvcKW3MgXdsbNtDQHwk4JjoHG+iRWbqwu2h6X/MKw=;
        b=LqrGWrfY/iMln/uM8I0QcKFxjFR/masPceoHlasLC6VlmB3jKseEcfRyHYxc6VapgV
         4zSFgDGqQaNpNr+JLfEZwrxsqSNEVg8wJ8A7/wwuNCfzEbl25LoIRY9uFdUruZ2ma0sM
         WS4lU+Fa6myyfLjk4X1b5uLsgo6NXggqyZdMz1pixeqvzk3Tjl8dJv3zAsZBXFKFdyHY
         sDnGGaOgLvR9AHyBqCUB8hPdqGXv3yfrGSupUfu+FgRVzKuq704N67PX+Bf5GO9Yq9gl
         PmR8Vv6XxReUhJzI6c8EtpTXgcXnMKDaC2sfwT6yEiZshuiteYrqvUM6SmVItfW0yN6P
         ZSbw==
X-Forwarded-Encrypted: i=1; AJvYcCUMeKH/9Xm+ENxAF9Zg9iw9bnc+KqDRKGk8YzvA3wMfBCB4fw3uwIuPpIEjaqbb1nM1PoejdUIVtTCmjX8C@lists.linux.dev
X-Gm-Message-State: AOJu0YxNtg5BC0OsnKAgmDpFb3K95dG6usO78Yf4YtwhBOm7qrGSYaSY
	u8gEXpC5fum7ew/1roiJTMaLEZQcOVFqRDRinvXeOz3PsaszXxyl
X-Gm-Gg: ASbGnctxQN/axKWVR1r2gn48mYYH6dlbP1fDwQWd2Uw9Pd/conSfMuBRl3SH4Ss2xoD
	v3XQlUO+hi/qg8F4xbRe85bAl4DjxxfnVvcHlWLBJoCqw8vQblJx98YT8s+JaD0CYZuKccR/xf2
	zqtLm4PZdfQengu019zp/EUSeICgJTyQ4Rr1zC2zN1FDgFjeu6He8u4Y7lE8AqXBuIjSr3AGw7y
	k5/xx+4IMM9rzBIlOv8cXfZqZwz063UizeYZIbb6zjQekEwAzMkL+Yaed02qz8HPabCjFdds+4U
	wOGA7WI/33mlEAFpsEuW+oCpzUAT/IwGrQbVjbeP5MkV2DSyhW871jN/9PeRxDjpJt/zaBqafHR
	B6FHmcMQsZNwfZFbUAOlst0Sq1+RqL/3HuioaiWaDeiVnuNTl8LdZmyxDLs4x9Ky4S5G0HF5VUe
	UNHA==
X-Google-Smtp-Source: AGHT+IFTKXpGcruR1rtk8NfAptc3Ldio3+MGfuUDD2uU4ON1l/n52FUtzrr9PqitPyGSCwYkrEy4bw==
X-Received: by 2002:a17:907:971a:b0:ace:3a27:9414 with SMTP id a640c23a62f3a-ad17aefb21cmr59437566b.44.1746135044072;
        Thu, 01 May 2025 14:30:44 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:43 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 8/8] Staging: gpib: Optimize error handling in agilent_82357a_driver_resume
Date: Thu,  1 May 2025 23:30:37 +0200
Message-Id: <4f560559491207b85cd1997d9e351e417f048068.1746133676.git.thomas.andreatta2000@gmail.com>
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

Refactor the agilent_82357a_driver_resume function to consistently use
the resume_exit label for all error paths. Initialize retval to 0 at the
beginning of the function and return it at the end, ensuring the mutex is
always properly unlocked regardless of the execution path.

Simplifies error handling and fixes potential mutex lock leaks by
ensuring all code paths go through the same cleanup code.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 .../staging/gpib/agilent_82357a/agilent_82357a.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index 4fdf6d42f63e..92bbdd57083f 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -1590,7 +1590,7 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 {
 	struct usb_device *usb_dev = interface_to_usbdev(interface);
 	struct gpib_board *board;
-	int i, retval;
+	int i, retval = 0;
 
 	mutex_lock(&agilent_82357a_hotplug_lock);
 
@@ -1614,23 +1614,19 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 				dev_err(&usb_dev->dev, "failed to resubmit interrupt urb in resume, retval=%i\n",
 					retval);
 				mutex_unlock(&a_priv->interrupt_alloc_lock);
-				mutex_unlock(&agilent_82357a_hotplug_lock);
-				return retval;
+				goto resume_exit;
 			}
 			mutex_unlock(&a_priv->interrupt_alloc_lock);
 		}
 		retval = agilent_82357a_init(board);
-		if (retval < 0) {
-			mutex_unlock(&agilent_82357a_hotplug_lock);
-			return retval;
-		}
+		if (retval < 0)
+			goto resume_exit;
 		// set/unset system controller
 		retval = agilent_82357a_request_system_control(board, board->master);
 		if (retval) {
 			dev_err(&usb_dev->dev, "failed to request system control in resume, retval=%i\n",
 				retval);
-			mutex_unlock(&agilent_82357a_hotplug_lock);
-			return retval;
+			goto resume_exit;
 		}
 		// toggle ifc if master
 		if (board->master) {
@@ -1649,7 +1645,7 @@ static int agilent_82357a_driver_resume(struct usb_interface *interface)
 resume_exit:
 	mutex_unlock(&agilent_82357a_hotplug_lock);
 
-	return 0;
+	return retval;
 }
 
 static struct usb_driver agilent_82357a_bus_driver = {
-- 
2.34.1

