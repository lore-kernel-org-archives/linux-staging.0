Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E818C2C
	for <linux-staging@lists.linux.dev>; Sat,  2 May 2026 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777688304; cv=none; b=WtxifpK+6TuyI6G7Y8qlwy+lGBbO0dzm8mpoAGs15NCr3/8wzT6PdJp7XdD/RMPnU9kPO9vzXDJrHYZ8IRKIvFhpUabDyw7ANHP6+LzJ5dimJOH6GSnEz2aO0L6CRJEa53wB921XJpy+PGcGPGvsDydxbCYyCtsJ8xhOSbpwt3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777688304; c=relaxed/simple;
	bh=3/+Pr4j5iSVX/Vmbx8yW6ovs9S4TRVc2mRVxpfIkpCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JNzRBWb5B8/nSn+JMGjQcFELPldCN6D66HqMXz9/KYzHCsdDqJmaABKt+hXleebpOY25gGzc+Ns02LI0NEifx4p92ILuK4S2Fy3edbZxi92KdJXCQqyT44P8BK7yr+E8YExK9Vs2xxfvrHy5VxR4sCuzEJ6nobcYY02DBCJQMoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQDBrFZk; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQDBrFZk"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad9f316d68so9800675ad.2
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 19:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777688302; x=1778293102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8bus8UEoB8rKoM7Ii6ZhV3wSXwGSHXrSXqNMvxh7aHw=;
        b=dQDBrFZkC3bFLscAa4omxIA4vF1fJUK4l4rvCEQSfPoqQjD4S6sWQUabDC8s637Zu2
         AKcdNPqm/w/r9nieFi6sLeftc+aLfi5GzCFsJlp4RMhLcqawp6MY8NRPA9hplybbZyBK
         Ql5ovrNDY+U9FbZmW/SvviXAzCKZqDzJmvGxmXiOqywU2t/WQ1M1hf5ljaqRoj7yxBob
         goguB5JHkiz5QiBIFWgDFytAen9JlwmIk05RrWgOs40C+WFynMMw6972bqxqnTwY8ULZ
         Protp98mtZFzZTfPhTOr4bktnF44nIX9QPuAIncT0hQYGR3UCVmMjJRKmM6tAV1lrygf
         gUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777688302; x=1778293102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8bus8UEoB8rKoM7Ii6ZhV3wSXwGSHXrSXqNMvxh7aHw=;
        b=AGx3J04ue/3/1TKULAp6PXd5DiCnjzWWnQstrm1ZMHoq+f9gC04d8sZWEm4hBg0wcH
         JTJ/9qprgixT+hz66frAPIN1Gmph2iEcK3IW0/FG8aqiWPuTxqPqVDD7yHbrBpU5ZSje
         Xj2jQfrRjhC++mXSAYDzaB/0KuGxjuUtyaaw0/7HvafVf2NmuUwFyNpN/ndunNsttxV7
         26TPLlZl07l3yghDj0ABb2ClrsW7cza2vLfWy3Xs9PMtT+OYIBwMjPt48AO0pDHSHA2v
         9ttBCNWqIl4Ed7yVXraaEP9SrO+pSyEdqfXvNUMB+In1Q7JA0IYXgkBQ6jGPMhxzWwQY
         KoFg==
X-Gm-Message-State: AOJu0YzTF7VyFj/UlwF1ks1yW0rfTpNG6B951nxJca92cXGJFKO03E2j
	KpxDuBvqMsZ9uV9UMnoWMglVXcZisGFDCA8t+63oWXfB7y53H7Opw0Km
