Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434BE28DDB
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705594148; cv=none; b=Eiu/+eRnoQCGtImS+OSkpUpbdYTRkQqVHk/UolinUlXxNxGxNm/E1x7k1cgNHEzsvuEgiDshdsO3/4CRK917/4pIeedaoFonKLMZ3ykIa6eEly6mEPiu2tNfLcXgRUg1aDG+IzojIt/6ZImGUYusnnM2RRAsfUibahcAh6MeF0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705594148; c=relaxed/simple;
	bh=kHzuk/kNSL6JIRdg7lH2BgyUkGbVunML4qI1j50U/aU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=hbfwHq1fTuY5tHsfuz/tTAbu2lTnYoblo3jjESPmSSO3V+bBRYpl+PaS+8U0cjns+DccOZ7Pu8js1zi870SD04FV8P7R0FcmJOBM9AbObwlKa+i7PnCksyl8h0EDYMfaHYrv9mwv3gR/LIoDqStiEgTN1lEoqob2kw+jXrIh3Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hSskR2KB; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hSskR2KB"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-429bf893300so15085631cf.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 08:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705594145; x=1706198945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDM781oFpgaSAT0QQI2tKSG6Pv6TalHpG0gxNI4eT4Y=;
        b=hSskR2KBOEAFz1KZF22I5giAj4Is+r/4qgJLNp+HohdI7jqH93gZtP8bRS8IpmnaLd
         DffxDp9bpw+ynh4+K6JMqeybhsG81WbXe57ijVI8yv8/lxoFUsbd2KL1IAOWzVWESego
         uaVY7wal7Wxn3qn+wd06/6WblAj+RMxl/RHKlOGz0XA4fF6suoilcGDunJ89Yim8H7ip
         UBUR0mt1XwwPU/NyG86ixJYXJalG4R+NpYng9Uf5plaKG0p411Ml5eHc8HOxQsQiAeF1
         unhcCZhU+waUEK4ZNM44p2BjrnfujncK3NNOwpHKECoIe4BwDO/VqA/bDuTYrK329uph
         xMdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705594145; x=1706198945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kDM781oFpgaSAT0QQI2tKSG6Pv6TalHpG0gxNI4eT4Y=;
        b=NyJPvzEIL7Kdbn4y6TF1qPn5tqTmPZ9IdfUVRMWmYBG9UYKiLkJNKejG0B3PfQoj5u
         /qXN4Lyrh+m7o+UVX3dThe0ZrNrtXNGuDIpiTh9iyk5avW1qxskRYsUO9XIMTuuS/LlG
         0MKdxkEYJPqYfxwzhZumLRmAYdqbF6HeFbn2uPDuhtLqaQGiIDSE0YxJtz3F5MSLwnly
         m/2thPaY220tu7xrCiHHBMVQzCJYhC6MKxnZMse/PwsqRTA+y6Q7vD88XmG070BOaVWE
         vX4vJARMsKfc0hRwqvEdALOVt+48IiyB5fXkZNI6f10QMbLdPMvTE2AUlrBxMdHsFsNw
         jhMw==
X-Gm-Message-State: AOJu0Yy6FjEixuiEMlqhbsz4NX+hENkHoH6cDpKTy71EYXP0uXgP1xkP
	OkI+5cHITSIZhLrPnYf/WYOmgQeCGvICvdScVCHIIMsDSomyfnA0
X-Google-Smtp-Source: AGHT+IF0+tItICVcJXLHzZ8+UXQlKYxINubxeC3GTQ4wEZYESJxViQuSAVZO0+FI3GoxlJHS+PzTsw==
X-Received: by 2002:ac8:118f:0:b0:42a:1c4c:f662 with SMTP id d15-20020ac8118f000000b0042a1c4cf662mr1398446qtj.3.1705594145125;
        Thu, 18 Jan 2024 08:09:05 -0800 (PST)
Received: from me.mynetworksettings.com (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id fw6-20020a05622a4a8600b00427f89957d9sm6863013qtb.79.2024.01.18.08.09.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 08:09:04 -0800 (PST)
From: Jacob Lott <jklott.git@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Lott <jklott.git@gmail.com>
Subject: [PATCH v2] staging: rts5208: Add more details to Kconfig help
Date: Thu, 18 Jan 2024 11:09:01 -0500
Message-Id: <20240118160901.71756-1-jklott.git@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current help text is short and triggers a
warning from checkpatch.pl. This patch adds more
details to the help text which should provide better
information for whether or not to enable the driver.

Signed-off-by: Jacob Lott <jklott.git@gmail.com>
---
 drivers/staging/rts5208/Kconfig | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rts5208/Kconfig b/drivers/staging/rts5208/Kconfig
index b864023d3ccb..4f9cc3f00e1a 100644
--- a/drivers/staging/rts5208/Kconfig
+++ b/drivers/staging/rts5208/Kconfig
@@ -3,7 +3,11 @@ config RTS5208
 	tristate "Realtek PCI-E Card Reader RTS5208/5288 support"
 	depends on PCI && SCSI
 	help
-	  Say Y here to include driver code to support the Realtek
-	  PCI-E card reader rts5208/rts5288.
+      Choose Y here to enable support for the Realtek PCI-E card reader
+	  RTS5208/5288. This driver facilitates communication between the Linux
+	  kernel and the Realtek PCI-E card reader.
 
-	  If this driver is compiled as a module, it will be named rts5208.
+	  If you opt to compile this driver as a module, it will be named rts5208.
+	  Selecting N will exclude this driver from the kernel build. Choose option
+	  Y if your system includes the Realtek PCI-E card reader rts5208/rts5288.
+	  When in doubt, it is generally safe to select N.
\ No newline at end of file
-- 
2.34.1

