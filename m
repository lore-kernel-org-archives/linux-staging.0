Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DAD30BF62
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 15:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615071; cv=none; b=QUowMQIRghm3EEaDqxd+L4/z22IIHo7vkIz0LAv6cDoAouk03SdUkNRULMQh8GZ9eXGG4gsEfFD0auh3JONRz59iWgwdKG97ep7mq6tkZtB+TFfoXXfv5wZASTQIM/ljH1THTLg1pQKpiXb98B/7q+PlHsMIF+Egls28pd0leMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615071; c=relaxed/simple;
	bh=+TKOPXeTy+3kWNOlCtGEkeNSRpvpGcXsvU2Xcap+Roc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXRdBvkVlNxQBOcFQSiAwKvk+zzJEQcbAokJ9aiOzLUdqJd5K3O2NqPeDVBYIZBxcKhofTFCMMiwcdIBOhwdOnTCIIz+9o6rO3oPVy/KebttJldB8HDwqurXpUCpJaMxQo2nyXefWUVXGvzUvqdVT4HH9L5OCxTkg5EVTZixJSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayiuy8GJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayiuy8GJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48049955f7fso60627525e9.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 07:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769615068; x=1770219868; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XI+XRgkLIU9MBoAG0qWeOcIKdpupTEKZGY5QQDWpO8Y=;
        b=ayiuy8GJ8QPWtfAdZg1AZjncwmqCW2FU+j++AX9WhRfIEHbWYp59RPBSPzWf+4Gcxl
         x8cD5xQHpOHnw2osBlAHO65EbXbpQNbmEKxydPm7DFyYRHIRau32m/XUWjnO2FDuCkJi
         a4xiHpBsZATp6IKIo1hKeXuv5OZ06c1efucJyEhvmZ+XXrYVNJLUegKFa6nlH13G0T2/
         /bhe2d5/sMSUMqtiNhWs20DSkjl6sL59SAoqcJwHYHhSTh4L/oSv8Ik7G+7r9jXVjCX6
         71hrJm/yfDjLKv1hb9BYG+u9EKwDNLPSxtT8q03NSqEjDgZmsTJYyA2LkZHJmFf+2BrR
         yDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615068; x=1770219868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XI+XRgkLIU9MBoAG0qWeOcIKdpupTEKZGY5QQDWpO8Y=;
        b=P2yT3DTFzVd5o+uxTKmDFW7NMhf7hN5uDJWWBB+CTpxT2rg+SjVpHpMG8lRLcRB4SG
         /JlAJim4cNL1EkNqtZHE++o9wOKJ5zVlC+rt8oVqsAmARxpE5LCpjQHFtEjkpMJw8ndZ
         AFLRakZk9ZM1PeYM0X13ydbgS478BUeKvbd+vRCagcbYbZpBwMEutSEQyKgPTNFPge00
         KFHe7VFxBmRiyjwVy0EiP5LJq1xiFJHl6pVmKoWBJ5X9nlVolAYxOQf4rKa+1ranYS2J
         9zd74/LuOsvhYiyKnRqbBz8tMRUXvLR9h2WrWnwrLiFARL9jdGlaAhnYyIc8SleAYsBP
         3pwA==
X-Gm-Message-State: AOJu0Yxr+LHcDD5pcv10eANczcBpiru4tF3iAQRkWYBg/4iH3TQygtys
	YNWYCfFMoYXia/FLwZIENtCCXMVhO97OdzNGJ2Ds9Xed1uPTs4I4eSXp
X-Gm-Gg: AZuq6aKB2UBiVVqTr3e4gSVLrOf1EzNc3t1rxxgYx5NeDk2L5PML57mknullIRM9+YU
	0XSPdY8YzbqG3GP+VREgB0vWXOca3AKSiv8QcLOvn1hWqil2Xnx8OJKozNAA862pUqCVCCj0EU+
	zbIptbdtIZeyAdqrVwpc5QMiUBqsOP9PLwG28hA7YkOykU00I12warbUT6AcOLji/dutXcPrFDb
	qza+5nen+8t2d+5ShKfkE+dR+Q/NaOJMz6FhURcWFgmU4tclicZgUj/FEwryiO/iA0f5BIVZQw5
	8cqcQkpVel8OiE6oFTraDyVkcvz8wsJdDOj3bvHoMefRot5kjMXAidTSqGeYJAgvlVzdvm+Hb3b
	kPizkut9kFPDKyvCuV9UaaG5CwkgN730q1+Kmp9+phxQY2ErjrKveLEaPCV5hOznSLXQD2Nerd1
	QYnF/tVrrh0M1nOR3Ib02KC9Sn7C8n1NtksnYbzdb+VClUtDOCsWjzeuZunPXjzRI65KcTDaZsr
	1rysy4JLqA5pwU=
X-Received: by 2002:a5d:5888:0:b0:435:a0f5:c271 with SMTP id ffacd0b85a97d-435dd0a3893mr7976469f8f.31.1769615068102;
        Wed, 28 Jan 2026 07:44:28 -0800 (PST)
Received: from localhost.localdomain (lfbn-idf3-1-422-154.w83-114.abo.wanadoo.fr. [83.114.17.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cf16sm8319504f8f.22.2026.01.28.07.44.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Jan 2026 07:44:27 -0800 (PST)
From: Louis Lesniak <louis.lesniak2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	louis.lesniak2@gmail.com
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces
Date: Wed, 28 Jan 2026 16:44:07 +0100
Message-ID: <20260128154407.42421-1-louis.lesniak2@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from single statement if blocks to adhere to the
Linux kernel coding style.

Signed-off-by: Louis Lesniak <louis.lesniak2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 5ffefa506..33734d20d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -63,11 +63,10 @@ u8 networktype_to_raid_ex(struct adapter *adapter, struct sta_info *psta)
 		break;
 	case WIRELESS_11B_24N:
 	case WIRELESS_11BG_24N:
-		if (psta->bw_mode == CHANNEL_WIDTH_20) {
+		if (psta->bw_mode == CHANNEL_WIDTH_20)
 			raid = RATEID_IDX_BGN_20M_1SS_BN;
-		} else {
+		else
 			raid = RATEID_IDX_BGN_40M_1SS;
-		}
 		break;
 	default:
 		raid = RATEID_IDX_BGN_40M_2SS;
-- 
2.50.1 (Apple Git-155)

