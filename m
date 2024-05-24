Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0563CF6A
	for <linux-staging@lists.linux.dev>; Fri, 24 May 2024 15:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716565224; cv=none; b=VFCPsAkvPDycGENHWjNJTth9n60eyOiNuhhkymwcJZVXrzRHhYDf+UtXQ5XcOsSM4NLgkc+DTMJjjXAZ+uKontj8Wa4guenkufLlSNyJsDfFL5ZEybR7hCAQ2dAImBZ6pL0N+/ZLifYSMRcWGL6APfQkzHjqWZ4trRAf1wVh58g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716565224; c=relaxed/simple;
	bh=dfy7lBx9o/LoiFhztFzB6TT+AoSqyiXNlnNPdSnQbY4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uBop9Vc8XkWzXDAxl3In3EwMM3aIWnr0ObLBK11XMTd7W0GyilG54AzE9LleG8a6tgb5T7vPlck6qIyAqxw66m1wSIonZtFufIYTm91JfOU/4E6CzZVlrOPjiEpqg7mgk9vqpyWW24eelQfN6GOvNNPvgETFc79Y0WlITUNxc4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFSig0Sz; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFSig0Sz"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f8ecafd661so936449b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 24 May 2024 08:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716565223; x=1717170023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wP+0c9kO69lJishldPkRtQz2m4VWJyfKYjNILD4qKl8=;
        b=lFSig0SzpWKFwmonRGTseXLQeSSEgODHm7K5QnFYO/tbeFabpDjI7qw4hiuFZoLhFS
         zTx9922a+UzniWNbYSTe5oE5+kG63WvRJJMcVMlYa6C4zIqhH6JX0DgrGHuu7S2BfwzK
         CuFUY50ygPPoXRCAmgVSG3LSmKkdPEdPtiCyM1L3gxkKk9fCsiPx0HTupaoSsbPi9j7h
         naMNoPiHhm5IDCKRPEj5cAj2zd78Lav5Htt0cZxC1YwTlc1BZd3jGfezrL+HjHSGRN5b
         lX2bIXfkiNKxVjwU1R3PFfmrDuDWddkGYO+MePsptz8uM7c8va7ebWdBv54wIOYektXi
         iKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716565223; x=1717170023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wP+0c9kO69lJishldPkRtQz2m4VWJyfKYjNILD4qKl8=;
        b=V3/0n0YkyySKExu4uOV1bwdG1C/TdradSURMcj0NvncHMvwcGVTEzy1lWJH4IDOkKB
         WIPIUsDc9h7hTJP21A8BDYazFurLJBeDFhc4h5tiNZxW7BiEr5+qacVhTG1yjWwKgKVs
         Gk+0HcohqUrR0Zq07VuqYGTatkCxrBZh3tTor6ZO4EgWA56A3X1WDagJWEJsI3/UVCQe
         /DnihCyvH203g7IfLFJR0P5LRW28OS925y2ZcIe4D8dLd1C5Qf1Sfilbnb5xWB7hWfY1
         QOULiYQIUkf8F6bOH0kmJ0OIcRxACbjrY3DPwmChziFvgvmQDu4qaqTqxlGr1eSyShQt
         j6VA==
X-Forwarded-Encrypted: i=1; AJvYcCU91CWwEgp9H1CG+itgNhEl4ph2Y1JAPwEdMs3hAGBpHjqM42C0gp72M3k6TPwIrXJl3kVRtX2KhozW7aQwiKqJPOiB5pccVLobxBRryA==
X-Gm-Message-State: AOJu0YyT4vJ/zKxwNA0ryGVQ315CfHfWOFWNhqO75KTUjxV46k/Ehpq1
	qgoRIZjVTB+HKYEmR8YSyibY/NgVdg3UrUc2V/+36zDDYUvQ8bqA
X-Google-Smtp-Source: AGHT+IE+IJeJkijTrkeCMpTMKxv6s/e3nRYLMeX+cNgRdLnj0qTw/3UWTy2pZII5zaz3A4LlDkGwuA==
X-Received: by 2002:a05:6a21:3115:b0:1af:dae8:5eac with SMTP id adf61e73a8af0-1b212e1cc21mr3349631637.46.1716565222648;
        Fri, 24 May 2024 08:40:22 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fd4e3704sm1242993b3a.202.2024.05.24.08.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 08:40:22 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	ayushtiw0110@gmail.com,
	namcaov@gmail.com,
	dan.carpenter@linaro.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Fix spelling mistake in rtl871x_mlme.c
Date: Fri, 24 May 2024 21:25:01 +0545
Message-Id: <20240524154001.63946-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch corrects misspelled word to increase code readability and
searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index fccfa0915a02..70c295e97068 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -944,7 +944,7 @@ void r8712_cpwm_event_callback(struct _adapter *adapter, u8 *pbuf)
 
 /*	When the Netgear 3500 AP is with WPA2PSK-AES mode, it will send
  *	 the ADDBA req frame with start seq control = 0 to wifi client after
- *	 the WPA handshake and the seqence number of following data packet
+ *	 the WPA handshake and the sequence number of following data packet
  *	will be 0. In this case, the Rx reorder sequence is not longer than 0
  *	 and the WiFi client will drop the data with seq number 0.
  *	So, the 8712 firmware has to inform driver with receiving the
-- 
2.34.1

