Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4012ED154
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 06:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766038484; cv=none; b=BlihMvtSFpiURcOcEyhSkusWEppLdpzVTc1fHDHWu7B05v7AoQ0nhWFYKaefJU+FPdkZxaaiKdIOpXi+61f9YzTb2si790QxOugu8JFd2BvMBaMFxU+sh470zqqf10+V3bAokXTebMI58uj6itaESU4bu5q8E6rx43mXHmrQvKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766038484; c=relaxed/simple;
	bh=Ggx3K3AWheIt4L0mh+WwSssxKcKkJcMLFPNyg1GrfRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fSgfefSA4bTz8o4YsbsJsW47++LIAlgi4EQqPQuY/3wY49BUDVKjze3gGsMP6LIbwwRC1iAcAdt2EOzrclMWJxG4wtjz7EOWDlOFqBOv7rRMk72cl1a/d//E2RwFnvuUDNX8AYJhstntb0qppm7U8uYKmyvqzyi6JogCI5l1q/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/DyQMI3; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/DyQMI3"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7e2762ad850so347167b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 17 Dec 2025 22:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766038482; x=1766643282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ByPqHkzjH6Q1Om9pizog4Avqkf2U2qg2PTvWNAENUs=;
        b=b/DyQMI3+Mr9bn7WIqHeEDd0EOkXwnAelizHA2FusTd9wWSFhW7hWSv7ctaDCpw330
         2C01oIlZdZPumOQGz1xe3p7WY/t3BvwQgN/D+qb1FbT6+f8UDXsrRYIMD41JYRlpfzxb
         TYEOPtKWAlOjnFuJ+uuwefeQRf1pYzDv0t+lE5oO1zrdLzbq/1RDbuiM2I7O1jhSkck0
         j3PUVg6hvpAeRhqyG9AatslFRhWsf3471piCtmDtPjsnPMlzU0Zugc2Fq46EJvlY8uob
         Kn/aFg8QcgVwA9aBbw6Obzf7VPBKQVuSrwGOTH3HAYWJ+eRI+VGu7fjo2ziNa7s/qo6b
         iL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766038482; x=1766643282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ByPqHkzjH6Q1Om9pizog4Avqkf2U2qg2PTvWNAENUs=;
        b=Q64CxXoxJ8XwIVrj/3RcAsrY99FJs5eTnYDxWJ3th0wwNrXRAXkYIheWgvaY/oX9rk
         pA4F7F64HvvbusLDSw9QDNZ7gElnnQxTWhB2e7W0VLcBzG6wQeNYoRi3597/AxeS+HLm
         ibSiM4KrVca+aMef75799YreKVfOuJ/fzCq+oF4bnEneDhZ5lYCPtDhZu67e9j9aF8/S
         7ExNgIhr3uU4cLk7oGQg8W8gpULb59Sb+OMjD4KGXq1tTlu2+vEbzG2PzPGVjkSfAg7R
         zod7HXN8d0aOaKHoPrk1IcTJH4/7xoc0mrMBqEAq49HJ+wHgikSvPmJ1tzzHYqb4acCh
         GjCA==
X-Forwarded-Encrypted: i=1; AJvYcCUfogK0E44NBxmsCvRhMmYMdYlrZML03/luzVXLnO87DuYF4T5eemeRMwm53uy5tp2kqf1FTbMn01zyWRPO@lists.linux.dev
X-Gm-Message-State: AOJu0YwE73O+IONvshyUp+/PVxhLO68kmGAOMHw3x74DK4umgSFqXBTw
	PdCYAVAHH/bBi22klkVIGE0juk6yZtIseK+Lq8Gozf5//CNYaVoEOVJsBd9AXa45
X-Gm-Gg: AY/fxX6woHSPmrCeuJiZEAFpSQXWzDyuT6QsPh8NwwCLaTTtiDxAiM4DNaHCn2R6oAS
	HBcN8aQEk/M8UX5LKm9HOHfXjWqoV0PufgEcoiNh0TqGYElFbrp9uuVfkvuU1BO09QXz+z7k3+q
	xXwDXWLCZtwIvTqtgGIgzKP9Lqag4y6meKdUgtlmgBvZ0MnRMeWRf0Esmf1WrM753Vg8lG9Y5XD
	3kg1nNkDLCbh4gMGjgPdtvm/tMnUwvnIIe9c1+ouS3EuNukTF5nWZfanPPxMopSrV3wWWslmyui
	ggKu0llVx93NTP+Tod0M69E5pA+0+DNZuSOGJ74/o6B0MxWyUb4Cmq9fJ5MPzai5iGJvOxYG4K+
	2Wz92R/6+elquGuOarjfDGIpnP7XCnAWNPWARq4NruwwKXHqScnJJ98c/kVkwMucuwjfVwt3Tnx
	7DC0E93ygPaL37VNb25n6IdhYNS1XV
X-Google-Smtp-Source: AGHT+IE/9wFIIieTQNvwxm86+AsvmVZQ7ekju2YVJBrytFbrdfTJ3zUvKtJoZsiHz7qoBXsSg5DZNg==
X-Received: by 2002:a05:6a00:6ca4:b0:7b7:828b:f569 with SMTP id d2e1a72fcca58-7f667d20d99mr17684559b3a.25.1766038481793;
        Wed, 17 Dec 2025 22:14:41 -0800 (PST)
Received: from SIQOL-WIN-8.localdomain ([49.36.67.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe1456d417sm1347795b3a.58.2025.12.17.22.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 22:14:41 -0800 (PST)
From: Arjun Changla <arjunchangla7@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Arjun Changla <arjunchangla7@gmail.com>
Subject: [PATCH] staging: fbtft: fix spacing before close parenthesis
Date: Thu, 18 Dec 2025 06:14:06 +0000
Message-ID: <20251218061406.8043-1-arjunchangla7@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "space prohibited before that close parenthesis"
on line 65 by removing the extra space.

Signed-off-by: Arjun Changla <arjunchangla7@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff19e4..2f7c891177fb 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,7 +62,7 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
 define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
 
-- 
2.43.0

