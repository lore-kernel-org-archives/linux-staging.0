Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420B842377
	for <linux-staging@lists.linux.dev>; Mon, 18 Dec 2023 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lm+CctcG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d39e2f1089so16388745ad.1
        for <linux-staging@lists.linux.dev>; Mon, 18 Dec 2023 07:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702913535; x=1703518335; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPnry4ABNCRoEF7YlhZVOqsWCrakY3lvjh/I9JX4fyE=;
        b=Lm+CctcG7tTzmYtPh+T51KD1z7HHh2NYOrSaM4COB6wVKTJwpne0P3pjjZ1GlRmwxY
         jnExuc/ZQbWnu6k6akYInYZD/ykXOxLqUDXDnYB0134qsWuR+mRA5wbaUNG+XhTs2pRa
         rFDpCnlXDozN4Bopzhq1NaC+jFu/Y24Uklfrjz+4doi5I8oolIXaA22EcWyaOUNH2G27
         /WTRGWaf2Nz5feSqP56QZhatEaZ33CgOXmucWjHbm95V+g7529R3V1rFfv9Y89FEoZ1X
         0m0XdE8KhCrmButRaKRwzuh01N3zPLsIVCHPFA0GvGaJfrw/9WteEa6bkm0I3EE+CUvE
         keKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702913535; x=1703518335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPnry4ABNCRoEF7YlhZVOqsWCrakY3lvjh/I9JX4fyE=;
        b=RnlPk//T7bsRfzb4BGHuh6W+epnU1TROKeHvijluO8/Y+FZHRS9fEmjURyUkyCH8hh
         XLcPe3+HAmaO8KErUevx/lN6HqH/djJ+mW4g54QFqBpGnqhWYwHTdEBvwtFo2oPdn3HT
         7EsTn9zvsgYS/qgrTgMeMNwUWnBEvnv5u5B+cPMC2LpADNfTJgCrP+FIEVxUGzLLZwAy
         SxwwdaBzIT0XS9Pv/06t4or+rJPjFTnHYOUg+2Sr1Fb2OaJKfLijWgJ/wIxDG2VmN4aO
         RXuF1BbQTTiLFejesIeLjIlynl9C3vOQ81pGsL+nZnO3ernEwnl+vQWe4of2G2iVOnjU
         EueQ==
X-Gm-Message-State: AOJu0Yz1aypHNH4UJ3xnOsmCJtmjd4N4dHelREabE9SzvSP4krhd44tJ
	L5WBII0uJWPmB0A3H4wxQWs=
X-Google-Smtp-Source: AGHT+IGR6fcR7dY6sUS+4s0yRsbTxaaJhn99EhB3+ag/KdKrhMD/ddYr9LLElMWyaO+iubF7GhPEWA==
X-Received: by 2002:a17:903:2b0e:b0:1d3:6b17:5eb with SMTP id mc14-20020a1709032b0e00b001d36b1705ebmr10352773plb.49.1702913535439;
        Mon, 18 Dec 2023 07:32:15 -0800 (PST)
Received: from ubuntu.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id g3-20020a170902740300b001d39d4fa323sm4358415pll.55.2023.12.18.07.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Dec 2023 07:32:15 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drivers: staging: media: atomisp: pci: Fixes a spelling mistake in sh_css_defs.h
Date: Mon, 18 Dec 2023 15:32:00 +0000
Message-Id: <20231218153200.450148-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The script checkpatch.pl reported a spelling error
in sh_css_defs.h as below:

'''
WARNING: 'upto' may be misspelled - perhaps 'up to'?
/* The FPGA system (vec_nelems == 16) only supports upto 5MP */
                                                    ^^^^
'''

This patch corrects a spelling error,
changing "upto" to "up to".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_defs.h b/drivers/staging/media/atomisp/pci/sh_css_defs.h
index 7eb10b226f0a..2afde974e75d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_defs.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_defs.h
@@ -131,7 +131,7 @@ RGB[0,8191],coef[-8192,8191] -> RGB[0,8191]
  * invalid rows/columns that result from filter initialization are skipped. */
 #define SH_CSS_MIN_DVS_ENVELOPE           12U
 
-/* The FPGA system (vec_nelems == 16) only supports upto 5MP */
+/* The FPGA system (vec_nelems == 16) only supports up to 5MP */
 #define SH_CSS_MAX_SENSOR_WIDTH           4608
 #define SH_CSS_MAX_SENSOR_HEIGHT          3450
 
-- 
2.34.1

