Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4FB2629D
	for <linux-staging@lists.linux.dev>; Fri, 14 Mar 2025 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973484; cv=none; b=TWm9qLjdw0Y4+2vIHy/IbrjNbUHPuB6QwXh5dRr1ELNcgpTpnxrxpmX7FG7jcfvVyg/R6gtLNstbiOKr9QRQZchFTMq18XGK1vn+2R3k0XWM0sfpiEFQft3Y/MMv85DbHEY4RhqbOAJbTYsHC/XEcqrxP5Z2TWuJUBuG4Gszpjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973484; c=relaxed/simple;
	bh=lQHiypFcLak6lsLXoWDwnUCHVk/PPGA0FiTJLIOtutE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cYxAIxbeVswWtbU0xehY2UrmxfVIYl5S0hwCsCKiLnUsTN3Rp/2l4EdPD3DFmVuklBYjOetE4E7KneVNRnbeE7kC2L3bcu3LctJV6pzh7SE47vPETg3KS3+qls5ndwFZmvYW20kr+YJYZOUTxQbeZvNQNtvXw374VlW5dyVGxEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7lvd6dW; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7lvd6dW"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22349bb8605so53151115ad.0
        for <linux-staging@lists.linux.dev>; Fri, 14 Mar 2025 10:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741973482; x=1742578282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o2H9f8fayNTLuc4RxM/hrBITullJSe5ENEpakpPOGu4=;
        b=l7lvd6dWu3vuDHVfYsPvuWCTh6Kbr6WzgnZ52B/YfRTdCg6dakGdL6Hzi39uBa5uQ9
         fJcRTKFe1jz4YUMHACwPsGum6l7OpY3sqokuTqW7axtT8IPShRWEj66U+Tn0aH4T48Ut
         rQhmQWMEa6qTeSxEi3i/H5Hqw6A0LxOb383wlIsVqeomYRx+UBHDj/YbOoSZ8bzoEYCK
         HUHQYyBBgKmjvVYotEvoAhFe35+DxEaN1d1/zDdkB5jhOfzo0WmSSwA2hX3bHIHy83YR
         HE0R/SvMk3rDyLLUgZoj8Dmi2RhKRDTDVLRi/3yLOjkoSaJxwwLF10P7AbYbOe+iPklW
         Z4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973482; x=1742578282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2H9f8fayNTLuc4RxM/hrBITullJSe5ENEpakpPOGu4=;
        b=iWk5Hv8SCBOegnvO63SXJDsYLdrGSmqkUY9V3Ihsg/4tPYzlvLm4s1CZou+w4AXAAn
         lndM8wk06Xby9Nek0IuquiCirRRWakEUqWsca6TEDUSmp/ESVe65bnfiKPQ6bjYSqPRU
         hP6Q30PtHylFkwaiDQtJX4dPJCb6oEZipDSVQvNLJ1oE3Nfvz7QS4c1SYn4rr0uTc582
         Y55d4vCIny4JlTurO/g2IMrCdZLyYwYRyi5MhjJ2LXs1JBq4c2QVZa3D07rKxiiIf5r/
         KHOGje0mzx3PJEkYHbNf0xp936CZkevrR15zBvNsmhGtbePo3a/ggIdzXsxeNtmNI8wd
         tUHw==
X-Forwarded-Encrypted: i=1; AJvYcCVTAf7R9JThynMmwPuqg7HROhwaqha88INPiC6iFoyDPKRxoNZVrwrRYW0bpmC3OgF4ALFeiLpm8yKf2t3C@lists.linux.dev
X-Gm-Message-State: AOJu0YzQZgvBHgXXsQy3XjJEKQzpw4Rw65oBbPG+OPCuSR/xgzv2oyNg
	XUDt743zg+57IHu0q81fxM+vf8lrifDsRT0dr6qFo+FGQbAv0N54