X-Gm-Gg: AeBDieuODSPGSZBqD/uylmYabe0WisFAcNHWbB/CDSgBKjN1r2RdY2zOkll66VNBehs
	S5T2Ft02eEHdkr+PMX/e1QaaDFZTafWb8mPxy+/Q8qSzcv6sRvTpYEswFayQn7klO4iWz2baFgr
	K0ShDApfvIxcjX1CLJOzeswq+/azCKtbz1rRqsR5/0J7VWUnNg08BcffOmSq7fd0rYRMd09BcJs
	n9qb5Lw8HplPasrTyq5Vee00YkeqjtPPBMkUmegQI1JnoSGJGHf84f3htjElcEMVw57XaWWoK59
	Y+FHUo4USdgDM7rQlufvoPF6OBC+4fk6RtsEXn1AioiyMbtah6xt8i3Fvid+ueze7EV0FbdMv/n
	k/AFZ2h/DR8x4PVU3cQWYZ0M6MygfdrS0C3beYF6fCP9gp+5TygXLpuT/yscHwrkBHkN/scrCfH
	oCqkhuLlep45c+Z8NiNsh5p8llO+aTcJySi7ya/70=
X-Received: by 2002:a17:903:4b47:b0:2b7:895f:407b with SMTP id d9443c01a7336-2b9f25e3063mr14076565ad.21.1777688302096;
        Fri, 01 May 2026 19:18:22 -0700 (PDT)
Received: from scootaloo.modem ([101.179.112.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae110acsm31770245ad.42.2026.05.01.19.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 19:18:21 -0700 (PDT)
From: Angus Gardner <angusg778@gmail.com>
To: linux-iio@vger.kernel.org
Cc: linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	Michael.Hennerich@analog.com
Subject: [PATCH] staging: iio: ad9834: fix probe error handling and comment typo
Date: Sat,  2 May 2026 12:18:15 +1000
Message-ID: <20260502021815.3953423-1-angusg778@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use dev_err_probe() for the master clock error path instead of open-coding
dev_err() + PTR_ERR(), consistent with the avdd regulator error path above
it and with the equivalent driver ad9832.c.

Simplify the -ENOMEM return after devm_iio_device_alloc() to a direct
return rather than bouncing through a local variable.

Fix a copy-paste typo in two comments that referred to 'AD9843' instead
of the correct chip name 'AD9834'.

Signed-off-by: Angus Gardner <angusg778@gmail.com>
---
 drivers/staging/iio/frequency/ad9834.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
index bdb2580e29bf..5968aca74ecf 100644
--- a/drivers/staging/iio/frequency/ad9834.c
+++ b/drivers/staging/iio/frequency/ad9834.c
@@ -164,7 +164,7 @@ static ssize_t ad9834_write(struct device *dev,
 		break;
 	case AD9834_OPBITEN:
 		if (st->control & AD9834_MODE) {
-			ret = -EINVAL;  /* AD9843 reserved mode */
+			ret = -EINVAL;  /* AD9834 reserved mode */
 			break;
 		}
 
@@ -239,7 +239,7 @@ static ssize_t ad9834_store_wavetype(struct device *dev,
 				st->control &= ~AD9834_OPBITEN;
 				st->control |= AD9834_MODE;
 			} else if (st->control & AD9834_OPBITEN) {
-				ret = -EINVAL;	/* AD9843 reserved mode */
+				ret = -EINVAL;	/* AD9834 reserved mode */
 			} else {
 				st->control |= AD9834_MODE;
 			}
@@ -389,17 +389,14 @@ static int ad9834_probe(struct spi_device *spi)
 		return dev_err_probe(&spi->dev, ret, "Failed to enable specified AVDD supply\n");
 
 	indio_dev = devm_iio_device_alloc(&spi->dev, sizeof(*st));
-	if (!indio_dev) {
-		ret = -ENOMEM;
-		return ret;
-	}
+	if (!indio_dev)
+		return -ENOMEM;
 	st = iio_priv(indio_dev);
 	mutex_init(&st->lock);
 	st->mclk = devm_clk_get_enabled(&spi->dev, NULL);
-	if (IS_ERR(st->mclk)) {
-		dev_err(&spi->dev, "Failed to enable master clock\n");
-		return PTR_ERR(st->mclk);
-	}
+	if (IS_ERR(st->mclk))
+		return dev_err_probe(&spi->dev, PTR_ERR(st->mclk),
+				     "Failed to enable master clock\n");
 
 	st->spi = spi;
 	st->devid = spi_get_device_id(spi)->driver_data;
-- 
2.51.0

