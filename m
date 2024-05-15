Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2009E3BBD4
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748762; cv=none; b=LyVOqxfbGHWR4sQ1q+97YCwuB11ycx6X+5bapKK1zgUoOGdYNT7ijJA8y3/4GnKDLkchF/6M5aam5yHqUPhcS9MhTUroL/nINevFZGqMDS+SfOTPIW3HLrd58af49n1TcLQS5fzYG0g/LZX+i6nH4sGx12wcrLqpRJAx6RmBR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748762; c=relaxed/simple;
	bh=2vCRfNs3ZoRpdHPQTS1iVcZSbxc+pNKyzsoICvpoMhk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F2K84v7gfki/fXYiX1W9BvKNqmk8a8UwXDjjiW+mraefgYFTa3wEHKi9QbLfjMfRBzaCjLvAdUH845Dl8/KU07r1yKyf19CW+OB0qE62Opb4B5Pyw7g7/8p6z0glzDEumXquhdANCFu4HqylThZYb/412Pdv1q7oYeBfMLzvIH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=cYvpOu+h; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="cYvpOu+h"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f4302187c0so5015099b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748759; x=1716353559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NN5bUoGVMW2u4IDIB4KeRdUT7NeTKlHAi/jP0KOF3p4=;
        b=cYvpOu+h5QB8pq7el4p+1SubIMgGxx4iiVklVpX6GvJbdbe49OuusLR/kXkcZ8hOto
         vlcUFph1I4El8jn8J54rYssU+SwmIIveFKHGYV0Tbn+2CzM77PHMOit7FJ9ctNgoqBCR
         jU8KhcDb5Bsi3gBjaU7Fr8oBvISXWeS63q9tepQblCNl4XH1nwZsDelO/PRIKv7O9QhX
         oI5F7aKEPW2gZIUqw2Sw+5H/v2g5lQFb1TctV/v/BDvoeCNpkIEWmt2DyHfNx9vzqTSC
         kJAs8K55tKYyoWemN7G2vlhPX/DbXqSYJrm4aQqfypKlwVXGCX4tkv4vN2Q7qZGmvdqR
         Il5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748759; x=1716353559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NN5bUoGVMW2u4IDIB4KeRdUT7NeTKlHAi/jP0KOF3p4=;
        b=J8OLB9IuKKoMAseRqQtVUYpntKAWaXipscLcxDHgbcvV+RlYtRXZ+kX8+Zx0aut899
         XuuuRXCHdTl2dGAeFsFWnvY2NVyMrMN316lF6hcwNspMDK+wzO5huIFI6gZx1fivtAok
         NM1WjekbGmxxG5qme3JyqWK5Ul9axXlmzrRCWG22xLV/z/+IZ52fjj3q69uLjLQKr0p0
         PjCnKVgJzNrm8NI1azSDOuF9MQyNVK96uPKPJXPkmmwZafERgdYzQkUaC/xFLaw/yvcf
         Hpz0R/kAVBSlQrHk089c1CoocVX5287jzEjyjZxMos0st34aOoAU+CQUf3JT7JkNJA4D
         995Q==
X-Gm-Message-State: AOJu0YxbkZmbRkL5mpywmAOniO2mzkFHBVjDM/7WgjQDJwhQRHxGcheE
	CBbZYfiCr/O0F4ps2iFtWNC5Am+0E3gfzhIfuYOkUZD55bwTnJNPZ8qFCc4ZVCg=
X-Google-Smtp-Source: AGHT+IGQ0jOhzWnhEJkBZ9+JsfxwNIe2kgVLLiItKS6Fiz/UcR/lnLFBX/tUVVgvDx6eW3f+QhA0fA==
X-Received: by 2002:a05:6a20:3d89:b0:1b0:c1:d8be with SMTP id adf61e73a8af0-1b000c1d9dbmr9274924637.1.1715748759310;
        Tue, 14 May 2024 21:52:39 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:38 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/31] Staging: rtl8192e: Rename variable MBssidMask
Date: Tue, 14 May 2024 21:52:04 -0700
Message-Id: <20240515045228.35928-8-tdavies@darkphysics.net>
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

Rename variable MBssidMask to mb_ssid_mask
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 7f1c2f49227e..3722fc0cae1d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -915,7 +915,7 @@ struct rtllib_network {
 	bool	ccx_rm_enable;
 	u8	CcxRmState[2];
 	bool	bMBssidValid;
-	u8	MBssidMask;
+	u8	mb_ssid_mask;
 	u8	mb_ssid[ETH_ALEN];
 	bool	bWithCcxVerNum;
 	u8	bss_ccx_ver_number;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index c29efa3eef6f..19cb717df3bb 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1818,14 +1818,14 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 				network->ccx_rm_enable = true;
 			else
 				network->ccx_rm_enable = false;
-			network->MBssidMask = network->CcxRmState[1] & 0x07;
-			if (network->MBssidMask != 0) {
+			network->mb_ssid_mask = network->CcxRmState[1] & 0x07;
+			if (network->mb_ssid_mask != 0) {
 				network->bMBssidValid = true;
-				network->MBssidMask = 0xff <<
-						      (network->MBssidMask);
+				network->mb_ssid_mask = 0xff <<
+						      (network->mb_ssid_mask);
 				ether_addr_copy(network->mb_ssid,
 						network->bssid);
-				network->mb_ssid[5] &= network->MBssidMask;
+				network->mb_ssid[5] &= network->mb_ssid_mask;
 			} else {
 				network->bMBssidValid = false;
 			}
@@ -2349,7 +2349,7 @@ static inline void update_network(struct rtllib_device *ieee,
 	dst->ckip_supported = src->ckip_supported;
 	memcpy(dst->CcxRmState, src->CcxRmState, 2);
 	dst->ccx_rm_enable = src->ccx_rm_enable;
-	dst->MBssidMask = src->MBssidMask;
+	dst->mb_ssid_mask = src->mb_ssid_mask;
 	dst->bMBssidValid = src->bMBssidValid;
 	memcpy(dst->mb_ssid, src->mb_ssid, 6);
 	dst->bWithCcxVerNum = src->bWithCcxVerNum;
-- 
2.30.2

