Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC1D1BF44
	for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708882432; cv=none; b=UKySmep1+Mc00azzFvDeTCYjCAvjnP5QcA7o8ktLeEgeQoBmDSwiAcZs/CY5PLvO1/USz+ZYWsLV1w1k/VHcFgLGHOKt+RIGQNcXqQs0Ven5cePsUagpD8RpE9HECGIpALeX12tXP7eG32BagkWBLRXnuXm7/Sb4PeuFW9lorIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708882432; c=relaxed/simple;
	bh=UWBYLq8HI7GnmwK3+bsQWF0LjzBeaokR18slcb6/RRA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F7CElxc8OfO0w2P3IbH9JHsmrPLDA3s+Dee/7GU2wz2UKNrnBTiwoJxktIFYn9OMa8R1eqmfF6lENgqkE0n2jHD8vgyxqB8dHzf/DeCQLSlaQpB5DMqw/BuwZK/VgwdzBKwcwrO0zpwOZbKGw/wbHf2UM14cZkgMUpOrGnrddfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFuGUojq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFuGUojq"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412a39057c1so2772035e9.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 09:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708882429; x=1709487229; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGqIypLRNK413/5tqEUR0eP+aBPssWDBJFP9KRu1Qkw=;
        b=SFuGUojqhElmslD9f06PG0ZFKDypugRwsHsxVn81vjIHMflojKFX3WQV5zf9ciVlBl
         45anOW/Y6Li6vId+5LETQQKWIdjzS4BQqhhLiKpBALGDZSXhXobFZ+QFfXEkajOdex4N
         NCV08MyDLct7A/XXqTq/1LYbE64dQW9IHfZmxnwMr8pkPpWWbHHj1Wb9/RMg2BO4/mj1
         83xtvgpGUgGc+e+F3QZNEl4boVMY/fRpwY2gBEOV08eoYtiNoPXZRsfUWfPAIcIfzggD
         W5zZLlWSKFYzq2WKFHTDBMahhZPweXOpvT+AawQvOuJVoJCNbgflviBFmZRVCDreadHG
         o8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708882429; x=1709487229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGqIypLRNK413/5tqEUR0eP+aBPssWDBJFP9KRu1Qkw=;
        b=o56mW5+t6AY/o3RjrEXGJ7pBBz0I8W9AC02R+MZQc5AWNHVYtO5TYQy1yk6XNwmNim
         z/KRWNRPn2+MoMHlSTVMR2SfRNNF6rKzn8CnX6/yGCqpl0se5NdWd6e8Lz4TnonjJFIF
         4/UGqEEpPFeR8EHPJePuPB+JGfEdAyG9qEAZh/JN5IWMrctaYtN9/57/ANzAzyISHry/
         TEf47nussgSIOUT1UQzUfPG8O3amrjD0kgdzdEKMousjCdMZ3k9myTHe9AtWFOW9kawG
         zZNJWYximSOLmjgXhjp2RevZeXjaU9gaQjLu9g53ER7XNyl1fGUnMpsZQWZJAAavYzd0
         t5rw==
X-Gm-Message-State: AOJu0Yxg/U1s56bmqYicNLO5CvC9t7ctKZoUtnRxIqkIQqbE5xSQt1ay
	YPQQ7fhq0ivw0WTQnIpbv+ek5z7ffX45QXI2gZyktbk6TLLJz/NR
X-Google-Smtp-Source: AGHT+IGXJ+i6mALim1Xo3qYN2hIyJ/UwmZqx6KAU2UcuiLb4rlXYoaH4TkF85BRvWmBGb1mkY0FKxQ==
X-Received: by 2002:a05:600c:5d3:b0:412:8e82:9a5c with SMTP id p19-20020a05600c05d300b004128e829a5cmr3818412wmd.38.1708882428907;
        Sun, 25 Feb 2024 09:33:48 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:79c9:6db8:8198:3c60])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b00410bca333b7sm9400108wmc.27.2024.02.25.09.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 09:33:48 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: pi433: Remove a duplicated FIFO_SIZE define
Date: Sun, 25 Feb 2024 19:33:40 +0200
Message-Id: <20240225173341.1278918-4-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240225173341.1278918-1-ikobh7@gmail.com>
References: <20240225173341.1278918-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIFO_SIZE is being used in both rf69.c & pi433_if.c source files
It is also already defined in rf69.h header file

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index d7e2dbe70d7c..4bfb1a98328f 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -13,7 +13,6 @@
 #include "rf69_registers.h"
 
 #define F_OSC	  32000000 /* Hz */
-#define FIFO_SIZE 66	   /* in byte */
 
 /*-------------------------------------------------------------------------*/
 
-- 
2.34.1

