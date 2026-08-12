Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A51830D3EE
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559976; cv=none; b=Rdk7aKhhy1xC7mlE0KHtGXqqYQJvtmWxOIYk4you3gj8fj91jZn4CdC0hSKdly7FBKB3sG4t0bVqWiS0+y17ayQQ16CCBIrUMaZ7lwHF/rjYxXwN7M6tyP1DFsWRkMmQKL+jPuqoFuwusuVucUJi+HmnQp79n+6hBvJ9FCE6h4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559976; c=relaxed/simple;
	bh=VtC8kW5UgnXbzYRNvT5xE4/xMYOzDjx8D2Li708mD7g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Se/ZgRL8J1JzjFFdt3Nm/WVZgyfdiJAwIgihhOVddVFs03l9yBS64eG8wm2OSM8lpcLt3xEOia96+tRVyvP+l5dMj9lne7X4PXuejF4qbMH0YWq/68/DBNwBFwZTWVpcdJ1uy9oQsOWLGfvTZuJU84iOJgKtb2LjqtEQOJY9M+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYtHJk6j; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYtHJk6j"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1391379a91.3
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 11:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559975; x=1787164775; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58dcMDhVGB55A3sdC1Jxb+rfpaM/ylnibi1GRRPWgG0=;
        b=FYtHJk6jLZ+TzvnYnZZTvp3vNarewzf/UTh+Dn9muEIf7WshebRDqyW/F17jOyjzmw
         6685r2PeTeAzRIXv3Q2W6ztw/7+9r0kI6smzAd9QbDAxcJiJorQpX/akKizELFHNoKAj
         6gPblFWI/8XpZzscY/MWsZUTLLqMfwpQEYv6XfLxRFc3eVh8vBF179CnMkb95t42KOV7
         XWNC1r2jRolkO23nVna3+GqPXrXhKI4gDG/sTdHs8mSUR6v4z8H9WStD9spBLzjlZaS9
         IFtBifMNFjrc/6eAHkB3ANVIEbB5o6EKzgSyuDNHzqPxa6DXU/pVhqBLuCqS15Jw9nxt
         8m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559975; x=1787164775;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=58dcMDhVGB55A3sdC1Jxb+rfpaM/ylnibi1GRRPWgG0=;
        b=QTevT3dNNu2LM73vAB+PqtEFgUD/se7Xu0dsQNFu/lyUVYIaXdD6uQnZU7+Z1ejHFL
         xO/ucuYU6iH6G52TYWu+2L3b/9Yu8Ji6UwerO9NeXMNDJkw5y+m4Dp9mK+ihZYUDS1y8
         qXPMuwH+vNS238+BLLtOUN7prA1pMphh+8fvZIe3MXXtfeD0UszXHnyQrxQ9RWxs1yq1
         lw9KP5Yv0E+21CDNerM7XoKVCtQWMVGc5QaFPQtgyTi6SK/XMo+DI7nM/DvtwjIiaf70
         p/NY6S08fHRDTlSp2t7fLZglS13e2+pJzICDPWCmZuFbwXtEjIwYCyQWU8pWanV0U5Y2
         XJgw==
X-Forwarded-Encrypted: i=1; AHgh+RpT2FaFbT+y8CSQAGZl5T4c9m9Yi1BbamftP0QaBMvgrI14ASXxOuVgcDfA2ky7xp3m2ooTJbYWL9y8DIwE@lists.linux.dev
X-Gm-Message-State: AOJu0YxKCwrrf7kcZuzzz8PC21ddHURPiKSIl2AmhdwDqITYZDRV8u0P
	l9kWs5Ve7ZB40slC9TJGeeU2+oZoQZbzayMNjroKrId8TcRYJfTeBbxp
X-Gm-Gg: AR+sD10qK+aH6tUR6s29yFA1JJLPplcdkepd5kfD2cY8ed+xsaasdiprh7ovJD/XPGP
	y5aednjrpTNEP56e74lOWbg5hB5X8BLMRT07IHwBKzn/bevIVlWSEYormwwg122j1r87ytvAka2
	5TMrbsJqb/x6gBiCE11iycSdvvyFQZyUJhvxyzM0Glx6Ij0Oz2ta79QdaiEJ69Ygx3x2FPSFA/L
	/kAX3EJRSh8o80PTF2DzTDo99Y1dtFlfD5TAc4ogGjClgdqRBJSD128YOLVJ7Bm1Hk2XDVX3FAg
	IbEc7oBAhCaNIw0ocdic+9bg5n7fVH8Yw5U+YXefVHtOL7T9pcO0yP7HBtnnXptTiMAgeFf8rt/
	uPJJowlZb+1EGA4Y3SOJ8ANeb3HbKetzOXcduqeJ1oEkawD9lEkZ5f8h/+P5aDuL5F8ljsMXC1u
	5ON2+TjK9cwPyvOjO30IePUtmWeVEjlMElJjN4pGOrRrpZQIWiI+ZX5HQ=
X-Received: by 2002:a17:90b:3805:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-3931e2d5ad3mr150974a91.18.1786559974682;
        Wed, 12 Aug 2026 11:39:34 -0700 (PDT)
Received: from localhost ([2a02:6ea0:d33b:2320::12])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd93d89sm410673a91.15.2026.08.12.11.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 11:39:34 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: pure.logic@nexus-software.ie
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH] staging: greybus: remove unused loopback macro
Date: Wed, 12 Aug 2026 15:38:32 -0300
Message-ID: <20260812183833.39666-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The gb_loopback_attr macro is no longer used in the Greybus
loopback driver. Remove the unused macro to avoid keeping dead
code in the driver.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/greybus/loopback.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index ea57b1f5d156..2a623fc2e99b 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -167,32 +167,6 @@ static DEVICE_ATTR_RO(name##_avg)
 	gb_loopback_ro_stats_attr(field, max, u);		\
 	gb_loopback_ro_avg_attr(field)
 
-#define gb_loopback_attr(field, type)					\
-static ssize_t field##_show(struct device *dev,				\
-			    struct device_attribute *attr,		\
-			    char *buf)					\
-{									\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
-}									\
-static ssize_t field##_store(struct device *dev,			\
-			    struct device_attribute *attr,		\
-			    const char *buf,				\
-			    size_t len)					\
-{									\
-	int ret;							\
-	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	mutex_lock(&gb->mutex);						\
-	ret = sscanf(buf, "%"#type, &gb->field);			\
-	if (ret != 1)							\
-		len = -EINVAL;						\
-	else								\
-		gb_loopback_check_attr(gb, bundle);			\
-	mutex_unlock(&gb->mutex);					\
-	return len;							\
-}									\
-static DEVICE_ATTR_RW(field)
-
 #define gb_dev_loopback_ro_attr(field)				\
 static ssize_t field##_show(struct device *dev,		\
 			    struct device_attribute *attr,		\
-- 
2.43.0

