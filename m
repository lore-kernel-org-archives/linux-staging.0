Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B3165F13
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 22:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724883946; cv=none; b=dNiSG/r6/CACsJjrCzFhVmyCCesS0566/a+RCph7OPROGV44HPv8R+ky/A3gRDyjS7URA56Cmj7ioLaoGgJN3wVRv7jS88/AKcpyQm/ZWpxUlk4GeyUG+7dsRe4Z+EjAFrIrZFkxCsZ1L2N2r38ibk50uRVJCm+o48J3s8j1PCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724883946; c=relaxed/simple;
	bh=NxBXD1LHMPtJRJVa9FufP+3VCVPwh7yiyPstEVnPyhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fer2Rm3u8HknetKYAJwvVJOl5nOmp8j2D7LfipENJhoIwnzmi5LiY82wNAo+i0/Fxe4Lhzes8ZPUDtrPU1MXK9LAO/1sSDCcs/rjFsxMjZxCE5bBDsZK6lM4zXJA4BTicSYnY2ktSVLafADJqcbF7SVAZ7HO4g/chikJdXhgOIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYjwQAgn; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYjwQAgn"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d3c5f769d6so4861878a91.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 15:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724883944; x=1725488744; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E4KuWpHNVVOIDuI2uNCaQcrmkzfLb+gZ5UqSaZNidUc=;
        b=RYjwQAgnyAwecLjeBvWl7amrfNai19B8ayHZ004nAyUtp3W+3Zdlz0PRh8M/m7RwIY
         YwSXYPD/764W1P/Y5zDqWO00PEuOD8DWJATBGRdmlfDkfDoxGS1KaJnomg+jbDimZaqA
         pEzwpsTERqGLtHNhqt0yMtbcKJkok7mbvK91G07GsHaK1gd5CxXLy18bW5ruQyPKHxZR
         vumnptzUKR1HCPP5sEo6Iyh0dh9ahnALT7LLB2lu55jjpuAHsfqFjpEUIEe+Iv6jqfTK
         ZBI24nwpWucBQVq/wgcTUK5qcL35ZMXgcppn+HH0Rnu5NxskirONpKVqkyoyfoMPnxIQ
         ec8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724883944; x=1725488744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E4KuWpHNVVOIDuI2uNCaQcrmkzfLb+gZ5UqSaZNidUc=;
        b=ONbGddlqBQiuRMR6GFc6Ju8QkhXPFkS0mZgMvJTrR631dRBX0inCgEI6cKureSmcDm
         aW++zcdB74nMqBGfYmpN6Z1V2Jv9FVhiL29E9d8BY2ZGhsPv7R7HC+BCQbfCxrLGXb5n
         Ybqq4xJvx0+eOJ2NtL7ezqhQ7xxVQTZNqGlbe0kSAEJRqI+KV3XT/LIDbziLRUACk0/9
         XSXkWqPAV3nRFCERpJsDHbwl3dkvbVqbQqIjSwSRs9udH62zbWoCxxk+8yvMWbeSj+41
         bAiI5wuBVukNtNK386H5PgwKUQ7F/IuipckcnIywxQW0z+zmDO0Elp7yKK3ZgC7qRzzd
         R3zg==
X-Forwarded-Encrypted: i=1; AJvYcCWW96x+8xF2CGP+XCWbWBvaOHHiFUgX8NYoOF7PBV2Xy9ImkWtp3yGKr8Pn8+P9FITna1dP4Fz6+AGMsbIv@lists.linux.dev
X-Gm-Message-State: AOJu0YxV9j3tnaZEkfGnIZ8Sn82Xod0QwjLONUT3rX7hLZ2luylrKDVO
	TIbx0cUoqJDf3VSvUPWbtyvhTdgMWKOXLR0o3+K+u8FjMnJsM1Ul
X-Google-Smtp-Source: AGHT+IFhfDQK9LKNi8Kkw8kWblPJLQsH+F/3qt3zGSOshQUrm3TWKHb1BUm98BHh249k1FpbQY6ZUg==
X-Received: by 2002:a17:90b:286:b0:2c7:f3de:27ef with SMTP id 98e67ed59e1d1-2d856503bd3mr737949a91.42.1724883944584;
        Wed, 28 Aug 2024 15:25:44 -0700 (PDT)
Received: from masingh-thinkpad.. ([49.207.54.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8446f3897sm2460744a91.49.2024.08.28.15.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 15:25:44 -0700 (PDT)
From: Manisha Singh <masingh.linux@gmail.com>
To: florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: philipp.g.hortmann@gmail.com,
	Manisha Singh <masingh.linux@gmail.com>
Subject: [PATCH v3 2/2] staging: rtl8712: Calculate size from pointer
Date: Thu, 29 Aug 2024 03:51:55 +0530
Message-ID: <20240828222153.68062-4-masingh.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828222153.68062-2-masingh.linux@gmail.com>
References: <20240828222153.68062-2-masingh.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calculate the size from the pointer instead of struct to adhere to kernel
coding style.

Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
---
Changes since v2:
        commit message updated.

Changes since v1:
        Broke the patch into 2 different fixes.

 drivers/staging/rtl8712/rtl871x_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
index 378da0aa7f55..20e080e284dd 100644
--- a/drivers/staging/rtl8712/rtl871x_io.c
+++ b/drivers/staging/rtl8712/rtl871x_io.c
@@ -48,7 +48,7 @@ static uint _init_intf_hdl(struct _adapter *padapter,
 	set_intf_funs = &(r8712_usb_set_intf_funs);
 	set_intf_ops = &r8712_usb_set_intf_ops;
 	init_intf_priv = &r8712_usb_init_intf_priv;
-	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
+	pintf_priv = kmalloc(sizeof(*pintf_priv), GFP_ATOMIC);
 	pintf_hdl->pintfpriv = pintf_priv;
 	if (!pintf_priv)
 		goto _init_intf_hdl_fail;
-- 
2.43.0

