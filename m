Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411CD27E1D7
	for <linux-staging@lists.linux.dev>; Wed, 29 Apr 2026 03:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434184; cv=none; b=qRFRokB7zn+sZqXd6j4AdH/AY4PHOM+sxFiKomcoWkGZSXiKjrAc98WI7RNFAaQbOB76FNBBWZBD96hLal48QaDaT3WmgBHBAeqr/ipSC2FLClGZ2w19usq58ZsnhpZem9T+wIG3ST6BckO5HATCYTTuNEhHV+mRvp7Y99s+1jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434184; c=relaxed/simple;
	bh=C3gr78ABvtfV0R2HNy1srEiqeebExlW790uplU59/ow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LZoQVeQeuTsxLJsC4oy6dOZZgLHm3ZRTlCLgafkRj9V9CmFOleOH0mG386Ef2Tj5mHextyEbYLiSTfDjI5miRnr2PewzTGm1J5QQ8nahGMqxByQyMoIXQyq4UpjMImtR20rHT37LFIbUxKzdDtOHaGFTCpAA2kN96zXzjWiaF58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuOJ0aPN; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuOJ0aPN"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8a032383008so119142026d6.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 20:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777434182; x=1778038982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ErBgLxBuotPMienbjmzpB5egIHpjNlLVhn6o8FMqyQ=;
        b=OuOJ0aPNxjfERumIqa1oOVty3EKEex01kohzCkK3bo5XsGldw4EN8hvxAvWKkYv+aX
         uKijhohpI69UZR/eRDs7+6u0HFjUf2/n3ugGZkGI8MQ1RKEUNWt6YV8P5QWt9ngOhP8V
         2Yrm43K8pE3Mg5jYZbicGHs0H/HyKgZBu+k4o+9i7ExTya+VezMg5i9AF3idWAmTfUiH
         99Hi+Ua2I8VGouivcr+v11pS++ZuqZQyPrdyFmBr71h/1Hj0epUfkpLZ7Sr7oVawr28b
         0N8dglcnvla2HAcG0cR/sYoxAxy6hSSO2W9HkTks0C1KDKQSaVsW95dpRiInymdV18vJ
         RKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777434182; x=1778038982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ErBgLxBuotPMienbjmzpB5egIHpjNlLVhn6o8FMqyQ=;
        b=aeDIu1Aeaq45LVdhuARvWAmYeJ/fZw0VzbZRpB+WsO0sPjQJ+OUKVqltJRgJojwPIl
         QmGwM/5xeGp7z52sd0NU0P9OTqHyz6KxyANUFL07kQeBePcj/AvfPCp8keWflkCu6sYj
         kJTv81/SO+uc/BqEz9ESMajbbo3uqe/XYG0s0h6UouseHB4yO8B1h6Jspect6BezuaeB
         AsSP6UdTCaR9MRw7ZU4uukU2ajMv5oQjy6j0+8OV3vqLfdAElFQ0eSM3pJkvh/ntqAVq
         PTbQz6r+1/RTWhXHr20rO01SFAT7EOFU4nfzHICrS+KtLWoNn2+5AXDv0J5urLeCULB0
         gR+w==
X-Gm-Message-State: AOJu0YwIHvo83C+CUTKxQwu6PVBVhLJ2kGZIK/ihAjuet1QaxVBZYrzr
	DxBHYhSpMx4Rf7su4ZJExyj2uuE4PvVW5oRi2rWSTQQCoZy6hbHmk+Qh
X-Gm-Gg: AeBDietNKBihuZNqLkrtDbNqlTSl3qZ+JeOwzrvClo/xB35gLnnPo0eVWQWN7g8hMkS
	OqYHBBoVpqYhctqf0Gm8HMcllFkeer8YGBSb8p5rQXt1hhDha1qgfc7cCXd1OnfVrfFAegHW8qO
	ByNl7NqspjbJhitOH0bMJs375lAXozFDbpkE3qB1/jIdFBYAwbdOjOdZgAXMg1nm9MrAdQrxPSM
	zH1eHWZbCkcAI9ABV9PtJK0c5UANvuA8rR8uObAItqgnoNr7P+sB6145GvrSMz31oq67xltwFpE
	C5QHa+aIxHsK75dafrgRrdPJ8L75gQvWgg5pnMpx0WjEOYqDKVFTM/R1gXmyswG1QFstG1hBvuN
	Kuc95jOqMeiUBI0RxGriEYlIxXbc8iV25wjGyom+PZWRTc3rW+vmUetzZIS5OcWQFF4GcN5nGRg
	bB9+I+DhQadChDL608j7a22tIXVq79QVCRuYwunNFXOO77Kv9gMNoxB+JEQmuupa9skCwb
X-Received: by 2002:ad4:5c86:0:b0:8ac:add5:2786 with SMTP id 6a1803df08f44-8b3edc73191mr37163146d6.3.1777434182226;
        Tue, 28 Apr 2026 20:43:02 -0700 (PDT)
Received: from House.mynetworksettings.com ([2600:4040:2afb:6400:d695:5459:e421:6754])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b3ef7f24f7sm8020176d6.30.2026.04.28.20.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:43:01 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix typo in rtw_pwrctrl.c
Date: Tue, 28 Apr 2026 23:41:56 -0400
Message-Id: <20260429034156.11523-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: willl -> will

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0f38..ca1cb58fc801 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -576,7 +576,7 @@ void LPS_Leave_check(struct adapter *padapter)
  *
  * This will be called when CPWM interrupt is up.
  *
- * using to update cpwn of drv; and drv willl make a decision to up or down pwr level
+ * using to update cpwn of drv; and drv will make a decision to up or down pwr level
  */
 void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportpwrstate)
 {
-- 
2.34.1

