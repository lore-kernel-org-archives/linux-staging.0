Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A76374176
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 17:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239766; cv=none; b=s/bbzSL4XW4LIm/ZdLF27pqrQ+4z+oJxvEP5nMaNGXW+db2KSqozcnNriPbWkvU9RuRts+k5VRbKmUBpMS1JZ51np6BCDfR66GaQJpT+fqiCAreW2mnVihx5wfyGH9j1oLe+5unRlDfR2iJt4oHLkpU334QG2in+lcXa0u8UlKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239766; c=relaxed/simple;
	bh=Xzf6NbrHMTR56V4ovAgyy4nMmJ+7ldh4LscABsI0LZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqQoY8BbJV3p73Mqr0EnSEIiXUJrEikNZwvx5W3kfmWspChb2UPJcA7IFnGtwRoFlx5d5Cij8W1edrJhnMJbLF7nz6wse0prWnpPS92C0hhiu5tJX1/wZc0wGkrm0XWVQW80Z4yuV8MnhlbayvwE35FvkEwb1eZhujApdmlMDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGAnKy7X; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGAnKy7X"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d182a8c6cso39608065e9.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 09:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768239763; x=1768844563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Av6/f2PV0Bw0PsmtirG9AckosNwB7WrWilY97qpVxKA=;
        b=EGAnKy7XiqdnUYRYdnMqX0t7z+DUaIKDdR0tHngNNTl9Yg1e95qH24dJ7jVj8hSdsr
         nXD0w43OpcqcR6bba8T1Jwdidggvtlq1oyDOBtVbI63OrQRUO3VggUdEb24bbgnDFDXs
         jspQsRmHIHOp1Lcjgraw47bZYdG9JfLFf7p7FFCJhe5l9Z+nLaX6E7+mLWdP72Bshhwk
         YWIVBLRhiWA0QUbNWLSu71xRemohgefoX4BBcj2WuyekYm/hQdLGKoXAjp7pQJdvCWLL
         JGUfKFhw9IoQarR+2k3fK4QBh3TdCH15mHNq8avOf3u05NV92WcWGSoRvNCIk7lBHPJk
         wHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768239763; x=1768844563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Av6/f2PV0Bw0PsmtirG9AckosNwB7WrWilY97qpVxKA=;
        b=mEa+5PtWb9IOGjQi02M6dh0qUNi1FI0yrUhV04/KaV3r9IbSKUIomkYyUuu3JAySKp
         nicXM4K7XF5m2J8KHT1gVlIBopyPS2/6+uH9knxvEoXXTWD97TRx8XPdINHM5V801axs
         2dHMl8q9xDJsfIp2FXMVNAGZeUj5ZDGrqj5fpPbHY2Sild9+EpbMaUmar1Ahb5SX3HpE
         wpTfC1vVsEmV5N3n4JDEVeKiB/cZdg+lZ7dCucCOwKvQ1/7Or8Y5f4ythLLUTctd97y5
         KC06Kpu5mMbZii2Ny9SFcwgvMzKUGN2MdjhkflZWWd25d0eOIUdIfwLx98cD1TlzXjwO
         q8FA==
X-Gm-Message-State: AOJu0YyKw6UK2jj2+/PtL/lySMwLcQiNAla9fdhSawaxLA1A4rZHqzI5
	98p1KycfbSYlRxcmjHHS3g4PQN3sN+xRX01Qd7ec9IwQqQVMX9Hp8rIMzq/gQp7P
X-Gm-Gg: AY/fxX6Yy8gdTWrrzwfApFfJpWdcAFTR7/e65UkaIBYJZ8tXEZ/FCLwgV+qe5RpTl2e
	IP3F3pG9XjYktvjJAai8qelqQhEBy1GXp7He20G/LqeeTPaTbs5ZY57Q83+hlcuJ7qkrjDl+7eZ
	g9AxFflK4qRTfmfATqeAnQd9WMDNCz58KjU77H66uxiXAPiuknizH2T5Br6NUEEv9rY7XjAI9Jx
	qXZRUaTOwz2qm6SfJwYCPtplfBZi+0P8yKheZKFa7NE8JaZ1od9hcuctxFOUsJuIa5hw1Sju54L
	5fxXe7prtTwwRIkKf7P/vdPmjqVjv1EqfSMAFlTzxqdqdWX/QGEz4Q+ox4EmGQWGN9fNVMkCjgM
	IeckCc8hieYgylJOOYKasy94zqmPGtybcVr8FKTY0N2umbACSsvI0LQubKcHvYgJHERowPi5Ch1
	EcSqbK2lj/L48/saRISakMjlAYYB0BApNWqI32ifQ=
X-Google-Smtp-Source: AGHT+IGJGMr59sSU9Wubs25ZX686pbTr1m/+vqTjnZSHUVAp/tcyn3hdRAvuY0c94WCaPkc3oy6rXA==
X-Received: by 2002:a05:600c:470c:b0:477:79f8:da9d with SMTP id 5b1f17b1804b1-47d84b3b522mr244490795e9.24.1768239763001;
        Mon, 12 Jan 2026 09:42:43 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacd1sm39090716f8f.4.2026.01.12.09.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 09:42:42 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH 01/10] staging: rtl8723bs: Fix block comment alignment in HalHWImg8723B_MAC.c
Date: Mon, 12 Jan 2026 22:42:18 +0500
Message-ID: <20260112174227.14922-2-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
References: <20260112174227.14922-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warnings regarding block comment alignment.
The warnings were: "Block comments should align the * on each line".

This patch aligns the asterisks in the block comments to match the
kernel coding style.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index 1f0cc8d58df3..a65dab37ad9d 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /******************************************************************************
-*
-* Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
-*
-******************************************************************************/
+ *
+ * Copyright(c) 2007 - 2011 Realtek Corporation. All rights reserved.
+ *
+ ******************************************************************************/
 
 #include <linux/kernel.h>
 #include "odm_precomp.h"
@@ -69,8 +69,8 @@ static bool CheckPositive(
 }
 
 /******************************************************************************
-*                           MAC_REG.TXT
-******************************************************************************/
+ *                           MAC_REG.TXT
+ ******************************************************************************/
 
 static u32 Array_MP_8723B_MAC_REG[] = {
 		0x02F, 0x00000030,
-- 
2.47.3

