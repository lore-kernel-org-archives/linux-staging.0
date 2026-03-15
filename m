Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337B9375AB3
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 19:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773602929; cv=none; b=cEnsZPt9T2MXsYLrpbNRchX5RSE9doERw2cxOG0udwNWgK24mDBtMvFLZgBxChpVxO+jACaugiZ63g6lPQQfFFX0FHWIiPaMGzYFMzBMdUcInpPYIJQQrMw3IP+Oua8BFr3bwKje9Fn4/d4mLpYoABD1Wq0ZKplKU0sqIcqpDG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773602929; c=relaxed/simple;
	bh=X+6IV+S7iAXOq+2QChAXkUpPa0gIZuyZiASVhlIX+5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=euUCe9BaImW9Cguj8tl0UKcJnqMraMMpzJhxARQvFdF35OfZfHz2EsxEvNEC2DTQxNg2LyDKtVLphyv2vQZ4Axaucsn855FYRpnHLs3lvBme0bi9zyDz6cQB5+C5awys0mXG4yziuW3d0/zn4F871QP/aBkCdPrMlNy7cIQKDl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwyhEMJs; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwyhEMJs"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-64caaacb9bcso4006266d50.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 12:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773602927; x=1774207727; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QhtwCYwtz4nDk2vSSld9MgmrrCjyRKF9QP552p4WB9U=;
        b=HwyhEMJsOFNWGTV/gjYefpiBPZXn8XTVy/Hqcwse6fiCuu1/5Q0qbzwyovCmNEhsY4
         b+iLvOjFc6vbuppv6ufWU7hImy4krm02JgW3NyTJYxp+nweMJ9tZfaoCX3xwwROTIEYY
         4oTkVmPebMqr6RRiiivMkVNNL+ikkD951yQnDQC2L2ei/rP6hNPWzTUy3kQ8l/JynnRj
         27+8UJI04XTAjw39jbLXF6USDAFXqZvtCjiXL03HaYEoNi34ZplC1HF4qOgoTMd4MEbF
         9jpQYUq24JWQX/HHequnTdJkU9eCqVC8SKeZ/Bykcb/xygt7t9GW2i7ATuqHavR/s/EK
         UvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773602927; x=1774207727;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QhtwCYwtz4nDk2vSSld9MgmrrCjyRKF9QP552p4WB9U=;
        b=OQ5JHS7s85lCxGjIsyo/zGcRMv+dtw9Gs2dYTv8/1C5Bqjp85AyN41jVWwC9fqxl8f
         441Tx6GXSbza4aVHFG0fkXEITzTW2uDXSetHcEullJWWNxjod8eB12XDF/KosDaH/gkq
         EfxScL7lkzZf1SyWepAdnraQnTX0bo6TPMA6ZqUqNibXqI5Bkot3NBc4mdEXrvU5NI2i
         U0E3Esm5dE51rutVDaL9YIGqm8K/bOXOf7liOnT/DwKSBUN1DPOOY34s5NnFXL/n8aP7
         J324dind0+TueVveqDy8j0rKzEH4OeItLHgcFKD5r1exFLh2GbcvgcSoxTKb2SlDe6Q2
         uz3g==
X-Gm-Message-State: AOJu0YwX+vjPDxdsjbOFu8URGIgixHs/mzg+oWda6nhilytZA8oaSXjL
	dZjdDyIHPeIVaPEDTQ4E0O6xIE80zgKXeJlUY8EkLoMvyfmchizOQebA
X-Gm-Gg: ATEYQzxs/sAmj9BBjYp3qx5B4R1dfRltKIKnpzYaxtnBbx+CJGTIR+FEPnH3ZnlDvBc
	lQIrETzMRLo4r7YqpGT72tF0aahKWyl54rpzERSNLXC2S+B3Ec3enEdeBfSN+0yXN7b5nsX25d7
	KvMttWWvhxK/OBUZBj3m4SwW+tbxSdu1bKjIHdVbUzFtnLSJOhONF/00QZ2uK52R9UPy1ObFdn1
	lTZp2N89jU6IYqh2oFB77eWzBAWhk5eD2LLZv+/Z4ob8EQOzLMKAHGKYB0nycm+x34clZPnVp/w
	n1ViLI5K+h0RGBw+nZLjaULj97Gascksyhmhr7H8pVsMeA7P8MfTkWuZrROPlk5qNHMrOAdWbuy
	VsZy3twtiaVbHZHPxfehqVOeYZGCaQaWiNT7TxATVQ5YMvURUpoVhPnDaY//G19jajTzd4L5kXl
	1WSLQkfQqmIva7bu9ZVhyj6Bx8WhQRbsBzaY+2LGN8nuoxkUBi8B41mLWvd1mK6NDa1dybwPDQS
	w==
X-Received: by 2002:a05:690c:112:b0:794:22cf:6d27 with SMTP id 00721157ae682-79a1c08dac3mr107618747b3.10.1773602926863;
        Sun, 15 Mar 2026 12:28:46 -0700 (PDT)
Received: from ubuntuarm64 (108-94-35-11.lightspeed.austtx.sbcglobal.net. [108.94.35.11])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79917de805dsm77435327b3.3.2026.03.15.12.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 12:28:46 -0700 (PDT)
Date: Sun, 15 Mar 2026 19:28:44 +0000
From: Joshua Gu <joshuagu789@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove redundant blank line in
 rtw_btcoex.c
Message-ID: <abcIbKgPQWkIB6vg@ubuntuarm64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Removed extra blank line, as reported by checkpatch.pl

Signed-off-by: Joshua Gu <joshuagu789@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index f4b19ef7b341..0191a943f0a4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -54,7 +54,6 @@ void rtw_btcoex_LPS_Enter(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv;
 	u8 lps_val;
 
-
 	pwrpriv = adapter_to_pwrctl(padapter);
 
 	pwrpriv->bpower_saving = true;
-- 
2.43.0

