Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECA15098B
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071850; cv=none; b=NhblfbUnwCHAx+fPwC8rVNC+SIHKNHeoQ25PFLET8POuMuSszX6s0gPRvi9d6mOIfxLXTMjFhUp8n2ArjTOfS8W68ZhOcxzarbNSDGEh4srlWbFwfFBRrCg7tD/ZAw19IZ53CaMgUTYkstRgpgCBqJ5pKsBHrFvD94eGB2tNlDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071850; c=relaxed/simple;
	bh=+2njOV5Ga0IzlzN0XUiI1XPr4AZxQTAQfakyMWn49qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fjbth3iU1YPei6Z0ONVcobLhvZmtBC0TccLf/nmxjpRVjRKseMo/6YGFFSqW1EpNQ2u0XYd41mEEo2w+2IWTOL+719kdNXs4FTqqdbvvrhWiKtgF1gB1RUiCtgGSZPWICOPDEV9Z/QTTAMBMn5oedGAUB0OuAiF6uRoIwaHqR/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN17caBD; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN17caBD"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33d8739ddd4so3560571f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071847; x=1709676647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ahqsv6gOyMACRg/0NA4F3TAuiEZ+oz6aihxiy2L38w=;
        b=AN17caBD2PwFE8yRi8AQST5NNTqVhF4Vtq5Mnl5vcXOZdBeoLQ1cLmWC2mnrbGLsAQ
         rfJKVtQ02BIM05wy2eCBcmEw1ZYqg9M2k02SY2LcHelIt8bBqxJYyXr/ywsI9L6Ugsr7
         tyFVhWR+mg0LtdSH0V8/fpfWkk3Dk8A7xzAxbzVYQ2gO+hCZOGGwSBABCcVAjUV1EZoU
         W0NF1MTW5R2gIzvWFu3KKFKfqakUQE9EKqgZOnUNhGXKmjnZEfqK1kWEBpsZTtUpKCGj
         YaIYeu75qSNu+/PGNb47Uz14Gn8fhQmNCZsCLVxb3TeEwuOicfGPsvdNwWgoz7XGCNXM
         KOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071847; x=1709676647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Ahqsv6gOyMACRg/0NA4F3TAuiEZ+oz6aihxiy2L38w=;
        b=qvjXDnwDmC25XbbOdI2C7BVAR2SiddLbPK8HCPvrnr5J5DlnlsjJJzZELMYOTuYIG9
         FSLrCahod2GJKCoY+IE6xrLr9kF4RzdCRrNhXoCD2lOfcdWGyEMRVMOWHlet8eD9mGfT
         jgvAO3gq13+la/RnpIqG/wGtE4suzj0MhhAd1Kw4P7VeGBtWFDzP8Q8eDaa21hJhfZfk
         W021+1RJCDRvkyWKzHiEvxqf/2fx+WEvDhMFDy7t3aEQv5DY3UNJqvew80YbOQUMgVW/
         Q+P9X4NOeh9h4LHc7jicv1jDocFZ5GECJ6Iy/HOjk4mLhRcVKxV6Ak0pOofH2FxWa4Pv
         YzMQ==
X-Gm-Message-State: AOJu0YyIon0HzDgYs1HGER5pn5P94GvUNxSa0ayIzHuMuenr8Lvp09Kn
	C1607sxiZiCTCqLy7ItuVoSAbM3VnFM15a1TOFqF9Rh04GD0BiRZ
X-Google-Smtp-Source: AGHT+IHewtvJpIknI3aiuB0KRWRWRBvA3NbH2g8mKCsD2iZN9UApBRtAZ+TWF1Klb32AkS5o3ST60A==
X-Received: by 2002:adf:eb92:0:b0:33d:be6f:7dcf with SMTP id t18-20020adfeb92000000b0033dbe6f7dcfmr8086572wrn.24.1709071847468;
        Tue, 27 Feb 2024 14:10:47 -0800 (PST)
Received: from YOGA.local ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id q2-20020adfab02000000b0033cf5094fcesm12562384wrc.36.2024.02.27.14.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:10:46 -0800 (PST)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] staging: pi433: Remove a duplicated FIFO_SIZE define
Date: Wed, 28 Feb 2024 00:10:39 +0200
Message-Id: <20240227221043.532938-2-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240227221043.532938-1-ikobh7@gmail.com>
References: <20240227221043.532938-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIFO_SIZE is being used in both rf69.c & pi433_if.c source files.
It is also already defined in rf69.h header file.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/rf69.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 8c7fab6a46bb..b3b8d1abd3eb 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -13,7 +13,6 @@
 #include "rf69_registers.h"
 
 #define F_OSC	  32000000 /* in Hz */
-#define FIFO_SIZE 66	   /* in byte */
 
 /*-------------------------------------------------------------------------*/
 
-- 
2.34.1

