Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082D152181
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 19:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711566618; cv=none; b=chB/+Qixvw/AdLqWie2pKRiQEF+zYch8+yBa7gnXUmI+2YUYMAgqz05OtOxm4e9Vop37r4ZdD2B0HE/nQOODdzewXcHrtqBXdkG1YWYXWyIOqaCaQK4Cwnu4lx5MWz9tgQQw0BHABq25jMYIxe8fulhiwWUOBkNHt9rHFTjhRmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711566618; c=relaxed/simple;
	bh=2P53dqZLCQDgClrPxw8cwYgJMflZz0YJKHxb+dxtGz4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YmKpqk2lFjHSuOa/6u3Y4ndvsG0Wb98nk3mdtgEmBWf2TZTBm+gHp5+vlhIuqwNizW7K5NhEmsxLGYDtKyiNNvmHnOj4iyQjPjgA8TTgwUowfWuthSCtzdAN+qw7LBDrLqf/bQr0Yb4cBYNbwZ3USX61zkdeMHrhVfLqUWyuY54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG21WcHe; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG21WcHe"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-788598094c4so6870285a.0
        for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 12:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711566616; x=1712171416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+OJvFLyFknhUDss3UMv5MZgT0NYrVcq8IA8NPybvW4I=;
        b=iG21WcHe9xcf02Yf3M5A8S/rA92wj6m235ScnKkVjAAk0oy9k6lqdWankmFWorwBeG
         B9ow6KVNOL5MiFTwiWhKthkIH361nFTYla3rueVf5rJ/19a/BuG3WcvD+KxkaLQwdV0t
         9c1WK2okdxhzSm7QO8f2cH07ZYn6PEH/Jw2vlF2ZMCu3BdhZprjCbGVaW8SpUFqEjs3X
         2gss16RkGxJYHQNn7iXAIEzrMcEKri8BQf7Tai3uQl2YKVTpjYNNyK9Fk5wAVhsu++wq
         phnfMQmahmDhSGeTF+9oeEKqg0+RLMQ8txK0QLxYQQTwQ4JiRIOkcb5cQmr64UUjicEj
         sgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711566616; x=1712171416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+OJvFLyFknhUDss3UMv5MZgT0NYrVcq8IA8NPybvW4I=;
        b=thXt/vrsPaXva7xUEoqD0BjHs5nUZNznIYzzo6jRLpxa+2ynrL0k7kj8eODsFLaC3C
         b21iMICvx2Qg1kVLY1mYoM5OIyVJW3Pg4c8nPtA+4jK+/gkZBmVYY0zOHQCB84LNVVns
         bwwlM0NmvN3PoDSSZmE79H+L3Y64M2u1/eSmh7wVJty1y3sWg7iFDzK6ujNfX4S5UfsD
         x8/PdVjN4zc84K5c/9jj0ynma8DoQiZasGmUKXjYPrxlRKJ8dLVBlAP2p3uEQuuuueAm
         fn+o0qQ8LVVKKT5BgYOYAcY7gc9hmr71z3SSAqoJQ6gubUGi3MYzUGu29LMNhvTS6Q6a
         VvRg==
X-Gm-Message-State: AOJu0Yz7hbkwZJX4BnSghavps3Wl5NkMPmS6YHpoNCPrWNEPPFYbrulh
	NU/z8UySCang/iLSlxjPNBzgxmPgGj+O9+ogpKVmyIstwS1xKEDK
X-Google-Smtp-Source: AGHT+IGiE1RuN1c9CUcRzRJsXLn7mb71lrh5W4dd3z2jLlJLq3px/AkdtBHo967VE8WV3ZXbJkMCPQ==
X-Received: by 2002:a0c:ea25:0:b0:690:a800:8ffa with SMTP id t5-20020a0cea25000000b00690a8008ffamr541916qvp.31.1711566615922;
        Wed, 27 Mar 2024 12:10:15 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id 10-20020a05621420ea00b00696a1f5dd18sm1784789qvk.116.2024.03.27.12.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 12:10:15 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] staging: pi433: Remove an inaccurate comment.
Date: Wed, 27 Mar 2024 21:10:03 +0200
Message-Id: <20240327191004.619748-3-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240327191004.619748-1-ikobh7@gmail.com>
References: <20240327191004.619748-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The comment specified the wrong number represented by the macro.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
v1->v2:
        Undo macro change. Remove comment instead.

 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 0c12b31c4642..ec9f07a4f769 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -47,7 +47,7 @@
 #include "rf69.h"
 #include "rf69_registers.h"
 
-#define N_PI433_MINORS		BIT(MINORBITS) /*32*/	/* ... up to 256 */
+#define N_PI433_MINORS		BIT(MINORBITS)
 #define MAX_MSG_SIZE		900	/* min: FIFO_SIZE! */
 #define MSG_FIFO_SIZE		65536   /* 65536 = 2^16  */
 #define FIFO_THRESHOLD	15		/* bytes */
-- 
2.34.1

