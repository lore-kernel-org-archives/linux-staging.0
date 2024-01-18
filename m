Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA2C2D609
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 18:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705600869; cv=none; b=f41sdZK3CmLmqi3TKXQNaJdDWlrwrsXBKoQ5qtey7awFXXY9/hpNXVXROFlgGK3mkAoYI0cWIGWXo4CocDI2WMEuzmwxJ8Z7QQqTvFeFQUL6WSQdY8XvBuO5nZT/uZeb5MupY7xE2KCuT1W3g+HZt1aTlFz3rsvmI8jz2KXSgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705600869; c=relaxed/simple;
	bh=OrU1H4UzGzxdl1Ds1iMEsFMSWtaNQCoi3wOtLuEophc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NCPxd4bje60WrNR5bB+AWYMV2JylqX/0XqRSfqQomrvjB9sCuH1RC6LEnZxUzf9Z6ZW56GG2LURnQVOF2w7S/tPJRB5YwL86IVE+6+3tLrdmEEDBqJGPCfabMPmGp8YYzuI6kAVIJ/D6oXH/5Zq+TrLEOaXS7rU01O5viMnABUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHVzRNRb; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHVzRNRb"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5958b9cda7aso746286eaf.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 10:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705600867; x=1706205667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAKbu+IwB+CV3y388Ck6W4m5EwM/Dk1UA+arbmrM5gI=;
        b=ZHVzRNRbk4eYfbZ1Xi/fqiGLsDoMsHMZuYJTu8liMJT65waZLPiaNIN/5DNFgvhhli
         nV3GCrnDw6NsNTbx0ZLmVUjzoEH3lZCLEPowTLH2RmHNYzlMsJg6GqIq4TrqN4e1XxFc
         ddzg7TL2ky02EdfeGMDdojUvVDB6yuDn0LnyJ7quruEb4GBw3VQn0oG9AplSIiXHxq2B
         lKVQkhw+2RUKJxDGgr4y5iI5A44Jp+NtEeOjFxH6n82F+1dIIOSf+Olkb5hOrRYspddJ
         SLMcje2X0D+KRWwxOD0lK5LUJgcXy1WH9AP1K8oezqj3qzDD1Xd29eJgfzIpDLhhD2RH
         ZkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705600867; x=1706205667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZAKbu+IwB+CV3y388Ck6W4m5EwM/Dk1UA+arbmrM5gI=;
        b=wkBJhUJyOzl52i682hzG9ZkedAnjJAaC34A37doEiaMsIPfhNjUBKqOdQ2tsAOOYUq
         pMIYO4qL9Wq2B3nmYfSJOofVmLk7FUfmdOTtdpNx79syJMaKA+QDLAUVFG6vJ8dEsG3/
         0aehhjlY9bHqJMuRkpHSIEsIHy9uzmeMBOyj7kRw6aMedJoKXSth/wCEuMfvdYxb+gZw
         ZEBSSIYnBfBSEa6zzJfebJSjIOftljqpp8OlmHSosxPw9nmpQBIeQicEUWECrkuRg1Hz
         7WwNl25OdoU1xmWcNAl+cKvYCorS7Kq2367mImOi385KxcFuhaCXOrweHTHpjQYO0ODY
         0IiQ==
X-Gm-Message-State: AOJu0YwytelFFSU4lHm7jaxl5PHa+4fwRaOejhC8G5LF5RUzaC0nFPaA
	Bkw3FmzuPsk2zUpDS75oKxt2ra193uJlhXMNnbye0HfVLr+xkycd
X-Google-Smtp-Source: AGHT+IENe9TQ+w/mpdRhglVCwG6JuvtbY6kZkbrpGvUXZZCBXdumy0ENO5bEn/zAVlcRf/y+QZaC+Q==
X-Received: by 2002:a05:6820:2e01:b0:598:c88d:2f44 with SMTP id ec1-20020a0568202e0100b00598c88d2f44mr2493975oob.1.1705600866374;
        Thu, 18 Jan 2024 10:01:06 -0800 (PST)
Received: from me.mynetworksettings.com (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id lz6-20020a0562145c4600b006818a1e269csm837236qvb.102.2024.01.18.10.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 10:01:05 -0800 (PST)
From: Jacob Lott <jklott.git@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Lott <jklott.git@gmail.com>
Subject: [PATCH v3] staging: rts5208: Add more details to Kconfig help
Date: Thu, 18 Jan 2024 12:59:48 -0500
Message-Id: <20240118175947.82297-1-jklott.git@gmail.com>
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

v3 fixes the tab spacing for line 6 in Kconfig
