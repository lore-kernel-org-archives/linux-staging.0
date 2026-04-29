Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B2F40DFCD
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777421796; cv=none; b=kA99edlxkMHEMwiCEbe7q2YBXk1aoB5dr4ErsHj99JUCtSkyGkdR+Ye4ph0oGv2c7dQRP8tsGsydW84IMZsaBQWqgInsrjqCV08SfrKJ9Jmt8vbu5Ep8juNUnn6mK2nnyLJhbMxKIMXrGs4p28Vpl92nRKQnpEHMSCAenwHxNqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777421796; c=relaxed/simple;
	bh=MYkC1lGgmyF61CGHkzTO951DZUc25ipo5CaYXUYB1s4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V0Ea9DpkyuU2gQ0inHJZpBCRpo5K7K8cSqeXIbHDKjGOG0thtl1x3Z2kkyBC+Ndr3kFpcxexfn4pMpwLsb24WwMRDzfyzl38VaLhy9mJiYLEWfjdtTWE7jASq/XC7an5e1DD+5XioWR98k21HI7hm6SVHuHGYNlr/MG9l1Cybbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnTgnAM9; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnTgnAM9"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c70f91776fcso4757442a12.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 17:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777421794; x=1778026594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IxLGKHb8A2XfyprIdpvTidPgjGnBvN3bS6Ed5BUmYws=;
        b=YnTgnAM9j2+ysg+a0ObsLQzDQs3NFlQlHHcyXnxd2vmDKpyOS9YjVMjZV1gb6l4y18
         7CkvIzdHuJgi6XhEIHUvzVa2O8T91HPmIV3OMnjmYqb7Sv9A2zNMIyAxIxKQhblhgnjC
         F5pJ1XU9ngQ8tzlYqGfjpO0nmdXDr7YHSd51AeespN5vqKB2T7rhHcBabla9AKJMhwXR
         Kh8/fjnrurGNV6ZnJ8N4dbb3lDlSjtgbS0evizR9t07gGD7uc+zgCGlcCXpNb8AKWLHH
         Q6rHkGgNMChFskYsJiwbaJCMl8vt+MDv+yDqSqYpCbDtJZPi24K1HY6wB7K/mPEu8VYd
         MF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777421794; x=1778026594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxLGKHb8A2XfyprIdpvTidPgjGnBvN3bS6Ed5BUmYws=;
        b=RKtaSp2SWPOMSomLA7BXFeg39Td4S+aVzmpjALRgTr4HlhZ41RjKDzn1Hx5zD0i1RI
         lLCz8Ttn3FhvD7dv711wiA8wzeNkuulv4z7IX+Y6doucMP0d4A8037/PhPrEX3s47zIr
         JPYugPQt+jyB2k4vKR73WfYh+lo6PMLBrcwEsE9oE/dpEMDal/FWy2TZ8k+LaKnwd8fy
         k/qE0rfQQ4TSwB2PBDT9WzHa+3T4Q4GL/4/962efWhTwu/le8v+S8Urj3qfGx+eg+FGa
         CX/u3WRuc083xnNeuOJ4mU2oJO+IkP86sA15UmqF7uwFYAjHsmc8t16F9VEDmDFE6sBE
         t2XA==
X-Forwarded-Encrypted: i=1; AFNElJ96aFQXrSvwXyXVHMK95QOPzJ5Ol76DMBxCqJqivVhXo7DVq1jWDHe37rtOJtz2btAkQ92uodeExHtmWuXl@lists.linux.dev
X-Gm-Message-State: AOJu0YxlyAm+kQ7tuJcRObqSRFZ6t1boMGiG+svQtIgzIOCgsJK6VSL4
	GG19iusDNvW4kqj6KcvsZ9/sdZo9bDCI/EQ4BTXoWrpeAy3wuhTz991r
X-Gm-Gg: AeBDiesDwvokUA0LxJj31CMf/3aCrBxYVlt03RK4L2uTtjfO/ePHQSTGrkBX3GFP/CL
	lKdslkDnkmngceQ6v7tLSjICkTMX9aakZ6/RNJh9MfoSwrCTKj+jI4PUwvr/nXtMAEFGg+TDwZJ
	KYxJcfmtrG1fIo77QKaNMmQSjwLokbbTm4eHoifyojG5Fv5wW+ZRX0EVXxS/51DcjI3brLpGVJn
	5fvm+iULqierPEQsP6YQcuszGmGUdXOaWM3f+mABAGx780OF5z6jCj/qxo4aVp4qqcRdTrObcZf
	U4Jb111Tb1nkMCa+OPSlHROvpNxVt8XOtIKmCZr/ftdaTgX3ebdFSBS2X89eR530VJ2M4Z72rct
	NV81Ovmc4gwNoaglwfMxcLJIykCeg8ylgwgtNFmWYhnrLimkychFaZ07Z/KTZh65Q0SrxkED88o
	VZ/MFRJSMs1LE48ri97W3a8S2A2wVbFWUDyr0JUH0vPE+dxUxavO7MscTASDQt3yJixzWQ9YU4K
	/ITxGqvXv1hx0nZOhPN+BZ8bI8=
X-Received: by 2002:a17:903:1b30:b0:2b0:708f:4dc7 with SMTP id d9443c01a7336-2b98742796emr14684505ad.29.1777421794116;
        Tue, 28 Apr 2026 17:16:34 -0700 (PDT)
Received: from archlinux (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b98897edefsm3493465ad.74.2026.04.28.17.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 17:16:33 -0700 (PDT)
From: auth <skunkolee@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org (open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Cc: auth <skunkolee@gmail.com>
Subject: [PATCH] sm750fb: fix spelling typo in comment
Date: Tue, 28 Apr 2026 18:15:56 -0600
Message-ID: <20260429001557.71737-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed suspected typo in comment ("programe" -> "program").

Signed-off-by: auth <skunkolee@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 7163232c0701..6363a66d5570 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -82,7 +82,7 @@ static void program_mode_registers(struct mode_parameter *mode_param,
 	unsigned int tmp, reg;
 
 	if (pll->clock_type == SECONDARY_PLL) {
-		/* programe secondary pixel clock */
+		/* program secondary pixel clock */
 		poke32(CRT_PLL_CTRL, sm750_format_pll_reg(pll));
 
 		tmp = ((mode_param->horizontal_total - 1) <<
-- 
2.54.0

