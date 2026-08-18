Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2017B440A33
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043506; cv=none; b=qSWHeg6T0EL6E6edcRO89aiS2JQX59ukm6jgvychNFfye6iTsb+N9n3JblJe1KXEwRl0j9OYVx2DlVXuWzB+XzHenIP85qVEqDEK8GB0S8faTsKsXtP5zv/G8k8TgJ7vYAbLndRg8bTkYkhPFVBKSAr3tUEhgUYzV6g6hAJrx10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043506; c=relaxed/simple;
	bh=VNI2zFvRRVcdDqT2ECDajIMbEAuhcyBHP9+ISOteJ9E=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject:
	 In-Reply-To:References; b=JG6WP8QSNscMwR2eErEp8TsfuFDLKFqvUveBlU6aijY/EL0eOexzrqnRVLS60Buky1MUF4Qzi96NyHxhiCuoE/7ba8AET/uYj/HmuIcN9UeS3dJve+mEfS22xb2Ym/sBUEmNN1yq5aiGGOLKS2fHfODEyT9caPt++5zLASGw0VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWDpkLMF; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWDpkLMF"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so4434386e87.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787043503; x=1787648303; darn=lists.linux.dev;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0yH+2eqb44bBr6wqQp49+xMEWRK7OgKw8o/qWVty4A=;
        b=mWDpkLMF3Z7/6UfVrbAjGRJijtE32O77FXddsTeueqJnUKi83uSOpbcFLM+ldPymqz
         EgPhfjrA7OgBcuq+Vxuhg7ZjoWtEYLWjcV9EQfn+5eHdymro2sQj5i3HFI0In1gQG+hx
         Cl/yUCMZ9DiQi8NJpjsgx2pXFtto4EoOUy6QMc+0t5t/T+uFs23QG5A3zC42+gvN3ECV
         Tn99WU8bfEUjIpDTtsFNW2kM3T2yI7B6DTVBUsIHHfexp9VSJFwxtb+N2KdyFgOKv7g7
         SW6CVLVzP/CtKjOIx6UiT1l4aabAYu/pL06/ha3o6Z2/dhN3TNWfBUKLfDHKRmVLBbTL
         ynRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043503; x=1787648303;
        h=references:in-reply-to:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0yH+2eqb44bBr6wqQp49+xMEWRK7OgKw8o/qWVty4A=;
        b=cv6+TEX6oKQ6pZtCHHd/KLfnXRpg1MpHnwAD2exxfqpVGt2VHS5AVM89g3gbcs7c+8
         +pQ8Rq5z++JE5KdEJxfKjz/k9XkdJnkNLBVVO+f+rJ06SZdCC/31hnN+Br5cITlpXk2R
         /74B8NiVaDJhhECVE2EYByS92M/RrKxPMpXrBPdBd5CDWafQZUzXeM+TxtIR/E4QPd+A
         MoszTBtgEkVlWVtp7HPgkS4FTVDPNTYdQwrEYjTiTA5wTPxUUmkri0IfXpri5JxeWI8n
         jgbMh1FZnyHhEYxwHwqSuM30s7+Bi73Y7l615riUIdCDU4vim9Ezd0ZhssGWxFL8bItV
         Y9Jg==
X-Gm-Message-State: AOJu0YxSaxQFfHjBSYdi83b8+PNfx8dZOS0/469xUNYe5sJH0R1H4Y/m
	CtjXYc73PkYJGM7TXlOHzgGX63zRSHaVSjz47bN/rULDqJy9/pXPHq/2
