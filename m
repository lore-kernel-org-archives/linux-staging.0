Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E536728DA2
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705592471; cv=none; b=C4OkATuQ4pLzYQ6ucaqzJ3IVTxpVWtKat/Mns3v+8LkvsS2wpF+Xgltxq3WmnhE9NrnRxNEmxhFxOLV5mbPTpBWgWzjvcYQohpw8e7izVriy8ED/kQRtxfihUfFsXYsIyto/ur2ff1YA75GTpvaC0v+HEy0guSGuqiCfh1MqDec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705592471; c=relaxed/simple;
	bh=J+WQhKpZvfHmGIQZEzxPTor6QcYXMVLBY1OFriy4R6M=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding; b=LGNHw0HOyPFTS0b63aVQqca4MhPTC9Kd8EzQpPYsula6KEv90ukBFfvScHdTUixvgI6POdxWuW79BsZW04YfWATs9mqlksp8Dka3XLd9OwyK4hGJik5Mj69yM5Mfs2wFm9MvNkLigilqH9npnrw8yx6fZkMrSO3uFuRS4kP7faQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQ1UYUEP; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQ1UYUEP"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-78382b09413so4714285a.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 07:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705592468; x=1706197268; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RQYEaR9pL9K6tl5rJo+FOjCIXsHbGHgXG9wdJUPHVQk=;
        b=gQ1UYUEPmv7Q9FhXNZPIg1ksS1D/TEN/gdQNGXY2Gw23i5gOJj2HwBWiVkODfjMofZ
         C1RY7AXogoJEYaMd7emRpNLVz9oeqzZDBFNCjxx53/yyw7rCBH5C2O7I9Kr6HEMLYclV
         RgGfsTtS/fa0nz5nBIM2Q1ErgmhYPaPQb7Tl0/1r8R/rOpsV2pO0gvQKxNUXnIW1AuS5
         woPye6S//lHw03/M43nRHDtcGfDePifnsRs0IpUaTCr1R1sBx/U7pI9dbrR8C1xuB6f6
         /S9EX7Ms25hcr/menBglZyzZZ+xHxZUrz+7leKJDlH+YjoTizxxJAbQe/VkrGEY1cuVt
         ZoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705592468; x=1706197268;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQYEaR9pL9K6tl5rJo+FOjCIXsHbGHgXG9wdJUPHVQk=;
        b=cfNozGerzrV0AXxuMSAE9t5BHFPiBEJvJUzBMVG86FffyclsmKmUQ+G86mxxUzGy5s
         r5CaL4P04NMuq8DVgcD1ahoR7oqTNYZfcvzE9L0fQ0AN9xq0Mzmj4IIwR4hfAKh5Ldvp
         ikUj6H0XJSgtd/HxLdRSAaB3Puon+u9/KrdgYJvW2Cq9Zv+6lVL3ZD/S2m3O8rrZgPFV
         LU7iI3haykch4cbjcebCIom32GF6rOfiNy4EfBDA81ywkxVbKb84FpJjgdAmCGxROV0V
         nER8jdo+aoHZzeKIWPPjdrCIRe/JScWaGyR3PpJhFpDzDK5Vi0EInEXnL1qMQJX/DSTI
         MTUA==
X-Gm-Message-State: AOJu0YytLpuE63Did9FxYQ0D0ME82GqwsREL6jVEaUDJ8FsW83pqmFCI
	uoKvMonbtwY+yaDXOfMIZz87ZQ/SOTMMRhD2Pahx0q5jrMOPpUqX
X-Google-Smtp-Source: AGHT+IH4knPH/sTuiKuG0L6HHgYzAYiGzcP1NRmAgEMYRhM8cxVYLCkAxajis/4Bi9du+85ipoDd1A==
X-Received: by 2002:a05:6214:2127:b0:681:926:891e with SMTP id r7-20020a056214212700b006810926891emr1906262qvc.3.1705592467995;
        Thu, 18 Jan 2024 07:41:07 -0800 (PST)
Received: from me.mynetworksettings.com (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id nf1-20020a0562143b8100b00681924569bbsm520689qvb.115.2024.01.18.07.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 07:41:07 -0800 (PST)
From: Jacob Lott <jklott.git@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Lott <jklott.git@gmail.com>
Subject: [PATCH] staging: rts5208: Add more details to Kconfig help
Date: Thu, 18 Jan 2024 10:40:44 -0500
Message-Id: <20240118154044.68425-1-jklott.git@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current help text is short and triggers a
warning from checkpatch.pl.  This patch adds more
details to the help text which should provide better information
for whether or not to enable the driver.

Signed-off-by: Jacob Lott <jklott.git@gmail.com>
---
 drivers/staging/rts5208/Kconfig | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rts5208/Kconfig b/drivers/staging/rts5208/Kconfig
index b864023d3ccb..76a083fbe401 100644
--- a/drivers/staging/rts5208/Kconfig
+++ b/drivers/staging/rts5208/Kconfig
@@ -3,7 +3,11 @@ config RTS5208
 	tristate "Realtek PCI-E Card Reader RTS5208/5288 support"
 	depends on PCI && SCSI
 	help
-	  Say Y here to include driver code to support the Realtek
-	  PCI-E card reader rts5208/rts5288.
+      Choose Y here to enable support for the Realtek PCI-E card reader RTS5208/5288.
+	  This driver facilitates communication between the Linux kernel and the Realtek
+	  PCI-E card reader.
 
-	  If this driver is compiled as a module, it will be named rts5208.
+	  If you opt to compile this driver as a module, it will be named rts5208. Selecting
+	  N will exclude this driver from the kernel build. Choose option Y if your system includes
+	  the Realtek PCI-E card reader rts5208/rts5288. When in doubt, it is generally safe
+	  to select N.
\ No newline at end of file
-- 
2.34.1

