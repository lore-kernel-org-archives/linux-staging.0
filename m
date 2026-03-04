Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B960349B1D
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772638710; cv=none; b=q+hM5kt+aLvMtBQQKzS2oFkoOj0VIgKZbehrRtQysuaT8o/f2RN0zX9ZrW3JxPsgTk710Xp/eyU/HvlWRMpFABEm8vkYadGF5ZhdeLPM0uBWbbsiZts/fpePu0nwcx2nGyLDHGu4/+9YDEb5/2QYrJLMI8MNip5BDia3WQ4dDsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772638710; c=relaxed/simple;
	bh=s/dm+XUXMLyS5FdMJrcgYmUJd55dJOhnzuMECHpQAbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iX0VGSRq0gBCTqHxDMmR0ZyMyPxpaoQmkmQV/mgcoB0ixUyrx0MgdXmGVe+n6rkDnPmO3yCQn5Y0WJlwq+xRaNqMT/ybyBn6X1tWCwHmu7SyitIJ+J71mC3IuX4wytc7qSozw1an5/9tyRorN5zyZPrGCe1FAqPZIzsMB61lC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFZs4wZ3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFZs4wZ3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b7c2788dso2371387f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 07:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772638708; x=1773243508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rl5P5V069YVdMfLinFrQF8yItSxXPntegDcPLHO7AWk=;
        b=LFZs4wZ3ZaM1zIR1vcpg7Yx3Go+8jgePG09jwzH0RPFqdb6tW5w64FTd4QtYm6S7ot
         14TylCDggXsZLart7QIPyLhD6ikOzRFtBWCgdh0UBK9+SP9BwcN/AcMUMdrbVrgjYmRZ
         y9rEXCgsFn+xTQwgEORn1NAgAAhF5In7W6Z2r5d3q0xvUb5dWOiSXg5zktd4/z98Q3qM
         BQNVhknbbRyMXZ4IE8sJnKk6y1FqxNz6CCyRuP8pI5YjC+DlNq8p0954BmSj9qasynyB
         4V7qoIqmxvMnImowJyAAxrpYtr9Czaiub8QAhMzBYpe9Nzal8JhmuAJtU4ZE4btA0rOd
         XBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772638708; x=1773243508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl5P5V069YVdMfLinFrQF8yItSxXPntegDcPLHO7AWk=;
        b=uQ5TIjaaHc/y2UPqlRetXVYmQiH3cYuoQVoU9OJ60F65oDIuCmkhAH8+rarw24nFPo
         zfO0CsS7m79ZjpWVeeq5AZqaEzWBA4fB+70dENQahnnEkiMXlvY6hobSFkceNrW6QnDj
         K5t9SQ4Db4nP3fSqYALuSqYc6MQjcFISHuoSp9omsJQExFVvN02acWqRmYdZrxthSaFI
         958ZGh1dmnq/IZDUVOYSe+7J2k91xeldHkjFcMcZbESg21MuqRs9qhms1Pqvu4RUaDUs
         uVyBvXnVa1GSxCMDwJWY4FiFHV6snm47Erm02LSZIB1/ryULPrPIQL+lRxAR4dvne+Vo
         lI5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUen5jKH/EU9CA+2Un9JE4nTWaEIdYE6Pegckdc+dFnycoIlpPHJN9cnEPNken7MuNC1Y7OLPqN0SU3hbrM@lists.linux.dev
X-Gm-Message-State: AOJu0YzfIx+P1TDDocr7LJVHhCKF/uF6Ku3Miez+c74eFb7ppDktdmDD
	XTh6aKTEQ6/G4eCno7xwI2sxHf6u1otMm2Wh8enyf17Aj8MbNpm/XsVu
X-Gm-Gg: ATEYQzxW3jRbICGtzSDI7X1tDMcuMWa2UrkD5r1l2dNKSrOxQLg6u/LIIy019WbktxB
	YXVmSJgDsMxyBBDrZskvq8ROoVrWqEBa5COdsHNkGTnp6baQ5ZJB+5io4ZWaZSrAx50yIEO4b0J
	Y8Uc4BgNJvDrQ/WVGuijJ/LKkfzms8iWSl4EHloXIKp6FAIovDRp8uRCFlYi2aj9iUMQFUJS9iN
	BsqzG7KWOMCCiSDtyI8GDYCEnev1RpSzd/TPjhKysiWdTgAVKdYmTeEIt0798pbQhRtiIoVpMAh
	rOSxdccBbu4gmK/4FtjsvNwgNBQALO1mFAScPoLsZKIPyflcA0rldve3mSUY9yIVqzoisNAr/rS
	3Qqa2+awvCL9HxPpoKBk3IWOjc/CdZ5XY4ZQwjyiACvY3KNjwFkFwi5Fpqqm1sfkOC7M2FMNXRL
	uTdQP35tcVCnB4MgDfXt5igaZ++JYAocdku8XOUSXJzw==
X-Received: by 2002:a5d:5f93:0:b0:439:c018:60ec with SMTP id ffacd0b85a97d-439c80002afmr4792894f8f.30.1772638707432;
        Wed, 04 Mar 2026 07:38:27 -0800 (PST)
Received: from homeserver.tail6d6c39.ts.net ([82.137.32.29])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-439b503425asm26285808f8f.25.2026.03.04.07.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 07:38:27 -0800 (PST)
From: Eduard Bostina <egbostina@gmail.com>
To: gregkh@linuxfoundation.org
Cc: broonie@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	Eduard Bostina <egbostina@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Clean up unnecessary parentheses and braces
Date: Wed,  4 Mar 2026 15:34:26 +0000
Message-ID: <20260304153426.2217417-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase code readability and follow Linux kernel coding style by
removing unnecessary parentheses and braces.

This also fixes the following checkpatch.pl issues:
WARNING: Unnecessary parentheses - maybe == should be = ?
WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 1a52d3e1d285d..a1c2220ac476b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1339,11 +1339,10 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 
 	}
 
-	if (ret == _FAIL) {
+	if (ret == _FAIL)
 		goto exit;
-	} else if (ret == RTW_RX_HANDLED) {
+	else if (ret == RTW_RX_HANDLED)
 		goto exit;
-	}
 
 
 	if (!psta) {
@@ -1593,7 +1592,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
+	if (check_fwstate(pmlmepriv, WIFI_MP_STATE) == true) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr + 1) = 0x12;
-- 
2.43.0

