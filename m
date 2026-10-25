Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933397;
	b=iqjgjJ62coLM2t2sfV/9dhWyvI2pCSfazXphKSAVW40MTZEAQdsNw+twAeVRy5kztjwf
	 STXkNk2+OxQTLrC5kKo1DC4X1EEMG5GO2tDACkWS5bcrSPW6R4ADO/hHYs8ePlkc34ejA
	 sCOZLJbRDX0SUlBGyIlJtRvqVwniXqZy8vz8UMXYdKxU3bibf+5OLRfIw8il8hy8a5vLl
	 eGenxthAh3SKDyVLkZyu8ABqA6eO88kTyyF7LI1/P/mi0PETF3jl8SmCPusELQ3hQCL6u
	 tAn6NSY2OIler5IKt9tRbxzIvyxQWOfFUGwQdWMuuobZhBFkbJ2oYfpYWe+BoYEJUHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pw+VQzikrvNhFcsLNLiHCOdnZ30fvzuuTNfRPpO+bNk=;
	b=AJ8f7ulovBUzq3bw7ShD2M0+6GB8rYLsci3JJw1UHD3CaKVhereggAdTTDLRDiNr+DP8
	 e7wcsOxREnqnJFrTM1N7fT628KWAaeadfdnyXE3G7Ho8hXNlnfqWV7Bt1VmWYF1MF0jxf
	 7qeBBIMAzpXbG4VzHzEQ0tsacY2yS6gCAfAvVmSgV8l6oQRQMCJtB8WJsqBPQ6tNzgChi
	 d/q3AVDZaNSkPODH/2VjaO2HTRw5r9YOZFTBnT4ZdldQsg3zoQjvIEC+GAiY4DnWxbyn8
	 v+mp6xUq9Aq1JdgewKShwIbASdMw927Ppj1xjMcAYFmUCckThURnHjco78UJ138JrjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHdb17uH;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6942B606A31A
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 13:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6942B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHdb17uH
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so20736555e9.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 06:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792933396; x=1793538196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pw+VQzikrvNhFcsLNLiHCOdnZ30fvzuuTNfRPpO+bNk=;
        b=dHdb17uHCl80JSdHvVm0WbmufYdvxP3XIUy80dsEq2D7vqg/RnDE6JeprAOjW9Cq+3
         PAx4iN+h0rzw/Fzn1cJX6bwdN0zyc2Yf+qJlovkP/QmP0B1/XBh7/w3qiTACteXAD1z2
         7SbfYC4ZkodR6YLL1Jya77hDeYpLdphrQ7lEPJCl8D5eE/EuUPC8uIUcresbLq3COTWl
         ITRwiedQF8ta2ShjJ0mr9Z2e7RT5gCoySSJG45Q6nT4tNSbOCKikE769IKbjqh3l3wL1
         iYXTi1wUV0LuY/xIjFJ8FltI4r+7ssoUHKI3RGIggEzCcvlJLl8ODGrI9mOHQ1B18vlv
         FOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792933396; x=1793538196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw+VQzikrvNhFcsLNLiHCOdnZ30fvzuuTNfRPpO+bNk=;
        b=z4a1Ymv8CXIZFzOi13JFY2Pw+8FCNVIRUISabYNEG/pQ/yR+Ee3qCJ0L0bJop8rgVH
         RxsnOYGyeJAvVsYPqDa90GwX/X1pDKye/zWapThOde+sQAmugt6NyBJg6zzEoTaiUQvg
         lsmsR8zO8hS86F/AsThB2e2yVRWjWqkGwunid4ptsyLpFgnWI+J/T8X758Fb0c/qEdQK
         tvHgzHXSnzjeKYTQ9ptOEicLvnd+71GAKbRPaT0tYaOq0O5ZftamgmPotK7FtZgbCjgJ
         z0Y3RTDnhTTRKJUEZhVR/CkEEdgBowsRhUD8VsvWFgrD7lObCKEx8jWdNLkOiuGMc+nC
         ROAw==
X-Forwarded-Encrypted: i=1; AKwUvByuEdxxhwFVpqEUo+hirZlGolcYO8nOxv3j2UVW+5Blp0ryARv5soo3C3TVXtH2JcU3vscfUPZMUcAW3TK+@lists.linux.dev
X-Gm-Message-State: AFq9FYKNNnGzx/ZRxYYJQK3oJrxzBp/VRmDTKOTI8I2Zh68hzABYULdh
	L1+C2/8zh2jrqNpAidu7mCaHuxEO5tjRUzdv5qBy2Ezna3Mtk1JU0nTy
X-Gm-Gg: AYBFou1fnCvKjGqAAoW4Efg6QaKhBo43rzmyO9ARKR/Fn7bEVDNK4Y0OTbg2k7Uhvim
	xdZSG/XVs1wS5LGVK7ayiKen3YfXO7FgnHDRwFu5//Samw9Diwtn8U/JSn+5zXyUypAPvxKs2xe
	XN8MZTrnNYAjdEqfEirndJDLMeBafZrjnY3YUbW2qeXVaZ67br44eyUeZf6Czdtl6T9hDfsZfWa
	JWAfjiUo5XmDwaKywLBpKvigpn72U5xfZPQtmRAIqxBsVcbtrTXOsz3rVvJxR9KOkqLjRUsDFyW
	jP2h4DttMr+I/kxF5vZvF6si2OlrpPQMJl3fa2tGMntA52KcwUxii32korbCqSFwIAX46zgrj9Y
	H7k5jSWK2MZdZw7sZsPJaXZ0OdbwxbbpH50IOW4dc5/eGEABO6+qDZtse1W/gN35l1o7SpEg95e
	gpyAkqMN8kG/GuLXukyOc5iQhNogb/PNbx6aeyEoaxdgVVhdNsKx/0rFOxbraQ6OcZefujCeoL5
	tRpIwZ91wdMEHvWvbTPYK3V1tovpEzqrQYH84H+1nrCt1J3uz4AaFFgrewmi6ieHexqfpshAX9+
	vzIHXWA3Sz9kTXcdfg==
X-Received: by 2002:a05:600c:6749:b0:4a2:e0c:2b10 with SMTP id 5b1f17b1804b1-4a35aca32e1mr66130535e9.19.1792933395658;
        Sun, 25 Oct 2026 06:03:15 -0700 (PDT)
Received: from Ubuntu-vm ([115.186.50.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a029332sm108000685e9.4.2026.10.25.06.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 06:03:15 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH] staging: sm750fb: remove unnecessary goto
Date: Sun, 25 Oct 2026 13:02:58 +0000
Message-ID: <20261025130258.10747-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error path in hw_sm750_crtc_set_mode() jumps to a label that
immediately returns ret. Return directly and remove the unnecessary
label.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index c4358d3e5091..22f93277e91b 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -272,7 +272,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
 		dev_err(&sm750_dev->pdev->dev, "Set mode timing failed\n");
-		goto exit;
+		return ret;
 	}
 
 	if (crtc->channel != sm750_secondary) {
@@ -332,7 +332,6 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 		poke32(CRT_DISPLAY_CTRL, reg);
 	}
 
-exit:
 	return ret;
 }
 
-- 
2.53.0

