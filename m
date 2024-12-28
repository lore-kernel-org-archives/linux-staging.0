Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCEE14A62A
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367169; cv=none; b=j1iB3dn4aqbnZWX+ZGKamMdSsrniPKnZUBv3q3VRSu9RrsdUwm3GLdcQTb24E4GPfvCzMeNIrSoSCTsDzGkRc838+eoCJOU50vlyae1ivltCn6G3GLCOfOBeEMFNrZiTRWR5ua5+rso7x072SYyMPDl/D8PEwOmuRTZsgITURkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367169; c=relaxed/simple;
	bh=5RPOADarcrakfDotD1CuhKlQhRBJCGEbR9E+aj4sxmQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U+2KqjlLIPi4/TqlHXuIr5cgSVWSBTwMVtvg48y5Ci9GWXqRciiEOX/zm5XkfELwiT04eOWnyyRax2d716XfymlJA5oDTpby04x99viw3dWSR9MSBygfL9isbn3oHr2IOaW2ZB0fRVzGYY7C25w/3Wc0Bg2KDEPNNlZc3u58IbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c+buZ1wq; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+buZ1wq"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-218c8ac69faso11734905ad.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367168; x=1735971968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4bIH6RGM0z1JJhXp40bqSwGh6KzMQQ7CPOGwKP/Daw=;
        b=c+buZ1wqX0ptCCcrsg2jCC+IaTXY6NSnP7f9PScD+8nb2bZL2fabPNNF6ym61WVRPg
         imHUh+bbHwZe/z17t4i9px9dX2IF0OrDIpX++heB84w/bR7nymtNn8vG2Zz4wMl92I8+
         42EFjqd/DauIlMFSCjVBWyp+auzgr355JZP9+k7dSHTdh6S+MnP3I11IYoimdRBddKxZ
         eHI+F/l1EUDfVgg/kTMGYYYU0b+mxnlotp3eC7wxSnsSDqCxQ0HumUHFNdodYpTSfzNf
         Zcg1mGYO8GWfte+Y38Xq2XHrwLN1bGvxIwWctB+lPesfzwp+yBickj9ul9bXMUlpsXGz
         zSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367168; x=1735971968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g4bIH6RGM0z1JJhXp40bqSwGh6KzMQQ7CPOGwKP/Daw=;
        b=CcU4+HyKMJdr7Z04UCVJ4Mb7fzZLDSecxaLJxE4EmS0I8QxhodFEKAhWUoVfkh3lDz
         lt4sKthgL5RJfinyew9lKhCxoM33xWHU6+m0lczk2PrsBCUuLNasa55zRSlleDH2pavB
         Xh+f7l2a1yAd/a87Vr/NABqsdzLLYVKaEeHRlN2Y+zqtjh8gbLAkd4G0/MCGj5L26CpF
         OQflITRC7Dp+hR1D0CphevVJGZtq6/UM6g0ur64BHley0d0B6fmUQZAuK51SqG6EqoT9
         VMmaG6oinH6BmjTBWIm/hsokST62x4QTtEo/K931U7L8ciG/3DqC5Muv75DiunwSraVY
         kVOA==
X-Forwarded-Encrypted: i=1; AJvYcCWdHYkR0GCfY+7kjaEeWaWglQshBp4l3lmF+ztBCMQgW8vj8f9uxJjNONVtJIxevOWHQm/lVlB85t+QlpDv@lists.linux.dev
X-Gm-Message-State: AOJu0YxJqBID4Hu5NKOd5u7OlKuvdf3OTZjbI2uUhl64AauD+Pwrnp6J
	uq8ZJzjmKKtfDIGHX0+nBgd6xd0zHgG8MkSqXm8Hu2lyfrjQnGLi
X-Gm-Gg: ASbGncsIIzXCX5lzYxjnk4Qm5kmK3uMOZutKOihmbuVJLR+Rwgk58NclFhxMIOLyeyi
	zsMa1DgAykR5zV4/WAb5ut3y3I0fYUJ431PnZxfded+2u9mO8F9jn7C2TtSetJfUMeISpiME4nm
	SPGJtw7UsXFQwInCXuhROiTDTeeuTf/vzG7XmU+wst36YPs0H8g2uINXkjEUDUy2AhVnK578fy6
	YZ2l/SyG6gTaWmblqJNYPnlrzR7Ms3NMhEtI5iW2tVhHWxIZIRtVsw=
X-Google-Smtp-Source: AGHT+IGTxlsItD+a8SxlZhWTnZItAiFo7zZPWh18ByNq8xeO2EVO9u7NmUA8jRJYh6dcBsSGECDbkw==
X-Received: by 2002:a17:903:228d:b0:215:9d47:4897 with SMTP id d9443c01a7336-219e6e9a124mr150181775ad.4.1735367167839;
        Fri, 27 Dec 2024 22:26:07 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:07 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 10/15] staging: gpib: hp_82341: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:58 +0530
Message-Id: <20241228060800.107653-11-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228060800.107653-1-niharchaithanya@gmail.com>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail, resulting in a
semi-registered module and does not return an error value if it
fails.

Return the error value if the first gpib_register_driver() fails
and if the second gpib_register_driver() fails unregister the first
gpib_register_driver() and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 8ad1c885a9fb..eaeed8fb77c3 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -807,8 +807,22 @@ MODULE_DEVICE_TABLE(pnp, hp_82341_pnp_table);
 
 static int __init hp_82341_init_module(void)
 {
-	gpib_register_driver(&hp_82341_unaccel_interface, THIS_MODULE);
-	gpib_register_driver(&hp_82341_interface, THIS_MODULE);
+	int ret;
+
+	ret = gpib_register_driver(&hp_82341_unaccel_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("hp_82341: gpib_register_driver failed!\n");
+		return ret;
+	}
+
+	ret = gpib_register_driver(&hp_82341_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("hp_82341: gpib_register_driver failed!\n");
+		gpib_unregister_driver(&hp_82341_unaccel_interface);
+		return ret;
+	}
+
+	pr_info("hp_82341: module init is complete\n");
 	return 0;
 }
 
-- 
2.34.1

