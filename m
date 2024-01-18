Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140B82E3E8
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 19:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705605475; cv=none; b=MnpeL0LVk7SCu/OQopdVu44P/1HwpbmvPWdRvfTAwrYU/GG5rD0k7MMTaoNU1520mdt70ySbjnTet4ol1z50vAPsinw/+mWQOra3ltQ2DUdW1qatOeg5DxwZZ+I/rIslaWIinmZyMUYT475g2+tpiGIo+g/7PPs01CGd216Y0s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705605475; c=relaxed/simple;
	bh=U74K1kY2dyd5hSBstEhod90EVhWSL5ywn5NpSDxh7c4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CoQduO1SuIQ6ahAYoS8k7SrkLiSoMSbD9iYmKJwSx095WUMBqi/MlTrAy8kgLLcQwVX6RBzQEb+yfmmSfist+IvjzZPlPsyYcdlDzjAsa/KlB1tREfLTwY1JsBJAPpxzzixfqRPS5ozApjzSSJltcbkeXfDraqJkUwhyFnP4wio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gf4jd7ME; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gf4jd7ME"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-783549da20cso466185a.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 11:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705605473; x=1706210273; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+QqmfYbfkxReSZlnA0Rop1TbT1YTY/BIoy1a4nhbFg4=;
        b=gf4jd7ME9qwkD6FepgkNpJ9iD58IAdN9WUqqARNKjrXy2rajkgnVMk7muzjBb74OE/
         rjxiiVCBqWPf/v2gIC9Uum567VblP7CtPOQ8lvWKHOacPCY4UQ0th9Ly5+QQj4s7GrAT
         LdSS7InN2L/bqC7iQ9Qik7IIm93hdQ4axah0JvXt5o7wJd1v0OvE8iTFm9we2uGS0FQX
         hNEE6TuR/SkTRCnPy/1cKMszt2cWqswwJDIIoQWrT54HUL3UixtKtjcek1F3tnEeU+Nl
         6r4gYlckyzzlRbizZd3Mo5TcWrxG1B74FhZqxmpzVDsklXvn+rImhVry2MevwVp72hCv
         RpGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705605473; x=1706210273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QqmfYbfkxReSZlnA0Rop1TbT1YTY/BIoy1a4nhbFg4=;
        b=aOUkdBX7kfV4WXNdPCA5TyBciOndkJDwQcyMijtawlbobXoaGj1F8mmglemaopAZoO
         jcDtA2rLO9ZLkp2LK9RtgRC7jt22nBd06sOdxr+OVbnTdeA384xwmpXlL1GotrD4aSrT
         SOhCq0eIBZHZBLUXJ/asDr7Lpn3FDq7sDte+deET4sdnCU7F9HRTt3z9ni3aq74CWjUZ
         gSwRynCc1GsR5cepMP3Lgv4kASD6GkySHgoRtXtKvgc6rr5JlQx55vfegVkVx3WGkRZ9
         gnf1E7eC4RE1HSA/JNZrQkY59e+Z6mWIAe/QA2aCCZjDr6LCNjYZdGE87xGVi0YFKkZm
         j9nQ==
X-Gm-Message-State: AOJu0YxOjsk/01bouAH/o/rhIFPlltDoxXIm/Hdv2Y21+eTq0/tb18/e
	QmulBxMmpxr21d+DPLUTcssV699wiU0urNvA4OhI1TO6A57dtQju
X-Google-Smtp-Source: AGHT+IEb91YYCfcYQfOZMQ7J1lypHUmBWTsBrt2DsHYjfZ5XQJgJkP+UK/FcAq+zUwbeP7RGZvAJgA==
X-Received: by 2002:a05:620a:6881:b0:783:843d:df5b with SMTP id rv1-20020a05620a688100b00783843ddf5bmr266388qkn.7.1705605472745;
        Thu, 18 Jan 2024 11:17:52 -0800 (PST)
Received: from me.mynetworksettings.com (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id s16-20020a05620a081000b0076efaec147csm5461145qks.45.2024.01.18.11.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 11:17:52 -0800 (PST)
From: Jacob Lott <jklott.git@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Lott <jklott.git@gmail.com>
Subject: [PATCH v3] staging: rts5208: Add more details to Kconfig help
Date: Thu, 18 Jan 2024 14:17:04 -0500
Message-Id: <20240118191703.89535-1-jklott.git@gmail.com>
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
v2 -> v3: Fixed spacing and newline in text
v1 -> v2: Corrected line spacing based off feedback

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

