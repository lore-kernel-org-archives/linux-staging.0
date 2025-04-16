Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C8B24C072
	for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 20:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836143; cv=none; b=JulEl7Ivk34ANvH+P6DFiPybZXgFB8yjm3WElfvehTJEmTz/+P9NPUJh+LkosaeP8ahR2CwcOT6TVEOQAI9rllpcwArj3bRl/h3nEzV7FiWURMxb7ChBHUaXk8DvqjrQczvLG0G+vY4rXjTzfGz7xPUTcUtySc2u3HUTA77SN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836143; c=relaxed/simple;
	bh=vpnZ+9dRThyOfcFKpNcoiQtRcM2q8nmnRlwHdTw3Zrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoD+C9npNgglCDZxOPqlv+LxuW4AQb3hsobtP2nvyWIQtc7eBD73bE29VTrlErkgTj2h3x8vWUA/ADE2+1RxBkovvQtdzKqTsryHkoTC9NhXuwGVDqNoHZJHy7lDMn4C6ExjyIj3Xv3fB5hCOGOgDKWfQ/BF4kM4E63SWYCSRAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OllhQXk9; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OllhQXk9"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7399a2dc13fso26191b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 13:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836141; x=1745440941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H+0BcBKraYAKcBr0ytrcRqedIgRXL4U/FszO6yDuzCw=;
        b=OllhQXk9Ejx1G/LMQt3IMDmyHuTgy69+55D3RyW40h1maW2iMYBJ3oe0qFHJ8L5p2U
         P1jPjxmJE3UEk5rhIu72UMUOamEAi1wl1xnVjVeb2/yPlsSDxI/1FwqnBCb2wqsmjVW8
         yhcImIlxsOLfW0CpjAMEjQ2nSSbxT77mRHMAWJ8kq9xO6+cXelSunR84uefcx8Op4dQF
         2eA0RFy5Y9xfiO+2mYI+p+K6SoajWkX2d9Q0KktTc89f8pt8zNQBbq8s9TZgsoPNjYYr
         9RpIuI+du1lRJhLtrLmG9DmY3hjG0oBMa7o2fN4Ne+60TrpDbLQACq2MEsnudjZgCCY6
         g2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836141; x=1745440941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+0BcBKraYAKcBr0ytrcRqedIgRXL4U/FszO6yDuzCw=;
        b=LuK9qLi5aIUHvthPNqGVqT2wtUg4EGSReUI8I+ULqUnOhPcL66j3HUZgxP721xdAD7
         usRd39nSABi2tadzX3ih8WO/OcWmL9bdeBP5LTemXHursf7cwCgbR4fGG98Sg++LYKYf
         ygqZHU3Gm3u6MWpCwQ5jV77i1cwxQjWMbkO/Kos6XMcYV7rHCW309qZDmWT9Tj3UdaYe
         CTZueooZe8M6OTaCNevRj8bgL0yLNewsF534VCBmTjd1Q2yrpwTHIokmkwzCU2E5bEJX
         zCeoxQL3AYzCJHnD8M+sPm9mYvGPt4KngX+gHA9PtFrSlI/Qk32YiNwf8D1BneuK9HXG
         eB+g==
X-Gm-Message-State: AOJu0YwFrD7EJYIGZV+Q4Vyw4EphMdF4JzQS42TPa/3u4UHTDEYiwEoE
	UB5s008s/9xq8MERO/neZj0wZVUWtTuLbzj0U326QAnGdNPC3McQRRbPv4S76Q==
X-Gm-Gg: ASbGncsb73ZntQX0jzc8Fe2NN+upQyVeTxmcXlnGnnRuxRirs4tZAJcDv/8MsS/5sD5
	MdAwmHib+eS/XlzpE+PujSxGSxi0WRsCW/FNCmhkhmw5Y/BeEMLFtXxMuMrw3j2+eCZakMw96cK
	71frYho+8SHBXOC/IK6cURX5sG6iwfEoUiQMXJog12rNGflbjmLUsTpvzLoFwYzFpqI27WU+OdX
	l+SwMnc7d/CmyE2rR7FmEM1ivHS9+ARRRde9WIjfc8E8nq6COw6Y8RVnS39O4BxL7s1ASfNyh5i
	1qCd+mM1GfQImEqNnZaD2Lq1N/TMDOAfyNUDJvg+aoDKpnglfXKdBAgrlxXu1WgW7hhdFJJY8Zq
	ALtSJ1w==
X-Google-Smtp-Source: AGHT+IGVHaELi/ymBqdRjMjhCHOzlwZfRpH38TtbAdlJ/JymhlbtOLQHLDNlAtUP22sRedK9eA2XLw==
X-Received: by 2002:a05:6a21:9209:b0:1f5:5b2a:f629 with SMTP id adf61e73a8af0-203b3fd5e27mr5244835637.30.1744836141677;
        Wed, 16 Apr 2025 13:42:21 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c3870sm10767839b3a.48.2025.04.16.13.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:21 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 12/18] staging: gpib: gpibP: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:58 +0000
Message-ID: <20250416204204.8009-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpibP.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 3e21bb1a4297..bb3c4fd5ea03 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -18,9 +18,9 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
-void gpib_unregister_driver(gpib_interface_t *interface);
-struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsigned int vendor_id,
+int gpib_register_driver(struct gpib_interface *interface, struct module *mod);
+void gpib_unregister_driver(struct gpib_interface *interface);
+struct pci_dev *gpib_pci_get_device(const gpib_board_config_t *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
 struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, unsigned int ss_vendor,
-- 
2.43.0

