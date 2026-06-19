Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9835E1D1
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 22:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781907543; cv=none; b=TPXRiGxCzGvuQ2qSN6BXo8ZOQngkDTeNIpjVDPxwmRYuEBZT1I1YvZEdKgvYiZRp77SRZAxg9nh/FKpkmDyha87z1MfWKnH9f0jvlCh/4sxA55Hf33SJeu9XkowTpLrsSCSvjXpAjedaSCMvrScCLjmS55abDop3HMISrQAFCJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781907543; c=relaxed/simple;
	bh=/85CDGfidDI6K1PoGj1BYlKFBmTrcXVI5Gyew9JiBUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uh98iirl7HW9cTYnYe5ZI3LXSbfYRno4Z4aeaTMmEBjTfn/Z6Lf5N5JTh1itA6M/iXnuicdheMVjBTgLhodY16+1gilZuaZWBo0bf+8adip01rIAZPQwur2cH1626sWLwxuvEYubAITevx1uZxN9kohyNbsV07yKp3fXsdWiCfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhFTkzG0; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhFTkzG0"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bec423a5265so446864566b.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 15:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781907540; x=1782512340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTml6KE54IubDu1eTve92eFW0hAuwij384Tv4wiIHUk=;
        b=dhFTkzG0yVCY2z6l+7GpEL7kjFLv70n+EjW/iENLE9EY6RAzK9i/9c5Phs2wRvsXSX
         JL1UWXPXD4eTUKz2W6f18frYcpUgdfTNKQVX/4e6haua8Nj26eiqpAuiOO4+/kOEaVFm
         F2s7xIR3QlxTLAgnlgv+g0QyJjdpv+kRq7jgVba+zgBNyXJFnMwjmKksZ3e9Q1KsWkgN
         x7xasOJ/l8DJ411zmp+NTfUZWZsWTch4ragjsYnjcEC/FvMF94KsZqzQoCgB93LSqjLj
         LR34DdrSWJuW4bGEX2TMoCuGTJoLRgmOZvpsNPUec/WoEqjKZn0buYj5EvNaJN2CTtEm
         U9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781907540; x=1782512340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTml6KE54IubDu1eTve92eFW0hAuwij384Tv4wiIHUk=;
        b=k0NZwWUJtpmf4pjJ/PbgErQrco/CwakD4OzuUCotwhIMYV2VZRB4nBIL/HtUKsUwoI
         +q2cP5RbMr//IGuer9oOEM2oOe8hBgImdc/1xYg6D1ZrC16OxzpGKhnZ0EbtjSHQt8wt
         OGq4cfwPmi09G7zpm1jBA6p1ukkcZmDz6V9iZD1iN15pesHzphbeLL233+eKwoaGjB50
         /8z+myJBsfzmg5Ye7WKC6Syt2tWTR+k/0NTvNNwFYf6gqjowI445HmWVbXeEN7Sg3kiz
         mdKvs5vN/FF7MLdpci1VB9JFkp4Lm074fXA209AGVs0erMrIcDmUKTWhKHumeEbd/WTg
         XTnw==
X-Forwarded-Encrypted: i=1; AFNElJ/n0rSDkCKc9CRyi2teAhU0klwdvfwlqY2f8reZ67lJLOxUjp4RZ/MrU4Zs3BFcBRTK+EY3H1E+kGp5TEKf@lists.linux.dev
X-Gm-Message-State: AOJu0YxNp/ZIr5roZgw0TwchUJw9PebygsUzPT1cG5Yw1PNJaP3+Og1E
	DWboIOmNs7pA2sUonM5/3xaFPGqPQhmF3T2s0kuqJx87tJy38lnZxJVj
X-Gm-Gg: AfdE7ckiw3ueyu2hgQ3rBTvq7rzLubzzArrogQtT1ClDqlwNuFD4rSykr/ZjflOnE8G
	KmLHHGBv3ytFDab0zXR9dM10UkGWbwnPEExOvgi1H5x64LFduFfOp8YKI2ybXaq1lfqO16SwawV
	l8muqjcBRWNxngK/l9wq6c1Gmk47TyzlLuk+uI/da7e+PgeaWvQIARRxPDHAJTGyX9+qUgvjbbc
	ihKCnV8MlnF3FewpJp6hgGNc98TN4dK3uLmYXu0OqTlc21WMcg/+pF0TjcZNrLhYqU09CXwKnLC
	UZTarNTwBxUwg5uicU+tGByKSRS0moRqW+wkHANA5g3iXda7qYloTIJkrt0Y2daWMNMBVIS7YCS
	8g/KfJilVPzpd3jr1yECVEIVXJAZHkvYqwQozgXD/hQouXiAqOTS40C49vjf9/aYp7ODx2iZ6EJ
	63ZoQ5LMNnYG4iRp/zywj/Vx8IzD1AKMNGNPYnKBnfTVOKShEOxZIXUmTb9A==
X-Received: by 2002:a17:907:97cf:b0:bea:f4e0:c7b9 with SMTP id a640c23a62f3a-c097b19844bmr300496366b.19.1781907540170;
        Fri, 19 Jun 2026 15:19:00 -0700 (PDT)
Received: from adr.. (212-8-253-73.hosted-by-worldstream.net. [212.8.253.73])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49b77bsm28513066b.2.2026.06.19.15.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 15:18:59 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH 1/2] staging: media: av7110: replace msleep with usleep_range
Date: Fri, 19 Jun 2026 19:15:23 -0300
Message-ID: <20260619221524.51814-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The msleep() function is not precise for short delays under 20ms.
Replace it with usleep_range() to provide more accurate timing
and avoid unnecessary scheduler overhead.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/media/av7110/av7110.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 862aee993889..e77be16f442c 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -1818,7 +1818,7 @@ static int nexusca_stv0297_tuner_set_params(struct dvb_frontend *fe)
 		if (i2c_transfer(&av7110->i2c_adap, &readmsg, 1) == 1)
 			if (data[0] & 0x40)
 				break;
-		msleep(10);
+		usleep_range(10000, 11000);
 	}
 
 	return 0;
-- 
2.43.0

