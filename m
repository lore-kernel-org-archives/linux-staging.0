Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DCDB673
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286567; cv=none; b=ZU+WcLffApkeX3Q4SBHiRPpwM0AXKGH3E8pBj7BWQR4EQHdkYLR7n6GLPNNy7oYEcO1ZqDZlxtYNjwue7bslfqJUA3pJLnmIGDvxMvklHFf5Un0STogDhksh7v1u/+V1K5nu7Er362PSKRpbV71bhPFTMEnNHAGAubG6mKE5qQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286567; c=relaxed/simple;
	bh=DZINcWbYvLBnkXMIjWaceM0xrF/s8/GGRUcjnVdS99I=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=L8sfNjUKf1LfApD1mQkV6FD3wV/qB7Jq+NHKIYKWBeIc6uNzrIFmoIZictYtgU+sGNA+LXgoHUVgRhyCd01+fpiA5FDvh46SPd6xOWNU8c6QB89qIRbhs4XEK3d7IIMmgTjVQjro40iy0oMBjG2Dzm2G5Msv2dYOz16b/3fMIYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eNMcakZQ; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eNMcakZQ"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-7c3d9a5e050so189924a12.2
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724286565; x=1724891365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uzg/nsI1MbFA5MFtMZllhZX1eeTJ8tpCl7jB3/2ZLrA=;
        b=eNMcakZQnlknhYq2ZF1dBUz8w7CdvbSlj1nRJ6r6b0tSE8sQ5XiNZds1ClqZmUvQvE
         8q2PEsjVykw2IEBppY625Ke15ewMb0O7JCFwNtE0cku/V+7hOAdu9tSDhulNLKDrXRDz
         yAX7+YT0sp7jKQHH7bl7OlKMdG0hZu4KTNuFpAxzZHxWQWFjabvq3Ak1+WOfpf1kIDcv
         fXt2QnFIGpOKMMC4qDbjvxvSsOxZZLX1cTG9BMaDJnOxdw9KjGyOd700wyw3ObMoyT11
         1kUeq36R26ZGHkW+H25wlXakhhOi79NY3DJtyCP0qBNCsU21VqR+81xX0PPUEEs2P19R
         jrlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724286565; x=1724891365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uzg/nsI1MbFA5MFtMZllhZX1eeTJ8tpCl7jB3/2ZLrA=;
        b=M2usgAd75lB92E5kuzpw5Ygu/OgkBTlbd+6MJHzCDgafQNnXlLGZTsnhI5R0D5NVsr
         ywkBA6vu8NqqzcV12kOlu9gRC3fZPWKUxGazH80jdHtgmeUNM1KbMLck67yje8vhfBxy
         abPGNsSBdNmWChchDD5pjMEgcvT6Rn5wGpqZgoeYuP+LRE6Z1n4H/vre9DhipiqhwZWO
         BjAQ6qnWXEJXHiYdPP/T4bnyTCEE8ezQrnlrmZ4zr+ucOp9EMDUfqoc4I8Ct5jQ7nQZd
         Z8w76F5OyaEi6zxr+bCLSKxQG+45Co6qQMA0gqmug4O00XVDI49ABslPc7oTIqua3AOz
         NhLg==
X-Forwarded-Encrypted: i=1; AJvYcCWOMlcTRVcPn+VFdl81nLuwg93JGIuXIE6Hs9uJh3IAlC2ewqkL+CV2TRzNVqXzSqLMQG9ULYLnV/QZ2pCd@lists.linux.dev
X-Gm-Message-State: AOJu0YxgCDSWJ1vMiXlmzsVfg1mTXTjhYUPx2XxsqCXeFGJJ8v/drHbK
	GU2B+Fv8iaFTmXiQN5sRbVfpWN1yIIAj6MxdJqpnv3w0CbDdLf3Z
X-Google-Smtp-Source: AGHT+IENhxWDehQMJE4AyEPrHbdego7IJ8NpsdReufgLGO+pv3fgRFxoZkTAFoOY5aPkCxI9/JlT3Q==
X-Received: by 2002:a05:6a20:d707:b0:1c6:fb0b:51d8 with SMTP id adf61e73a8af0-1cada03ebcfmr5668271637.9.1724286565048;
        Wed, 21 Aug 2024 17:29:25 -0700 (PDT)
Received: from sholum.unicamp.br ([2801:8a:c811:1:c632:51db:b42c:82d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203855665a8sm1740335ad.43.2024.08.21.17.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:29:24 -0700 (PDT)
From: Wallysson Oliveira <wallyssonryu@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	/home/sholum/Unicamp/LKCamp_Oficina/linux/~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: the alignment now matches the open parenthesis
Date: Wed, 21 Aug 2024 21:29:01 -0300
Message-ID: <20240822002920.11753-1-wallyssonryu@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The line 994 in the file drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
was not alingned with the open parenthesis.

Signed-off-by: Wallysson Oliveira <wallyssonryu@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 18b948d4d86d..c7ee71c60a84 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -956,7 +956,7 @@ void rtl92e_init_gain(struct net_device *dev, u8 Operation)
 					 (u32)priv->initgain_backup.cca);
 
 			rtl92e_set_tx_power(dev,
-					 priv->rtllib->current_network.channel);
+					    priv->rtllib->current_network.channel);
 			break;
 		}
 	}
-- 
2.46.0