X-Gm-Gg: ASbGncs/zylxCQBIEK8+4NnLgdWJ7GfjCut8Bk+bXYbZHofZsnDtWHbMyWidnLJQ2X8
	JyK/ry+crON2gRJn9/DsgvBrR3Tv5lwLP60khm1h0O6FRhouR6OwhXHjxmI3Ei9JFYD3DHKxqpR
	ShiSYxR9e2/7zCCCoUHCyyMASvlFvro7lvKGes+J2Rz0rqJpuecmjxdBReR/f/Cy9TO4ogbkmQR
	isH7FqPYEtnFPB2rzXmurruT9NEWOcwJufBhJaP+pVb6oIptghcGf05L9B9HpzdzPtX9/mBV9ti
	FgqMQDBzmc7A8btoZkJgq/wbXi75ikP4dIsLvzxA7ZpfN3DFAo0=
X-Google-Smtp-Source: AGHT+IGW1ErhGDYOgIoHp1zxSvP+OCdC+KrhrI01W0s2eDw5SYAFJ5Fu5ht9zU33PZPMd68g4r9Xfw==
X-Received: by 2002:a17:902:ec83:b0:223:3624:87b7 with SMTP id d9443c01a7336-225e0a4857dmr30165535ad.13.1741973482001;
        Fri, 14 Mar 2025 10:31:22 -0700 (PDT)
Received: from Grommit.. ([2804:7f0:3f4:18cf:4497:3613:11f3:bcd3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f38sm31160435ad.129.2025.03.14.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 10:31:21 -0700 (PDT)
From: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
To: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] staging: sm750fb: Remove unused enum dpms
Date: Fri, 14 Mar 2025 14:31:09 -0300
Message-ID: <20250314173114.4476-1-lima.gabriel.luz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused enum and replace its usage with
a unsigned int.
add comment to ddk750_set_dpms function for
documenting state values

Signed-off-by: Gabriel Lima Luz <lima.gabriel.luz@gmail.com>
---
 drivers/staging/sm750fb/ddk750_power.c | 10 ++++++++--
 drivers/staging/sm750fb/ddk750_power.h |  9 +--------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_power.c b/drivers/staging/sm750fb/ddk750_power.c
index 12834f78eef7..547a96ccba9b 100644
--- a/drivers/staging/sm750fb/ddk750_power.c
+++ b/drivers/staging/sm750fb/ddk750_power.c
@@ -3,8 +3,14 @@
 #include "ddk750_reg.h"
 #include "ddk750_power.h"
 
-void ddk750_set_dpms(enum dpms state)
-{
+void ddk750_set_dpms(unsigned int state)
+{	/*
+	 *	state values documentation
+	 *	crt_DPMS_ON = 0x0,
+	 *	crt_DPMS_STANDBY = 0x1,
+	 *	crt_DPMS_SUSPEND = 0x2,
+	 *	crt_DPMS_OFF = 0x3,	unsigned int value;
+	 */
 	unsigned int value;
 
 	if (sm750_get_chip_type() == SM750LE) {
diff --git a/drivers/staging/sm750fb/ddk750_power.h b/drivers/staging/sm750fb/ddk750_power.h
index 63c9e8b6ffb3..93dafdde3699 100644
--- a/drivers/staging/sm750fb/ddk750_power.h
+++ b/drivers/staging/sm750fb/ddk750_power.h
@@ -2,19 +2,12 @@
 #ifndef DDK750_POWER_H__
 #define DDK750_POWER_H__
 
-enum dpms {
-	crtDPMS_ON = 0x0,
-	crtDPMS_STANDBY = 0x1,
-	crtDPMS_SUSPEND = 0x2,
-	crtDPMS_OFF = 0x3,
-};
-
 #define set_DAC(off) {							\
 	poke32(MISC_CTRL,						\
 	       (peek32(MISC_CTRL) & ~MISC_CTRL_DAC_POWER_OFF) | (off)); \
 }
 
-void ddk750_set_dpms(enum dpms state);
+void ddk750_set_dpms(unsigned int state);
 void sm750_set_power_mode(unsigned int mode);
 void sm750_set_current_gate(unsigned int gate);
 
-- 
2.43.0

