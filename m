Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300881B010F
	for <linux-staging@lists.linux.dev>; Wed, 14 Aug 2024 14:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723647175; cv=none; b=U87P7dPOIIxmSERgHvyQzH23jsSsUOKM4aNXkKOqI9kOzGwdmcRXpo1eSfLvx7Hshe4BbCELE03Pr7BaLyHbh5IyLUWb54wdWbucA8GKDQKuCECsC0cL4iTdsF9q4uALZ3D+Y/1FixykYdPBKIrrOXaHgpUMsd7LafVCmZD7uRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723647175; c=relaxed/simple;
	bh=fYleo0yX1fwh3D5yruey7QLTuaNklJFq8nDi7CBNU2k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRoAd/JAcYapAHrQ72RwF/M1i2yzIlcJzGyXBYs5KYavS2vT0dP07FPnWwKncXNQxD0gcIExCINfKyUjMNNYJ9PM9H9v28fVtRSK0ZX32U0QUH+Q89I+Bb3TzBHUVOFoKCf4m1N9b1I3hS1EuCqjBLBh3CgZAe0rlF0UazBCdac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fNHSqTzV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fNHSqTzV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso49932995e9.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Aug 2024 07:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723647172; x=1724251972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Nc/x4iX30JK5v/qKKee25/DYJBOi1gSnUVT9ldVntQ=;
        b=fNHSqTzVNEFlnU+gpWeu3j3XXzYPM0+D43n0fonJjuo6m+cRwJixM9fwMb8KsTn3ps
         zD0rX1poT4e1gYWO3Q2FdAVRBDefPIPw8bnN+RAuxw/PzVUW6WADevAF5+bDn9FCIaXJ
         Tb8SCFlx6ErIUYEH0LHOWbbqEkhvf/1pRleXFw+U931tyk8Il6P4KzXw3NuLl7LND1RU
         3fQa/8rOiNVhcae8WAEFjQ7TB+2NtzRm2jFplL/TFna6cNxHlA7sQRfFuI1SognBFUEG
         tIG9nV2CcZl9w1FDwSkbbmSFQClZqn3Ufs3wgdR4GKwnHpo/D97AGy02Yu6HuC+FkBq8
         +GLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647172; x=1724251972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Nc/x4iX30JK5v/qKKee25/DYJBOi1gSnUVT9ldVntQ=;
        b=gCER8yY5lJ8aTROdDqPXUvzcoW0h+x78WLzAtCsw9FR2DjeU9nKdHtnlW8vmqlgDjW
         L2B9Pp32Ot/6ujPGDNVQCtUshmxymJKwjRncPeaOPlhXDXHrRKjb6OSmrG3Ni85KDNkz
         4CNoi4rdJp5C1A57p4eo5yHFt0WqiZbHriwn0enegQKM+tNAiQzscFJZuo1/w34oZlSW
         VQY3VQmIGJCEeVIiCRhT6aNaZ/nIg5YJWWh4w6yyD6s9alazq8OG2MAySR3aEV8dDTQK
         wfuKCTVxpXaO+WXGLutpEIfnIZYR9pUpr5uZukHeeN6meScXShhfNBpwxrsMDjBlk7O4
         VHow==
X-Forwarded-Encrypted: i=1; AJvYcCVGSIvE9Wml00h9fm2vmXM5I52dP1ZygURUeitWndn5ScRmNNXIIkZX8YM6C/IVmoSjvQiwgL2vH6nRn76r@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7FZbEWxF9rJEX2biAb/ddSkVcXqjt+jCNgS5bSZgk4OMh8P2q
	24SdJsvqQMUgJcD/2E4EOYXoS05pTlszMj8qczNPwAVSFt00sL0Y
X-Google-Smtp-Source: AGHT+IFdssqc+ivi3rGmJB2MBWFygqPvAJjej4yYB0FRObwT9P5jMm+9bsS3WoH5fHzxtHMD1uGEAQ==
X-Received: by 2002:a05:600c:138f:b0:428:1846:4f0 with SMTP id 5b1f17b1804b1-429dd2374bamr21782835e9.16.1723647172112;
        Wed, 14 Aug 2024 07:52:52 -0700 (PDT)
Received: from morpheus.home.roving-it.com.com (8.c.1.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681::1c8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36e4c93833asm13125766f8f.41.2024.08.14.07.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:52:51 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-staging@lists.linux.dev
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] staging: rtl8723bs: drop unnessary dep on CFG80211_WEXT
Date: Wed, 14 Aug 2024 15:52:46 +0100
Message-ID: <20240814145250.943457-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In commit 174ac41a7aaf ("staging: rtl8723bs: remove obsolete wext
support") a dep on CFG80211_WEXT was added to allow wext userspace
calls to be managed via the compatibility support. This is an
optional dependency which the driver has no dependency on and
stops users/distros etc from dropping CFG80211_WEXT if they want
to enable this driver. Drop this dependency as if users want this
legacy feature they will be explicitly enabling it themselves.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/staging/rtl8723bs/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/Kconfig b/drivers/staging/rtl8723bs/Kconfig
index f23e29b679fb..8d48c61961a6 100644
--- a/drivers/staging/rtl8723bs/Kconfig
+++ b/drivers/staging/rtl8723bs/Kconfig
@@ -3,7 +3,6 @@ config RTL8723BS
 	tristate "Realtek RTL8723BS SDIO Wireless LAN NIC driver"
 	depends on WLAN && MMC && CFG80211
 	depends on m
-	select CFG80211_WEXT
 	select CRYPTO
 	select CRYPTO_LIB_ARC4
 	help
-- 
2.46.0

