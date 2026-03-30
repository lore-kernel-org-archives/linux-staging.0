Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3733A1E66
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774856179; cv=none; b=HDP2r5Rc7Lk2zQA/DurnRk29enq0wc/WmdfBLi0s3EfLfiBVZQ9kYIbzX8Vb79Ax11dQpjw8MttDvdYLhU49jT9mljSJWnbtA//1toZM03sMUz/7YfuDXyEOH4/5rpyeMmJr9Qix7JorkAb9gtHUpd7I8uOJF1T+KvUQbOYayRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774856179; c=relaxed/simple;
	bh=LAaNo5RL+flgMVL1YHSP0zlU4TE9e7ImpSJmnKfKBr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VwTe+TyNmGnuBSUzEalyCRBpQOKB1V8n62sxZuYHdjjvgptZo5iIvDu0Ra/zasRqoxc31mLd//8+SKYKu1x2BT1TzB1vKdk+1VcpXVgSJ4zZJGr4CnTCGaYS4WCc+VKoyN782G0MreuaxhV1zrz+FPkTt2fGdHzfpjcNT8chVDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5HjzQIq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5HjzQIq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso49284995e9.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 00:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774856175; x=1775460975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6PDT/N7LbYtJJDcDJelx2xg8NXIfygevP3dIW+DnC4=;
        b=a5HjzQIqFu3n7uuW0StOFPhWxkce5mm+0gLGsc9h/Qpdx8U2iAj4dO2QkKU+Ys6ZjL
         chtWJzhmqyHIPXkeOZ7zDuJ+RHaOVfkJqGYIltx3yqG2ByFPlVlTF5oi8OBXp7M4iR4Q
         OPZGibUz06JMD0WmpDIWJwydBeeUKmVkSBSsaxrpsdjq0MJT7x3ByDFEmbXMnqov6a6s
         c1vHO3dU7OUjRFKU6h6kOijgaA6wadfKedP0vkwVfEobW7wBDm6dQdwcL6yxh0RRuCvI
         JF2uOxj//5Jb06mVh4/NmJi6sEavVEsWTXYMbDdyD4L9e2hGk3gTKXjxe9mpHsEx8ku2
         6JNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774856175; x=1775460975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c6PDT/N7LbYtJJDcDJelx2xg8NXIfygevP3dIW+DnC4=;
        b=OhFIMhwspO+30F3aTqJMldx/H8x4SjF7llMYbKOVCRYnESqFW4HF9YEcFl1Fz1Vtla
         5wIA4wNNwCf2PRjYK9eDmyIeHW+xkJMCKVOInp3oz8TRV6y4osHqpJWgJEvimgbCww46
         SWMPTEcAQpPCB9lQ4utv+unZKYdND1BY1Zy6puGSfFzZ6vyYDQ+N/+0MkokLjCszspPV
         U9nXBajDje4Y6vyJVLIrmqHbsOE30/GP8sWSTxToxQgu0l7HbGgmJrhHv15MBtUCkI2p
         TyZDRiLMozoeAI5YYQoZhktrPf61n6e10dy37USFlqO3o0oIoe5HsHpFGZ93PatcEiKv
         5U5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmpaZ3xRLa1svOCOAMNurEctCoDsVuulRFizbgNj6d/NnRjlRX7ZfOR/xnQ3KkiRJX8wYYXOq9KWN28tQ9@lists.linux.dev
X-Gm-Message-State: AOJu0YzZEBLww2uG1RWb6EfObXYSJ2KVBd0AP8/Axhu4rPcst6yvJoJw
	S4qEpPK22oNu+DOQfN98j9+CP2VNO/4YKWmhunReVME0mx7Kmx7W8tfY
X-Gm-Gg: ATEYQzyK85lwOwxnezB30TCrZSW5lO4Wh9zVGtpNqlJ5tJO0Pw/I7qgMZv5xfAa5zTG
	VClsJH4iJGYQ8zwK5YRq3PH90Vx+1cxEgXMYlTwIFg/heBvR4Chpii+IvoJvU9jnkYBD0m1QNjx
	sYKoZXB2EqNYV0LDdCtiHJ0aT1s82pZh0Qi8ajMkFogItWl3WiicuAXBvBiMhmutyMFPFeCEqWL
	Zg4hhbouTQQTFTRKjlCCX+Y9jTV3OROpltC0MW91g8UtHneJs3HbY0KOS23Ibw5fMXFR6961K+h
	qcwk2Sf1wknviYLM7UgQnmuNfzS1uPr4dxidosdhk2LrmQNNWORMCQWNHE4IQZGvUjAL8IhO8QH
	WB/y2INe3gxYoBbjOQIvUCIrMN0Wakc+eq5GbFZDSFKbFLO3ySprfBA2GpFc7UqMfxuv6FumHFQ
	ezf4K/BxguL/nteNymoWHeyL82PO2cW2va9hoom8a9F2Okn0DBRb0d1UsXAj+wtA==
X-Received: by 2002:a05:600c:4f53:b0:485:481c:e7bb with SMTP id 5b1f17b1804b1-48727ee9b89mr188413445e9.20.1774856175429;
        Mon, 30 Mar 2026 00:36:15 -0700 (PDT)
Received: from DESKTOP-IHE0QGF.localdomain ([86.121.12.60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722be608bsm389407255e9.0.2026.03.30.00.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 00:36:15 -0700 (PDT)
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
Subject: [PATCH v4 4/4] staging: media: atomisp: remove redundant blank lines
Date: Mon, 30 Mar 2026 10:35:49 +0300
Message-ID: <20260330073549.5782-5-robyserbanpascu06@gmail.com>
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

Remove multiple consecutive blank lines to improve code readability
and follow kernel style guidelines.

Signed-off-by: Serban-Pascu Robert <robyserbanpascu06@gmail.com>
---
 drivers/staging/media/atomisp/pci/system_global.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/system_global.h b/drivers/staging/media/atomisp/pci/system_global.h
index c65a5be8445a..d417230faff2 100644
--- a/drivers/staging/media/atomisp/pci/system_global.h
+++ b/drivers/staging/media/atomisp/pci/system_global.h
@@ -218,7 +218,6 @@ typedef enum {
 #define	N_ACQUISITION_UNIT_ID		1
 #define	N_CTRL_UNIT_ID			1
 
-
 enum ia_css_isp_memories {
 	IA_CSS_ISP_PMEM0 = 0,
 	IA_CSS_ISP_DMEM0,
@@ -248,7 +247,6 @@ typedef enum {
 	N_ISYS_IRQ_ID
 } isys_irq_ID_t;
 
-
 /*
  * Input-buffer Controller.
  */
-- 
2.43.0

