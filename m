Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0696A138E
	for <linux-staging@lists.linux.dev>; Sun, 21 Jul 2024 04:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721534818; cv=none; b=pEVjVtKYgB+GDr1rsyjdlEGgEtujbyJVuDzZecacHUzGYZF7MpxorVhfdBWEi6fkCi3Huogh8rWuBWJGBqt/SenfUR6O/XR5aW66qHgKu+99C1r0jRMfSVSqmpPNNGB7qL+Ift49nZmtOW6NuGUQToyP5ASSnoClrRX62CbI4j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721534818; c=relaxed/simple;
	bh=4PJgdJ5/4G+/KqfQOl8Azr4AhTP13XdKt52+h7gUc08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OeBfFTp1gQP/Vgw94HdVomZnfyVVypsiji6Nh/8uySONQhERFHNFZaprhR0IPEl5elfIATenApE2hwobP1E+JdFeK12VGJCxpUKth0q172vqQkgsQ3mZ13w796XclcKjMJK7U9O8NVde5173cOutJWS2Wm5CbBp3jS+RI9uCjNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tvs5YRpm; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tvs5YRpm"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70d24ee79fbso33086b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 20 Jul 2024 21:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721534816; x=1722139616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4kd+SD60E5jzlrNcow7W5V4sQBkb4dpPb+4c9X8Y2is=;
        b=Tvs5YRpmRp9fl+z+rgkE04MZ4UfCma0YTU8Xue02bnv+vupzjLZCbz4waoT9jfBTDZ
         XL/65J4HV7Upx7ZuUr2vl2vwJS5ual+yTWB8MWXQSykp7LidxXJpcdwJB9rN0n6Rm23i
         FdLV07WwLJtYn161r5ON7WjaPUMTqdYBE2mAxnVBX+zTPct5L62PxSWKQA5AuIOwRTEv
         vKMOEO7OnrxIiXXwZGa9s2tXYbFHVXcmc3w/RDCJeJ1jGj2XguNvBaw3b2blLFH4YQat
         T3BzTBLFba+0aLE56yj5dGwjiW61acsdDb2teB+r2YYtcbBFpwlu6i8InttmKHGm6uO6
         c8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721534816; x=1722139616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kd+SD60E5jzlrNcow7W5V4sQBkb4dpPb+4c9X8Y2is=;
        b=o+icMBJWH7NNXRyVPGOUsZOzuCKdfbwxz52IESFh8JImM1UruxXj2ySGmL81MEPOMo
         0qAGiVyOxRP2NZmh4hDYiacfg2EA2oQEm2AK47HPCx4zVfpddyfUFT9ET6M5/5o4oNLa
         A4L5S1aXViv6PGSM3HH8zcAAOPFqUs9KHIrlr5e/xu2mQGiyu7T3GGc/CVnGxxTsiz2O
         oqh3FhOkTxJzfXRLUQn8D9Gq7Vsnsxkr4GGH4HiHGnhcAf6WdIpXYQKWIJJAPOQWfDJV
         yNdpuKCiBfflk7DzvJKppJ3AJ59NDCCMKGgKaFUXZsgP1G0mbdaBw6Ln2mfUhTrMfwxn
         nYJQ==
X-Gm-Message-State: AOJu0YzyTSi3Pu0JzUOCAv/tezITF2mZfVw1mOUGwdb8MkeOh+2wCDHR
	wsLNYcAhFzUTQJWyOg5hc3GaVBTQ4M9AdFmI3zuRUZ74NP/sgy5b
X-Google-Smtp-Source: AGHT+IFxWP1DbjpsDo07AJnnWxz4ONLiiln8OcWiNuBPmt5LrOSLN2m2UzTKuD+q2rktearo0gZMCA==
X-Received: by 2002:a05:6a00:a90:b0:702:6f45:effc with SMTP id d2e1a72fcca58-70d085ede59mr6025925b3a.20.1721534816234;
        Sat, 20 Jul 2024 21:06:56 -0700 (PDT)
Received: from localhost.localdomain (7f.84.a880.ip4.static.sl-reverse.com. [128.168.132.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d24a0bf3asm100147b3a.179.2024.07.20.21.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 21:06:55 -0700 (PDT)
From: Cruzer-S <yyyynoom@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com,
	dan.carpenter@linaro.org,
	Moon Yeounsu <yyyynoom@gmail.com>
Subject: [PATCH v3] staging: rtl8712: style fix multiple line dereference
Date: Sun, 21 Jul 2024 00:05:04 -0400
Message-ID: <20240721040504.1483-1-yyyynoom@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Moon Yeounsu <yyyynoom@gmail.com>

It fix the following checkpatch.pl warning:
Avoid multiple line dereference - prefer %s

Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Moon Yeounsu <yyyynoom@gmail.com>
---
v2: Fix email address and checkpatch.pl warning
v3: Fix incorrect commit index, start with new thread for new version of patch,
	place notes below the cutoff line, provide appropriate CC,
	include 'Suggested-by' sign for those who gives good guideline.

 drivers/staging/rtl8712/rtl871x_cmd.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
index bbd4a13c7bb9..ffeb91dd28c4 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.c
+++ b/drivers/staging/rtl8712/rtl871x_cmd.c
@@ -528,8 +528,9 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u8 *psta, u8 unicast_key)
 	if (unicast_key)
 		memcpy(&psetstakey_para->key, &sta->x_UncstKey, 16);
 	else
-		memcpy(&psetstakey_para->key, &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].
-		       skey, 16);
+		memcpy(&psetstakey_para->key,
+		       &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey,
+		       16);
 	r8712_enqueue_cmd(pcmdpriv, ph2c);
 }
--
2.43.5

