Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2675F3A169A
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 07:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856175; cv=none; b=CJl7TmbDJEhRs3d0cQvvkLgWkbCIU75tLtk4aY/h8GUXyQsWZE++QHGNGWyEzXzNtyUIg2Aumy+xbaKlB5npZCpFaSx2FbPFPbLLeOjoRJQV45OZeIUSkBMkUAD8KCqoHOk3WDIjJgfUlWpPPOwOemNeZqNKHwhYYvdGs7k3J8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856175; c=relaxed/simple;
	bh=6waufSmesp2JgfF19DKXBQuLDjcjbl+OJb3oAYIjJSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbskaaPGOO202n6dilbvEtzVOeVfjPEipMkbFQd11eCIkdXKV18WyJEBhdonUVV91X3Ev91n7W6xlAj77vXBBRw+22ZP5xSVBDaidJeBFbOK884W4aXyQSvnfLRba5IcRj3fLBUyfd5uqZD5HmuF4XN6sQ151sUJsvMH3AWiojw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J4uRzaQM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J4uRzaQM"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso40376595e9.2
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 00:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856171; x=1775460971; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12hnKdjz6/Mr8B3it9Q0v2b6LVUl8V91nVrdlKXH76o=;
        b=J4uRzaQMSW+b0bZLTgbYXeEn+ITa2W3DyOsGcpZp8Iu4uLjaCaIz/IhoJ5QPTeLkRv
         iEVtyG3xXcE9z5eHEs87G3bTkl7vOUmtFN8nSEsKNu6kWr7xQEoylzQ7b8CBVEFkuYC7
         zz2eZ91Rom4IZieHArOPQdrebIDPdb8puu0nk7jjISMVSfpLkb2lTgsVB9WQogKTNTmI
         VFfqaMISK18Cl9Y70xb1zlLP/JwyX8E6234I+lPk0dVL0M/gJ7b2IBxAi81LOYxB999c
         USUkw7vtX0YfYrw9YNHg1Xs3e1i/KSQ1kl7BXqgYxyAAv5TRIm28xjU1nOsxftZu03ck
         g5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856171; x=1775460971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12hnKdjz6/Mr8B3it9Q0v2b6LVUl8V91nVrdlKXH76o=;
        b=M7FB/TdCR+QPiJQPbOi4G1DNCUhkXJwjnccZVaUsgCiwNwIbws6dPF8cqiJqU9aD3V
         /yIlWC3Q22k12ZYHit9KdeQaSwZAkIbSgrKpTwnMLuxA+9XYcEHNOILIX+upQuHep0AI
         9kw1+qC/7UqogJdOVKUc+o2RcXjqmvXJxk2Zq23vILwtfIM6nILn3OL82Q+zsuJn/npo
         w306NY1QheBFTdnasPO2KrtlnEP96EUPykzPtl3yD4Jv21seA51AW3mTGW+ZZMwep7I8
         oAFKMhOQEZ6FXuY/6JBtZAh8QvMCSeFnotkQm3ulz+AAdPNfw+YdkUKED4OFTFdpx/V9
         BeqA==
X-Forwarded-Encrypted: i=1; AJvYcCV9lZ0fNt1hCFu7K/Ewp7IFhCU6JXJbm4u+jtdHL5ejm+bikPJfsqvz3kQcxILdeGtMrm64uBBKHp7P120I@lists.linux.dev
X-Gm-Message-State: AOJu0YxBz6GKz1WEdRI9MTWAvEuJmJF76Jj08J3BVRzL+XxRuVh5yQX+
	OvNe9AUIaHd/IyT6x9kELFYBTH3Yc68ofBU5NBd7xM4IGn9ivt5h80G9
X-Gm-Gg: ATEYQzzhbJn1QWaNQ+SByjyK0WT/tcz4C7/djxcl97RooPbU+17oZbddRuGnDUVT6od
	721yc6u1+J5Yl60xHha/9/jHxXPKo4W+Ydiii1NqcVnBmND9PTRAKOiFOqB6svSYRYbI6UMgn2S
	O1WYTULOqPCa+B/LM74FodWxPZU+PamRFQGVS0HPIvDxuVJCfYMyMBadI94aWdMgriBcEJ0c1uX
	1VfREr7bdJIu3GdSx8SNptQZiXuvxpyB0xbdcFWUPrnsh+3RG7hvIryRXnaXi0cb08BqhK17CCs
	H/+FrZ6kJ539phpJ704iKTFo9Pkj0ZAAA5Rm9+pyhrJSY9902C/kRnmK6qYdeinhT5NOSdtKqei
	22jM7tHHZEaORWdOh6cEm1UeWnyEFiKjqagU89VPAqXxHgdbWgQ6dPOC9kQtvRtWIainf9DUBk0
	S2M8OOYCBynxAsdmi4/tHyphNRTZuIpToVf6YGmXOOwLfPqpjCEv0=
X-Received: by 2002:a05:600c:1393:b0:487:288:1199 with SMTP id 5b1f17b1804b1-48727ef16c5mr199023885e9.28.1774856171307;
        Mon, 30 Mar 2026 00:36:11 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:10 -0700 (PDT)
From: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	d-gole@ti.com,
	m-chadhry@ti.com,
	Serban-Pascu Robert <robyserbanpascu06@gmail.com>
Subject: [PATCH v4 1/4] staging: media: atomisp: fix SPDX license identifier style
Date: Mon, 30 Mar 2026 10:35:46 +0300
Message-ID: <20260330073549.5782-2-robyserbanpascu06@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
References: <20260330073549.5782-1-robyserbanpascu06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the C-style block comment for the SPDX license identifier in the
header file as per Linux kernel coding standards.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index e8a29f73d67a..c99fb649fb5f 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -1,5 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-// SPDX-License-Identifier: GPL-2.0-or-later
+/* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
  *    (c) 2020 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
  */
-- 
2.43.0

