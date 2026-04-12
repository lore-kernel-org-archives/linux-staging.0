Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ADB29D275
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 17:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776014517; cv=none; b=UGm0Cv0zavVazJgQxjonHwbm03wqGpryyAkX2rqB+UZ0t9X9iE8bRCHrgldZ0Nm+aitiOhgcxVUjO/xl9mwA9/HLWtBgN/etEJXHOGou+m0q4D2Y9I5u+udPIDoGKGeGBVgloyX3ePobuYxRWqoZYbABXtNeIrzC0ddUtVEChqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776014517; c=relaxed/simple;
	bh=/fq4vDr56CO2k+npiEa+6hwzqLAU9ijIhxkJrtFIYjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J7jkbvN2sP1oBn1zBvQAwGAA6zTmawzH77xJXtRQbne6ra0XEO+18NTigAMBbdrVX2KFW1s91gPpLsQoVjYdkDtxdb3Z5ZrT5zQEUC7WCbAU8nwINlvc3bXRy0aHjGJmhyq9Yag2Y/Lj7bwjw1swMPgCiCqa3b0rYhszTxKybOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E20BLwRv; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E20BLwRv"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48896199cbaso39720455e9.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 10:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776014514; x=1776619314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zY6yfZkHIbKAhpXHmyMs2cR3FIwM5tf4pW3ivO5AZFE=;
        b=E20BLwRvFkiGYKofZ6YpWyqp4rPiPX74TEc4xKtAjbib2tw1YjqN0g8WvVQW65lgT9
         C3iwnXVHBaXoMnS0N+jAqpn/iXW//ouzdY6lg0v3K78v86aD3j0shc/JH7WZZrkZ+HQ+
         YzAU86U2SMEHWPxnKZegUQB9aBoY1eBAAP9xg7HlgMkVoL55bzW7wB80SRsFagHqDoDy
         HaP5sWb3pWV2UBVQTt0awbcb65D6VbtTH6BbqZIzf8zhg9YHc+kRoPW/i3cIQka59Gee
         qE70O2KqBUbshi8K7/kOjQN3yRXEVp+Z02Nh8Y5FgyqYLqTedJqP8vjYKCt3FKA8S125
         3W9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776014514; x=1776619314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zY6yfZkHIbKAhpXHmyMs2cR3FIwM5tf4pW3ivO5AZFE=;
        b=ptpjqXaHNwb+2DNNFwNpuMjUQ3ePLKukZVvtZwFwkjRoOxiOniIcP4liW8Mm3gW9XY
         2APRGq1VTSEHAjg2qo0EpBw5a9ePyL3WK5oh5sNSLrKvxzorarfvpZNG3Ta+k3luSP91
         AcyU8h/VZip75VjF82iArcWVL3zZhTEXnullOQ4nMNDRogo/fiiWhrYpRIY6kfk3omy5
         P+yVOtBu3nlJ1wkr7A3ILMwLe1WdSXxcfBFfL22M2J+opLjEPAnIViTEKn/+J61LL2XX
         Obx/J9gPnasY0wYuXMYcAba9mMJdxw/r22gt6AjvhxtZQJ5/dgDPpsj53XdkpQE0KP4v
         u8fQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4Wnvbt3nXHvAjB61HOFJ1/z8UwL+4HwSVOUuU4iyXNtzEXE7wqcOkfTWUgPjL10Oxg7c3KgqF7655TI4g@lists.linux.dev
X-Gm-Message-State: AOJu0Yxh29LeghTWj61QcCFBlDaFTICUpBjo9zp1y5AHBY7IkPElaC8f
	WjYY/MAt8ap6dilxRknm3ZKbiW+XabVZB32D9//3UJOPfA4BKG7GH8FU
X-Gm-Gg: AeBDietxCp26/MUc0KyAwYGr2LDG6uNh6DBAsh9dkXuceVZTawpHhigMYxp1g1m3xK+
	1d8splmSCDMRVpM44wOMQShbPGL6iiC7wytF/Wfpk6Y4xP4ZyxJXtnxKRdXY0z0GgTso7l6cq25
	er+Z/iyIh6t8ctjRX40BlTu/NYlF9tt9O/0irchtM5V/rLHms7/asCWzI3jgt9z1ltbbq6F/ds2
	YKdx2ibAjD+Rd+Xe+MdBfzJVmPDmn1IeJa0rLWiUuvrvB2V0nJpWsDw/fOA8xpignrzcGrvbhwF
	VU7pwYszrJsowKSVpuKD4J6/q1yWwGjJFYNJ3VlGu8SCu+m0cSSU7ZScykYkaJlE1k+7vYFp8+r
	53I6CBBXp7HhtBg5ffzeM5tkxULzQf79NpwFA9+5rY0qSuBTp7xP+c0n7yz+L1fV8RHSOI9CxAn
	bsMZdAjJMRIrJNbZ8HGpPf
X-Received: by 2002:a05:600c:c0c8:b0:488:b749:8482 with SMTP id 5b1f17b1804b1-488d67bbc13mr104496465e9.4.1776014513771;
        Sun, 12 Apr 2026 10:21:53 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:58be:2682::3d6:8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5380feesm287047045e9.9.2026.04.12.10.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 10:21:53 -0700 (PDT)
From: Baker <mzndmzn@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Baker <mzndmzn@gmail.com>
Subject: [PATCH] staging: fbtft: fix coding style issue in fbtft-bus.c
Date: Sun, 12 Apr 2026 12:21:46 -0500
Message-ID: <20260412172147.2817-1-mzndmzn@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove trailing space and comma before closing parenthesis ')' in
define_fbtft_write_reg macro as reported by checkpatch.pl.

Signed-off-by: Baker <mzndmzn@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..409770891c54 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.47.3

