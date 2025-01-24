Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788611CC899
	for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 11:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737716504; cv=none; b=qRk47RnLEX4q44O3n6gJGcBkWGBhOSSUqUu1ZY7LtFJwjcnsq03XwYq9DrZcGaHkQPOcxMLchoKM6vT6TPltctcXizs8oO/MTwrzM4txjv/Y/A+nooWze2UkFBwAGqCxUhIqZdKsyagu/GiPP+eg8yIpyf/qeqMM3iYpuyRdUbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737716504; c=relaxed/simple;
	bh=gQiollDy+BqlWZlky2v9IBzRbeq1WXtZcTIxkajHpng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bLNj+gI3ARrVPE/lN6awnYhlxaqgIHshWNWAti3Dpccwt4CYcDkiWq8L57hU/NOAHT7K9Aq88eGabKGoGtsUXjKSPFSnjvD3UfoxC1F+GbayoTTM02//E4cZTxecxAg5dKw5FriiHeRkNIwre2ayycARIp5OLL/c7M4RjWqGHmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FGDSFW0N; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FGDSFW0N"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436a39e4891so12972325e9.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Jan 2025 03:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737716501; x=1738321301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUwlmDmwejBJP87JAahqezz2ee8z+ZzwE8A5wOy/g6U=;
        b=FGDSFW0NNEw+CbNDnqA/Q7kVnVOVdhmbUDt6t3tvtBL/3Sf/TTH0CPucyKSyHh3Dy1
         eG8Dzlty3qd6ZOHSbikNHk+rIK4olq9Re42V+foZj5KDnJOO9CjqQUba3UTFL/24P/3L
         v652zUaXamIku9AqLVde0yWjvOK+hE8oUSs9RmDMLpuJoZI+uByQyGnfaK8m203lbNC8
         kqjdzmF50KKf7iyi+6T2KatiPqDpapEWUoYgofscUJi/jsZ0Gn2XeRV8apCfPbHBilzQ
         u6GBrkV8iVzUfyh0qR6zCed12i/0ZEI/AP7narNwm+wmB6wp211diftU6j7kkkfSy70R
         cbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737716501; x=1738321301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DUwlmDmwejBJP87JAahqezz2ee8z+ZzwE8A5wOy/g6U=;
        b=mC1L4C79Ag1VKJpB6tyKP/7ZWd1a8U4CvKORKqywPsHV2WAvbCWdTEhLmA+Eb1edrv
         SfxqA03Mu58blMeWK1BSjbCy/QP29yp1EiGShJHJeDfHAypZXG9+fYebR1guwmYvU32h
         OdCHiiiI/7/Q/Z+AGOot6au4nqHFVPWsnFp9Pw+tq9NwuExLH3Z9NQvI3JFovDHSLP8E
         v4rAD/1JDbC5n9eWvUyqFrWivwH7K/6FwB/DX/6fQLYNvCgyJtGxVQN3+QHFvYP1rqGX
         qFaGzrggkzRxeeAIXZgoQ2SgsIO16Lyo8IcxIKrakFwUC5IfNigRIn8TT75UeKtJ5IrB
         657g==
X-Forwarded-Encrypted: i=1; AJvYcCWjd4I+BSE+TQwWCTgjVXEwuqQlKsBNS9veq+NsWtO76xJJ1jVHk4cSgtfSTeZf3/D9xQKFrsyYBfXIvQh3@lists.linux.dev
X-Gm-Message-State: AOJu0YxJM7u7pn6LpK8Sf2iqEgJmty2YoJOjdMmYaQORixQT4Cjq3fQo
	VkDdE0x1Zhv2pwSGltzSdbl3rfpBtyW3Wkn/ZzldG4+fl+7X1g/KJkdGgM3s
X-Gm-Gg: ASbGncsEQjAoze0i1MW3FbMEzXEXEvfKBRBmwmVfUsfnfZSkpzoT2dBc3ltr38YAgRh
	n+IrhxP9zWqNXgrELHsrl3SUN8A9xV3JyJZCfAtC1965qGKiclqlvMCuqCRaMfiJrN2q/M8/V5C
	HEo+FEDxVzXGB45Jmh9tV1S0f3qQEpByum4etJMc1u7VVjXjfT4xG7D3X0s1jFDyOdGI0UwZPf1
	d/ChlF9W5oh8YbG19EW+Xjmx16Tklkr4lZSztZpbmsVwJ2WBDlo2HnvQIaK+zYCAmCH2Pk2jXG3
	0YAiN6VxEFNTBZptDHS6FZ1CQNean7sumBc0EBhm
X-Google-Smtp-Source: AGHT+IE9HjoOhHt5dU524zom0XeW2iea2WF+cfMiT3gB1zuR7gXmKLV0E20Ce0xTbggBwNkPeRkazg==
X-Received: by 2002:a05:600c:1e0b:b0:434:ea21:e14f with SMTP id 5b1f17b1804b1-438913ed04amr268997355e9.13.1737716500651;
        Fri, 24 Jan 2025 03:01:40 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd501f1esm22101185e9.12.2025.01.24.03.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:01:39 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 3/3] staging: gpib: Remove depends on BROKEN
Date: Fri, 24 Jan 2025 11:59:00 +0100
Message-ID: <20250124105900.27592-4-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250124105900.27592-1-dpenkler@gmail.com>
References: <20250124105900.27592-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The build of drivers/staging/gpib/hp_82341 driver was failing
with:

ERROR: modpost: "isapnp_read_byte"
[drivers/staging/gpib/hp_82341/hp_82341.ko] undefined!

The driver was marked BROKEN to fix this issue
Link: https://lore.kernel.org/all/2024101412-outsider-icing-052e@gregkh/

Remove the dependency on BROKEN

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 81510db3072e..2bf11df122e2 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -169,7 +169,6 @@ config GPIB_HP82341
        tristate "HP82341x"
        select GPIB_COMMON
        select GPIB_TMS9914
-       depends on BROKEN
        depends on ISA_BUS || EISA
        help
          GPIB driver for HP82341 A/B/C/D boards
-- 
2.47.1

