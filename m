Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC29F1D63F7
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 01:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756949199; cv=none; b=d7yvgPuw9HXq0YPeVf0No8UGd/MccK8Bdr+AsQN5QxvM64ho5qn3w/roFsRnqx5X4/XvSj7EironFqH75Yi/rZ9zH2+kuXtYvYbO4XdJh+fsHTHP/pUGj0tSgvM2pXTNI4Aalq1q16aV6PgVylzhvHxun+Fr6qUyDUf/jl2lpgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756949199; c=relaxed/simple;
	bh=ZIDFMuE4M5pN3hNXaXhKSfNWI42Rb3epwAfW5TFj8CA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bUTCsefzYh2Nu4dwaBJd+YXi7ndPXfaSY8zDAoLoWfavxTYlnOnpKZqM4iGvyD1K7arLTfh8U+0Jvuirnirh9meeDRaBY5fA+f2u96SZHWCKiIMSec4ihjHJ1x7a74bu/arIpFy5S2irvQ/L9vzXqz8FqoiSm8Y1uILG7BePoms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPo57RyJ; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPo57RyJ"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-722d5d8fa11so3874326d6.3
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 18:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756949196; x=1757553996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=75NYRUjzu7V9uiI556WCEEmql3MK5Ygx3IijVaMkk7Y=;
        b=iPo57RyJz+nY2y2j7qjQbw7vrXODmi6ucCB+x8KsiT6ArLaA6gQUcYi1s4WJ9tuX4W
         TNGWlHUPTX+bz/r5gB7Lx2wZ+fhar4q/8eQgN2ARFxkDW00cFmTbFyYGNqkJD9wZlQFE
         ZGK0lmo/i6cPW91eZtF8QpByWen+oiVv7BE45l4KcfKwEX3oYA/mzf6Fg26GHk8FIkN8
         AAxQ7er/K8c325uMYEnhylnCiKaw8cHtv2lgFiQDhZa2mXGzVVzC6SbiMT3wg2gK3p2j
         sIWC9iobFaJMINZYIqbQT0yzYMgvPWhpD7MMQYZ+0cNGx8pMUq1DLJrKwyrnvhvnXFeS
         jJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756949196; x=1757553996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=75NYRUjzu7V9uiI556WCEEmql3MK5Ygx3IijVaMkk7Y=;
        b=MPsyRkYusdIDCADBETVeJp3luUaS+RqT/5bv1M+ImiqiUQDgbsDHj/IIvn2hw60ozs
         5a9XtzRfmqJv68E43Y44LDD+YoldMX3hEOmRRL5uWU7hNYOBS724QU6/rqARCIXmxZfY
         3XEGLNYQtwhKLKCiacD0Zj3EyUbK6Tm9+w1aX6CqDFTNvOQGRGvBvVL+RuJ3N0hG7S0z
         iWCpIA57NezFXZHsdjfsD/8Pt6tRIuf/7q/1d2puBnU8ACsHt1USrCeQDYnyPX1lYqvZ
         1GTDwpLBhxtfrfXIjj60HkU2oppTP7NDxDvFDOQM/1q/fpJBbuxt/nS2sjE/1LVXyEVH
         F7qw==
X-Gm-Message-State: AOJu0YylEcj6F+CekutN8VsnafFfyUqgRC+UcaHY+ko1jEcdPq+xJ0Do
	xERaoyMY5g1EsmUWIM1MnRX4y4IXj39WnbO9l16JbWTgabZvd87GqQNx
X-Gm-Gg: ASbGncvs2jwkCWM4qyvWBmh1hfKkKAptu4mKwb+/PihKUm7+2KaQz5tmlFGLRzyNpAV
	g6J9mroTwSwjQvbIhJJufIeMM4gElm9kY+KlcoKx53M6DO5HrC/jzgmbtF++UNZyFpzPpzUUIRl
	9OE4RvHTdSvSUoC2sqP3duZCkoTHSnLVSpKWLoFJYSoLgp0siJLHkUlSClNXNaUxiutweqET/KA
	mGs1bPi07K+p5a7SJVbr9wZYQIwLx5yRqlMno8LspqNZnwmaOwKCtJ7J44v2qbodLM3wEFtNLKq
	9ogD8HnLQ83WUsMp/BHjb6aN4pG9WpThMROHBpARF0X28dCPH2KzPXDdpvkEP+Kkx80kkhpgpbM
	dxWn+LLm9CzKs9McvBuY9OaLiNwl5APFkwyxChfmq4bCuaVLOxEI=
X-Google-Smtp-Source: AGHT+IFbDToJ7AUXbhetPYcmB6/Wb5TL+pzH1QYk/b5j0SDArnwQMHzR9WJxw9tq5MNSVAKVt4Fhxg==
X-Received: by 2002:a05:6214:c21:b0:70d:ecf7:2102 with SMTP id 6a1803df08f44-70fac76e538mr193808096d6.15.1756949196611;
        Wed, 03 Sep 2025 18:26:36 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720b682faf5sm38423266d6.65.2025.09.03.18.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 18:26:36 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH 08/16] staging: rtl8723bs: remove space before semicolon
Date: Thu,  4 Sep 2025 01:25:28 +0000
Message-Id: <20250904012529.215521-9-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
References: <20250904012529.215521-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary space before semicolon

Drop the extra space before a semicolon to comply with kernel
coding style. This change affects a single line.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ab626c88e7dd..d05ff073af2d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2236,7 +2236,7 @@ void rtw_update_registrypriv_dev_network(struct adapter *adapter)
 	struct	wlan_network	*cur_network = &adapter->mlmepriv.cur_network;
 
 	/*  adhoc no 802.1x */
-	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0) ;
+	pdev_network->privacy = (psecuritypriv->dot11PrivacyAlgrthm > 0 ? 1 : 0);
 
 	pdev_network->rssi = 0;
 
-- 
2.39.5

