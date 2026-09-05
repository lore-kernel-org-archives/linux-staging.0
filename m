Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056BD4A2E2C
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613044; cv=none; b=SyxuQTYY4PkqjJWX7L7CevGs1R9R9yhZ50VwShr8afiLLcVILxtHtyr6mnrwIdnfsrhdaXgsb8SuQP7p9vp+YcaaHfOZWj2OvmjIduPbIFUlhmGjS1/XXH6KZweQk++uOEd+VhMhBt7FN4V48swGbpJASBziHcNhiXt7PSzd6hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613044; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AlteljqLCQVKO63nzN24GWfzVkN+X9V/KXteymk0mRzANLnXCe2sjiBxGFImRCPW3LcgdH6g9ipj0gTxQYezF7ohhVJYrtJW/QrCjikMbtuuo/Ure88oMA8VbSvNa5gWrLaK1J4Ohwh+09C6oTGlrj+xrDINd8bQKOHVBHMibb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aX++KLln; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aX++KLln"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso850088e0c.1
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613042; x=1789217842; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=aX++KLlnTyyzuXhFLAl4uertX8e07WjHu9m7qpfMFLbOfnG5gIBJKC01c1FAwQX4LQ
         lbuq6qbATBXIP6hW91gME9Ax8BXp15bSbZNgkEuHPYw9FkgD07yr2YeMmaMstT44r4hU
         328RoVn5SDUpvCIRUJSNqI78Qc2lh46JVS+WVmSEuQx+i8izDsLUgqrXNIuF0tqZtm2w
         O2EO4u7tnDhBhox7oUYRLOR55RuaVA7ta2O+Htk0y8kov8d1C//BRMf2B7TOHEq7IQ2w
         lKiFTpkPWapvVS7UHBon8UOOsFNOkne97yBETAwIRTlZsESBuNDf9OIIea4up/ExBxtK
         hCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613042; x=1789217842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=FBRZK8o8AtpMcAFV1qht9/zEr0puYPHINNcWNK2IPPzNHUIQNnT6WTxPhfUheBi+ua
         Otb7c9vJo9fjfoRZ6qNL0/uPZB6fYuZHJT2lbrgtXugcyRr3afrSGlJQ/vYIFhEAl74s
         XunnagMuBOKQizQZNoOqiaRBY65BwvAlWmNlHPBamAXkMMeyGmt/GHUQuLoMld6Bv1PH
         RFVhkgrh5KT/2IZ+/QHo6Aq1ruQKhWBifd/pMOGXyF1ao8GU93NUlQeSalB7uyZGWImi
         aOPJ1JCGAuyGGyxPy+4xXHXWMB4zJYgbMAc3hQdMSnx5TpEWMv/f6WpSah8yjZ8ERWOV
         baFg==
X-Forwarded-Encrypted: i=1; AKwUvBwWM8YvEOyNR0cQdznNTjtXDdAHoQjzgLTG2MFgCF0VxQcEVkctpkUZEnvREbnqy3s283IQNJG2qhzKZgrM@lists.linux.dev
X-Gm-Message-State: AFuF++np1alJheh2uZv1PtGJkaiPjK1Fy4cujuFN0KZ8YF351pon1S3m
	sMjulroYZnNVsqVwAgSsGSPdpeSDeyV0ART3HU2/ZB4JP8+L9WESuLqM
X-Gm-Gg: AYBFou2YufAHAFclSyJQ7Ji7YJ/WFuuqWJPq9+Wn2GyikT62D0g2ZwIMSA7J24Tt1TK
	kD+vizWfNeUcgs7ChiZDRCA2OWjInQCvLxbgUUi3XyEudj5nC18LbPL8gk/6YebUIFO5iPCjz0e
	HlekVPk/3Tuw1Ioy5cZtnBuo+H5IUJRzR1KCY6UlTGEkPLL+x0UfY4r6T1rZ61th3ZO7OxxY+OY
	gJQ2JfgdmD1fRi67uJeVDmzNFSN7qdXViR+LxzB0fRQLs7t+XfV+ehGsR2Ic2fSENZAfBVATxGK
	dxKAhZQfk1EP2UHUwySfx6NT8wJuHyeA5V4rksn79sFq56rG5Fplg5msecEDJWV2Y5VJIEDBLSP
	qSpFKS33AcDpRJzyCq3C4CNrcnwOWKSIgueN7/X75/GPRXFJaEY+KzJo/IvhpoKVWCJgRgA0Zwu
	SbhNaL8tzw1xMkr4mw5oECmvSuk954zOV3zpyp28Wl6R662rjMExLAUXT4gVTS3b+wc42Ro5Da0
	EbzcgDL6nKOVj4KlqVBL9QA44F697GvesMzsVrdoQk=
X-Received: by 2002:a05:6122:4fa2:b0:5c7:c666:ec22 with SMTP id 71dfb90a1353d-5c7ed407509mr5471080e0c.6.1788613041673;
        Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm4349416e0c.5.2026.09.05.05.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
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
Subject: [PATCH v8 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 09:57:05 -0300
Message-ID: <20260905125706.6550-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905125706.6550-1-breno3011alves@gmail.com>
References: <20260905125706.6550-1-breno3011alves@gmail.com>
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

