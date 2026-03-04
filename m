Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52785372EE5
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632759; cv=none; b=DEQ5yLZANvW4AZyavixhPCI5zrgOtKXBCTQhNgZ+BnWeIrtGPHC5WXUhaN84N5XLm20N2LuUO9fZnFyjdIzAd2q41DY9+X5ZW10B09kWJFrXocQZx9N+qKis5fCu0ike2juMes7JswcKFb4ta5wpax3Bw/nK/VRJLqqiFuDr0R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632759; c=relaxed/simple;
	bh=1wLA/wnv72k/Xp0qCP/crIkRfqcedxUtu12ubeMyM4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n408DPuyQoRhm1Yexuxk+pF/E0J9lOFQsZN+P0O+CaoX916wxdI659/Qz50kDIhHZS2JqN6p6PHdw5JLqtszCEocU7Ea8HJnyg8NdSOAfC+I50NWE7TVmuUO3eE2Koy3xES5c9ONemajAWbRJ2broFxhV1kHCfnJVsqFvumEb+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlDP0zNV; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlDP0zNV"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65c5a7785b4so10125095a12.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 05:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772632757; x=1773237557; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/voxa8iKSk8LIZwTp4XyTgFjfn78/xRQyRzQxigAbvo=;
        b=GlDP0zNVFPnrrat2AeNIn0o/RDbZ8cJGpiW6r16jxj1w6lJFDGbPXqP8qHBmr8IRqU
         Dt3aOiODcnnsXVGPUi5NTB9qaqxSkBR32jrJM+f9VouDnCqT0HCY7B3PqjYg0disbWoL
         3D1GKqbZuO9XAFH70IU2fRKLEt/e/M11A8sA/0PR/MJ3d2f9WxkkxMj5N3EgCPvGG9Vf
         rQr+jSufKt02T0tPCJsSIZHpQyEoIs5slmSJhXmtuV/RbbCvjFjPvYu0nKWalygd3FKi
         lePzd9KWdO2oAbwz47s7r27TuD7ipkOpHIwRIs0F9nHcLtEHeW3QM7yI6WYlgVcFRR5g
         wo0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772632757; x=1773237557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/voxa8iKSk8LIZwTp4XyTgFjfn78/xRQyRzQxigAbvo=;
        b=WDHvAR2fUAd/BYBXsfIgeWjECNaAsgmaAAABOCnub75Bz9+AmQwybrjWUzOGo2L6YV
         qQzyaeBHrKOi8DAbGggNgNTKpuJMOgZ0xDx318RZE1Izb8nOBOsd/Nu3wOMD1I43zelV
         KMgWlXETF5LAhGvQqejxev+n3E1fvz+mM/hoC0nDTaJt1rTYMYEe4tLUT25nq8RniRUP
         rjhKbu5BdhLacD7PhZ4GVdROUEJz8KSlU/NpMGxQJdqfj+YD3aBA3hGLICE4q3Px3y5A
         LrqIq/+dxWxw2FnsbZ4+SJJ/4GBuhZ9r3nsU+hJ5jHC/vdDMlZ3KDIHFRPnP/gd0c7fN
         SLWw==
X-Gm-Message-State: AOJu0YzdNgvLpf3uDNMCiwyLgjWETM1S5wT+E0MgQJLeuNkNQ4xLmkjF
	MNg1Lm5I38lcN0adr2l5GDoZWR2pd74HPwhhvQXD4dCfdoigIzzP/jOPqEnP4qJF4gvIig==
X-Gm-Gg: ATEYQzxO5+6x0GUuvYL2Ntq5frY8U5ARsFoRG5s8UzTHX0hvlT51P1iz2wlovU9e6ao
	2qF72/hjffCh0R96OxXeqbNTybDesXijX4KjIJzYqBjqMC6T0T397bZRfyiPQZBEPIh8c6dluZ/
	futMygkfBpKAtAUXQLg5wL4Vw78kp55tp8TnuERqWBO4D3WpWRNd3hT8SG2JGi0fVbBPqa/Vl5n
	LwS1jtkaT2uNzMF1NQ9NxObDyHq4FPyJ6RRmXiCLN2BFwnc7dXg/Drg6iVUtJHxOpkmTaTP2KXH
	00wbhTpv6/nU87v/3Y6X94tyiNjeVSmMd0xeiK/D7Hd8iCZAqOLiZECEh9NzVLk9CgP/sH0lsQ8
	/VHU26I/IImsUJuRwaCTl/VytNwqnG7KVMqF+ORUvFn9ZdVc4L3oYxG8UpOWdJSPk6pKRZFmX0Z
	cWUHpSkIQ1JMmt3siDvCFgGEd+KPr5+J8F7K4saMtSE5ePqfzoWhivgD2QvInOu+prRS79rY/Xh
	F9uojNa7/yIW1jlhjFPSwUwj9Przf9ktm9/MRc52VB6Y2E42QNsYhX1KWVQDIw4L7N2Gzk79vUx
	1fyEzOvm6b95Lfn/
X-Received: by 2002:a17:906:7953:b0:b93:335f:18d5 with SMTP id a640c23a62f3a-b93f14356demr118276266b.36.1772632756362;
        Wed, 04 Mar 2026 05:59:16 -0800 (PST)
Received: from DESKTOP-JNMGKT5.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae94441sm740933866b.50.2026.03.04.05.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:59:15 -0800 (PST)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v4] staging: rtl8723bs: replace alloc+memcpy with kmemdup
Date: Wed,  4 Mar 2026 14:59:14 +0100
Message-ID: <20260304135914.38286-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304130706.37347-1-hossu.alexandru@gmail.com>
References: <20260304130706.37347-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded alloc+memcpy patterns with kmemdup().

This simplifies the code and avoids manual size/copy handling.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>

v4:
  - Drop unrelated DT binding changes from earlier attempts.
  - Include both rtl8723bs changes in one staging-only patch.
  - Wrap long line reported by checkpatch.

---
 drivers/staging/rtl8723bs/hal/sdio_ops.c          | 3 +--
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index c9cb20c61..6e03d3d8a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -583,11 +583,10 @@ s32 sdio_local_write(
 	)
 		return sd_cmd52_write(intfhdl, addr, cnt, buf);
 
-	tmpbuf = kmalloc(cnt, GFP_ATOMIC);
+	tmpbuf = kmemdup(buf, cnt, GFP_ATOMIC);
 	if (!tmpbuf)
 		return -ENOMEM;
 
-	memcpy(tmpbuf, buf, cnt);
 
 	err = sd_write(intfhdl, addr, cnt, tmpbuf);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 7cb0c6f22..0ae7b6389 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1430,13 +1430,12 @@ static int rtw_cfg80211_set_wpa_ie(struct adapter *padapter, u8 *pie, size_t iel
 		goto exit;
 	}
 
-	buf = kzalloc(ielen, GFP_KERNEL);
+	buf = kmemdup(pie, ielen, GFP_KERNEL);
 	if (!buf) {
 		ret =  -ENOMEM;
 		goto exit;
 	}
 
-	memcpy(buf, pie, ielen);
 
 	if (ielen < RSN_HEADER_LEN) {
 		ret  = -1;
-- 
2.43.0

