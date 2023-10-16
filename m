Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DE534CE3;
	Mon, 16 Oct 2023 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpRPv1kU"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so3895286a12.2;
        Mon, 16 Oct 2023 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697487336; x=1698092136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWwYlaRFlBZNOnbwWi1D/5pxIeYnW6pCz+TmV2noCe8=;
        b=JpRPv1kUbi8yBJxKV5lQkwMde2Z2ndtCahajYSKezi+c6C2J89MQyqlClKgevbIUnu
         wdBz/ZGczPRSGxsMoM/DM7+9LReSe9rgh7taFc4a9ORh11H3yM+nheCkM0LPvbT5GT+n
         gYWQrzxzFb0yirmzrZet5F7/ofIxTQM7BrJv5mrZ5cIoQuogPRwcubOZDUh6jAb+4fmh
         zZ98KMnLh7gG9/jFcHGIqWcyJZ4VOXlOlGRZ/gD/or7Acu4dDTMmD4YDNT52WE7fKuMj
         T664LsFoz9Q1P2s1v8lbUlsa+DEzCLijktmrj1um4PytbduP/pwZVoWIyaQamsYpJo8G
         Ey3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697487336; x=1698092136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWwYlaRFlBZNOnbwWi1D/5pxIeYnW6pCz+TmV2noCe8=;
        b=ivdfGO3QV5NoA8vuJfKpGchYN1CAiD3SF1Bz6v1ihZ43cMPxiBtl/yuDK6zIJYboyG
         Y+r+BZDwmL5ZO+x+6G/Ud/kIf94kQd+umFnSk8gOXa4TyFmRxyW0xiY6zYzy6ZAZS4aC
         kzsy9QAkEQv9BQfK2vakhX0TBqD8m8hF+xlnL+5t5kYXAp04dcQMNgSMG0u0gTgZVoqi
         HmcPP2867ohLw2ATqivB9UYWFV0OreppGVmahZXTmMVaQ7fiZbeKw5xL56AvkHLYq3YE
         dWH4u/hu9y2jtzgfhgCrPvtZNgEiOHY0QXsTs9Ho/VijtNY6oZrrrGCPYbMiS45dGoB/
         TNkA==
X-Gm-Message-State: AOJu0Yy6zys7vvhAEbZmtYvDVIVYaPKk2bdaCCSb/ED0HREMdPMnsHCB
	ZzsRRfZd9V+R3rKTYPLD00ispqq8x+1dsg0=
X-Google-Smtp-Source: AGHT+IGJSdPocqhPOmarYwovWzPyDfGeS8QtO/7KpgvqKud+6g2Ztpv0Xa9D1qNWuY2xtlBrHYcGGg==
X-Received: by 2002:a17:907:2d12:b0:9c3:e66e:2006 with SMTP id gs18-20020a1709072d1200b009c3e66e2006mr101565ejc.9.1697487335730;
        Mon, 16 Oct 2023 13:15:35 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.1.143])
        by smtp.gmail.com with ESMTPSA id u26-20020a17090657da00b009b97521b58bsm4606055ejr.39.2023.10.16.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 13:15:35 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] Staging: sm750fb: Rename displayControlAdjust_SM750E
Date: Mon, 16 Oct 2023 23:14:08 +0300
Message-ID: <20231016201434.7880-2-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
In-Reply-To: <20231016201434.7880-1-anonolitunya@gmail.com>
References: <20231016201434.7880-1-anonolitunya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function displayControlAdjust_SM750E to
display_control_adjust_SM750E. This follows snakecase naming convention
and ensures a consistent naming style throughout the file. Issue found by
checkpatch.

Mutes the following error:
CHECK:Avoid CamelCase: <displayControlAdjust_SM750E>

Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index e00a6cb31947..8708995f676c 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -14,8 +14,8 @@
  * in bit 29:27 of Display Control register.
  */
 static unsigned long
-displayControlAdjust_SM750LE(struct mode_parameter *pModeParam,
-			     unsigned long dispControl)
+display_control_adjust_SM750LE(struct mode_parameter *pModeParam,
+			       unsigned long dispControl)
 {
 	unsigned long x, y;
 
@@ -125,7 +125,7 @@ static int programModeRegisters(struct mode_parameter *pModeParam,
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
 
 		if (sm750_get_chip_type() == SM750LE) {
-			displayControlAdjust_SM750LE(pModeParam, tmp);
+			display_control_adjust_SM750LE(pModeParam, tmp);
 		} else {
 			reg = peek32(CRT_DISPLAY_CTRL) &
 				~(DISPLAY_CTRL_VSYNC_PHASE |
-- 
2.42.0.345.gaab89be2eb

