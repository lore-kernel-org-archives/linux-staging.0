Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB691237194
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 13:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752501063; cv=none; b=TQfW+FcAy3gXmw00SFogOlVaXMA3QjU/+k2QNCpzbjlfRgy7nZPfeyly4EnFpd7RK4zn7kBfWrLLawQz5zop7HI+A7jrhlbAgZfG1E24H8XQOz1qcVCgiU4IZgHNz0xbPNEoerv9xh22fSBlWmdKjYJNVuhiHvbCU1pR3xn+qLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752501063; c=relaxed/simple;
	bh=OO3qtlOU5nab/BE/Qo+VwsrskRxL6r/L4D5lBrq84Os=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LnABut4BNltkt57+wGCKpq5wjbXpnRdQ12PPjqaLr0yexZpYKkJlZjHsoKIH9ygcHytEB3II1qf/VKEd8CZtBghNkMjUftGf2pJBEXIZoWgPDS+NPtNFvAi7bSlrC4v5LIMIIq6qorRRLuVsZsXl42Og0qVYUWXE/Xn/y/j+ETU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TC/92mxK; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TC/92mxK"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7170344c100so35984657b3.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 06:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752501061; x=1753105861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeeyZV6Qy4I7FM/LKS7AigWifBQxBfcSFWTkoEx7zvY=;
        b=TC/92mxKse2lcjkYCyg8Q632eq8i7jGUb1oz9CaVlP4wqaxGaArdKl4IgkcW/ls/Dt
         jrLBCB1U7Gg41qUFb1Vq1yWTzaYTAgaT6YMtiMRLGBip122VxxG/rBGlUgt8M+Lo1G+z
         shL0j9cwjoR4fPDcyZLe79LLZXMjiLsExRGVBPhEszRdPP3n29h9xFEiIaKdq9gkW5Uw
         9IUAwXSo/VnwlwBeUWH0ZopD08S/HQ3ZxHlpHpP7gA9YycZegdn6x3sqsoZ65B5c8dAX
         kdaAXiNsWhEoJ6h0PK6PqT/IvcoIPssgP7mZbhuTfQoPqnuoFdqPjiwFRiTpUrr3afCk
         F/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501061; x=1753105861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeeyZV6Qy4I7FM/LKS7AigWifBQxBfcSFWTkoEx7zvY=;
        b=K9l+u3yxrQkzWrh3hpIHPOGLOmnFzzQOZoj35Prl2hChgt1gto60ot1zZAhtEwpy5I
         ouk3/ttkMs9oF1UY+/Kic8h641iX1hoBVGCHyPqS5098VJdtfCHHi/KMwf3SBGUmJfc3
         BiccDs2fOWuEmkri+ShvvP4QEk5eze4H1xLgNBifnEsAUNYpGL8J5eytC+vqccowC2xt
         XUBP8sxEWMdo2Qkdk0G5CpY/7QktDnDifP5FB3EHCOJdgXu7aBbsPbLSMhk4idHGAisS
         XrbbCwoaMvpryXTzgWDyIfuqRoNR77rX7Q58+hfjmdGkZ79r0RQa5XlCv71Np/gI3luR
         Cz6A==
X-Forwarded-Encrypted: i=1; AJvYcCVWiyPU5eMVoukZhr+FZLUXEG3nJXnSunVclOO4EotX9rSK+IagsV5mQEAym45OcVJA3MQcd+w1Z+VZpKRH@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc39FCiUi4A245k1EGdBMucxpWajaMuqcCpZx+PGBQFMn6MLLD
	rl6nyJHrjgDsdURonzKZAypmtQj/XHUzS08f/+Ft2PnzsdaFc6G2cw6E
X-Gm-Gg: ASbGncuJEgkS2K7TVwFQS0mVdy5mQwn05gxLcHh807kR4pVZ1xqyt34EP7s5k8O+E+A
	cMDH8ndw2iN6y/16qbUQZZiFuPpatKoMyq5TiZk6AzxlOX8eFS5Eh4mYlW4+IUSoHfWQuyReaB7
	u+LVOUR847zCK9//Y/wkwFrjd7ZyfpHy43UlgwpqDndBJ8Tgbgk83fsaLCzE7JbeLH2KfBTIrs+
	IUUBox9hj08+/sWaNFxA5W2ATestVKWe6PPOCIk0FCte/kTrSDJbgGrbSAtHCvXxtVvbqnVeSZg
	h2kx3y66EdNELpcVzOBt0pWwCY4pi2KDMKlT9OoKziYB6lJhlGSNMRnvlufw9cibggKzt6lzowB
	q0PidrDUrW/Zw2IIDBHQDy3ggoI7ADepWAeXKAUoC5P2BF/NiSUI=
X-Google-Smtp-Source: AGHT+IEUpJDRgbueMpNzxHu0sc7ijmI3QsQbCpyeBsNqte/zBTUdFcQUyEI7MT2sTAt7mF3JUWuE8Q==
X-Received: by 2002:a05:690c:d94:b0:711:371e:ecbe with SMTP id 00721157ae682-717d7a5ff53mr196301597b3.29.1752501060805;
        Mon, 14 Jul 2025 06:51:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:5881:3041:2700:bc8c:6e13:ff9d:5355])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-717c61b4b72sm19726417b3.74.2025.07.14.06.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 06:51:00 -0700 (PDT)
From: Woohee Yang <woohee9527@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Woohee Yang <woohee9527@gmail.com>
Subject: [PATCH] stating:media:atomisp: fix open brace placement
Date: Mon, 14 Jul 2025 15:50:10 +0200
Message-ID: <20250714135014.212067-1-woohee9527@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: that open brace { should be on the previous
line" in isp_param.c

Signed-off-by: Woohee Yang <woohee9527@gmail.com>

---

Hey, this is my first patch, I appreciate any feedback, thank you!
---
 .../media/atomisp/pci/runtime/isp_param/src/isp_param.c     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 251dd75a7613..b4aac76c2ed5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -102,8 +102,7 @@ ia_css_isp_param_allocate_isp_parameters(
 	unsigned int mem, pclass;
 
 	pclass = IA_CSS_PARAM_CLASS_PARAM;
-	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			u32 size = 0;
 
@@ -178,8 +177,7 @@ ia_css_isp_param_copy_isp_mem_if_to_ddr(
     enum ia_css_param_class pclass) {
 	unsigned int mem;
 
-	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
 		size_t       size	  = host->params[pclass][mem].size;
 		ia_css_ptr ddr_mem_ptr  = ddr->params[pclass][mem].address;
 		char	    *host_mem_ptr = host->params[pclass][mem].address;
-- 
2.47.2

