Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389C51581F8;
	Wed,  2 Apr 2025 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614230; cv=none; b=hbPPhmqHrmQ4viEVRH/LcQyD5ulFkVf2JyXaYLKSlRN5woi3xa6Fbdgnird254idEv2z6DCbMfRNA9adiMGXZQgoa6Yb/BY6hbQZwA8+hxjQ0xfaFXlSPvwpIrX1T91+vLz9nJwZewfB+I7XQqlqPK3iLhk+IyrgEZOUclLkLwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614230; c=relaxed/simple;
	bh=ASy7x/f6SxcKvqgHHFXn+615GFU+RPiRQERe5vqUfYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRUgeOmv71GBNjvE4mme9ftLu3agD43l/l+9s7s+Fw2dFeztC0LCh3OyuJMEW5+H2Y7OXkUe1fy09kO8qQE4T9dD/TZFsHHoN9JYWdOaKSo40SfXfZxI8hyLoSVv5ihyPKLlN9mDwP1V8uknGQNaT/SrHZzX427+ExLO/H2u1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2hyu0b7; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2hyu0b7"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-391342fc1f6so46627f8f.1;
        Wed, 02 Apr 2025 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614227; x=1744219027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM3/jrbM+7MikuWA46DfR7ZYWcwqvfqg2BzsEh+PZgw=;
        b=a2hyu0b7YCyZeJ0KWxkLj8L7kjPyVIKuO0WgspnYMGccvMC3g6DIMhi/na2kRF8x52
         0Q2SN18Ghz+QaEhXGmRMMLEPLHVI2uM0Xa46o2kGF5oqYkhSejZk8i4pyVuD7QRCSc8e
         hzJx9SlFTnzFQncPTrhJ2bqJUbgedQkgT5KAzfa+lQsHT0O4HClmKGP2e/IywUhliCBd
         Yn+uB5w3xNmYs1a9Xg1ItKxKlzMhJznZm/uEqDEfa6sp542LW7PqwGeR2Qfa4DzNT5CA
         hGxgBtPpeafZu7ZC7uLi5khJAEt6VUNVTHaTD5dA/AFltWkx9zdKJcwJB3VXXZCn2D8Q
         GSPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614227; x=1744219027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MM3/jrbM+7MikuWA46DfR7ZYWcwqvfqg2BzsEh+PZgw=;
        b=jOT5aeBiHEjGIeG+0qN/Y30R4IVWp2pkE1XUwDECQdC/DgMydOVH+Yaw6aoxk50dKZ
         EdafLJY6AWGyjlr477dbFxHiI/dHsKgt8G1Z4svBewCldazzpRaz+HxMdxocgyO+yqKZ
         755TCB2Xr67Oq6tkJaZ0ufonphWFlrLyK0/zDxFv6B97gcnyEoRPHtNHqQfssQM5yuTw
         W23x+Fr3mI7Wd7LDCQxEcAFA0XgChvZv3YzcKWRBvYxdwJxGF93ki0w6zg2qAwTP23wg
         UCxpZhUOduMxl1xCHzCiRM1iH7Uv/9u84G5ulfjoHl6KnJJEBuuj5BN096cGwu+n/hXF
         Cycg==
X-Forwarded-Encrypted: i=1; AJvYcCUQIrzHPJhjvizSVN1T9ct85a72XwuA54Ix+VIHZlzQP9IJCim1Rj6ucDb5tSdH1bI7Zy20B1kOX9jFOV1i@lists.linux.dev, AJvYcCXhXntnaL+Ft0NUAitjEo+2MLGN8sQpnsaCgZxim6PYokRw68NLSEnZEjxEF9N5ZcuVLMEPkvd8FJyu@lists.linux.dev
X-Gm-Message-State: AOJu0YwU/3dMkNztxnM4ROhc1Pfc/jWF3XUgOjTyi2fwp/27aPkmPGRY
	SlpUVyypqGz7p3GeebL4DN+moDK4IQ3rfUFcyIXQwaYDkg7utunn
X-Gm-Gg: ASbGncvBq+vOi1qMbfnWMRRt8Kd6V47Az4vaInD1qJ/4lZO6N6UIKy5MOusKPhfEdxc
	Rh8TZrH+AubGBhOO+LuToGkbbjmGTSch9DR+0rGp9Rz5uPrMWnU2btyW6oFwNNwzhFLMld8B7Uk
	gNWE3khNbgrItbKKFNOlkxj0a+xigAVJvI2WtAa/dmEUteyqZU663gXSn003VJ/nY2qTPkMlnGd
	8qmbBp1EO6tAkkaZC/lKZ83xHqi3TjTNJbsGKNu8jsLJDqxlsQU/zpSpRl9JV4bqWz5OrXotTNQ
	Md+GDOEa/hsJ37jhaSSicDuNBr4eB52G7Ae/PEDw0A==
X-Google-Smtp-Source: AGHT+IFCOAuvL+YP/0LNaOQ59lyeIa5mHPjsHVljIMRh18gMNrw55D9gMOfYJQa3vj2VbFQrAk0H5w==
X-Received: by 2002:a05:6000:4282:b0:391:3406:b4e1 with SMTP id ffacd0b85a97d-39c120db7b4mr14776803f8f.15.1743614227333;
        Wed, 02 Apr 2025 10:17:07 -0700 (PDT)
Received: from pc.. ([197.232.62.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm26713525e9.11.2025.04.02.10.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:17:05 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: rtl8723bs: Modify struct sta_info attribute qos_option
Date: Wed,  2 Apr 2025 20:16:43 +0300
Message-ID: <c303000c4edded3c66593e62230d661cf49f7e71.1743613025.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743613025.git.karanja99erick@gmail.com>
References: <cover.1743613025.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by ensuring consistency,
replacing instances of 1/0 with true/false where boolean logic
is implied, as some definitions already use true/false.
This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 952ce6dd5af9..8f2c9c3e853c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1173,7 +1173,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	/*  check if there is WMM IE & support WWM-PS */
 	pstat->flags &= ~WLAN_STA_WME;
-	pstat->qos_option = 0;
+	pstat->qos_option = false;
 	pstat->qos_info = 0;
 	pstat->has_legacy_ac = true;
 	pstat->uapsd_vo = 0;
@@ -1189,7 +1189,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 					pstat->flags |= WLAN_STA_WME;
 
-					pstat->qos_option = 1;
+					pstat->qos_option = true;
 					pstat->qos_info = *(p+8);
 
 					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
-- 
2.43.0

