Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73903367F21
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 11:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546900; cv=none; b=NJbOClLk7jwYS6VACRhaZXoAjjPk/FAzDv1x88hLldFy22Qkf2UckGimcds+8WEZvg82eKgyGNym3lVLURyuXCxeBUPnqM+spKmgafhV5MAKMNkqvhfIzKbGaalQVPjc2g+4sf1r5WZJJpVONHb/5rrWG/kSqtDNFXBtLns8ZA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546900; c=relaxed/simple;
	bh=gYqI5EtspGPwx5u8iW3Fmzod1dv9OA0p12udKiIMvME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MICggHw4pd3lGNeDTlr3eSddfdnQ5z0uULPcKV1HzGweofjU7eL96k00GnQWkXL9ZUZ45kdA6weTxzMnsf4UFUP0XUoCbbvwFmQKyDXuH32+W+ad7RKcJYnaT/iNblT9nqIq4pWwbFK4hE4P8ddkjkZ2AgK07+LStmzvDN1KXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2NVffdx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2NVffdx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38deea72eebso7875447a91.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 04:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784546899; x=1785151699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQgOhqe+fAH2CG7iQ5S0HRBskMHSjjsvcQe+rh+kcis=;
        b=Z2NVffdxGgmAsruxqfKYjRW8wyeh777/HDocwVbe3oJ3+VHxyi9+Ctl6bWz1iJRcg0
         NoaSFv53243iLsBm3cpbGfPBr5/AGC8ZAoJHItwyjiUnzy9Us9/Ppqw2AJvCtLfAbw/z
         3CeFGxo7ZmRju9NUtR2uGPiwVo9jwFmTsREOI3iQReQcvtyrD/8V4K10z9WQWt2xblHH
         a2nSQ2uRaBciAMYsSeneOv8wk63hXck3ShJuE1yZF9q4GfXtGN2bMV8Xb/b88KxQPFTG
         jLgSmFvH0pK56yuYy0zWwA5Bf9yfx0s0oIYcqLkBFC5ifOhf7X1MCnKzGm3qlzC1HbCu
         jqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546899; x=1785151699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQgOhqe+fAH2CG7iQ5S0HRBskMHSjjsvcQe+rh+kcis=;
        b=shmtoZfg8e/pKxdwEJgNghh+5dBA7SvX2Rw4mDrrXD1Ri0pUuJq8iBKP9g53DqJ8i6
         sUplycIhxkSJB1RFvHgsCAA/zOrJXel/4h0Wl+cc7BNwLApRFdLLtfuEfMWkmiu18hi3
         bhASTUK5IvzgO0icbPHASyAyXxl3f3Mne9NdvYKewCJf9lQbt2zM06mP8TPjrQg1IABp
         UEqtyeXNGaUxgU651iGAjfdQwhxxs/0fCkqeCTQym49n8Y1aaSj1+VVTDUkIKIsBeeus
         +MeuwY4YXgCg8kPz0xmzH0UoK4FyW7VZmYMYjAtoiHY/EZM8UE50ynFVeOkMigx3TzIC
         Nj9g==
X-Forwarded-Encrypted: i=1; AHgh+RrDsMKCsfljwCebraBH762wgC4iCB6WhqaQ40DxmoErevFn1nmfZuVS4UcdZcL3rwRLUeZY19DEzy2VficU@lists.linux.dev
X-Gm-Message-State: AOJu0YyvQ0i6KLjS+iy6+gtbcwGSZQKtPLbI5bPIXUGRnVOFkhj5FAIr
	jBFN+7VZdd0odK7ehraOvkwYyloUgbbhMeg6mzS/PdpMIsPFzOBfNZ2K
X-Gm-Gg: AR+sD13JlDTlXrKYVlvJ+qaEv/RcDaLMwJpu2zeGvFKQ9G2QFdu8CSe8P6CW4Z6RYIg
	xoVSaQjhDTgMcZM7myTmv8Vh0JGjIkK8V6PFVkP909I7wEVjtdDyTSCpIbbKQ04wv25bJeDmcq3
	DZbwZDeJ09jAdcRUilH+F30NkIxjGPKJYMK6LiwMSXC0vFTxF7LydR+srj3nHYEyc324mk/tuGy
	iK9vNezFEx6Sb2/jI5A+C/Jpl4xtdxzcwyQIwh7a4H0LGrdNOiDxjTZ3fiut/Vc/LZuSGU0NWpZ
	oHA0ypIQuKlVCcmRUUvMzfutHqU2YE4ZykDA+lwQpj0p4NbA9nDecOJ/MXWh2RLFDXSLDXXXloq
	RsMuHMbUMQOGpWaYqYZzTI5PpLRBmSx7qd6tvk3R/oANM/Vqh62PN4DQUk3ZnGfqiM/L2f/q7Y6
	+pMuGQn5E/VYnqoIl3JtOwXYB3Kw==
X-Received: by 2002:a17:90b:58d0:b0:381:c500:b0d1 with SMTP id 98e67ed59e1d1-38e4b530574mr14528440a91.20.1784546898632;
        Mon, 20 Jul 2026 04:28:18 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.174.103])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29ffb13sm30500198c88.6.2026.07.20.04.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 04:28:17 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: error27@gmail.com,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: Remove pad_w and pad_h module parameters
Date: Mon, 20 Jul 2026 16:58:07 +0530
Message-Id: <20260720112807.6348-1-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy, Dan, Hans,

Thank you for the review and catching this. 

In this v3, I have completely dropped the changes to the debug 
parameters to keep the staging debug facilities fully intact as requested.

This patch now strictly focuses on removing the 'pad_w' and 'pad_h' 
module parameters and converting them into internal driver constants.

Remove the 'pad_w' and 'pad_h' module parameters to prevent userspace
from overriding internal ISP hardware padding boundaries. Convert them
into internal driver constants instead.

This partially addresses the 'Remove unnecessary/unwanted module
parameters' task in the driver's TODO file, while keeping the debug
facilities intact as requested by maintainers.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 8 ++------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index a2462fc306fb..7c6c0124ff72 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -22,8 +22,8 @@
 
 extern int dbg_level;
 extern int dbg_func;
-extern int pad_w;
-extern int pad_h;
+extern const int pad_w;
+extern const int pad_h;
 
 /* Minimum padding requirements for ISP2400 (BYT) */
 #define ISP2400_MIN_PAD_W		12
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 812230397409..d117fea2860c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -64,13 +64,9 @@ MODULE_PARM_DESC(dbg_func,
  * output res, and isp output res. however since we do not have this yet,
  * the chosen solution is the next best thing.
  */
-int pad_w = 16;
-module_param(pad_w, int, 0644);
-MODULE_PARM_DESC(pad_w, "extra data for ISP processing");
+const int pad_w = 16;
 
-int pad_h = 16;
-module_param(pad_h, int, 0644);
-MODULE_PARM_DESC(pad_h, "extra data for ISP processing");
+const int pad_h = 16;
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

