Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BD2253B6F
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741203446; cv=none; b=kPQxJlw6FTlJlnlz8dottLaY2npvnHLHpTU/2d3fni6JS14xVlHpm+oPtBTtvXlMZ9NqB4XePCNxECn9WJjWICjffOfpLZSffRKx7ruDQb/fIlnF3Uq/BaGH7H1j4EPJCSnSFO1KbKEc7l18MQF4PefBug5VSJHqqL7Az+I5LJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741203446; c=relaxed/simple;
	bh=NiSAOPAgkdb/WErvFuPt8dYjPkHrz80Z5l1d8QBlXxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dogNK0v5sEwZ21RJZO/D1v+DV1Ek1yPoWItQgIRGUrmMIDCqLQYN8HIzf5ZVrG1g4f/5AnPyWOFDz+X2zIRWh4JGFefX9/o1bgNqpsjj01ozv+ASl4tQM0NI7/7shisNgLZ0AhXLBANBvVR6ofoaLHtriB+PwcRnFRujHVxJNV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZvnLqLc; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZvnLqLc"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22400301e40so1881805ad.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 11:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741203444; x=1741808244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HZfT3BJ97SDi73Ze6YNCLhdfpk5R2Zm48aUE8tr5nI=;
        b=HZvnLqLccQ6bHaExw9jcZ/97BFAONWobxN2wF5Elw9GkTt0CGlCnTaCgsuMwqA5puj
         JmlM8T2RyEhP+ZR1ttxO9Wc90S+BVkJ9QC2UJcktPQjOuQp3yxJOugF20lL9QW1+GJ9T
         zdGqUbNa4+y0xR14i9fjF5dCIACul7l50Aw0byl2MnyBeAJSs4Y35nzTlABCsbFSfZLt
         1357EzMnwa+pfA+EJVV8ucIwbbBw9sWUvhOFXlgU9rOanNL6G2BRgaEZwpS3HP3NX7+X
         BPymhHXQg2PrPNfMbmETeTr32SsTg1cPV6FFLn2zCBoygnKqsqqOeAynkT+8awlUhvVl
         ZP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741203444; x=1741808244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HZfT3BJ97SDi73Ze6YNCLhdfpk5R2Zm48aUE8tr5nI=;
        b=GwU/FrMARtXgL6i3J+2TAJkGuzi9cwphkeaWSM8XDh/wlKaNgam4+LXLcL9PV14Ak2
         zRMlcyykpdE9XksltSzcDL3g4bS+x+OKiMHBqLuNW5Sl21iRGgi7odRVF2yEGhoUQixm
         CSnCZEaS09yYp0LKTvs6U7ncVrDt/xIBI3WtqYLcq7YzL5Yx8wB42QaB9lwJNoHVFXcs
         utKDzebc3NqqM5guzMoiMgGIFg0yvqHGwiygpvFlV3GzY7MLc804jcZFagr6fE2kLiDe
         pfnKQ0V9xOpRMEm4b+qUbk3zJhghvYEOBHCz8PhW3GIeJR6xRsYG1tLBdQ0hf0ZsIWFg
         7YOA==
X-Gm-Message-State: AOJu0YwEV5+KYwQKYDZA0eEb7GwerDv19ybhEmmhrO7qD/TRjZYiyU8Z
	0QT+zxCKu83AJC0+nu68cDh2EAfVPwn4kQortKop3VCG09jM41ft5mGDsw==
X-Gm-Gg: ASbGncsmS/A60ukVedTot34HS3lmgUiRy+Ayl73xw8fs7N8qTM1soxVU+pXjXNZXOgd
	4rxhu4B9E2CuZOLJ+hnwCBstTCRbPHcQBAg9xjpPP1gssFTPTgLSgU2Aedi85pXCN4FQstlZ3Xo
	4kXRKKBz3vZbm+gjl7If8B3eITngbtPleFTS5FsMkPIbI4Mpb3FKmIvCLsE2Vt4eSUfHnm0r0cX
	jwa7Z3zpxYkFwmSoG4rp4gN64m32ogpbYKADGqegbL/anEYswiYcZxiByhXws4U9iwhM0gdzr18
	9IJ5+qoSY5AsrcXj/fgsAZBep4URSqa6eYEoGbeIXTd/vCrBeqruSIxjXDfy
X-Google-Smtp-Source: AGHT+IHsMPQdEsN+BrWmog6Gj2bXAKJEAfY6RuvXg31gY6PlWFrf/eyHD0qoGNGZW7v0mj/fHoDj7A==
X-Received: by 2002:a17:902:e881:b0:21f:1365:8bcf with SMTP id d9443c01a7336-223f1d33ae6mr27861905ad.10.1741203444288;
        Wed, 05 Mar 2025 11:37:24 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7a2bbesm1898148a91.37.2025.03.05.11.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:37:23 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH v2 2/4] staging: gpib: fix kernel-doc section for function usb_gpib_interface_clear()
Date: Wed,  5 Mar 2025 16:32:18 -0300
Message-ID: <20250305193614.39604-5-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
In-Reply-To: <20250305193614.39604-1-gascoar@gmail.com>
References: <20250305193614.39604-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add '@' character in kernel-doc comment in order 'assert' to be picked as
argument by the kernel-doc compiler.

This change fix the following warning:

warning: Function parameter or struct member 'assert' not described in
'usb_gpib_interface_clear'

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
v1 -> v2: no changes in this patch.

 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index eeabbdb39057..090857824d07 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -621,7 +621,7 @@ static int usb_gpib_go_to_standby(gpib_board_t *board)
  * usb_gpib_interface_clear() - Assert or de-assert IFC
  *
  * @board:    the gpib_board data area for this gpib interface
- * assert:    1: assert IFC;  0: de-assert IFC
+ * @assert:   1: assert IFC;  0: de-assert IFC
  *
  *    Currently on the assert request we issue the lpvo IBZ
  *    command that cycles IFC low for 100 usec, then we ignore
-- 
2.49.0.rc0

