Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DDC3DDAE2
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613042; cv=none; b=g210bvBZFr3jLMsf9xIsf/fgbFGxolcYlqagQa2rSUxuQaHCFx6/Hj4CtdI0TOajqu2gsRlO1QXcxFo+ejRa57jfWOhCCtEBjkYcsJ2PxmhOOceFOirCJX/Cre+CbvDomUQhGdsCis8HnB30lV1tpeK2AnjO1L+LeHaDDMDa1Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613042; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NIAu6xCXxjxf1NDXIo4tbRmEy+mPahjOOWyTppVa/X3qUlOJzLIQZLDIcxdRP7wTqbdG2xr46lZouZxIqUFEDeF7mUfJxhr+I0Qcm95bbF23RnNU1u675Di9cWAbvFSktW+/Rb/U499Vxi2LLZDszhOQS5Kjft4didjbhNmu02Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzp5Le0l; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzp5Le0l"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5c65d654c23so799971e0c.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 05:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788613040; x=1789217840; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=bzp5Le0lsaHEH96mGmG5xvd0G3WRJ0ojXlxMLa6e/5B/Yl0Q8bNl+cu1jj26Czk6s1
         S4LE5C8dSZpOXPFheWguJAyDGSSqtADqIQu8X7yQwWS/S7fLug2Pt4NRC4Wm4TpKqgFD
         po4mQeoZRJ1QZwX1CnoZWKP5ujay6qwVE9GY63y+N8Iasz1PdajEWlMhndZ1rQHI6xH7
         fFqM9F0yi9cMfCHaopbvlxFO5JOcZ0aeODBkdQn+u4DJ7owcCYt+n66eOMGjK7vuUJFY
         LMOYuuabArIVzmyhROm+DtoZ7+/G2o/GurM7+lA/OiPlCgWzvLnov7w+luC/fA4fAqsW
         sLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788613040; x=1789217840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=NPuDkul1Jykbi+DD6+g9jl8ndrpyj/oy40rQUxpP1JRayzDb+snGXx+7T85+sT7tFw
         NzA+QKKvyjWeeGsyRPZjeBBwDVFAtUk30Uo8R1/y1bA2sB2juC7QJsbW8gW0PrfI6YW+
         22mL/SdtkuM3hiu3SxJzCdbKhR9UHnqERe5kSVqohRtzzgKgDD6B7H+rr/1VjIA4dwex
         CMKvx9SwXUn6cZTArEPza/qeCjv3rUG+MROBQyRFERjQ1rzZCQnD+Lam5xw4YnkYll3J
         ke7yH36OdRw8CHh6xzq26a0xTPc1JuQjwHC2LCt5lrb1kz3Kt31GEsF0GdL+aBkXUut4
         D3Wg==
X-Forwarded-Encrypted: i=1; AKwUvBxUSEfy7xZCFF6icmKcU8SWXnQa1yKU96m50yanLKmN8/terIV9WO1PorOTboOjxC7xRGfabyerCpEagPHg@lists.linux.dev
X-Gm-Message-State: AFuF++kVJYYklL38EpwQ2uIEeSa/eGacGAPgijpwVtxkbFB3R0OXjwRX
	XDGnwiO4HNiEZ/LOW2nO0s5zfOvO72ilib2v9jyd7FcCmc/93A3zX0rv
X-Gm-Gg: AYBFou0cbS7JEXbYgdFeW8I2qmyUWscupY21DRi/nPo0zc3SvuBSGHgLQuEAOAXxKTy
	nynj+A2M5BQHRTS/tRcuWhU7jmSKKboDQ8BR5IIi34HEPU87mkkTe4w6I58wSmepdspyMmgw5B9
	Kl5ofzXwx7yf4fARfniJwVtvi3pic++xH4Uo/AwDmwgmBZC3sFiSjRn/5AtRXJn7wEjLQAJ7ZMs
	z+csDtef/9IbBaO2cNDrdOVXgn0BFMnMrrubsPHkfml6kgcr91PGRJpJKIk8YuS+/+JW6nFT4l0
	flP5oAwoJNZjq1w+aC/xplLnMvWRs1h+5JVCnyxXzFJnxUpsKO/ATYRFRnXsPWIDH4vHbALpOC7
	p9orWv7InWF8k2v/H0VeZUYW+t03zRlxWV25h6jMRHmRk/1pZWEH7nYWcDmh022dPKYfifakGL1
	dlRhF1rPBO432NVa7vDQuxPXTiFYVQgKe+aav6+gIJuxgs1HvLatXOKWHiOubNdQ6BNbYXN7qH+
	3rqgfHYkCzLj5ZtbQuvekIZQaon+9opPrnCJmm2/Sk=
X-Received: by 2002:a05:6122:32cc:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c7ed0c4c20mr6435898e0c.0.1788613035512;
        Sat, 05 Sep 2026 05:57:15 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec1ef7a5sm4349416e0c.5.2026.09.05.05.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:57:14 -0700 (PDT)
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
Subject: [PATCH v8 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:57:04 -0300
Message-ID: <20260905125706.6550-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

