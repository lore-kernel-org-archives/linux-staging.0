Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945618;
	b=XA3UrqE9nBuTvsbZqTQ6KpOOedPW8skAmPZGu88qP73jYrUhtP0guLj+LX2stkdhoCyp
	 y2EtAWnYkQQsEsJ1WkW9GSblf/zlQGaHF0tB/3NLDq2aIOrj16cUZ9slN8XXVPLmn1Zke
	 tR9MH3145uUlkQGJ3Ad7e+PS2MGud3MwJ3lb8cKfzqoIB4D0uHVXsT+gmEzigofREBN/x
	 oovZlgk7k+uCgA1n5Dxnv8RFXu/Z3LKCSDR36iUaJdzNGhjGTbO3KoMq4UMw4lVz4eh29
	 Tw/Qqcpomi9hIHL4HD6ShbX+T93QRwYLwSFtH1/c0t7/iqHbMmHm7pYvRe2jQmSJ8hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bDSSPNSQqDQ8t1tNwPdKc7jR5DatkZpoImvsQgQ5S54=;
	b=lPhs/GSIjwEP31QfNOtoN6xc4MX7ylcDoCm++fqDs1YAP6mQ3bGMh1JS8ltJN+mmC3B+
	 InmdTgsi+bAvU1KkcKI7aSOKHz8knxeR8t/NhM8qgV9ABYnJ14T4vJ0nVNOFeXhS3Grb8
	 z/5ZZpPcXC6PkWN1f/cgPt6bf/JEZvrHtaQiY19IcWnmJb68cXBChvIkLCq0TgIPDaVpK
	 ZwxDJqDu+HfwQPEV+YHkO0jNvM++X1HGSmCRCdRDoBwimk4W7ols9/DLKaJAIKVjEpved
	 WBEiSZ67hp1QwfMsaZ5yftNQUlHn5ESLbNcAAsEmXoKrcOublW+h+Vb/djsGZdilGZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+uy9GQj;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2840C606A31D
	for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 16:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2840C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L+uy9GQj
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1329221f8f.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Oct 2026 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792945616; x=1793550416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDSSPNSQqDQ8t1tNwPdKc7jR5DatkZpoImvsQgQ5S54=;
        b=L+uy9GQjga26gqzpe6IB8S0hcRyq1BJ8SFYpb1ttBU77zZojC9gZSkckwX/SivlV8K
         ZYPmsTaVFFzQc1W6GDWUpyZJ0zntDMB891Q8qiU+tVatsX0zi5KWNzZBZPzqnYZmHlX0
         VCMcuiKHkmaV6K04RQUgqk5PolLwvGVdxt+8I/cS0eWgrJymZGBHiZfUeUVsNdCkG1WJ
         t/7H7ZGEVegj57YlpyT/6O4Z9ioQz8XR7t9kGKrmFUvEPkJMOjECAls7GUfP/2vyH3q2
         Swq/7fC2dFXGbHZGDOt4Tk0tkWFA8iEvlun7+ij/3IXWyZDpcfq/jopDdsvYNKJxwqlY
         o6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945616; x=1793550416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDSSPNSQqDQ8t1tNwPdKc7jR5DatkZpoImvsQgQ5S54=;
        b=CU7xw826v+FVFBj0A/p9u8VCNWjBHiusjACiJrQHzxydlWvuCX1TDdTX/c0/6ppZ/I
         aUait4CZqdJi4JgQXfUj7Ce/Pw41oJy7sM8kEuN2GDHTYhb98ZgP2NFLcHCx7tCaMmjQ
         OkU5x/qmijD/nXydT9w6dyqk7uE4xo6SF03imBGPdNEtikWDuNjmEWb6/DCofo4kDDrr
         nxrGJU182q/15G95rn0D04cyLS1RMe+7JvsHp2uJFHbHNYhWX/Sbvi086N9IdgHPqMKG
         y9vrmq7FTd9CtNJ6m/pbtf3vC6XurIPhtEU8/hFHmKfKu1JO38Ss3Oa8xMe/NxN45JOO
         TneA==
X-Forwarded-Encrypted: i=1; AKwUvBx/vWBUfA8769TYKC3tgFlix2xbk7n2BC2/Ub9mgVbsd7m6jr9/V/lehBOD0DQTRqnjxN5q9aFLS9TmUSwv@lists.linux.dev
X-Gm-Message-State: AFq9FYLQAZLC7ebETcuqY+85keXlDIE/vUo9B7R00KE3wOCvQA56XfSA
	Xgw6xHwF9R9Q003aO7VdCdSfgbZwlrFHdXudMuXIGHqbgn7FE8B1iCBE
X-Gm-Gg: AYBFou3dXKQeRuQM1QufHEVYE7q53/kWtNT9e+sSzNvJpCUxQRo2vuQpbLoQrzBHxOL
	siQ4fk79+GdjBMItPKch8nZAtizrVoc8sn38HTkW0Ty3J9GCUq8WEWJpOZU5c8Uh62hr7U1A6C1
	bbZdKyMThj64hvdEfRPF/7Q6ZXJVu9JqN9evW7lMwRILoE9iW5N8yw0a1zzl5qaCdDsHUNGE69o
	nL0rvshmzFkCgPJdAYBHVZTfxVI6Uoz3+6hmNWsDFF3YFp4dGQatuLrBPzJsju3wVVo0M4tTsGi
	ehhYiKnxmd4Mr/IaaKUjnmGDKW3mBVxhv5hq/cWLD8aqUO4E+KGypRV6+jl82EoC6SXiIz8SmIC
	H20wNbcwDuTj6zO3f72JBs2L1BLebMAtRrnWu2Hc8pLrtShfsXQVAa6UfEY9Xtc/bNBjFE5ifju
	syE9KWS6DE9WqoEahOqDZUkBPXr6g89YLs2Jnhl+XU+UgN7WKG+EwVpjkf++NNO4WPzxMVGQGxX
	5KLP8YKNQRi+OshlRr8tozVZd8turR9Hhv83+BLO1pbW1VOYzVNYmyQSHxcHHUENosoBL8YWmu3
	kmtANw5vPv/AiU6sfRY/rvQ=
X-Received: by 2002:adf:f0cb:0:b0:48b:e50:7159 with SMTP id ffacd0b85a97d-48e3eb931efmr6231047f8f.30.1792945616300;
        Sun, 25 Oct 2026 09:26:56 -0700 (PDT)
Received: from Ubuntu-vm ([115.186.50.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm11127395f8f.54.2026.10.25.09.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:26:55 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH v2] staging: sm750fb: remove unnecessary goto
Date: Sun, 25 Oct 2026 16:26:32 +0000
Message-ID: <20261025162632.7186-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025130258.10747-1-haasham93@gmail.com>
References: <20261025130258.10747-1-haasham93@gmail.com>
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

Return directly when setting the mode timing fails, rather than
jumping to a label that only returns ret. Return 0 on the successful
path.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---

Changes in v2:
- Return 0 on the successful path, as suggested by Dan Carpenter.
 drivers/staging/sm750fb/sm750_hw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index c4358d3e5091..4dfa1cb6b352 100644
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
@@ -332,8 +332,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 		poke32(CRT_DISPLAY_CTRL, reg);
 	}
 
-exit:
-	return ret;
+	return 0;
 }
 
 int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index, ushort red,
-- 
2.53.0

