Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F91B013A
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724878010; cv=none; b=F1zMgA6Is7MS9iA8krvMY8XEXhSrtWOhWx69IGKdShkqEuB+y8PNG8W2y43gof4uGxQeaTlVJ12uu9pU+yT+R1yeVLoC61bDHFVUOin2Mqbaft+nlfFRleRc8+Od40jJXUGXglV4xYymRcz0qDSF4Lo5IfB96fq8mG+TiBSNFbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724878010; c=relaxed/simple;
	bh=HrxIsLX1t8fqUKStXlSKad6YGkhD4DzNg9xJcaB84l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5PJMhJbMBd38nqMqpu0pt3foi6NN/hkbhY+pg7CzquGpFrvZSLhhJoNw5SMrX9RNk/ceLM+LF7fesvYgznH/DLbAZju9R0NP8E1WY34YiRLMx1rOep8uuNrmN3eq6mWToGrFNKMDFbfhQvkKeM16g7G+FCoPy5HgaFo78aqw+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPjOjCHR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPjOjCHR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20227ba378eso65737695ad.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724878008; x=1725482808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLjai+LBEjlJGkvV4zgGzDy9TLZP9iYjURA2R/8vQGU=;
        b=RPjOjCHRu6a1oNW3IZHyrqnxD7u4hGhMx1BZbeOVgyAcrwbXBX+XqsP4oMldcsSTn+
         HJy530iFx0vgn1YV6eIEYdcEzJe7osCnLxFhWSWYY+Z1UApk4RMb+dNGpOP8dy13YLNR
         TPyi2d4Jck4lzmUKsMn0Rcle7o4rscJ7DO74P9ynldIpNN8PI/ve0POrf4Pa8Lu4Rrvl
         5hIRLBAr0y49GWBI3cqcbGMBuNlyfBJZnakM8GzvP5dOH2ntDfwU4CjPNq61+TcIJbYc
         76GTRC6OB2xfiN3yWPx0aBawntJ4H23dsJ51YPdAXLp8xYOVg4Kq2aefW5PHb9DoiOVx
         ALOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724878008; x=1725482808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLjai+LBEjlJGkvV4zgGzDy9TLZP9iYjURA2R/8vQGU=;
        b=MBNYw9c3UpKmV87v3ge6jqCeMQPoI4A2vXTD1BRM1gavO2Re1YDFIsiuWcQw5eFByl
         v7VV+R832h21msWhecGJCs+j03EjeAHZZ3c3s/yvsDDf7LozBgayDz+7tsEpMFrzyN7D
         0i7kacM9cUsOtiRZn9EnDNIrPJzQm/qb/dcoyoLcDGxcp4HvYM+Py+diMv02eZ9jxe6+
         laEfhllNg7pUDO7kuThR9qnNVECXoPkc3+L5asMZvBFlpadL+4+/N1wdlNJ9J+spllM2
         xsYA+Q8FS/UrToWONjkYoCbL1NP8eYhYF2gW7fNgKhd5rGUEcFKo8mfdHOM4/6Mit0ue
         D40A==
X-Forwarded-Encrypted: i=1; AJvYcCUsnzIFDaB81Hy3mB5VK/sSf9GGvaputl1thl986KteO0RH7VnqRpkbI6wzzYBnF+CIbgojA0tZni+xoaDm@lists.linux.dev
X-Gm-Message-State: AOJu0YyvdGVMBMcDTh1TGCaJvkOKaye7EswOsALrFHN0oW3FUZsj+5ap
	RGpOa8rgcbCFXa0y4h0oNATCiWB8Itkfb0mWBAwyTpg2Z3bFlp9+dLtGDWbu
X-Google-Smtp-Source: AGHT+IFa/o5P0sWqycj/85Ak8c7rm3mlx92GxwtrAUqvBzQi66wBS6D1TrAdoAQ8/Dc/n/6TaNpXWA==
X-Received: by 2002:a17:902:fb83:b0:201:e65b:500b with SMTP id d9443c01a7336-2050c497d69mr6929785ad.63.1724878007774;
        Wed, 28 Aug 2024 13:46:47 -0700 (PDT)
Received: from masingh-thinkpad.. ([49.207.54.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556667bsm103351525ad.7.2024.08.28.13.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:46:47 -0700 (PDT)
From: Manisha Singh <masingh.linux@gmail.com>
To: florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: philipp.g.hortmann@gmail.com,
	Manisha Singh <masingh.linux@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8712: Calculate size from pointer
Date: Thu, 29 Aug 2024 02:15:54 +0530
Message-ID: <20240828204552.26790-4-masingh.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828204552.26790-2-masingh.linux@gmail.com>
References: <20240828204552.26790-2-masingh.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Calculate the size from the pointer instead of struct

CHECK: Prefer kmalloc(sizeof(*pintf_hdl->pintfpriv)...) over
kmalloc(sizeof(struct intf_priv)...)

Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
index 6311ac15c581..8ad4647dad2f 100644
--- a/drivers/staging/rtl8712/rtl871x_io.c
+++ b/drivers/staging/rtl8712/rtl871x_io.c
@@ -48,7 +48,7 @@ static uint _init_intf_hdl(struct _adapter *padapter,
 	set_intf_funs = &(r8712_usb_set_intf_funs);
 	set_intf_ops = &r8712_usb_set_intf_ops;
 	init_intf_priv = &r8712_usb_init_intf_priv;
-	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
+	pintf_priv = kmalloc(sizeof(*pintf_priv), GFP_ATOMIC);
 	if (!pintf_priv)
 		goto _init_intf_hdl_fail;
 	pintf_hdl->pintfpriv = pintf_priv;
-- 
2.43.0

