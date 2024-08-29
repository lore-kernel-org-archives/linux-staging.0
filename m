Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD8B19882E
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 12:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934779; cv=none; b=lQR4Fgiy3L0vosRjIAiYQ7PKS9+kF7yJ8V7QJ4MkO/oMEx0RP44dWGD2qjjRdNqV9Xb6bK8LFOIobRbzA3aa8lPrGImZAmqQucBWAqwC4XAH/eSBAez04JlXo9R67T0+ohAir0K8NBs0lt/r0JMM7AGXCeygt0vhZq8QwHXZzrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934779; c=relaxed/simple;
	bh=SRTXte8ancTXyFLBRoxU9ak3vwXJ2tIzSD3U9JJSDho=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Z1u535/YAy1yvdRxRJGkJFfHiq9qeHe78CzQQSQN//S3zJTLkscYyi23EQfiE3kNivrVUMb4LWvllLhsXXX05Otrt1xEyVUTDe8VfYkA5xzKTOweZAqoedjtmiBRKzZim4o+DeOO0vM7tTIXetqMEth3c4wYkNYDHi0ep50Pa5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IABdhzhA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IABdhzhA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d60f48a2ccso455816a91.3
        for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 05:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724934777; x=1725539577; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpLhta1Onq53+bLklwgL+euTgLHAYQa9BqkAwN2sT7M=;
        b=IABdhzhA4CBUWWno2zcUMoty0J2nBAg3Ewwcp5a1YiFBCOQI26VFTpfyqfOQ9mvuI5
         ddJ2cHvwDX2yPYyx1ldpZqjuGJvAJtXb1Dc1jpY4JPopbC11oGWjK57iulzVbcPBWQ6/
         S3FUeBCqaYFhrItDp99m2QbF4UhseZN6VI/1PGJdicGMEQvAWkCq0OEDiGJYn8oPyuF+
         jgzC5bPNKbtuzv3Cm3yVirbQzHYjCaTAHtoJzWWForLb2fBMn3w8s1oMk1OClJUt3lU9
         z33ICPZEy8m2ye2f2l7VgoOK5ExCwzCo1JrIlh+C9KogyaeVV782Wo6HwXk1rK6DLE5g
         RuWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724934777; x=1725539577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wpLhta1Onq53+bLklwgL+euTgLHAYQa9BqkAwN2sT7M=;
        b=hf/dkRci7+bryMCb+k297oTJGpyUaZRMlnn8/dXMjiTIRseYleLv9yqeAzDQo1JsNo
         GYe+OigCisN+P+juekZeYR9doyVSGVrFG2ebSlUjU3TmBYiB9d5bVIg2mC09r7qbIVwO
         KNW8/75/pP7BDoZZLKFAeYOJbA+dleCpehBt9B/axRC5f2ZULDGoDWZZscv6gU1QQU+j
         HVVqualjbKzIKvSZznAB7vKDcT2qICTbLZtIf6hWmOiEV08lg+EATajx1v9LXGhzsSZG
         uEHBW4R00rQg6mIoGEDhMFolLGX9xDPmgbiyal/dLJN1/6HHFu9t6XGalsVGqx+yqpIY
         BxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHyVqtIZs9E9IRKMkkGtZ5YAyl+OfkFHRMwBKY6Wf4vH6F2kpLY3DxwSQ21ucqhogzQeBhR4h8mvqI7fGu@lists.linux.dev
X-Gm-Message-State: AOJu0YwsoQYsNHMBlRKFS7MqcTl5252sZre5cmxZYdxJxSomkYMealgU
	xydGSsi9k1Amn8dLZNjDpkdF8iQ4LnNYiRLvWsIxAzui836EfcVw
X-Google-Smtp-Source: AGHT+IFPdLOOyBet2Jy2mM6kcKOVaAQsrn9R4BWD5QxRsyht+GNlHw3NaHP4yGnS7m9+DDzubndddQ==
X-Received: by 2002:a17:90a:6449:b0:2c9:7611:e15d with SMTP id 98e67ed59e1d1-2d8561d3ae1mr2760812a91.20.1724934776506;
        Thu, 29 Aug 2024 05:32:56 -0700 (PDT)
Received: from BASE-20.technicolor.net ([2804:14d:c098:8bf5:58c0:549d:d99a:c399])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8445e8010sm3971138a91.14.2024.08.29.05.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 05:32:55 -0700 (PDT)
From: Alien Wesley <alienwesley51@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] staging: rtl8192e: Fix Assignment operator '=' in rtl_wx.c
Date: Thu, 29 Aug 2024 09:32:51 -0300
Message-Id: <20240829123251.83574-1-alienwesley51@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separated assignments for pairwise_key_type and group_key_type
in order to silence the following checkpatch warning.

CHECK: Assignment operator '=' should be on the previous line.

Signed-off-by: Alien Wesley <alienwesley51@gmail.com>
---
v2: Line number removed from subject
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 47f1adf30ab4..2d42e7a5bcdb 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -677,8 +677,8 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 
 		if ((encoding->flags & IW_ENCODE_DISABLED) ||
 		    ext->alg == IW_ENCODE_ALG_NONE) {
-			ieee->pairwise_key_type = ieee->group_key_type
-						= KEY_TYPE_NA;
+			ieee->pairwise_key_type = KEY_TYPE_NA;
+			ieee->group_key_type = KEY_TYPE_NA;
 			rtl92e_cam_reset(dev);
 			memset(priv->rtllib->swcamtable, 0,
 			       sizeof(struct sw_cam_table) * 32);
-- 
2.34.1

