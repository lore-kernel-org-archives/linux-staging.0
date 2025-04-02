Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D6F8632B
	for <linux-staging@lists.linux.dev>; Wed,  2 Apr 2025 05:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743571819; cv=none; b=GbzX0uO8rf7JJrIMZR38oC1sGMwHmUGq6antTFs0a4ZKzON699/ogLmOCnhVkZvJHb0sh0HPp14zHWmOyuJpr03GNfqnz746OYiCatDZ7TqGQRCn5dauq2j1gC/yFDoJJehyNNLQ/vD9/PH/kyijS9NyX+xWX8zLE9DfXvk9Vqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743571819; c=relaxed/simple;
	bh=JwpKu/+tGG2LlLB7gE/cIZ2fMysXP9H0X8/B1275Z2k=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=XtRKE+qW13oViOOkv0XjekzYi6IRNrIwMcKpmBZ2glEoXqV16vc9pD7zUtQHIW1BIPipqqVGxP04txACTcSwfJOQ/axbsabY3mTY/Y0QYmlB2TlE5H7980y96wlA5+4/3sGN6zMySIHW88Bd6FME1ym3SrM5RfLoI/HulQs4qyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7Gh/GzT; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7Gh/GzT"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5568355ffso548335285a.0;
        Tue, 01 Apr 2025 22:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743571816; x=1744176616; darn=lists.linux.dev;
        h=subject:cc:to:from:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=idNiOgMZsEH2VTfUxWSO5JKrc2BwA/5DisQk46kD/dU=;
        b=W7Gh/GzT3FSdjoq87ES41l09/xFb6dIZ4FzUP4zUGHrJ3Zs/uPLmFccB0MVoj4DNSe
         tb/wcFf4cvbyY/UOgpp+V9SO2CQd0/wQvOrXGBl0leAslgmq/xCci1TDVHqNvPUMIhBF
         zNZGBTXJ433NfdYAkAd/BwPmyFboo+YkW6d8LWStW1J4fFuqHGts+ghxUQo/wuCo/BN4
         b0vh8nTX5mTzeOrXCE8L7SIPB6mDrRmuGlKHO1mWuylpncpc4kfpUOXRTN87k4wH0RzI
         XmdO/Y5OOYw0cYZQrDtpcBXBXUg6wcmL3ay5JPyxbxjBPkxEljr6sPbhR7tqftmSgb+9
         o8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743571816; x=1744176616;
        h=subject:cc:to:from:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idNiOgMZsEH2VTfUxWSO5JKrc2BwA/5DisQk46kD/dU=;
        b=WCK7h2SOIBt6lmphM6rt5hRDC9nchKwGaCOQf21GnjxCkCGv8pMSZkJxbwaq91J8/Q
         xIkV02pBs9Iq/VrQ7rYa1ARYZVW5nVImaBEEgSRVjbvbBW3AB+QPUIDf/AeAbZIRtE+2
         4+MGdLKgx17ZZNPB7ibaJu21+x9yZKJkhLsZoZ0WsrDn8uHYbJoGEG0WhIH9LWV0EDxT
         EEnSOgIOtRLtcV6F9vjg4PSAFb8SMaxWiDFaW5jcWMOyTagmwVJuJzz3oC1IDMDqu0A7
         cwh/4cIrTNnbVwgJUj3e4vBK/LMOnGPjRKYzz5fwdRihNsxi1fWw9hUz0D6+Ef4SCUY2
         AsVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMhuvlNmsHqbZtnpfK9wCdq3uBueBp2H8NRVSOELTKuNVHo9dLhXQiDQb03IC5Z9zIrHokPviii4S9rhaldA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFW4okzm3yQTzeM9LBerG97hYyZY3N57uahz4uP4R7tDxj33oR
	2pJeqLYFEd7Xu3TCWcmSOBB71yruZ+FALpn8IYvuqSOzKn/+1+ohtyRZDfyhO8A=
X-Gm-Gg: ASbGncseeOLRVlJ96/s1pvAEHnRO3MLGJYFxc84OmTCyPWQr6L2mxAQeDDUHl0qrMsV
	4moIWa9VQe1WT0CNhBvzgSIW7Vn1B6xMGMdZDiGcKGHwLAzvXpRg9Ge6QMXnzXmMerDCqiUphBY
	J+6mtCdnQGAi3LkY87x8h6FcMQG8rZUPm/s4XyheT6IgokyT1LSK9rsciczl2wIWBNyt0FzkIeG
	/3gb+oizb+qBxWKbchsx2RDwiTv+noHbnoU/+DGl937r/8i7pZmgm8bRB5gDWrjDfVYjEcp3GOH
	1oNNSPDGIZg5nHTzUfhNklnxaS5rdco1/QBue49n52mwzQ==
X-Google-Smtp-Source: AGHT+IE4I0NZwNVd4uEbHMV8JQvvGeLpr9v5J/IbgjMUWDtDQ/W/PsoyRIIZ7Psng/SgNcvpsazy3Q==
X-Received: by 2002:a05:620a:2726:b0:7c5:3ca5:58f5 with SMTP id af79cd13be357-7c75ba71f5fmr767116185a.3.1743571816129;
        Tue, 01 Apr 2025 22:30:16 -0700 (PDT)
Received: from [127.0.1.1] ([73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f7764e60sm750934985a.86.2025.04.01.22.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 22:30:15 -0700 (PDT)
Message-ID: <67eccb67.050a0220.dd435.b100@mx.google.com>
Date: Tue, 01 Apr 2025 22:30:15 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============2708167609590510838=="
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: gshahrouzi@gmail.com
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
 eamanu@riseup.net, linux-kernel@vger.kernel.org,
 kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 gshahrouzi@gmail.com
Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace

--===============2708167609590510838==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>From 3ffe31ac00fdfb94ffc521d8ab0fa60196e69c7a Mon Sep 17 00:00:00 2001
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 01:22:59 -0400
Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace

Remove trailing whitespace to comply with kernel coding style.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
index b93d74a5b9a5..48bf7f66a06e 100644
--- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
+++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
@@ -209,7 +209,7 @@
 #define RTL8723B_TRANS_END															\
 	/* format */																\
 	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
-	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0}, 
+	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
 
 
 extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
-- 
2.43.0


--===============2708167609590510838==--
