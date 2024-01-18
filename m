Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D05663B
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 14:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705588975; cv=none; b=gC/i6G3uTcgMUtb4oDn4bKc6QTHMW69FJd0XvdJj53IVF6X+MyrweRDrvFf8Z3b/ZwtAuUly1WLiZIbp46W6oaW6MZyn2A0gYzg6ru83wmUQMuAb9/RPcvgFm+oP+Haf7QO89XRNc8A4HeVkz+19q3PG2cX/uqu7PMaF9qEC/Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705588975; c=relaxed/simple;
	bh=uxGgJcXm3aAJDaHF15vKNxr/n7qIlwyktZ3CCGHOF3U=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:Cc:
	 From:Subject:Content-Type:Content-Transfer-Encoding; b=H9BM540sg7/QJDfR14ub9KgcSjJLPq8Py+E5qRHirpD6eeVKJ13Q7gbKfhnDpo11GFByJLEcif1zkQsya5JElTgGm5qd/5JIEUZx/jxVokzGrRCX/Ie3OnR24spYD6g9lb9EU7Zo9wYhzXMBdXq78LwrqN4Eql9v0GZ50itNGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhAv3xKN; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhAv3xKN"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3bd93839081so341585b6e.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 06:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705588972; x=1706193772; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOqtTg4UhK2C7KvLSKvadXo0TFb7Q9SqKiW1/C+ZT5k=;
        b=EhAv3xKNr+erl7HTvwMzsWMlNzf41bqnCY7WHmG6R0ZMU5JlCjwNW7wH8AfV6YkyNL
         IWPfHEJrbVrtUrWBHggZzLkisZseqnCc0DqiKh5vG6q57itprQSqzV1T4vSdisWKVdaQ
         kGsNXsJqDTLwAHQW0cCgy1zqp0+kSBvljJcfjvmt6pOUNwIDOP1JxNLYP4eeuhAa833k
         HuzV2iiXAcyO35gnsvin2uy0L+J/TVlYpGQbVrBzFvVbOmMF+rY0uomCQX7boPe9NKW5
         s7BtLSvji6CH5kpIHzOUKnIYmARUeXsxAXG2eHf52TupDxhaZf5yAc9e6PVPTV1xvr+x
         8ZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705588972; x=1706193772;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mOqtTg4UhK2C7KvLSKvadXo0TFb7Q9SqKiW1/C+ZT5k=;
        b=O0be9iXPMiLHNxy286U/EJS6fOWMnSFQBPFFogKMlPdXvG1pjvDef20JKe3shTFgN2
         HmBPHMdfXezhPleu7co5w/I+6eN89nxOn1r7Ue6DGQJinUylnjRQEaa/oAym4BlcS9l3
         jkCIOeLrkSLADbX9ILng3i7HPJIhvxf/DhHwHE4De874SfdRu6+7LWrenEHpKubMXvrn
         ysKQ5z1AsYd92/uXIXGt9opkMei+dQVPTA8lwkDk0o6qr/whfuGogc1P62HUfrKgbp+4
         ww8i0l+zo8QJT1m6rMqetxxiL/y+SGOmabQMKQg4EjNSDTvticfr3DiXsldF3/Gpa2nu
         5YQQ==
X-Gm-Message-State: AOJu0Yz3o7P+L9xxugT4ftiShzLFzKUiYNk08Vj8YnJvv6oX2PSEpbcr
	pTc63qRPe6XQz0zzQonaRQU5PFSXnxS7stnpWm25rI0Am+utYHEA
X-Google-Smtp-Source: AGHT+IHwO/PRr4anWSEpoynGuxV16/UCi+N+rYypmX49+oaDj5sBVZrSE7+8oKlL6PS5YMbX7NpSRQ==
X-Received: by 2002:a05:6358:8a9:b0:175:d0a3:7432 with SMTP id m41-20020a05635808a900b00175d0a37432mr1914208rwj.1.1705588972436;
        Thu, 18 Jan 2024 06:42:52 -0800 (PST)
Received: from [192.168.1.157] (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id nh17-20020a056214391100b00681929ad11fsm455813qvb.76.2024.01.18.06.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 06:42:52 -0800 (PST)
Message-ID: <03b524b7-8e66-4180-b22a-aa641acbaac3@gmail.com>
Date: Thu, 18 Jan 2024 09:42:51 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, wei_wang@realsil.com.cn,
 micky_ching@realsil.com.cn
Cc: jklott.git@gmail.com
From: Jacob Lott <jklott.git@gmail.com>
Subject: [PATCH] staging: rts5208: Fix coding style issues
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Help text in a module should describe the module and give
some guidance on whether or not to enable it.

The BIT macro should be used instead of 1UL << n. This
makes the code more readable and easier to maintain.

Signed-off-by: Jacob Lott <jklott.git@gmail.com>
---
  drivers/staging/rts5208/Kconfig     | 10 +++++++---
  drivers/staging/rts5208/rtsx_card.h |  4 ++--
  2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rts5208/Kconfig 
b/drivers/staging/rts5208/Kconfig
index b864023d3ccb..bb293cbf6230 100644
--- a/drivers/staging/rts5208/Kconfig
+++ b/drivers/staging/rts5208/Kconfig
@@ -3,7 +3,11 @@ config RTS5208
         tristate "Realtek PCI-E Card Reader RTS5208/5288 support"
         depends on PCI && SCSI
         help
-         Say Y here to include driver code to support the Realtek
-         PCI-E card reader rts5208/rts5288.
+      Choose Y here to enable support for the Realtek PCI-E card reader 
RTS5208/5288.
+         This driver facilitates communication between the Linux kernel 
and the Realtek
+         PCI-E card reader.

-         If this driver is compiled as a module, it will be named rts5208.
+         If you opt to compile this driver as a module, it will be 
named rts5208. Selecting
+         N will exclude this driver from the kernel build. Choose 
option Y if your system includes
+         the Realtek PCI-E card reader rts5208/rts5288. When in doubt, 
it is generally safe
+         to select N.
diff --git a/drivers/staging/rts5208/rtsx_card.h 
b/drivers/staging/rts5208/rtsx_card.h
index 39727371cd7a..9d2504fddb13 100644
--- a/drivers/staging/rts5208/rtsx_card.h
+++ b/drivers/staging/rts5208/rtsx_card.h
@@ -338,7 +338,7 @@
  #define DMA_DIR_FROM_CARD              0x02
  #define DMA_EN                         0x01
  #define DMA_128                                (0 << 4)
-#define DMA_256                                (1 << 4)
+#define DMA_256                                BIT(4)
  #define DMA_512                                (2 << 4)
  #define DMA_1024                       (3 << 4)
  #define DMA_PACK_SIZE_MASK             0x30
@@ -542,7 +542,7 @@

  #define BLINK_EN                       0x08
  #define LED_GPIO0                      (0 << 4)
-#define LED_GPIO1                      (1 << 4)
+#define LED_GPIO1                      BIT(4)
  #define LED_GPIO2                      (2 << 4)

  #define SDIO_BUS_CTRL          0x01
-- 
2.34.1

