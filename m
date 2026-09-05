Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D454A13B6
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 12:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612286; cv=none; b=PO/+PQPhKyMPwOgXd6bRbemxMlqu9HjgFfHixvC38QefHq2fAclg73R//dRqjopsDSxEE3VrAfUKVFxZanpyTvG2YxdFCc0mM+PZ9lFhfAfev5fL+rclzyQhCG4DZ6mn81EiT27o+nXGXZJT8YaD2uZ3TrCoxt2CzlPl/8QRXtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612286; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYzSmqw7H6ClE/ejV0jCFs6gLUMRUNaMCQm7NfUkeIfN53gexoDtwKKtSgjgbW7u8y1HmmGszMQZWiH4oDv2hzC+uiLX/kRjAr3wmD0l1u6bAosmFcthDu9hD9tjEdAYJnNNuree3MHgeU7CgseH4QIYvyPSSBClDrd52QKQ5eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cgd/WxVj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cgd/WxVj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84eb992a881so1313935b3a.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 05:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612284; x=1789217084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=Cgd/WxVjcf0pPI0QmBAYfPD9l/KO/H69DiR1PTWxTKq7HFsXh1NfcnFpWU98/3v4Py
         7XkYQnOLzRzIyFC51YU2IcahQGJMKN/VBc2lnCLO2TW+e7awZS0ztdvrPFQF0RF7FTGL
         i2VzUXFmJSnfOFpWfUv4aSS/t8M8jPu/LFuYFCZ22HLwzTvHKLrn5nEEZjdJ9a8zhkWP
         rDpfjpF2TCwJbVp5pRDU5/hN/jia+eHi1ZuomA/v+7o/6EOQIorqA2Xsbkuu849726UW
         DQQIqv2jKVa8PZQbJ8rR2l3I1ZJ1Eg52APUCgtRl2xmsE4TEnqOYaPqO5PyQk8IKMZIa
         lsDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612284; x=1789217084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=G3VjlfMhkx+aFVB5paGnT26IqhyunZaH616fjMBQmEV2ghRgL4pqR82GqvoEO6hOfO
         9cBrAb7BG649cqDJZKDQz5HfI79Ynv5XGh7Q61rq+6orbp+Ex0zO2TnP6ZdvUTcF2nL9
         J4NJzy2tp2/abjEsdhcXKs1KC0tljVBaGHZfpJJBDfCtBlwavcKTPrOz/TbHfspn32w5
         0LiIGLWZFdTtgemF4M8qwc7dtyM9k4ob2BTzExk2vNqarj6fHYy7OfCHzgFyz97R2ayZ
         NJI1A4kmtLWALNveRFXR0tf7g/LQpSD12OZN3oKe9KTgUuExUUpAV+hFPcsg6po82riZ
         R39g==
X-Forwarded-Encrypted: i=1; AKwUvBz/w2dw4ukTdZhIFQMbM+VDQfwMdeAdYv7TdmvDvas8zR2TAdSjzBfyCLFYt1r/yLDzMSdHRH3v46XDBC+E@lists.linux.dev
X-Gm-Message-State: AFuF++kGbpXLAVv4WBY776ubFzRdIPtLkgQIkeWY7jFX3ImFGFrRnvRP
	J7vFLOr3nQkouKLqkXp9qdpAMOvwBZK+mYmDayS1DEuoc5U5S4BO0UlI
X-Gm-Gg: AYBFou3sK9JpVr7R73zHzWUhQqpTBbY1sPOA6g4N45/vSghnqE+Wj7Id6izuIWyimaQ
	7+Mw99qDjnMUEIaDrGuXrmIxo2+jkLbPPxKttwmz3otxOnwlo3adyiqiUbzeYdu8P9ixGSjtu8w
	R1LR5U47pUvFhtQCdLSdBXtnDZC5/++yvdeHzljaeViHtQ5pexKBJxCHVT8uQ2Yyz6gCGhvYXhK
	ScqRRK45/7m3cDuN1aFhYWULVAjWFsta00qX+yjOFHR2DZX4yYx3BV+AJmgxgfLuINbk23nPHqR
	1a6k+V48/VEiXaRBczxfBUvR8EI45aSLZfBIr9m7Yd8WQHBvowChx9NB5+bxGrASF1L9rpaYqZA
	tn7mJiTAn6RDV4cBG53qMyA3PHSGlwKEte6yr+xwF9S9zlC31YrvzTb9uCorGStOtHvYGpt42cZ
	N371wJRHZimJRWgNYYHperwFbPfSccBdCRTCm75LJVKHPxpTCeO0NKfAgEEbItDRBgliPswCCEX
	PdKS0t8XjI9ILRX96ylVdcwAKTsLc4u1mw+jiYbqjGc
X-Received: by 2002:a05:6a21:b97:b0:3da:15a9:a18e with SMTP id adf61e73a8af0-3da3a0cc429mr18182599637.23.1788612283674;
        Sat, 05 Sep 2026 05:44:43 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:43 -0700 (PDT)
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
Subject: [PATCH v7 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:44:33 -0300
Message-ID: <20260905124434.6163-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905124434.6163-1-breno3011alves@gmail.com>
References: <20260905124434.6163-1-breno3011alves@gmail.com>
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

