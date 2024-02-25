Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB9C18E3F
	for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 17:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708882429; cv=none; b=m/VnHo1UObzlNt7M/lneyzXR9V3MEJrN0n1VeVP6PulmBwuwSoETHhKa7+PoT7pBzQGQT1ePZmdwjSMC2bMfYpC/P6xvGMXZwryCtSx2+T04gU0WCQwD4Mkx8zeDq4e0L6tnVas4/0FYx52zz2hhykkKdGorP0cmT1hn02F3C3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708882429; c=relaxed/simple;
	bh=hW1hBb+c5MG+qi1RYxCxybzyrw2JmdBqXGgpDRxc9L8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sza295z5Rti7zU8HmaM0+x3mcCIuqLn5dvE4isjJNVlZIpFs5k3FaHZfVmMyZ45X3+quoXnwbbT14BmIZIHHOTWbRevdMLjb8Xl6Sq3kMKvjt8tb4p7k4j1znPKZZq2fTZ6k+PlpXML9KTPdgfPmVWikjYckGh+a/IyAGkYYRLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8dLUQO/; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8dLUQO/"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412a3903586so2891315e9.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 09:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708882426; x=1709487226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WxAitMAlksvcfjA+ht28Uc2cND52s9jJweHCl49uv/0=;
        b=m8dLUQO/lcjAzJZrXUrJHWz/Y3r+/OY1D3S8TbDqc8rNerGUHHmEKFwb6D5qQeIG6+
         jX4FlfWGKog05Z5Dkcukwc8aTyt40CFwlgavYJqEzikz5SNk5fIoFWT+XgJHavZj6HLk
         CGNm453b5JrRjoQUEpPLZVSSgvdTtoDcxQtMqElJS9yNlgh6fQmPtinlkOUovTRf5zRh
         ASIiWtzr1Tiq8xA+deZHnbw1aePIEvvDZc4vhIQu0EMdWFtkqZaXPV1TsYDSHUE76PjJ
         q7Sc9kBIUmCsVXwSR0DT/NmQe1g6p8JMCQZpwxztTSmXvKMtK+KIg1oJKBrxxENVlnkp
         gvLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708882426; x=1709487226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxAitMAlksvcfjA+ht28Uc2cND52s9jJweHCl49uv/0=;
        b=VMMNZf+vPorQu5+vGc85ZpcWViLy4uhh2P3pxFEd9vbuK2kJkdRB41t+nq1oI/xlKx
         vldUxjnLgsszD8KueRRJZ2uW8cyIW3+enaISYHISKt2RgM2zte+Mw18irqS/gYcBdKRJ
         mhm/TOPREHOtzfzxlFK2GjL9cozHnY/EHb5EcLY0pdPjtLi9TfA2/7S0gsWj9r+2wVVC
         BeDa3H1r2Q9ip05Tn6K24W9+2gL9Qi1KKwjUU4U4oxuBZqspzQC+8gzq+tG4xJARQ/0j
         31ByDFbzWSHz678KLHaWkv/lydskHEsPtQhZYMLxFgqPePDOlMveuRrsHSRdPhlBHFIY
         U2vA==
X-Gm-Message-State: AOJu0YyAd+hn6o1M3GWKUIuNQ+xtwf6h2oS9VtsxO2qdXqyVje2X0eOi
	9Y0uLRy/xE5jfONzBluFrkWx3Pp6MCP1Z4QVoh64fA3UbpSMofJK
X-Google-Smtp-Source: AGHT+IFatI2Mw1RwfVTugJjlPgmMizsnbu6KzRUHvlM62cOfiV0IypdKK4huN9qvklZnjlHFG9496g==
X-Received: by 2002:a05:600c:1c1c:b0:412:64cb:eff3 with SMTP id j28-20020a05600c1c1c00b0041264cbeff3mr3262561wms.3.1708882426004;
        Sun, 25 Feb 2024 09:33:46 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:79c9:6db8:8198:3c60])
        by smtp.gmail.com with ESMTPSA id m6-20020a7bce06000000b00410bca333b7sm9400108wmc.27.2024.02.25.09.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 09:33:45 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] staging: pi433: Remove a duplicated F_OSC define
Date: Sun, 25 Feb 2024 19:33:38 +0200
Message-Id: <20240225173341.1278918-2-ikobh7@gmail.com>
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

F_OSC is already defined & only used by rf69.c source file
Also fix define comment

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.c | 2 +-
 drivers/staging/pi433/rf69.h | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 8c7fab6a46bb..d7e2dbe70d7c 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -12,7 +12,7 @@
 #include "rf69.h"
 #include "rf69_registers.h"
 
-#define F_OSC	  32000000 /* in Hz */
+#define F_OSC	  32000000 /* Hz */
 #define FIFO_SIZE 66	   /* in byte */
 
 /*-------------------------------------------------------------------------*/
diff --git a/drivers/staging/pi433/rf69.h b/drivers/staging/pi433/rf69.h
index 78fa0b8bab8b..52e43a909b03 100644
--- a/drivers/staging/pi433/rf69.h
+++ b/drivers/staging/pi433/rf69.h
@@ -12,7 +12,6 @@
 #include "rf69_registers.h"
 
 /* NOTE: Modifying FREQUENCY value impacts CE certification */
-#define F_OSC		32000000	/* Hz */
 #define FREQUENCY	433920000	/* Hz */
 #define FIFO_SIZE	66		/* bytes */
 #define FIFO_THRESHOLD	15		/* bytes */
-- 
2.34.1

