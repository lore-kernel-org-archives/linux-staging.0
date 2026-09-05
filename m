Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6BF4A0902
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 12:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788611705; cv=none; b=SHUPehlCB+mb5pYfxprBW73OVyYTbs/WchTc6c9jDIE003gGrJYkogBiTD21W8zvxBAlhryy5oGF6JAvaT50KIjGE+cCC89wkOYoyEjqBPhcznFxFT+eRyYY7xT5S9ldcAkSQ0MdoA2hsukMEalH3lww8Paz4YtgjOyzN7qiDQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788611705; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UiehRhltJrtFtv5jaPqLqhkXUr9Jf6tZfInyMi1ojCWAE96pMZkC6zYR7iuYMkkHgubgi2Jgax7h+T884G+yHls6zHPCQEwQDI2gemtFxhXn4TVbFxrRBHdR4ipFEcMEdB1PSd5sml66EJd1RG+B5+kNk3Lp4a7/MKtSK7l6EwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mj7d//wg; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mj7d//wg"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2349983a91.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788611700; x=1789216500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=Mj7d//wgcIgLGrDDTEtABAqV8/hJtRfGnWVWkVxfJTFsdQbFd4FZJIZ5hhgg161jiz
         GgQE4wQR1KJcV1sORLLT7dQFI4OkqmuwRRlN0+XP2qrYONvChwzTOXGlMEmDH2WUN3eh
         LJ6q4HqFxJOAygJguD7b3gAAuK9jv6V29FWnPs2b1MxEvy+0rjAkq+Bkp01NYySNuIJp
         rB2Q/CUgfKPw+WE7PYfdRHHVPM3+YIIOD/5VdweKAICvEvmHljzCHGzhTvR42h//hGW2
         DYQ9sJSX60f+1zn2gXD+//FFSYNQdlggPT9Ef+6TRYBk8fyMpiCdqU6RthseQsbf1iLS
         1TGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788611700; x=1789216500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=r7iGJXeOnt/VFAxSw/81l9RcWpW4Q4igqpfHY3aC1bVRIRtwnzG+GHYbgNS39E3iCo
         RERI8/Bt8rQxb1DcMS3FfOa1lQBGSkzKtGRr7QThK6+UYc2A2lo7PGLz3Eu9sStcGI6O
         ScM3O8ThWfz0ekI7P9U/wy4VpE5Tnc+BhfveIx6qlffircKhgp5i8IzvaRHtilyGQ8DR
         yDnFHuA/9hkEJktxNEzfjDrUGUJIi42hyoI3zSyWHSIVtaX6v0Yz1PTdIBDYMHOhgIxk
         u1odHnSd7ujyFXBg6xAEelpo1ZaeB08uaFqs34o2wej3t3Bc7FMio83p6ftnVn+VElET
         NaRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRbMx4cEmj2eRFs6rF7O2odEbC1rkjr4u1ADNGJrCTw/9n1mx8or7tt9FZdomhgScVkdOUWFXyxJX6Gw9+@lists.linux.dev
X-Gm-Message-State: AFuF++mVlbUJXzuG4qJ4I9iXqtPbQ4Y4MSHNkAcgiIwzuJWU6yTOs2lc
	JkVJZf/IA4WM/ANo3u+zbHtN5kzmBuKUUKwcyXd9ZQudteYuezF+TyXB
X-Gm-Gg: AYBFou2zDP2kO7LKhDLXbwESsQTP0XR5HTrlIx2H8hPRb9Da+KHNGmlXwjnBe7qkYfI
	q7y8QXiucpCOjy+FOIDN5lvyuZdp9MsK1vLFaxGBNdxB9YmrkOYfxPiuTz2MzYExhJBq/BrbsWp
	URk9acwz5sptn54W8IfQh7F/tUapM6LVotsxSsF14l6jLjScfbow8ICZeV54go06slK/3IGwclB
	vIlp9AQplvGMO4JJPqqDlhVhehpSC5yG3gh9YBUG/2ASbRmgFV20uC/QNeFBRxe88MT1JAaAmzy
	maASGC5iy+lZIvpUYEIaHPYOGUwRsYWRltMNwbIPpAvmnu/yoeTDh27xkpHh9/4lXQFBtJO94oQ
	N1R/FSV1/Ldki0qjHapQfCnbG7uBkPSoPzfYUQ847RaSa1kbPRufwJI/75fX6l9oL2QRkld4KCY
	ghz+IXiNR4a2k/2ZQR/GrekFr6vDOgRhEnUcb5F9Y4qzLRfZSHWbtNZgRR64CENlxz02UeWHpng
	qeGeYnPvjuLezoM2xySLbn7GsWfyZNb
X-Received: by 2002:a17:90b:17cf:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39b26216cf7mr18508993a91.23.1788611699999;
        Sat, 05 Sep 2026 05:34:59 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm13829815eec.27.2026.09.05.05.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:34:59 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v6 2/4] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:34:48 -0300
Message-ID: <20260905123450.5620-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905123450.5620-1-breno3011alves@gmail.com>
References: <20260905123450.5620-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a Makefile typo that incorrectly placed the mt6316-regulator object
under the old CONFIG_REGULATOR_MT6315 configuration flag.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/regulator/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 5a764cec8..f81d1f31a 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -107,7 +107,7 @@ obj-$(CONFIG_REGULATOR_MP886X) += mp886x.o
 obj-$(CONFIG_REGULATOR_MPQ7920) += mpq7920.o
 obj-$(CONFIG_REGULATOR_MT6311) += mt6311-regulator.o
 obj-$(CONFIG_REGULATOR_MT6315) += mt6315-regulator.o
-obj-$(CONFIG_REGULATOR_MT6315)  += mt6316-regulator.o
+obj-$(CONFIG_REGULATOR_MT6316)  += mt6316-regulator.o
 obj-$(CONFIG_REGULATOR_MT6323)	+= mt6323-regulator.o
 obj-$(CONFIG_REGULATOR_MT6331)	+= mt6331-regulator.o
 obj-$(CONFIG_REGULATOR_MT6332)	+= mt6332-regulator.o
-- 
2.43.0

