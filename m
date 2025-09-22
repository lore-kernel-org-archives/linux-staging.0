Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4BA20E6
	for <linux-staging@lists.linux.dev>; Mon, 22 Sep 2025 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758512967; cv=none; b=MZHwCfmuu3+Md5/EYnewgZe9/Rop24y4yYUooA2B9M9XdQtIMbahWXa/uBYv9kxB3ttinJCYnR7ko0RuWXKW3e1NjeHCKSNut3AObOPlcD69H8kWkq4XVc+VmqW/jX8EPavgJod2oa8yYtvTy8clqrYa4ngfSA48mwVaM703jhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758512967; c=relaxed/simple;
	bh=R4BpydptfYN3o2mCLvyEh4whce1vNzMChCA1I6SaaVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PdG1j/A9D9h7jyclxAtPrk0FnIpEqiJEn/kIdj3Hnet9CVfObbRIVefoiO5dWL2bfOSWZf17et0P4R8H6BfutAId3OH9jKFpoYWGa9A/48zepHa+UiFeH+exQd4I/7U5BjdRnTpzDSkHdJYVbQjhfrh06yKyAbiNmAJlNsQSNec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT4nmt+R; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT4nmt+R"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-72ce9790acdso36949707b3.0
        for <linux-staging@lists.linux.dev>; Sun, 21 Sep 2025 20:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758512965; x=1759117765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cajskub3yInyko2vwCPecgvg5vw2BSZfivHDY0rM55c=;
        b=AT4nmt+Ro3wzTA8PPGMSDKEeYyQbH7WXMlD8sy9bkuVgCEZ/FbBFSL1LXvm9KFlz0q
         tcea2T7RQ+BD/DHigDgwdnsUbUGqTkni/AZ55HG7mv2xuuFfTETdmjAqZcXYFgarzkmz
         5gKSyORuZlnaPVPpb17edub6Xc1DRqF61JKhAiCMLL5crT79rsNPwt1iSU1PzAYxaafk
         qawUwEXUhchWsaTlsXfgbwUcuIFgQMky9TSIsK9vEGIJsrMwj6gyji7C20Nb4syo45MW
         3dHyY2V4UDfeHT/WE8mzx4WBL504o3WKTXmuTDYhLxepieR1neLxxMG332AUqvdIQzuH
         V8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758512965; x=1759117765;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cajskub3yInyko2vwCPecgvg5vw2BSZfivHDY0rM55c=;
        b=i4WC3WN8Ytr9E7HmvjRlgade1gcJFKWGnE7BVwQnTt263XQqKhMolEMILqjUzaClL4
         OGdvACGrrqkimzL0rKD1b5xAFsIxiDq73EqNCdSXiS1l/9G6M0IaZbqM/1HNrp0G7B1P
         jyx7BG7BNMFji7YHOdZzNjcUkpH5c/3bIY5B8vY4OiI+8emaWO3DHZxExI4X4hgpgFY8
         y4yXpaeqcieQOY2QOs6JejL1zB7cN9SoevvEVmwq6mQ9Y+UFTaUm+46aiHJloVYysb+i
         oRC/q+zXtxPdvm96xEuSw7o/6LLW5dnuFds1KqCllP1oaneL6zlQWrXhJGONgcC+CcH0
         ZSVg==
X-Gm-Message-State: AOJu0YznJXiAhmSG8QxV4nkHZ9aFXeijnNoPOI6DajZJY66vLhq2AKZN
	U2cXp4rQrvOXScZuGeYWRo9YYO3w2celGJziGeFsBTMEBQPBnoO14gmH
X-Gm-Gg: ASbGncvfUQFyMwJmEXjUuAR0sUbl8KejCVSXc0a5Ts3xpd0Q4+6xodc9H+CoGhS2/al
	YUXkesWdvsHJiCu9ZEiZ5GX2M09JJPIqpEaW6TEAaj9LeMloG4btZW/JBDdxACv4wOUl4ykkJUt
	0S5x40OoJrof/IRBQnvdyMuWyo0wtE+vxjVLVPRHx9MJFmMUm8v6yMpoDbqAviZor5o2SM25DN7
	QZMkhEOTdQJS5fdrBuRIGwPXJGVyxK5fiDecMY66Nl6Lgd11RpvNu7dN31gOANvpgYap2llwskf
	FNQRYkOZzoFdg+3pX/fwnzoKqBWoiMwDP6tVuT1CiHjT7CYvBVNH6O+3H/4FlXNbWYi8ZuXt/ij
	LQD3C9gbcyVCd6SOzR6BvW5BKxR+VhCRfs+nMUbvuV/VgiiZ2Q6OFErM0GRL9q8qxnPyhvK1yHx
	lj5bmABYagzc1zmcFG4bpYsR4t57yUvQ==
X-Google-Smtp-Source: AGHT+IFvwkZzRYDO7G+CXHfhWGsoGmYJo6wv7xcxwSLMHGrtECzDTRnVvaHYE3sdgSu0oNVFnmnaIA==
X-Received: by 2002:a05:690c:e07:b0:739:7377:fda6 with SMTP id 00721157ae682-73d3ef2d908mr99924287b3.42.1758512964928;
        Sun, 21 Sep 2025 20:49:24 -0700 (PDT)
Received: from ubuntu (host-101-28.flgauca.gainesville.fl.us.clients.pavlovmedia.net. [153.33.101.28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-74da0e03500sm6675897b3.15.2025.09.21.20.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 20:49:24 -0700 (PDT)
From: Jaiden Magnan <jaiden.linux@gmail.com>
To: hansg@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Jaiden Magnan <jaiden.linux@gmail.com>
Subject: [PATCH] Staging: media: binary: fixed a brace coding style issue
Date: Mon, 22 Sep 2025 03:49:08 +0000
Message-ID: <20250922034908.17918-1-jaiden.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Jaiden Magnan <jaiden.linux@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..2264db62c818 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -498,7 +498,8 @@ ia_css_binary_init_infos(void) {
 }
 
 int
-ia_css_binary_uninit(void) {
+ia_css_binary_uninit(void)
+{
 	unsigned int i;
 	struct ia_css_binary_xinfo *b;
 
-- 
2.43.0

