Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DAD23770
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345275; cv=none; b=cQqyCIHLQ7lIjhQBB9ejC29LgHPGrrAr5+aj31pcPgooCjjfZelD575dmc/TAEc4Az/dEnWIEqIsesVRpiI+gwM8GBoxIU5rAgXUn17lDo6hO9JA28QqpsrSUAXzsNL0diSFiRRIP/as2s3YGv/5K1qhg3ai/kb9+g8uDFDqqjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345275; c=relaxed/simple;
	bh=VjSg2a0zESUrQlQ7UqqXoz3ZfIq6uHR65gp54GGKI+8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BN+qD5BOyU19Et9k7bUNck6H6Zh6u/Z7rMzulqQY3HfdA38fVFtOMaLyOgIWawRfOqtxEAfMEJx8HtsQ7ycJeRxKTCbOFR974bXTU0C4NgfjMV2YpHGkwL4h91DjsP1wE/grNI6xps75YoWchnttrfy6YZrVMf2E5mW8etsTqaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=dTaYgAMw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="dTaYgAMw"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ac9b225a91so3102900a91.2
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345274; x=1714950074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dkv6fQ+rdTI8d1Fd3FEdWOYYHkDKSt1pFsTmB15mOUI=;
        b=dTaYgAMwMoHuSMJZmd/J2RnAD1VeS20KzysfXoOTfTS8ikJjiVDvh0qsC3sIsOJiHY
         ln88RcT4EGFityZ/Lc19PT6NqaRiJqPfzV4t9Baq/37ceTKdfUplMOaa+rfUZefFedh9
         1kUlAXLADTHzcrQuM0NojJHqvYmnQx6oVB0kHjKlXQgryjO7ZaeTJPEH0+uyLYkv3v/5
         BgN1bgQ/emNCE2L7rai5QGQn65/x22fjpqhlkNzWPF8wZgCiNNGUd4pYgb2cr6JKb0EG
         saJobqoS9GZ4GFr5//KJbH7mYXZGrW4pj3ZKQWb/QlLiBrJZidnbra3oa43WgO1hKZnJ
         Kf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345274; x=1714950074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dkv6fQ+rdTI8d1Fd3FEdWOYYHkDKSt1pFsTmB15mOUI=;
        b=a1Hg+3X0rI2dk9x30lQ4Nehg5pBZWVlLzDUsCiiuxq+NxVOnASwvd4SyAskl/yw96w
         5fBNopBLZCypmJbFXEoIHIjmsOEyoLjo/uHacG82USuCSQlNEJnp8xUQo/cz22CSCaV8
         idITfimbuD2+9qqYh2mOpitz5r0ONOiDbRa+Fsz6nmYHTOyjTgv0P4zYFwYmyCU8k+sT
         tSbLiMpArbsEXintyPvo3mZY+SCGhFDUqNj789SDABpOYJp6h0I3+n9Wf4MGaqCfLAx2
         S5LT9v15FkzjpmAugD4I0k6D16FOFm2OHV43bFF/llE1Ox4qce/7Wm4DykW0186P3RVV
         JHjg==
X-Gm-Message-State: AOJu0Yxx8iPcLcNnIz3IVK56z8k9ftv/WLF4TtZHWWWdGemjwbkeLHpx
	PlNgNGv48gW1Andh1EMoE6p/Wo1hu2GTj6O56h+/161R1lA22aurFyW6tgoMJwU=
X-Google-Smtp-Source: AGHT+IGDkmjZ+2iDHDjqNo4usnK1Li7Vh3VXy93nGUJmWpm2zxMO8iK+AB5KltTaSHEXqYCCpb+W1Q==
X-Received: by 2002:a17:90a:654c:b0:2ab:b480:5018 with SMTP id f12-20020a17090a654c00b002abb4805018mr8648550pjs.34.1714345272260;
        Sun, 28 Apr 2024 16:01:12 -0700 (PDT)
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
Subject: [PATCH 04/18] Staging: rtl8192e: Rename variable LSigTxopProtect
Date: Sun, 28 Apr 2024 16:00:52 -0700
Message-Id: <20240428230106.6548-5-tdavies@darkphysics.net>
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

Rename variable LSigTxopProtect to lsig_txop_protect
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index d8fb2bda91e4..7e0f64df01ea 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -37,7 +37,7 @@ struct ht_capab_ele {
 	u8	DssCCk:1;
 	u8	PSMP:1;
 	u8	Rsvd1:1;
-	u8	LSigTxopProtect:1;
+	u8	lsig_txop_protect:1;
 
 	u8	MaxRxAMPDUFactor:2;
 	u8	MPDUDensity:3;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 837911934462..503ea1e92a7d 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -268,7 +268,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	cap_ele->MaxAMSDUSize = (MAX_RECEIVE_BUFFER_SIZE >= 7935) ? 1 : 0;
 	cap_ele->DssCCk = 1;
 	cap_ele->PSMP = 0;
-	cap_ele->LSigTxopProtect = 0;
+	cap_ele->lsig_txop_protect = 0;
 
 	netdev_dbg(ieee->dev,
 		   "TX HT cap/info ele BW=%d MaxAMSDUSize:%d DssCCk:%d\n",
-- 
2.30.2

