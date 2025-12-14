Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CFD25A2B4
	for <linux-staging@lists.linux.dev>; Sun, 14 Dec 2025 14:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765722398; cv=none; b=hS67KN5iIDl700YWOCgS5f8hAIRAlxooupD2QhCCFQBwpMKGcJdA/a7nE9+lCVJujdcthiBg3mB60aiGs/IP83WkJDMeibFFUl9rEkjUOsU/kGcaywll9Z/nt/Em7y4iLmJ3PsjUD1is/BQny5ke5AILfzZ6PSuJcNCfVFq85Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765722398; c=relaxed/simple;
	bh=YyvxvMaalTzN0dQLv5awGM2xAyIfAJXBl4vV+ynhCnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QyRnWg94J0KzRLhJWtZBwcttHDV4+4u0c5repkKEO9j3ahpBJ///snWggsZ0soyFEl7PXshnRKakF4q5hCTqrFos+lwcnPJaWR6r5UYWoNjHowAG3FgUafjX1yIHMGkxrjJz77YOpGqmHBt2YSEA0WkTq+K7v/dnurODGvgexyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y8913ibp; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y8913ibp"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso8821545e9.2
        for <linux-staging@lists.linux.dev>; Sun, 14 Dec 2025 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765722395; x=1766327195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J/aNNdIz2ZWsQYBho6TSKGDmOXOqwTDsjncmuZJLSI0=;
        b=Y8913ibpplSVyMrtWetinOuqNM2rROxr3pvSTbCfQ3/6VWZecp6PNWu6BHkTPQm66F
         HJykMGZFtKzIZdVWrFw+GsGIyESzOE1llY/K2FrABylpleoItJMHzsIkc7WPoPwu1Rbs
         YYn6pelzAORGRFL2CTC+Iuy2pC/Z7SJzJzTOcoDCOujqsHG1mtff7FabG4QDNSYoAY3N
         SwFrWo73WN9A0ZtpLMjnGLponNWx4hABkZ8MHXXC6srFszUjQC+ShMvmS1vHV+UZeGVo
         3mfS/sr7Re0Aqfh3bkHNb7srEaNcRl0Sx7N0JbbLfDB6CcP4hkdFBcfPRgpC9Z+rd4ro
         HMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765722395; x=1766327195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J/aNNdIz2ZWsQYBho6TSKGDmOXOqwTDsjncmuZJLSI0=;
        b=GK/LVzXj9DndDfxLhE8Sq/O8LVDVAVfdwMSTFyAh+MYeJUGZYIA/leC8x5eVCTvk/c
         DjZMc5Uza8PoJNar4NdR+Udhu3r1qVVEnSynTX7sYs3QPq8YIV5zTrB1vZhUb/nt86n7
         0cJUTw5tQTr/vZBWPomc2PrzIrApBPbt2euoVFoa9GvpFw1wmxJup6Ed0a4JihvqixTd
         o327rxtJT1YgwvuA0qUKSlplKkd+1/iA/m3CNqhsev0s2ySUWA8N1bMLmOOGekpJobXa
         REL9Nnrq8Ns7GH1JBg3AEouOWQJA73KqHK8bVCmHDCge6eWYyPfA1z1cOEhrijO/9hzr
         8lvQ==
X-Gm-Message-State: AOJu0YyD15sEKiTLv4B/zqISjX2TCIS7zMIUPvGXWPUJ3lIdRmjsWKuj
	GwUJ6ijNpv+jZzMawzzUVZKdFuVVOX5UzqpZWL4q+uGew7PegN5HlncE
X-Gm-Gg: AY/fxX4J5dqLYxExrbiRCqkSLQVT28whk5oT4Iazf69eWOKua+RNeQqi0/Qaq49M4qC
	0L9pAA5nVM7clvW6570SHSjXHw3gACgm68ZR5RxQNiRgjC+nMtugnAOxkaWEO5tJV5Fvyj9xLxV
	51LKnkrUFo9hlVUp+z/GmjgT0r5hFTljSlU0McN8mkFRnTz0foBtgtiZYIDdyiwLPW+kEzqNLDL
	9XcUTvkayIpYDiY7nbxlDmPuMdSTDFzcArMEg/V8k0BrY/wP/XMkarpbs8thz+HwzCtC5dzjC4q
	PzXqhiW1QGHsIjQhyNioJ39sLWHI0P95w9kVYuG7yf8wSjIctfnMOl3seJRgnIEd/yUUl1zQxp7
	suWEYuv5ButdtTPtzu+6aslpSpPHIl/bnH2saAco5KAPTIaWgffmnOFcqwOfQUUYfxmQo5fd8Gw
	gXrnGTinKSdk5gtNawUP0x2AM7GxplXJzH/6nNrdpfZHKN0SE=
X-Google-Smtp-Source: AGHT+IE2jXJwGpyAGRNBQTpDIJgPNbbmmCk1bNezOZh2stCRXgKph7/89wsk8TsxJpEoSSpg59dhSA==
X-Received: by 2002:a05:600c:6994:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-47a8f904080mr74795945e9.17.1765722395057;
        Sun, 14 Dec 2025 06:26:35 -0800 (PST)
Received: from ubuntu-kernel-dev.domain.name ([169.150.197.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f776898sm132672635e9.8.2025.12.14.06.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 06:26:34 -0800 (PST)
From: Adrish Bora <adrishbora@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	Adrish Bora <adrishbora@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix block comment coding style
Date: Sun, 14 Dec 2025 14:26:08 +0000
Message-ID: <20251214142608.5516-1-adrishbora@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the block comment style in os_intfs.c to match the kernel coding style.
The comment was previously lacking the required asterisks on subsequent lines.

Signed-off-by: Adrish Bora <adrishbora@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548805..ca841cc61076 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -934,14 +934,16 @@ static int netdev_close(struct net_device *pnetdev)
 	padapter->net_closed = true;
 	padapter->netif_up = false;
 
-/*if (!padapter->hw_init_completed)
-	{
-
-		padapter->bDriverStopped = true;
-
-		rtw_dev_unload(padapter);
-	}
-	else*/
+/*
+ * if (!padapter->hw_init_completed)
+ *	{
+ *
+ *		padapter->bDriverStopped = true;
+ *
+ *		rtw_dev_unload(padapter);
+ *	}
+ *	else
+ */
 	if (pwrctl->rf_pwrstate == rf_on) {
 		/* s1. */
 		if (pnetdev) {
-- 
2.43.0

