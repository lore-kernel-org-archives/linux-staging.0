Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158E3C6B5
	for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 20:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVey5pyh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c9b1e3a809so31366795ad.2
        for <linux-staging@lists.linux.dev>; Mon, 16 Oct 2023 13:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697487119; x=1698091919; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J6LHOYtLClzaa9kbN2vgbPQDO5kRAfn0VOdVTmmzqbk=;
        b=DVey5pyhGf7eRxb6CN1S4qg4gQuxGnoxyh94kGHKMXmjnzWalYnnrAKiZ4/lkV+9kf
         +K7Hg5t5GljPTmvNg4qvR9gJCxupPFeHIgD4zd9/1sIYhkxtgEhqWrk4mr6PffgVWXb9
         phYB8gSIAyUh+/OQuWDmWGutWc7MiLscVKvH1XL8+3vX8MnZGinSolKpkHqcEDFKtNoy
         YmyZkSzgpRrKc9uTlqj91zPlmkzqjvcp5+BSw2wmufMaGc9HAvpPYjpkj5oH5lYPx2Ux
         Z01AOB6Sc9xV3Mnln2wEiToPiboZYl69Q3skkBUhe14Apjrmi4Df65M5fW/xfhMHlSBd
         8r3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487119; x=1698091919;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J6LHOYtLClzaa9kbN2vgbPQDO5kRAfn0VOdVTmmzqbk=;
        b=fvtnQqQRJIirFa1A+u0RZLgbHCLV1Mk2cB1qHRf/kbPLKNguHuZEoieCzz9kzsHgPf
         m0HqdXhNH0pkUGOUlU5SRxI2dBLJOkJLmSNeSwPag6IjJBpd5VqJEkqeQ1+M4iQShgNc
         l5y7XZsFOKi3Ywlumu9ZwdT1k/SSUjnsT1q5IXwQq72vCQvw8WWzVCZ55VUXyIwdN7Si
         JtXqcN14WTAOG+P77HeldyPO4UTbJtMRSWBLPZ/tqqN5iQ6HVOlkOfqCbb+p3iEKSZ5S
         PqsgpPqsQzLm2P2KvixaBNH7SQmvvBVexwU54hdcZBxiLuoOy7X9pIZYp9+tFH+/HWzl
         5zVw==
X-Gm-Message-State: AOJu0YyikSfj0pEHP261ZYpr7nm+Vr2YSTliKjYYtuRqJZ3jf3CNS1Md
	YdxuoMeACFfpJQbG6pZP3Q+iImzTfQ4=
X-Google-Smtp-Source: AGHT+IEudiALpXVcT8kKa07mFAeKZkNNDuHZZ2axTlVYlbE4sBJLk+OChhPPIDe5+OXr86F5JtemkA==
X-Received: by 2002:a17:902:d512:b0:1c9:d667:4e4e with SMTP id b18-20020a170902d51200b001c9d6674e4emr410662plg.65.1697487119042;
        Mon, 16 Oct 2023 13:11:59 -0700 (PDT)
Received: from ubuntu ([223.226.54.200])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902eecd00b001bbb7af4963sm27625plb.68.2023.10.16.13.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:11:58 -0700 (PDT)
Date: Mon, 16 Oct 2023 13:11:54 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rts5208: Replace the occurrences of (1<<x) by BIT(x)
Message-ID: <20231016201154.GA14625@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Prefer using the BIT macro

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/rts5208/rtsx_card.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx_card.h b/drivers/staging/rts5208/rtsx_card.h
index 39727371cd7a..9d2504fddb13 100644
--- a/drivers/staging/rts5208/rtsx_card.h
+++ b/drivers/staging/rts5208/rtsx_card.h
@@ -338,7 +338,7 @@
 #define DMA_DIR_FROM_CARD		0x02
 #define DMA_EN				0x01
 #define DMA_128				(0 << 4)
-#define DMA_256				(1 << 4)
+#define DMA_256				BIT(4)
 #define DMA_512				(2 << 4)
 #define DMA_1024			(3 << 4)
 #define DMA_PACK_SIZE_MASK		0x30
@@ -542,7 +542,7 @@
 
 #define BLINK_EN			0x08
 #define LED_GPIO0			(0 << 4)
-#define LED_GPIO1			(1 << 4)
+#define LED_GPIO1			BIT(4)
 #define LED_GPIO2			(2 << 4)
 
 #define SDIO_BUS_CTRL		0x01
-- 
2.25.1

