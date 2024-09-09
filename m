Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0574737160
	for <linux-staging@lists.linux.dev>; Mon,  9 Sep 2024 04:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725855359; cv=none; b=pEfSUzJRJ0jgTzmVm8uzuND4i8HEnIqcK8eEo9pyhRNj3Ns7piUoV7Dn2nUFp65Ksqpct2CHYiro7o+Lz/z3+FAYNjFAK/06G414+3IY6lQM/hHUtRJ54rsleeQrtb6fs0rSNc/3Rz0c7t23y4LLXwn6SPLB2uJa0tEZJWTMVmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725855359; c=relaxed/simple;
	bh=MBlBxn3t1h4ykxy71xe2ccc5K5aI1pv0S5R9Dojvn6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uE/s7Wu512wIFTJLgDs1VhgZ1g5FbQYQQc5K0mozykARXVAec9gPfAtSRaxRgO0isj7ANOPSyaPtyVciZyQr13HtgsXui30LwhNIF/MJF1ldpdFueZjaFp0/L1Ravj2MeI8WyoxgBqQZKTrvDRKEn1pbAYuDu6N/Xz3Hc7SYSU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwSjmWSp; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwSjmWSp"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-717880daae7so324988b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 21:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725855356; x=1726460156; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3akMNQABCnRWtQy+W1zIMIz/6+9MRKicWpteLSTpJok=;
        b=EwSjmWSpC9daZ9xbW1KJhsBivZ0Ap5qunFhWnI/3POb5wuj+qCAouQnP7EfFA5cdP+
         ectmhy7UoUOxilTB2aMtcWjI4afTQKb9k1+9OQMk/Uo+t7hO7AJjGpcGsENNPCzqhjA3
         feLuTL/8BstYkRXmTjeYSOlQ+eD9Sod0+KMWm0XK7lwFDnRk2RsjWLuNJ10t0ZZwSNoM
         oOlje4KfqJbIucoeMx+9vKLOqn6a/Oc0YbmNl5sylG4PVfqHAc7OGCeTaqTMD2R+Wy4c
         M1QxKhI98TXjdSgJpa7KiH87gY5V3cFGdHXJ4rzQ8vATmUHrG0sQ6//vihDBMSkcEBrD
         hMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725855356; x=1726460156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3akMNQABCnRWtQy+W1zIMIz/6+9MRKicWpteLSTpJok=;
        b=ttCXgjY3Z2iZfvkeMHoFOkmktgIup3R8vGS3x/gpld2p2d9DdTPby90VdJ58L32laU
         HzXeQ+4H4W9Vybyej5QBpZQN+ypWjib5wLh+Lpyl/LUvv13J7UNtus5URPm2sS+cNP9E
         IpAuEpqnp6n7otOlLfdwgS2mVrbKfUwu6/wJOocVvwPd6iNvY6EG1g4xNviAES9eE6x5
         IY2bwp7ceOicRcgkRnH8iuQ3ElilZOzjztylJYV3FEIwSMbAVHcAs8Zwn52su7xObxsq
         v/cnVXd6BXIuyJEVGbszEkuxl28O4622fmjd0kFLXpY3o7QbKdE73ce33rm10DnV90SW
         qAbg==
X-Forwarded-Encrypted: i=1; AJvYcCXR0byTeB33LyNsPMIqS3AT4Xq205gl6AdElVbYOm4Fk1UPmsIPYg2I0cuyIbZxUleEa1rJp7OzrBA00fnY@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1uilPjQMZkJ68k/PYdfysyexDxysyD75us3/5xBy94VscpB8U
	P0tDGQzs45Ro01nDp6wirSFNfrSwGiXpwFa0rATuTzBBsS3mhxKq
X-Google-Smtp-Source: AGHT+IGpH/cQTxEBRwQSzysm7mSH4RoHBLBkFKfJnnYP8Nm+zEPk0mHyyngxSBAPbeQT5TASle2bvg==
X-Received: by 2002:a05:6a00:14d6:b0:718:e49f:4185 with SMTP id d2e1a72fcca58-718e49f4202mr2794372b3a.7.1725855356158;
        Sun, 08 Sep 2024 21:15:56 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718e58bd227sm2669605b3a.64.2024.09.08.21.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 21:15:55 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] staging: rtl8723bs: core: Fix spelling mistake in rtw_xmit.c
Date: Mon,  9 Sep 2024 10:00:49 +0545
Message-Id: <20240909041549.2449-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
v2: Created patch series as suggested by Phillip
v1: https://lore.kernel.org/all/20240906141157.10167-1-topofeverest8848@gmail.com/

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b1965ec0181f..755c1bc86a74 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -45,7 +45,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	init_completion(&pxmitpriv->terminate_xmitthread_comp);
 
 	/*
-	 * Please insert all the queue initializaiton using _rtw_init_queue below
+	 * Please insert all the queue initialization using _rtw_init_queue below
 	 */
 
 	pxmitpriv->adapter = padapter;
-- 
2.34.1

