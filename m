Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561821C695
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 03:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775014986; cv=none; b=sGEQNTEbwT3KgzCAEqXO6h/QZXhbwB0YFNNczB/NsoNVIm288R/QgrP6vWHuf1uBGZt38R9miTDkJspZOZGMSznG+z+mozQv8zkwlam6on19ptuzhGpcMK53wN6lbZNyZNGzhn+WlO/ui/t0uDuPIUHWIfx+7+4XCZVh2/w6sNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775014986; c=relaxed/simple;
	bh=74A081zf+/eftZGZpF0o5BYIvovZjTYVHEYWzm+rAg8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scaqgJBoTYmbgOvhoo3ovcfeJOIlUqhQF4auP+BjyfMxxAAjA4oeq7rnEtCeMzFJL1nrddnFI5RLNN/ptTOmJ8se+UAYIUwXE5TjNUeYskyRn9BsPFd8bDwy6T1cNFFOertpVdVdzUa3TQb6hnjWbbZ+BqinZzkhm5h0ELdDZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JNd0cLs0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JNd0cLs0"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so783610b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 20:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775014985; x=1775619785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=odEPShK+zgtTrK41jwZ03GunLpObS5hESUhpqAtdQ4Y=;
        b=JNd0cLs0fEiwfgMnIxDTG/q4xNjX0vHLoscWzirhXuJIdUVl7tAzq2Alx9fMMv3TvX
         CL3Ru4NG2NRmalJq+wZdKwwvb3zvuY+t2ucipiwHeNvesAJ3p8i1GS2nUwIyaz/aWL1S
         DjVJ8UQBPX0QRQ08oNy53RhDCn3DgDHX9iKplgP/jb+D5sS89fC0pENPI/aU1/XW0Fqk
         N9QefVkgX6uvq4VKtlCIw1qLi5m38zrPBamh5cr8qiWb3dCwsVkskN99duVpItq07HSo
         z2hSxybVkm7x8oDD+UmYTtuQi5FiFtY/tZeHdIsw+bx2D9m+nTfdOaa2wqVrKxi2NnQO
         hnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775014985; x=1775619785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=odEPShK+zgtTrK41jwZ03GunLpObS5hESUhpqAtdQ4Y=;
        b=p95pKpwCVKyfVAyAO+xRyJCf7xjYfrjDkSxJ9Eo8X+tVhogxbVstX2nwkXmj9XV267
         hu3lH8VJDNJM7BqqKJqwMvCC6xraJ3NuSmiwBFptTdbyD/n9iCCNkgOPz/hO5mVj9Lv5
         Ex8fjzvgpe80H89SU1kT4ie5j18x3GDOWWiN5rQp3MdK8GdZu/uI3N4pt26meTxKzz+Y
         3mP/r+wbfYmXZNLfoCBdhSnnnHcaM/t6I0tgEKdZ2dgt+mMWUeZ6OIsh7+FZwEyfxc6e
         jYPy9RDsmfbgmqjN7ktaj6ZaQokvkGomb8NV6Mvrd/FGacLE7kpuEWszcJ8a+4Gxg7vR
         23aw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Qfp8Jq0DaLACNWQn7s6cLQIbFlV6nAwKwQLEAFms5h3p/Ew/60+qhUBI7HyOUCqD49Qltv2pr9Rc70We@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/8rIJ53Xbuw8aWUYeLCAvlYPBgbSDbc0L9A4eKmFO5ZAe6kqg
	1oiKwaLU/AyllqIKNSAqtuvQSLqONBl+KXK7eJmxG+NjPdrY65v91lyn
X-Gm-Gg: ATEYQzzrWRsMCAUl+E9GWKOzzxuAhwey5djOdezTMsA7i6GQFV+3HtrMHaySuVHGnxb
	fyDTCc17Es8LdauEJVUVoWRn3Hka8x5LysBBixU/0cvXtGbfPyCrd5mm2ez9zuOSrQqx8/HOd0w
	clO9mwd1ZyVM5UyJ0+a6pgtFutE+fVgTn3L79I0bm1C+05GiF4je2U2Tn157kt8YGG9RUad6ZdC
	LU2COZHlpakf1wO6ViPwvBkdOZWxy+OSepr9iwb8mbyJMMiXjB0hPP+PA3CPu7mFPh+QALO6dj+
	V8oUDykwYm9kdWjAJTodbLNYJzWkVl8yKIAW1RJnJFdFcTuqrsI9WJOQeUD0dfLsRzlT3VQYF/N
	5vSdCn3I4GkYyDtjOaSWNWbfi+ED+RY0NKd+WiZ052YNQ0yu5/WXuypqC/k3TkYE0ua/aDCNRnP
	uDu4z+Sn/1KNcslfU=
X-Received: by 2002:a05:6a00:2386:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82ce88ea606mr2333650b3a.11.1775014984509;
        Tue, 31 Mar 2026 20:43:04 -0700 (PDT)
Received: from localhost ([223.16.32.130])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8467824sm11963286b3a.17.2026.03.31.20.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 20:43:04 -0700 (PDT)
From: Marco Lu <mcl7d9@gmail.com>
X-Google-Original-From: Marco Lu <mcl7d9@outlook.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marco Lu <mcl7d9@outlook.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in _rtw_free_evt_priv
Date: Wed,  1 Apr 2026 11:42:54 +0800
Message-ID: <20260401034301.31014-1-mcl7d9@outlook.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msleep(10) call is an imprecise busy-wait function in
core/rtw_cmd.c/_rtw_free_evt_priv due to timer jitter.

Replace it with usleep_range(10000, 11000)
to save CPU cycles to provide more precise timing.

Signed-off-by: Marco Lu <mcl7d9@outlook.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8ae..14778c22e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -214,8 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
-
+		usleep_range(10000, 11000);
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
 
-- 
2.53.0

