Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D146917555
	for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711272735; cv=none; b=NEp0B+i9xc23THwx8qtyECqPPOuibV76rokNIpHoeiUp+/xNE2dYEWe7xJ3WHZcdquZaJMZnb6kmLmoNX31o9gwSOWApGMoPjYBHAG5SKLSFvs7+V11xW9sDp03aosXz1ikZTlpeKgkuqClASOG5urd4QaHG97KRf+N/ltlmNj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711272735; c=relaxed/simple;
	bh=VT0EkNrQhjDBbAPpzVyUfpRwQiQqlFeykNPMlZxlnAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p91QSJ2KVxX7hhXpbTlPyN20XlrTM527KpUkUv51UPGHK1fDeleJGsksZjsmt7E/3AL52goJY00R9H3hxMWm+PdsnvVdH6ywQ8s8/zCeCmfdg5N95tHI8trQ1i3pAwNIdou7qu3QXy3fUFHr62Eevg+2ZTJYqxcN/z+tyOSytYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eb8shCT/; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eb8shCT/"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33ed6078884so2463777f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 02:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711272732; x=1711877532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6o+af74WSP97HZ3puohPzQ1dX5G0dkc3ZQTYmDMAGE=;
        b=Eb8shCT/PQGuwQ/yO7+bfVhLkVf/z2yiwOrtJFlO5cEbuzoiaYTHS6N3mtI8kWDKlI
         5VKNr84NX6avc765u3UhhXZbjBv1USjIPplqFVhL7Jxm4nHfghiZx3Hhwrr6695Ijp2W
         FeTT7HqZ0SC9x7EgaN+5EhHvRxjM1AGIQXNGySNGNjXYpf752rDuAEXl8vS4a5d3oneX
         o6kouLPDqWXs7PNtCE/hV4+HlXh+hc6TjXdCMmnVmfjdpQl7umlHDkREawITVD4vxWKN
         lCxZ94FqdM8RkMmIG6bUgvEWfWmryZiTT8uZ6Kkav62TGUT2WfP8ImS2kc9ceYPKI1Hz
         ZsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711272732; x=1711877532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f6o+af74WSP97HZ3puohPzQ1dX5G0dkc3ZQTYmDMAGE=;
        b=DHSZA0my0DJkdD3CPNOROEEw1zC+9371gl+TY3iGB++jdm665zjjYgk6igr1kJcHa1
         fURVbyE3LM/SAY3IfM9yluHTOHvLbFWSjX/tPp9E3EJUafomsAIvLilZGLycydpQS9Lx
         v3G0eHzFIH3emOruJFkN415ASyw7uHSwwOZ9Cif8EYNvyUVqWAUQ38shRX8ph+86eyO3
         oJZzEfu1pLw4/WQarv5p8fDerJzO9hxPTp9HG6Zb+d+ty8t3gQudvYJ0yMpQUMmNN0w8
         G0XyeLbUW85q1VtLx7BP9GBmPJ35QklFGt30m5ZEUZQ7Ba0l+IqRZYEpgCeK3d4F03wp
         ScTw==
X-Gm-Message-State: AOJu0YzNe2w/1kZdnKK8f4PWJPhTGoqSxnVt6SqSrQEQVzEowK/3wqsV
	Gh/3oIY9DxjFy7E2nys83v4KXe7JGaP/xjk5vCTi3vsG5mNXj4a/
X-Google-Smtp-Source: AGHT+IEcC/5j7E19kInkz6JcOC3nZEaLiAPqs7fStpTxOCqmWu64LIxS1gCBhb1GmJrsFvK69qshSA==
X-Received: by 2002:a5d:42d1:0:b0:33d:7e9:9543 with SMTP id t17-20020a5d42d1000000b0033d07e99543mr2605274wrr.32.1711272732281;
        Sun, 24 Mar 2024 02:32:12 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:42b5:8c78:fc9d:7600])
        by smtp.gmail.com with ESMTPSA id ay9-20020a5d6f09000000b0033b87c2725csm6490711wrb.104.2024.03.24.02.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Mar 2024 02:32:11 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: pi433: Reduce N_PI433_MINORS to conform with N_SPI_MINORS.
Date: Sun, 24 Mar 2024 11:32:00 +0200
Message-Id: <20240324093201.793485-3-ikobh7@gmail.com>
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

The driver can't actually support 2^20 devices.
Current RasPis GPIO pins can actually support only 1 device.
Other or future platforms might support more.

Signed-off-by: Shahar Avidar <ikobh7@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index a351b7acfcff..9fc93fa454b1 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -47,7 +47,7 @@
 #include "rf69.h"
 #include "rf69_registers.h"
 
-#define N_PI433_MINORS		BIT(MINORBITS) /*32*/	/* ... up to 256 */
+#define N_PI433_MINORS		32
 #define MAX_MSG_SIZE		900	/* min: FIFO_SIZE! */
 #define MSG_FIFO_SIZE		65536   /* 65536 = 2^16  */
 #define FIFO_THRESHOLD	15		/* bytes */
-- 
2.34.1

