Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BC03BED19
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 18:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007286; cv=none; b=GPqreBbj4sZSNphO4WNi2mQd4XOXeqfaD/5Z0iRnQjx/EEXYNQIIGVcqtVohaCbo2fpHEHlFLyh2oOUhk3ceA+8gJZzY+S9Rxn3fq8aDTEWBlmZnjCr0/gYvOrFZasKNFXneIjPJzaqSJ65RqloImUyIkdKfdX27udFsieAqXzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007286; c=relaxed/simple;
	bh=03OKUdsFJb7XM7JZewGqs1nLANOr5nc1nnx84g4nCTw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kNOux/Zn1/9Cqht8SobzGZv1o4wINS7KIMcXvLPjb1VtMAYur1jGtmoM9wnTNAx2lfEAjAlQBpyq/vVGPng9qCLDKsPEP8Usdq/MxcE+XlwxMiGL3IUT6M2o/UFv26ZgfW7d5R6B4tquPtH+KlS3ozrjsoTHHz5ITN37T79VtVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFwkr3Us; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFwkr3Us"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ecf9e398f4so13429526eec.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 11:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778007284; x=1778612084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OEstTX+NC3Fx1zNBW+YXQLV3Q+z921lYJRQU11plO0=;
        b=gFwkr3Us3uZCTL/23qOpjKnA5TBeOiNYcs6eTCIEN3P9w8dm70LCo+4FklzLJgZYUr
         3fLcur1qq6ORGIsqKKNJJixGSAdOgOVTN+cJsKKmeQGyfWqzw4ZRS9Ml7ZuHJW8MK8a4
         u4NSgOUJSlFznYYzkkPjYsRIAVKvEc4Z9Xi0oF9ntyWhtTQWwwwJu/E0os4LRa6w1Zhd
         Hl5ynyOUZP5BJt8gWv9e0Wi0oL/AbhqJBdSDyVcBvXLUCbsGNrT2TmDKfPl47JDKM49P
         E58VmICnM5ujrQ82HtdjtLAAgArWFU/bZi7z0R+f9wcIQePnA60eUgWEAqHwAPjGgUhd
         H1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778007284; x=1778612084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OEstTX+NC3Fx1zNBW+YXQLV3Q+z921lYJRQU11plO0=;
        b=Py2CiHPgD/Dx6jbXOgjviZTM3aZM9APqr+GJustDDUz5kK5xowxd804+wyEASfjwtx
         FurqdcyjFiHX0ywrDgqp3IhGxXJ2P+5alKBehL1+9sH/q8p/zcOzpwb4JGYZbfMLkMqy
         yKUppsiHkuwQKQ4RAL/tePncBTyT7vLN6Ct2psPd9JCxxoN3AQezLg/h/3WZt9DYGRZC
         9eupeGrxpItBTnkEjjwRbnTEusGbl/KeOTBWEASGRaqvUoH7svPZp4HL+ZNg3waNXP9W
         88OWWj1u8Q3NPwVo2EtnXsegzunmqZRNEvvyVHe2aa5nK0yBeLcxEOkyTxSVwgpUOjgy
         x6xg==
X-Gm-Message-State: AOJu0YyK1ikLzyYaI0ZYsu25G4EeEyoB/0MViU7pnyw+3tz46iuxwj68
	IzLbI0Py07DLCiCL4XIedruPT47bAy3qwZZXgg0F6/Z8KeCBx7ELQ9eBIYbPSmfR
X-Gm-Gg: AeBDiets8muvskw6gSibZ4gPpR2fPQ9TkRqsz+SONGSA/iLWoYjdK9G5Y46cNbLAK5k
	x5Q+P0hZxUOnN5gQHOwmIhwYuMm6OM9jRGC9mZyNRRQC35gxkIPFwxQvJfB4axR3SviWqojrq2K
	sDGCuo2n9LTbysSpNweLoL1Zaggi9CBi9hPiR8Kynr012E2ayMp1X830JncmZ7kHe517p5fl4jY
	eYvGSVD0EXvM3VlbXyslAHh/pdQjZ7J6WzVzaSJCcQ4RA+RNS8rjoraLT06ZYhcF5DMT7qCOlLm
	9KY8yJ6hr1cc4alF1kcoMw5D2DTRDYK96QOgE8qhBR94C9yuXByO7w7yHhem84DZm1s32KID5NV
	V5obxEdYNLQJpXplxBNLmQzeEdLBCdlvIeOLfUTD3HflMFDKcChgvrr3RZJkd/TLUwqhT5K//Qe
	uYFrsb+LlOvqfXFx72VTwVLQ8uBI7RWQj4PIOTJ00MdNE=
X-Received: by 2002:a05:7300:8ca1:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2f54d57ec74mr283433eec.28.1778007283734;
        Tue, 05 May 2026 11:54:43 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2ee38d78391sm28738774eec.7.2026.05.05.11.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:54:43 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary block comment
Date: Tue,  5 May 2026 11:54:31 -0700
Message-Id: <20260505185431.27037-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Found a block comment formatting warning in odm_interface.h
via checkpatch.pl. As far as I can tell, this block comment is no
longer useful. Hence proposing to remove it.

Let me know if I missed anything!

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_interface.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_interface.h b/drivers/staging/rtl8723bs/hal/odm_interface.h
index 400473ca58ca..c3b13f5f37db 100644
--- a/drivers/staging/rtl8723bs/hal/odm_interface.h
+++ b/drivers/staging/rtl8723bs/hal/odm_interface.h
@@ -18,14 +18,6 @@
 #define _bit_all(_name)			BIT_##_name
 #define _bit_ic(_name, _ic)		BIT_##_name##_ic
 
-/*===================================
-
-#define ODM_REG_DIG_11N		0xC50
-#define ODM_REG_DIG_11AC	0xDDD
-
-ODM_REG(DIG)
-=====================================*/
-
 #define _reg_11N(_name)			ODM_REG_##_name##_11N
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
 
-- 
2.34.1

