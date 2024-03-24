Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9BF15491
	for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 09:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711272733; cv=none; b=GDHsDELpcZ3FKPHAZdjyIXSJ3lXWYbNbMF6de9TsO2lZ/ZeT+1UTjHPvu9FJ2085/ljgGPmlRJW7O76hfwNlMEDBhG5a22TDy1VZxlX2RZuf68qEvaPcWM0P/0CNHBDMwbOLj0w53dRtRJkHP6CTnNppbiUlc35uyK1irXwnQf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711272733; c=relaxed/simple;
	bh=YVVA/Nue1HWli9ajTETSkp/Z8ht1gvkZIg5G81ES5Jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QfKxBQgzP8Dx492cQkqYW9r4gPN5bqrlYEIUrjaeSgQKTS9j1pVWyfQ31YNCgqnXub0NCoRWzgANqsmwk8ZgjmWm43YJ08LARbwAFz399HaQgNGV8ksuMwUYV4ZGMdP8JTjaeRgNT55CIduXpkh9VJ8W0w42J/DvTU33Dct9v8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkHIYUH/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkHIYUH/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41485f6da87so2100635e9.0
        for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 02:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711272731; x=1711877531; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9z4c5G0kdSZAq5c11ZQYphuwgiNaPxmvqYLKdSmtxQw=;
        b=IkHIYUH/OozaWUVsUSGgfTun7L+/xmGfkRVyQ+s+ydTEdubh8TgImxhnXPyHqZPLvu
         xiz/Qu7qUuzqobJCU/d/8+QlruYiNyyVFrS0nm9tEpLnvsEbjpJXp/5XxIay29Wttssn
         efR2BwePJW/j8rRM0meaDIKFDsneEBQZ1jKZLZ/2oYEviLhgGw3aCvmtv6tzTbXCXwY2
         LTaTElgxmvS3jOqPcZze97hdN+oJfBLNRygoZASGrQ1YCPHqI0+1csY4iIbhPIpaQvL2
         XA0Jq2bVer4QIkD8rBV8+QnNTizpxpz8031/orwFRrcwIw2R9bJyRoUoskRfprLbd6AU
         wwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711272731; x=1711877531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9z4c5G0kdSZAq5c11ZQYphuwgiNaPxmvqYLKdSmtxQw=;
        b=h8n412c9dNGtK3bXWY1sVIoXIreU/5EnptPmJ5z1bMYxWdV6zqzihgfX9Vpc6aiaCR
         nsQqfqDaTj5OZurhIgJwjYcKVWyu2K1X4XKKJS9nMzjW3+wtWQfm1J3PHPQ3/ZFDpv0/
         vPJ7V8pBFIQWE1iwJVaOHdEdVYGbnoWNywQpQew7SwwAi/4B/5qNZzPr8fU+6LnyTk79
         ekDp0Gx4VBVNz/5FZFRISdMxnOVCOaxQ6YhCu9OofUACjXLxCJscCMBqcIMiVUqe0pqf
         QiNN6e3OzSyRc3vmufuVIIXqCiPAVbLmF0G0lg0l/dLag7NtVpcJI7Z+RTWP4JY/A072
         r1kw==
X-Gm-Message-State: AOJu0YxbpJkJXoXr0j+wuwIzA7SBF42ExDdkb/D6tTREBa7dm+jHMAP/
	rgdrP3EsZqWgJMk0m2W4w1DvrvrazYxqiDdZezw6f1JJeyJhtJmm
X-Google-Smtp-Source: AGHT+IGMRut/BEV6BtVvBXPHbQ6PxSc0Wph7gW5unAlhd861t5LWGUaO56+dlY9f44h3fJp8ac1pwg==
X-Received: by 2002:a05:600c:3b98:b0:414:5e9b:804b with SMTP id n24-20020a05600c3b9800b004145e9b804bmr2787739wms.10.1711272730644;
        Sun, 24 Mar 2024 02:32:10 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:42b5:8c78:fc9d:7600])
        by smtp.gmail.com with ESMTPSA id ay9-20020a5d6f09000000b0033b87c2725csm6490711wrb.104.2024.03.24.02.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 02:32:10 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: pi433: Use headers in appropriate files.
Date: Sun, 24 Mar 2024 11:31:59 +0200
Message-Id: <20240324093201.793485-2-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240324093201.793485-1-ikobh7@gmail.com>
References: <20240324093201.793485-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure rf69.c directly includes rf69_enum.h.
Move rf69_registers.h from header to the relevant source file.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 1 +
 drivers/staging/pi433/rf69.c     | 1 +
 drivers/staging/pi433/rf69.h     | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index b6c4917d515e..a351b7acfcff 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -45,6 +45,7 @@
 
 #include "pi433_if.h"
 #include "rf69.h"
+#include "rf69_registers.h"
 
 #define N_PI433_MINORS		BIT(MINORBITS) /*32*/	/* ... up to 256 */
 #define MAX_MSG_SIZE		900	/* min: FIFO_SIZE! */
diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 5a1c362badb6..bf802f097310 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -11,6 +11,7 @@
 #include <linux/units.h>
 
 #include "rf69.h"
+#include "rf69_enum.h"
 #include "rf69_registers.h"
 
 #define F_OSC (32 * HZ_PER_MHZ)
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 76f0f9896a52..dd6fa8af9b9c 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -9,7 +9,6 @@
 #define RF69_H
 
 #include "rf69_enum.h"
-#include "rf69_registers.h"
 
 #define FIFO_SIZE	66		/* bytes */
 
-- 
2.34.1

