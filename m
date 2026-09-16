Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714134A0920
	for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549332; cv=none; b=mOKsK9ChD6rnsvasSHR0t7HdMdusK/5830S9K4ryfeUVqeF+4lohh5GRWaGKFkKY9mpODmNfov+7KU69wNd5mKfuCajhiRvnoJjug1ntizG/bt0GEH8EHAnEhS/iUC+LjsquLmbhb6opsTDr4Ens/NKe9Uerg5TffjMh+QYb8fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549332; c=relaxed/simple;
	bh=j5sbj2aiiq+G7EZlSbj67WaGpilF88mvU2dc4Sb1Ous=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMQQQKdbn41ONuzxC0vjQnMVYj+Zqok5Mn71k3J8Ai8g93f/FQXT43VFWU0VpHFx41NzW3ZXqt3E9ZkNhXM3H8e/JcVmD4WfGTvDizm/kVtlK0mAUlQVMD/uvPZWfIUKxqfO4C/gSuybfCIHRzZA/ep9ladDlcTtez0852geZI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iW6itGbk; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iW6itGbk"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so406942f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Sep 2026 02:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789549323; x=1790154123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mLpJwVn/HuZGfr8ir4XRFNtWV419k47czEV7zvOmQAU=;
        b=iW6itGbkmq5Hvos1p4iLGxbWKB/jjkgvOjO21QQRPuoow27vTLv+dA7Hd9FGJtIX7M
         tHL/0gDTH6tNmHoeD0lmG+FGcj1uMkO5Q/MzPXm4haFHZ1lrTbIymIQSRY/02XPV5i7Y
         OqC+MlJzyIyv09xdfNL2PxpjJaf47F9//Jiw6Z/bEE/xYVAxQZgrg00Qw7gqUkdaakg5
         zqYJhjIVQqdAjn2/A9n2o6QFie8ersY9isaVwugcqgnfU+6+yvQAJRjNJOFhQ/a8tv92
         yqlZ0rCBXBWiS3AdmmWuBcy4EGLM+3/mCmR0OOvU8ATJKswwkFaP5jmKEtImGJ7U3yg4
         xMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549323; x=1790154123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mLpJwVn/HuZGfr8ir4XRFNtWV419k47czEV7zvOmQAU=;
        b=Mr4MRRR0aLgZiRSXMoVPac+Vyt0j3JU82Zqn0Yx9eumuuCy7aeA9pzobrAl8lSWLWV
         l6StO7WsjW/0PjlP3IAutHB1pxl0MNOwX6pNWCIJdui7af9Y73GcRdjuIv3GC1ZQnuzJ
         Zw7g2aLSM87kEFBzPyPxtmfInFsIcS0EgXXYqRA5+7dvgwkT55h7pHHYSSxZjQMnRnRi
         qQKUqW5SlCiTxtX1SVnlCRvlQBfTo39r39vGvdLyrw0UGSdNu8PWJ/2AmE2M9tk6Yo9/
         umRPdw965RiZXe0Gd34833nUSA6+8NKr35Vbu/b0HUQq929SjSHeO3fXO4Whx2E3eeF6
         qpEQ==
X-Forwarded-Encrypted: i=1; AKwUvBznEq/FlLPVCobyFLnNhoE5xs8rzs6gnggnaNKD4pueDRXDmF1mAv5+vz6JxRPDX0l+KeA3OU1n+PRzB4pq@lists.linux.dev
X-Gm-Message-State: AFuF++lH8JEFVcz2DhLbxkQujijaPISMQALLeldD8s8Bz4IaH5Fkv5Iw
	keRaJJCF7x9E8/UfUnPj60CNjATNQT7UdOuGufJbg7aI78p8BLPvdX8Z
X-Gm-Gg: AYBFou1V4bxMV3ErsluVm+2ayppAtcFCT4SBGaeqNdvZauRoNXQ9kGYZyDZHGVO9El7
	5Ndg+mSeMaNOE2e6jQBIB34na8lSILgP0yONevhf7hKed+62jE+1G545sVs3QXpo4w22yrIVqct
	cPY5D+BHIgn27gywUkRYkX/YUHRVzzxEQdUkNGn+VjFXEe5momdBISb5RurIMiAN08VUz0MluCK
	ZxwRNvHXUh46StGGOHU2+q8kUhPAmJ/KgtOqiZu136l01sJQ+m7Ztb4jiMe3Zd2BCkEOg/BgyBK
	VZGrt4SCUHleidgdxfrbCnKOHCdwrFAguFM/GUHQyTQtya/Zv4E1GQji9EW8fcY0aTTr0hSmipb
	+umvDCbtLlNCRP+OQrgDmppZthCkJd6BBdGlTFz5WjvW0tx2/EqXMNO064njOzf24Ww/jxpttLK
	fK1aqK8cm66EJqIY2oqM5EUrWQ67dLAEm89EOuJ+pijrXgspnZpbV4zMAMXY01Mde0
X-Received: by 2002:a05:6000:1845:b0:487:370:d03b with SMTP id ffacd0b85a97d-4870cf201dbmr2386458f8f.19.1789549322496;
        Wed, 16 Sep 2026 02:02:02 -0700 (PDT)
Received: from omermac ([82.222.238.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf4161fsm5229696f8f.34.2026.09.16.02.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:02:02 -0700 (PDT)
From: Omer PALA <palaomer100@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: sm750fb: remove unnecessary parentheses
Date: Wed, 16 Sep 2026 12:01:45 +0300
Message-ID: <20260916090145.34881-1-palaomer100@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around equality checks in sm750_accel.c

and ddk750_swi2c.c to clear checkpatch.pl checks and improve code

readability.

Signed-off-by: Omer PALA <palaomer100@gmail.com>
---
 drivers/staging/sm750fb/ddk750_swi2c.c | 2 +-
 drivers/staging/sm750fb/sm750_accel.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
index e63f3b00e..24ad58207 100644
--- a/drivers/staging/sm750fb/ddk750_swi2c.c
+++ b/drivers/staging/sm750fb/ddk750_swi2c.c
@@ -393,7 +393,7 @@ long sm750_sw_i2c_init(unsigned char clk_gpio, unsigned char data_gpio)
 	 * Return 0 if the GPIO pins to be used is out of range. The
 	 * range is only from [0..63]
 	 */
-	if ((clk_gpio > 31) || (data_gpio > 31))
+	if (clk_gpio > 31 || data_gpio > 31)
 		return -1;
 
 	if (sm750_get_chip_type() == SM750LE)
diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index bac9a2098..21aed73d8 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -202,7 +202,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		}
 	}
 
-	if ((direction == BOTTOM_TO_TOP) || (direction == RIGHT_TO_LEFT)) {
+	if (direction == BOTTOM_TO_TOP || direction == RIGHT_TO_LEFT) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
-- 
2.55.0

