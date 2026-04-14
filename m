Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC3317155
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 10:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161376; cv=none; b=gUNNLNh2EfIueVL2tbXV/DEPwkUv6/WCCOFxkM9TEgMmb4MgdUoP6dEre27AKuQ7pQlYnJBo7FLFsUm4IZCT/NmQT1V0qKrJmbgRGnIMaa9Qol8jIHv1mQGSt8OWAR+xDKNsW0IR+LsGvt704FLExGmKgVBEYjdyfeVaay4SRgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161376; c=relaxed/simple;
	bh=UVuQEQwO9ZjOxcyAo++XxY7tWYlDW2Ukg5Q5WnLhjsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U/izHQqx0PPGw1ILq7sD6H3sRLGjI9AijnyMs8NNuD90KzliiD6Znjx9NA08y1P694HC8xwg8e3g9l7I1sRl8hUD8Uh7XaR+v8lKEjDPALCItTIyqLTKZPNDAXjLP/cIs1pRAvJysE+1cnpCq4L7fWq3iTkDQVXWXgJW9V9sTj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTjI2hRX; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTjI2hRX"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c6f1d1282so721306966b.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776161374; x=1776766174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YM29ecLh9a+Div79GBVrni0H0EBRd49ZucMDpXYMiyQ=;
        b=GTjI2hRXWFYIBKvCwR61tjA90q8C9NoOeW2nRLwPkP/IYE77vyK1q3yMJPsLcnjpIo
         hkuPoXJHO3hBQOWfZsxQXDIDdqToaBk5Gbh9Lzear58IBhQw5BYZHmB2gG7XTyWbVqom
         OhClHt2BfdtzdRqk5jxMqHQf8Ud7fhWQyuI/qXjLh8NFdMlWF1VsPQsface1mXi1aUev
         lGL7T5UdgGzw2jWv316RtorLdsub/7XlKvM/7rMf0tu57w7yjLkiBlb7E5vSUN6oV3WL
         qmHmWV3tJrhhHbU3D+H8wQ1GQx2S2ywk5b8pkriSVbYjq8snF2qr/EwkEP+GfLRVYGWT
         +RRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161374; x=1776766174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YM29ecLh9a+Div79GBVrni0H0EBRd49ZucMDpXYMiyQ=;
        b=LYMS3o0eqSWN47Viq69i2Ul3F4EhLbSnNb49JAfAxQZfnL1XrEOWMtYSg3Oe4CFK8k
         rFCeqhHCDA5zZ0ePHxA34MODeUL+CvhvVlTmXXPc5/PME9pQJXe+ZlN4ITOUJuh9ODns
         S5jSUr8GNvv+D0LVtXhxNI/aXqoN2Kft7UZaiZPfd0tgmzx9MSp9kehC6CiPBj0EfTWq
         CUDm74QydhLd17Lwjv6fW2xzSgTPCjdM8YqKY1nN6bPF9jTdE+oftj0zuwyhReqQSMnT
         BmkrRz2opAGmb8av9ug1MSAcPD6H0ymjvdTHlkej7OtcIGcA+OHyGnMp2PcOMcJpmeYf
         RcYQ==
X-Gm-Message-State: AOJu0YzkRuaI0Q8p/dIE1/tyhHCpcP17RvQnaNw4g891BExzHw/FnCxj
	U6+QVYSmKlznhTlulU6EGqbNXNK2DcrQz1t7GmvwdLDuI8+B2fxlgPNR
X-Gm-Gg: AeBDiev2zkVU38F++tTTBYRLw/Yigfc+NIkj5sZAlqflBGjerL9rEcvIfnZgOSj6ycn
	VfsMoyQm4yzaygGg5VmSZc/wCBo/ZGEpcHvgd8NZMW3xzCAQVkiCmWGjJsN47Xv7iOHjNGQlusQ
	MqtA6ihrw+/W3R9hlpbAKKrn7OUvMxCvxK+rmwDdnq68Bqw6FuMV25P1YQLh6F1pQtwSuRuPZJy
	1arc0JjdFpl62lT1koFBeihQir/rR6ABPbCK1NFtSIbci5FCD14VYGC/rto3hdHTeQKCUAMXErR
	f44c6LP27rZn5ArFM0QXT/tursJT2hdGFkzAgYFAmUsThdn8qdSAO3aN+AofBaVMu+ol/od8Gf5
	RmoFpZPFwLdgpCL4184BKmGEDxZIR5cSWPlZzUGwRFiZhxPWb416wOVEGMcE/AP/M7kzvGPUFXW
	bENX5bfgUp1c2B6VOiL8k4qMljPOX8jY5igmgG3uwN6RKHp/DBq+E8GRJvMQoG92QiWpl7vIQlR
	Bni3VFyVS2YzsUnWH3o/RevAw6V3gEomWpoMs9fQr6GOVRWnUWHSmy4pq3ZNPRb0Igy
X-Received: by 2002:a17:907:1582:b0:b98:32c1:2496 with SMTP id a640c23a62f3a-b9d727a0736mr667489266b.18.1776161373534;
        Tue, 14 Apr 2026 03:09:33 -0700 (PDT)
Received: from ahossu.byod.tudelft.net ([145.94.221.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a4fsm375261766b.54.2026.04.14.03.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:09:33 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	hansg@kernel.org,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix frame length underflow in OnAuthClient
Date: Tue, 14 Apr 2026 12:08:04 +0200
Message-ID: <20260414100804.871764-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413202824.740653-1-hossu.alexandru@gmail.com>
References: <20260413202824.740653-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If pkt_len is less than WLAN_HDR_A3_LEN + offset + 6, the reads of
the seq and status fields go beyond the frame buffer. Additionally,
when pkt_len < WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_ (30 bytes), the
subtraction passed to rtw_get_ie() wraps around since pkt_len is
unsigned, causing rtw_get_ie() to scan well past the end of the buffer.

Add a minimum length check after computing offset to reject frames
that are too short before any fixed field access.

Reported-by: Dan Carpenter <error27@gmail.com>
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 90f27665667a..6b0ac54ad3d4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -869,6 +869,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
 
+	if (pkt_len < WLAN_HDR_A3_LEN + offset + 6)
+		goto authclnt_fail;
+
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
-- 
2.53.0

