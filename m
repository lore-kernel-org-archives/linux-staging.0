Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB4B2C6A4
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 16:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705596896; cv=none; b=HFrFjvi1YHNLttQVvb4ZfXhsM0DaQpHlq/FFGJ91O8SzM+3Ty8LWaTSxAXZTLUM7h1ZZL4Oz6fClI/DOPpyemOBoS9WGP5MCHj2sVMWF1HCkzYgdaatTKX00j9Qp3KtoShptZhxFaMWfmeZZRWK0RMu7aplacZaoHoFR2//nTyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705596896; c=relaxed/simple;
	bh=O3B5hl/PkwgxfzcSFsKmiroJsVntteBP+PH82CDvc9A=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=M1fAjs1dP4R5qAKQxUXAG2DSoSrQW2Yj84weO5q5blAeN67fZ97RG7be5ArV2I3zJTX2RINjMurLH3P0KHHlvTzeOsYFexv6YOqijOIMC/5MSA9FUCDMM+RUUQr7LNzlK8twnAXjv6K0YcXKq1tetDpi5oUFWT5MHGGnMsQf3AE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=flhSIGNR; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="flhSIGNR"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5958b9cda7aso738166eaf.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 08:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705596894; x=1706201694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rpaFisTUShqKJQAtnulPrrm08KwxaoEZy1neHhi4+c=;
        b=flhSIGNR0kWsW5FjvNbEexLfR4RNfnwuTF3hmytS9JPy7HHdgsikvvrKNB2Up/zpiH
         xitcfhGYGrD16kkhxkj3Ak+06q2brg4CDPVzlMsyZOfAS5MFV4goLBaIJ7UIObrqKlQy
         7ZpnoWrTuZcVs6pNEp7glivIqu8H+YQUEa+WiEMJertlZVPgCoT1nmyt8OewISGQtOGl
         bVw/S4AOGBudcgdmk/BoCAgt7kA9yQuJ9zBvfdaotvzuKCXFq1IejrtuflJ68VCXBWXk
         hnC9Dcp9+awc4IH29TJnQwmJmAFMacjlynAwT44xZjilj2CflRjYymXvP4PPIwu0YTVq
         gi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705596894; x=1706201694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rpaFisTUShqKJQAtnulPrrm08KwxaoEZy1neHhi4+c=;
        b=SUX6/7ALRfh++EZaslx6glgkLDFAAKSvWusoKWJ2UvAj3dxdjEuXlOgPX8bHvcY6TI
         CVex2soto31kjRCdEJ2cRUpr1Qf+Y/DTtsEmUJEyb+/qehUq9cc0s8MZsZqvvegTckkM
         JjaoRruefu1xaJlZxpjNtr/3wCM5esMz4o9ptDqpMaSeXQBeKqP33i/fHkSNHxnvrrau
         tbRLWBunDsZxfcJnqteF1UDP0uXoY+F3AyIR5Yh2lgfZe2w7x1bDgxo1U84zZT1T2Gdm
         70DmoJVMCtN0Kgws35rMRp2zeVvta7pRPH7NUSTuyagJUrLUTiEFcPRWi3uYviZFrXFJ
         inMQ==
X-Gm-Message-State: AOJu0YwhAWhxqsDCmPxKGQrCggjKvnpgFLajbbadNRzITFkgHKx1+dPi
	D49QwsCyUE9WAOv3GDNj4aa+gD/HDDnLhqMSzfwtDIjZrNqtDrCr
X-Google-Smtp-Source: AGHT+IGoEwXFQLpN25iosPFOeAiXmbx51OYsIn48U2RlsUuRx34712DQab1roSOg4L1qhrDyU7r+aw==
X-Received: by 2002:a05:6820:2b13:b0:598:c118:30d1 with SMTP id dt19-20020a0568202b1300b00598c11830d1mr2219146oob.0.1705596894462;
        Thu, 18 Jan 2024 08:54:54 -0800 (PST)
Received: from me.mynetworksettings.com (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id j22-20020a05620a147600b007832104bba9sm5425176qkl.23.2024.01.18.08.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 08:54:54 -0800 (PST)
From: Jacob Lott <jklott.git@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Lott <jklott.git@gmail.com>
Subject: [PATCH v3] staging: rts5208: Add more details to Kconfig help
Date: Thu, 18 Jan 2024 11:54:47 -0500
Message-Id: <20240118165447.78727-1-jklott.git@gmail.com>
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
index b864023d3ccb..c4664a26ba3b 100644
--- a/drivers/staging/rts5208/Kconfig
+++ b/drivers/staging/rts5208/Kconfig
@@ -3,7 +3,11 @@ config RTS5208
 	tristate "Realtek PCI-E Card Reader RTS5208/5288 support"
 	depends on PCI && SCSI
 	help
-	  Say Y here to include driver code to support the Realtek
-	  PCI-E card reader rts5208/rts5288.
+	  Choose Y here to enable support for the Realtek PCI-E card reader
+	  RTS5208/5288. This driver facilitates communication between the Linux
+	  kernel and the Realtek PCI-E card reader.
 
-	  If this driver is compiled as a module, it will be named rts5208.
+	  If you opt to compile this driver as a module, it will be named rts5208.
+	  Selecting N will exclude this driver from the kernel build. Choose option
+	  Y if your system includes the Realtek PCI-E card reader rts5208/rts5288.
+	  When in doubt, it is generally safe to select N.
-- 
2.34.1

