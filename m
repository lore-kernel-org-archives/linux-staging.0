Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4156E125CD
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345273; cv=none; b=sdVLtpurBmZODk/vlp6J9DqP3LeN7hfGdp2b/u/inSa/slr1HfXyqpXDSPVBLTn9/NAiapYZOr7v6AWl9TxhVGvBVDoEWqzGeBs3y0BPJ0w3S/MqzYsabdfZQPU5/gy6p/woNjxHM71DZwh8sBAyew2tFNw4IttK2QH9SWoFgFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345273; c=relaxed/simple;
	bh=m1D6/uyC98EV0PGKmiylDGYkLRZjkkqiIkmWezY8OMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=a28YE0zdjhzhfeBP9Cwa8LsaGUpj41jXhOQcZ6fhs+ZTRv4HX2QNA272KKKpXAqPPuYXCqJz4cBjg1SGPpYyGLWiSOxCJq1swATj0i6nkaWyvgRStndZDQlJ39UHT/bf8jyzObi30antT4jMz0qhPeT6EoYLBRKT82Q7Zmhf7ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Ck3YptA/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ck3YptA/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ac1674d890so3449264a91.3
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345271; x=1714950071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8x1dK4AwyIF6K2TyibRSTbnCe/0I7bAw7PdKPkHIy0=;
        b=Ck3YptA/V+tMgW9WKrSOq7z2KFDymeNxKxpVinXlR5BGgB6KXuXAkYDyfOiDoG5oUn
         xjpeCt8SOqkrfezcEXh3uKpb7Zceum0/u5zPQF58XSme6AtD/zkrFN/1VlavoiknGSXd
         a7BG5RDdgPKrf8Qi+Cx7VGEjDIS23dDF3Xl04hzv8FcAsq27htdpWDk6fnAPH48NNzcC
         GAcbyE05VZZI6/qMdg2GIJ/HSTbRABKCNRmpK7/UF5USkgjLEbpUXT6+S2YZNp1SrgRe
         Wy09iP8tE41JkrIdsOXVQagAt5yfquQPBIG6IMPjHVGqtAoNB0UxwRDnrkOrSSpZwb1x
         yLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345271; x=1714950071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8x1dK4AwyIF6K2TyibRSTbnCe/0I7bAw7PdKPkHIy0=;
        b=OLryljVWabJEdAudzMIOzZDk0zkkzcB+p2mDs+K/Wzpzs+ItFsx7Li/yBOZgUF/vQg
         o1sJX39GLaMUTRCOCP1mauj5jpLOd7WP1X7abtTVjwVRJjZS3Fo82wE0Q+gr9cGM9itQ
         Mqk02Gs4YFICtjS/I9/oDZXM7mR0V8OcJBgr7QmQiYPBoIuTSYUcADIU337aFGHrvJxe
         JiOdPeupIe3K6iavmfPWZpa3xx6JSRyuHFOIv+qmyMO9JhLeAcxj23/TgLRni8eddKbv
         9uTM+PAv/yOfoehJkmD83m7n9ppAzuJ8WNQRZ0fY46yL73nA09X+Me1xBEFHt9hdoBgp
         8Bmw==
X-Gm-Message-State: AOJu0YzIAmXaPy9j0ES0bK6mtjP3euIqlzeykqeWHlXxpDB8eATus5SS
	pVW7SeQnIjECtkG65C1nizJ4iC0sEB38g0XWjfPQ6ehIIXgro3g2pBCBwMpqGMs=
X-Google-Smtp-Source: AGHT+IGPRe1hgJ3pnA0dCbofd4nvvs+/KyfOjg/JrI1DDLZitFUPOxYLRhz+SW3zz5gazE5Lvr3u3Q==
X-Received: by 2002:a17:90a:4296:b0:2b1:13ac:cb35 with SMTP id p22-20020a17090a429600b002b113accb35mr3524388pjg.30.1714345271610;
        Sun, 28 Apr 2024 16:01:11 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:11 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/18] Staging: rtl8192e: Rename variable OptMode
Date: Sun, 28 Apr 2024 16:00:51 -0700
Message-Id: <20240428230106.6548-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable OptMode to opt_mode
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index b789d0f17156..d8fb2bda91e4 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -62,7 +62,7 @@ struct ht_info_ele {
 	u8	PSMPAccessOnly:1;
 	u8	SrvIntGranularity:3;
 
-	u8	OptMode:2;
+	u8	opt_mode:2;
 	u8	NonGFDevPresent:1;
 	u8	Revd1:5;
 	u8	Revd2:8;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 3982c37f208c..837911934462 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -498,7 +498,7 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 						       pMcsFilter);
 	ieee->HTCurrentOperaRate = ieee->HTHighestOperaRate;
 
-	ht_info->current_op_mode = pPeerHTInfo->OptMode;
+	ht_info->current_op_mode = pPeerHTInfo->opt_mode;
 }
 
 void ht_initialize_ht_info(struct rtllib_device *ieee)
@@ -617,7 +617,7 @@ void HT_update_self_and_peer_setting(struct rtllib_device *ieee,
 
 	if (ht_info->current_ht_support) {
 		if (pNetwork->bssht.bd_ht_info_len != 0)
-			ht_info->current_op_mode = pPeerHTInfo->OptMode;
+			ht_info->current_op_mode = pPeerHTInfo->opt_mode;
 	}
 }
 EXPORT_SYMBOL(HT_update_self_and_peer_setting);
-- 
2.30.2

