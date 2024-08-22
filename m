Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A1F3D69
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724287565; cv=none; b=UNurTYfgW3rZ+WZEBgFKjU2hj3AdYIYsYSt6B8k+4qNNkMn0p6iSY0ZAdDVizjZwkUElaUus2/BycXFqenZUgR2RFoxKPxN+L0cg5VWZA8isQ3vpO0EqZWGhWD3d8/uoAHgGvTFXmDBFnfGsVIoTX+J1wGuM5eDl9/9aJ7Akv/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724287565; c=relaxed/simple;
	bh=xbhdrzXBXQGFHkBi7JVQQnh/qFFqzJW4jZK4RQf97gQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type; b=nvvymVCTf8xxBPWiY7GbTIr9pJk/w0UgWbvbw00jATcP7UGrUbYjG9CdI2wCEMFj0myl3EW2TMKE8xUUQi/rLP/6CZhXg6e7j5MYCA/aq1Zf2LJRBlE4ZcM5sMPT3KlsnJ1hKmo/mNBY31frCreSIF8r/8LMdIoP+vEbIv+YB0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqE7kX5o; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqE7kX5o"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-2689f749702so134286fac.3
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 17:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724287563; x=1724892363; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iBNlowdOWSl10OVciaBXJoWLTKHB1MfSEqNmoSmAPy0=;
        b=mqE7kX5oOlZQeOTZizkgjo8+z6tosrtc674SXbXIXAqay2K1tu9p6wjDgw6gGsMWbh
         9SnNhYTa26yIDaS4fXiT2r7RC4dZiwPDplx9I5u5JITdhneT6iIGOQil+l0SkfcJCijG
         rvGKOREr4PL/jxPI+tKPBE3WI42I2vMKsWPp7G5v2HuDi6koNXK2hqRvrP/JALalEnMP
         RqiE917YGh2MgXzI1uMkqkuKMqufrHVq+pZroRaqqqPVFkvEhfMQi1VVZKsQuL1mI5rU
         pGwOO6THvrlrrn5AWNPd7lNFWI62rIi+Dc6XlL91gwKi65b2LwUxzcE/OEYDLLvISH5j
         PZyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724287563; x=1724892363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iBNlowdOWSl10OVciaBXJoWLTKHB1MfSEqNmoSmAPy0=;
        b=oQKHxhYF/EkfyHF/8WvYgwIPgJw8aSPGPHZEPCVa090sZPNI2zsAHdTDKuSaecnRgd
         cSQwh+XZ1d4tqjYuKbQBvLdiPsqZzPMjsYw4RL4i2dCELnPPbVSzNLBNdaEiLOJqnbEQ
         /apj+TCOsgOr2jkYrs5NZLOVAwEHYjGT/ebG/NEfzqSsiFcIcre+n9iHCZD263rfTZfO
         oeyruugL4D3iOKUzwyCN/tF8ekGoOugSlosLgixLCNH+yqCnXvjL9op5UiEU7m47D4LT
         2IkW5MN60MohN0386DWmD8GYvxgb67ak3wLBtOuPy4RI1DQqSbFtVa386z1sdfCSipZB
         j5YA==
X-Forwarded-Encrypted: i=1; AJvYcCUt4JjpcYgLU6tdN74GEjWha5hA+CJ7WjFwva9mgWqQLAVzb6yK3aCE8HYQHxH7MEyAD5RyM0ryKYa5iwpY@lists.linux.dev
X-Gm-Message-State: AOJu0YzRsCxtaaopDpDF/Y76RiAmSX7GhGRMsEWvhcwo8tNeM3mBeP9Q
	l9YtNrxXvkQ2+qCxHiuhFlvmOLEI1BMV0u4IqaiC0CCW9B9dWg59
X-Google-Smtp-Source: AGHT+IH/bjf1naOOqPi5C/0NuQzz4PHsm3FWeNxQhSdv0/HWm++aXaJE5hnZNAX492lNQZ6AiiZ1TA==
X-Received: by 2002:a05:6870:80cb:b0:261:211:9d0d with SMTP id 586e51a60fabf-2738be524bfmr4580052fac.40.1724287562771;
        Wed, 21 Aug 2024 17:46:02 -0700 (PDT)
Received: from pop-os.. ([2804:14c:30:24b4:ab5f:4663:351d:b821])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342731acsm252928b3a.88.2024.08.21.17.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 17:46:02 -0700 (PDT)
From: =?UTF-8?q?T=C3=BAlio=20Fernandes?= <tuliomf09@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix parenthesis alignment
Date: Wed, 21 Aug 2024 21:45:58 -0300
Message-Id: <20240822004558.14638-1-tuliomf09@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix parenthesis alignment in rtl92e_set_rf_state in order to rid
the following warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Túlio Fernandes <tuliomf09@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 9eeae01dc98d..ad21263e725f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -173,7 +173,7 @@ bool rtl92e_set_rf_state(struct net_device *dev,
 				else
 					priv->blinked_ingpio = false;
 				rtllib_mgnt_disconnect(priv->rtllib,
-						      WLAN_REASON_DISASSOC_STA_HAS_LEFT);
+						       WLAN_REASON_DISASSOC_STA_HAS_LEFT);
 			}
 		}
 		if ((change_source == RF_CHANGE_BY_HW) && !priv->hw_radio_off)
-- 
2.34.1

