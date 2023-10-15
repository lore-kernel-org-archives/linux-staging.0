Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8263AC;
	Sun, 15 Oct 2023 11:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gw9Xfn14"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7af20c488so43553547b3.1;
        Sun, 15 Oct 2023 04:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697369296; x=1697974096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjh0qCOrrcuPUUg/LTlZhlSoQ/vN3kjSgUmu28e+nbA=;
        b=gw9Xfn14wTFscnyfBVvtYJOBr+zkY0dLWdYrc5Tf7xHJQXhJv2XsxL60wd12QbiR3F
         E+LwuKTCFzT9CUCAhQyykSEXIDk6914C7oP8XjRLOe1RV6b1rTCHxDdxkwHqQG4QNYME
         9xlvX8xNrYuo+wYXeudFYVNyAflgz517aBh6bgGW5zcrfL1oJfMtJsJZ+F43T8EdIY2b
         BdQ+vBXC+zVobewagBM0PmgL/4EnDGmB54+ZlcYAt4yGcdJ5cpNHuutXv3bYNmbRjstF
         1jH4yH1yl/CclU5WJFyg6MTvIHpTaew48VzOnB7OUWNxtRgrYHCbU1M8RbeAIbNo4lrt
         E+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697369296; x=1697974096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wjh0qCOrrcuPUUg/LTlZhlSoQ/vN3kjSgUmu28e+nbA=;
        b=TjjES6V8qg3OQAFjBgaq9qRUgGZeRCSEmxEl4db806tUAXqHbPqupeZkALS064i/gE
         vGuJEMh6UmaYd9Qglz5pcRznwDmz4V0T1QUBsn/QPff9dDzRd0gbhA8pVZqT6Ns4S51B
         0Qa1egc6in71P37cCTMa1rOHTZPu1eIpcbFkSJNaXXFP5bxKj2iJ0V9UIqwzI8J4VjUI
         ALPrrc/TvbPNwhRxoms4E3qLqcna7kCHBRbs2tzsOgn4FsPgbU4Q5zqWpxK5TlXbnyhf
         EzI1lYhRHE65CBFkV0MQlQ/sVRdegg6wEic7zfKgcnRdBdLTtzO2RQOYRBXPfcMVKQzQ
         xPUA==
X-Gm-Message-State: AOJu0YyziwLRAokAt2vQ7+gSIA6HciVcZrfZyU7/nFz89zut9fb4jnEl
	tBVjAhzjp3/Hw2RnNs6kME4=
X-Google-Smtp-Source: AGHT+IGZ6WSqaLcBz9n7SzfzqDi2qFfwFrm8HUYdy9HRxF3sjk7BPZrjK8nDnYTPCSiahIad4QHGsw==
X-Received: by 2002:a0d:fc03:0:b0:59b:2be2:3560 with SMTP id m3-20020a0dfc03000000b0059b2be23560mr30244289ywf.48.1697369296557;
        Sun, 15 Oct 2023 04:28:16 -0700 (PDT)
Received: from gilbert-PC ([105.112.18.68])
        by smtp.gmail.com with ESMTPSA id b70-20020a0dd949000000b005a23fc389d8sm1293215ywe.103.2023.10.15.04.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Oct 2023 04:28:15 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 6/6] staging: rtl8192u: Align descendant arguments
Date: Sun, 15 Oct 2023 12:24:52 +0100
Message-Id: <4b237c15c5bb5a8d6ee6a19a85a2413b8cca1357.1697367161.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697367161.git.gilbertadikankwu@gmail.com>
References: <cover.1697367161.git.gilbertadikankwu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align descendant arguments to the open parenthesis as per the "Linux
Kernel coding style" in Documentation/process/coding-style.rst

Mute the following checkpatch error:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
---
 drivers/staging/rtl8192u/r819xU_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/r819xU_phy.c b/drivers/staging/rtl8192u/r819xU_phy.c
index e6836eacc7aa..c61a29976e9a 100644
--- a/drivers/staging/rtl8192u/r819xU_phy.c
+++ b/drivers/staging/rtl8192u/r819xU_phy.c
@@ -875,7 +875,7 @@ void rtl8192_phy_getTxPower(struct net_device *dev)
 	read_nic_byte(dev, rOFDM0_RxDetector2, &tmp);
 	priv->framesyncC34 = tmp;
 	RT_TRACE(COMP_INIT, "Default framesync (0x%x) = 0x%x\n",
-		rOFDM0_RxDetector3, priv->framesync);
+		 rOFDM0_RxDetector3, priv->framesync);
 
 	/* Read SIFS (save the value read fome MACPHY_REG.txt) */
 	read_nic_word(dev, SIFS, &priv->SifsTime);
-- 
2.34.1

