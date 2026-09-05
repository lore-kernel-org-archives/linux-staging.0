Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972B649E5E9
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 13:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613781; cv=none; b=Aldizi0XuhlN9WuseYaQZ+ilyoc4ul+k6A8pid0XP5pSirYcrdEN6uQ4l02fkWhPXtXGIWwcJO1pBk8UPjJjSH+lQMJzdzYKW7XYba47kBpy9w5ZbkAiwAMgKeylTrq9Vq4rBrn/Uo0txsm1RTkNkPYsgC0+0R9CLxRnUwwDKcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613781; c=relaxed/simple;
	bh=fqRQGN2NtOQEQ6U4DtETKEyMZbTPYavOTcCPLbSO1d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z+TgjJ4dHBsfTcImtI3NqxtjET4ABZOFFMtUXibYrm/ssU/g7VOIURHZ3l7+PmYV9kGSPYaXAGhDO5SUfsQXzRQ2MGkxFQ1LxibuCj+XxTcXU7saGszBTTXzBnSw50g0aT5hiMBxCE9OKgx5+wmojv1+TOlvloEr8ufFTqAmaiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xo4bNxqz; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xo4bNxqz"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97e986f1996so531420241.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 06:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613778; x=1789218578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=Xo4bNxqzo19xsXQw7NhjXT/US5ywMuzIEc77hV11r3GmOnjGnINd1T2lcj8uMKXhDY
         G8aftaH+JLTVR0rwv43ORrspS3BeheLMq+18PJwQVIxds3Zcv3jsRur8E8hUVxWSHGp/
         fgv8mHvV1tRnNoT9xMP8kVVLcQ6BOVAexy42nL56MAYxscH9hPklYkvQyWmlPkdASEFY
         7KACOIL97K720KLLrRI64R1faQRIYPN4qdWS/xnRKrpQng9DRu683Yu8niOLfhuoZz08
         DYrUXaxMSeBsWa4qN66QrWJkY3X7NiIyP0kUVg86O6Dm/DHFgJwEbm09xCImwUdUVSn1
         DhBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613778; x=1789218578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mxz4lmsMfRQxpCRJ9peAz4eypsaiH2KPm1iFXpwcLu0=;
        b=rZDxoTnRhh3xjEIDlUZOgNNk67TxLdAxyKy/hHzEkS5N8dfrbk0AoEdcrz/FRQ51Yh
         /8tdsSHSG/BlCbcl/QeK7CPqQhtlttLWTvBoiW/imYe2uTs4RwiYI9msLaRGM47sK5WD
         /ne6AiBh72js06DLZsbatF2jW185T+kEBaa2w1W1ro+fNhkdh/BUh9MouMtgCvrVTmkB
         gJDNmQz7l5GvWZ+9yPpILpFr6Jv3wRBz/RkVgVzpPpsS72pgIwUX8L+7o1bvog10tN/a
         Jn3/bCd4II/WmSGUSCWFKlppT8KVB/cV2HE2xmiUFbdEDGXzjx+Kvh8KOIe+MnSDieLc
         CogQ==
X-Forwarded-Encrypted: i=1; AKwUvBxR/4SVUe8+y0ljSTwvmb2lYs3VudUoXYuD04vLHwx7wgXH3kUvrxC3DxEFmj0J4Qj6BihYGAuDfIvs/sz3@lists.linux.dev
X-Gm-Message-State: AFuF++lIr/SVZm82QAk2BqFXP8gLW3xYivSIYjfCZ0emVeoKTFbnOedO
	pcO0uAhVjU6Uo/1rcm3WFtBKRrXIJbrNLOfCPRtF+aMtF82hKpGEZLOL
X-Gm-Gg: AYBFou3IzQ/fq1dNG3xSyi86XnsaPmCnOKyGuICm+DH41QpM+rC6eF+PKyuDjR2bdQZ
	O2hMEd6MTHGjG89wYUuKYQDRRrGrfpA+yaNDAqc7gHfndYm4Jg2yk5jPeDiXiy0tAU2artVtuEz
	CbadgwcfmHcK3hIvh9FeNHhOobGQHBiHRAjOPcUEri9dcwbTquatVywDR005Ev+VkIZajwTO+Rg
	pvaznr8Z/ITman8XDv3l4eWfuAKebHngr5CSEGTwUyiJvdbYzEskYEJDP2Kn+w+8CTziEf98qQs
	O6nP+LXyrqhgroM5iJmf34UnHz54nhIRirEqoOwgadD6vyDS1xCl7Ii8Hzz4wakrDOwdkqVt/kw
	1ZToz7uqr1G7ZsU+x/ZTW9fv4LM0HLxEmsWDKYLjh8QGYTVNyknW5nwjbt1NXbJGiXTaWb30RYt
	lz+J4ncOmLfIPWvGnW8ftqHENOLUvgy54xXORsuMY9m0ze/aRjiXOikINL5iYXOTQCPJZ2a+k+7
	gUCezSfJXiKr3khfwdUCIy3Bt11VuT/JxoaEC7Cxrw=
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr3774484137.0.1788613778353;
        Sat, 05 Sep 2026 06:09:38 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47a76487sm3719782137.5.2026.09.05.06.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 06:09:37 -0700 (PDT)
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
Subject: [PATCH v9 2/3] regulator: mtk-spmi: fix Makefile typo for mt6316
Date: Sat,  5 Sep 2026 10:09:24 -0300
Message-ID: <20260905130925.7115-2-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
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

