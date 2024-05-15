Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2175D3C473
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748762; cv=none; b=YSwyxmtg/z2D+cXE1mZEg5UeSqXULoeY+GG0nw4L6ArMoB2T/jNR9aIAXaUHhkFYZWTFTq4Jux3VM8zHGBs1Q7ja90FIChk4b9olsDVnACPb6zlCP09lJpR93vDoD8001sAlFUq8kCfrtnPHorpzoSN8EUQCQkMd9a0JwFJ1T7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748762; c=relaxed/simple;
	bh=IiCfIcPfdct1tRc1QEwBDItQrFk8/iTPGsEHpxX+aug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=J+OvMsyawPzg7z/MAuY90dXjdcs78RxvKDM1YFCRCoQF5GviwZtb/jhg1NTI7603LA9Q92Akjtmas6NA6pk8CGaa6bpJ4xzDDWoJudiEeGAz1kdfAHrnSdZGtojkeF178STuzIDmDaLqsG5QmK/UaK8dAmwOr/wr2l+D4gbJ9fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=frT047WX; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="frT047WX"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3c9a0042e7dso1642955b6e.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748760; x=1716353560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3J9d19BBdCUNbsHdCNFFy7/2dgsskyle09cVkBE7Rg=;
        b=frT047WXxqWLi1Zkf8EYE9B1dJMDEw7gaKHsm59lv43ruYKWkala0ItMH9WYDU2gu/
         wUtOXueL8plro98i5gzZvQ00kHMelYUxmsuNc0YEXV6dque1+ui/Sqc+yOp1PUHpDyAC
         Di4V5ya3szAAAVDTdhY7rv7exAPmfgDC4OhHaeST+g6blUoHM4ozovv25X/WUW3GNpO0
         GZxqs+TtoBwLxHDimcxZWqpODAIbQFzi1JVn9TwlBdGw0zZGAo3iycTuuGct/k5ANmJa
         BzNRKUTQiWE87cLqQXuS8/Bc9fyfjdROkHwYTW6ltPoS5d2/BO1aKiEKbEfeOe7/ENIC
         g7VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748760; x=1716353560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X3J9d19BBdCUNbsHdCNFFy7/2dgsskyle09cVkBE7Rg=;
        b=mDGfXAZEbii3n8ceOovu0h877zY4Wa/KqPp+RaYCn2o5Lx1s/8Qb4mXvVEfCwYUn7w
         4hzDEaeA5VdwOX7Q63PeiZMx9rU87xfMIntF6mN1DQAnEs166tsX9hMq79pLQAnPEiu0
         Xto4xU2Zt53FBtfrX3DeGGLsefNMcrDnQ/u26/7GO7UuTzfPb2yrzub6e5lqkBADzuAP
         bBjZBNUqso3gcS3eGpmSWrqYVJj5F/H1VMkIEJ6u1X8bfAj0D7/vauSluewCIk24pWPL
         TbFcFdQOQ2mRO7KVebEvb31+QvYjuyGnDVeQRI43ASA9UTXUAopFmBbq7xbDMiYnDTJt
         qaeA==
X-Gm-Message-State: AOJu0YwbPnyNbYYAineIsDRfgglXXlOwaA6f+2YwyJGRuYUneIryryea
	UrD0s/gQWMQZr1z16tLC8nc4CJK0ByYRg9THiog16BrdxCBOCPEfObBIXOe0ORE=
X-Google-Smtp-Source: AGHT+IHA8WlMRLFaio5MReMR2UzSmY2IeFqtsVVmmSP4eZkT7ywqMi0MQpyya3/ZXC/g7YVyl/2hQA==
X-Received: by 2002:a54:4484:0:b0:3c8:2c20:718c with SMTP id 5614622812f47-3c99702a852mr14038489b6e.2.1715748760241;
        Tue, 14 May 2024 21:52:40 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:39 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/31] Staging: rtl8192e: Rename variable elementID
Date: Tue, 14 May 2024 21:52:05 -0700
Message-Id: <20240515045228.35928-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable elementID to element_id
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 3722fc0cae1d..4645fe803a15 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -728,7 +728,7 @@ union frameqos {
 #define QOS_VERSION_1		   1
 
 struct rtllib_qos_information_element {
-	u8 elementID;
+	u8 element_id;
 	u8 length;
 	u8 qui[QOS_OUI_LEN];
 	u8 qui_type;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 19cb717df3bb..76389aef53ee 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1456,7 +1456,7 @@ static u8 qos_oui[QOS_OUI_LEN] = { 0x00, 0x50, 0xF2 };
 static int rtllib_verify_qos_info(struct rtllib_qos_information_element
 				     *info_element, int sub_type)
 {
-	if (info_element->elementID != QOS_ELEMENT_ID)
+	if (info_element->element_id != QOS_ELEMENT_ID)
 		return -1;
 	if (info_element->qui_subtype != sub_type)
 		return -1;
-- 
2.30.2

