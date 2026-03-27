Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EA115A86D
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 00:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774570949; cv=none; b=SWIHgFn28bRi8G6UvSWUg+/YKaniz2FmuKjKOU5SCGbLKpg1uhZ92l4EXFhF1JtX/uV3xU25A5vn9FFHa6DCn7zXqaEl5eu7xJqE22mFtULf6qmzQHKx6eobf3IJf3SpIATEdu7ObYDQvHiR/S6kCLMrgWfcN+NIFD5iDf6qMGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774570949; c=relaxed/simple;
	bh=Y0ffbCKcT28PMoqCPfHuNaDS358P4stMCVjdF8nbOqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fscS7ZSOKJ5g8LEv7E6vAspFN8Ya3j3dn7TFbmqNWKCb7s68h6da1LuPYnAKFkXWyLjnqG/QJ+aolXjFtCDIKXVaGWs9Ir5w8kRt5gXhf/axHkO358iwe2GILjhwRMXoBFsDWDPF1dOFNnfs5EJdqiYi/XPQ4R6GC31f9fvQlZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJ62ZVUF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJ62ZVUF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-35c0e7b751aso1521220a91.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 17:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774570947; x=1775175747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvtdTDa4Rqq7XqdyAmh9YasekK8vBW6hao6WLB2n9OY=;
        b=JJ62ZVUFQUcY9ucgC4baqpUOSDQnKZ40h5r5dI+P+mx0nkNGxblky2rSeutLQQmOY+
         cyT+Dsm3IUWDD0+UIRtp9yEuLuzrsTgDMw+V+hjJAZtnZKHCKWfNc341/y5ooAF5a/Cj
         1STs2p+lWUyiwPLdM7rx/cDjRwxhYpzuNULjeEEsyMbNnraPFirjErmOhtK4VyX2qYvE
         WOuc5fymwrmU6kXs6DA314N3OkdmPfjyw4dQ5syb/5nEjcug7S6Gz/zMsZ9sOBnwMOAB
         V/Y20QVgL1QjDSEFifI81WITXat3A627rnJQSYd+StwFTg2m4jeocYELq3Wg/GkeHUsS
         UndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774570947; x=1775175747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OvtdTDa4Rqq7XqdyAmh9YasekK8vBW6hao6WLB2n9OY=;
        b=SXTNP8G9QLEoeQ5RkK02Cf0QAiYccmWDn/J6kRw6sQ/hwH0KfCxN+aqEWvRasvTj4i
         weORUoYvuA9ziR1GYsNhN/+bGr1cUhfsYjJ6/oBkquOJ6aBYH3u2lHqqlH7vl1LfxZpc
         qTTdENbITd9PAjW9itexO++Y/3lkgNWHiK+VD7Q8GitaWZoC4Tgag/cS/lkUIwUdQmWQ
         g/2ZuRPmDHUOMVboXrKbmdZPfSjnfCD9/HyAxzKbhjfdjJX+E0NE1veOyQLJuZtOMwR6
         Fq+/30BsiER19UVoLp06iMqz49VqwMR7F+TeAMAJkh7utIDevMcgDDJg4SeQKmb1G58O
         9NHg==
X-Gm-Message-State: AOJu0Yw6hsnWJLrkxNPWiJR7GtiyGBIdZA8wFR+L5x2hKaey+2WyR8WA
	4aWSpUM6+nSh8UHj5L4mB2jEWdwLe4q4KjlTDWESEX6ZQhmWY3ock09k
X-Gm-Gg: ATEYQzyObu7oq3xZapVhSTCbWaVlf58myIGNYGgqTPRV9/43m5CvQbPScdRq7nsnCc0
	hMZDC9d4fQxCNHfQ7e5A/1oly/8TrfmEuJ2EHC5JCtDquaPy3aAZyIjd6diGfOalpV/zH9pVRXE
	uj1bIT3TxBEdm/vycmr9zLqKLleAh1xl6uzlVQIudDGzb2bO32yU2jyU4V9+s8424im4F6pVq/H
	1u5cBkhqG30felFj5xRn+ivqAlpD5d7VkEda2T/gkR2HP92SwHN2HdmlFWyxxrTdSfwK2gmZLpw
	zSna8og+vE9TdOlzEj6yFhmLA68zWMnX6QkIUILXQOys5sFYkZSBnIdJ8sw1gbHVybZ/VkL65mP
	Ivnzj4O3hj3S3zGPppqMGN7T9WgDfLwB9ESZ+Xvr1mQ/53VJrjk/N4MQO45YKD8wWGS6PygKSkQ
	slamJ8//azVe9Jn1sS16jUS5k=
X-Received: by 2002:a17:90b:3952:b0:34c:904a:d92 with SMTP id 98e67ed59e1d1-35c3010ef9dmr491188a91.26.1774570947550;
        Thu, 26 Mar 2026 17:22:27 -0700 (PDT)
Received: from MrXploisLite ([39.194.5.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d8c425sm3649407a91.12.2026.03.26.17.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 17:22:27 -0700 (PDT)
From: Romy Rianata <arokigaming@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Romy Rianata <arokigaming@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: Fix comparison orientation
Date: Fri, 27 Mar 2026 08:22:12 +0800
Message-ID: <20260327002212.33024-2-arokigaming@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327002212.33024-1-arokigaming@gmail.com>
References: <20260327002212.33024-1-arokigaming@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move constant value to the right side of the comparison operator.
This follows the kernel coding style convention.

No functional change.

Signed-off-by: Romy Rianata <arokigaming@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 279bc87c3..69538246b 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -105,7 +105,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		AutoLoadFail = true;
 
 	if (!AutoLoadFail) {
-- 
2.53.0