X-Gm-Gg: AR+sD103v9hcOZnFlZKw+MVPF3UJRHBC+OzzY4W4y0b+7iDsrociCsGKDlxf4AKsIbW
	5hROQFrebyd3PuoYKxmW2R7X+0V4SBqdk/QeYocL7MNIG5LvgMmxwgO50D6sUIRgpwuaFly8ZIE
	YhLtiAbbMwX7a8UpJVGmSakaSdRjP+4kVON1o2BMMdBIfGzpwhNNreiT0i6bM4KMVD6BbuIjYsz
	wCeN1fzbrhNQwvCLtSV8Ghe42l6iEPsCudw6HX9l6bp0r8hrB0Hxwz/xufMe8ZjeWR5JTzSElDL
	ZdokFMZP6GUISDLxiqXxV4WHRl3brk+s3C2Sfmc+ZtosCEgSkg+ILYmmUYeg12rEoOb12NovjTt
	wYvWgJaBUVvMkSyiRXz3hbd9T8wZca+VLiIvnJdw29kzUunSNdkhUbtqUoYiG72KCPIJuWEI5y1
	Dkg1CpgojkGg0SlVjEm3W7xyfHzD5t4Pn6ZUf5wAF0tPZzu/P4A0XCAqw=
X-Received: by 2002:a05:6512:130f:b0:5b0:1ace:3bec with SMTP id 2adb3069b0e04-5b45910d9dfmr5781160e87.10.1787043502951;
        Tue, 18 Aug 2026 01:58:22 -0700 (PDT)
Received: from [127.0.1.1] ([46.187.85.167])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa12c1sm1073937e87.24.2026.08.18.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:58:22 -0700 (PDT)
Message-ID: <6a841eae.13e8e617.1ee83b.3070@mx.google.com>
Date: Tue, 18 Aug 2026 01:58:22 -0700 (PDT)
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: "Rork A." <qvkapp@gmail.com>
To: Parthiban Veerasooran <parthiban.veerasoorian@microchip.com>, Christian Gromm <christian.gromm@microchip.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, greg@kroah.com
Subject: [PATCH v2] staging: most: fix typos in driver_usage.txt
In-Reply-To: <20260818082122.30038-1-qvkapp@gmail.com>
References: <20260818082122.30038-1-qvkapp@gmail.com>

From 7b57ab25225268fce971508eb9055e61cd3f8c92 Mon Sep 17 00:00:00 2001
From: "Rork A." <qvkapp@gmail.com>
Date: Tue, 18 Aug 2026 11:57:43 +0300
Subject: [PATCH] staging: most: fix typos in driver_usage.txt

Fix two typos in drivers/staging/most/Documentation/driver_usage.txt:

- "post-poned" should be "postponed" (appears twice)
- "access a MOST network" should be "access to a MOST network"

Signed-off-by: Rork A. <qvkapp@gmail.com>
---
 drivers/staging/most/Documentation/driver_usage.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/Documentation/driver_usage.txt b/drivers/staging/most/Documentation/driver_usage.txt
index f1b6977f4..89ced829e 100644
--- a/drivers/staging/most/Documentation/driver_usage.txt
+++ b/drivers/staging/most/Documentation/driver_usage.txt
@@ -2,7 +2,7 @@
 		Section 1 Overview
 
 The Media Oriented Systems Transport (MOST) driver gives Linux applications
-access a MOST network: The Automotive Information Backbone and the de-facto
+access to a MOST network: The Automotive Information Backbone and the de-facto
 standard for high-bandwidth automotive multimedia networking.
 
 MOST defines the protocol, hardware and software layers necessary to allow
@@ -151,7 +151,7 @@ following attributes:
 	  pass parameters needed by some components
 	- create_link
 	  write '1' to this attribute to trigger the creation of the link. In
-	  case of speculative configuration, the creation is post-poned until
+	  case of speculative configuration, the creation is postponed until
 	  a physical device is being attached to the bus.
 	- destroy_link
 	  write '1' to this attribute to destroy an already established link
@@ -172,7 +172,7 @@ name in ALSA. The sound adapter will have the following attribute:
 	- create_card
 	  write '1' to this attribute to trigger the registration of the card
 	  with the ALSA subsystem.
-	  In case of speculative configuration, the creation is post-poned
+	  In case of speculative configuration, the creation is postponed
 	  until a physical device is being attached to the bus.
 
 Secondly, links will have to be created inside the adapter dir as described in
-- 
2.55.0

