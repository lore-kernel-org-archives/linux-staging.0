Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F711B29A6
	for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 20:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877988; cv=none; b=rcMza1fA5yP5wzLP24qi1j/OmIaDhXWFRrHgpJbSVJfEVqGwHBZJFFR4a2elMztiJ/4sV0Us45pAxWrGYf5jeNALnbvO6km3O3IzJkR+9BOManugFZTO+cYzGDpnnBOu5yZ0AcCJEI9SMcRckUcd3el8MEo0SjC3EoFgpX6XlN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877988; c=relaxed/simple;
	bh=t7MF9q9qQ1/BFft9PGBV+aPNqpvkHl+vf3Eq8jnJlio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lq7SBVyZWR8SLW2e/xNl5aqDs4iYe9JOph/SEat1a+JyBjMJmWVspxnXmRkLZYZ9ZeG9mf6dZP5JaHZ0LPNGGOlyiOrkiGjietVxR92Q1WurUR6TrDf4xka244EcHxjQZMxE7/Ve5Sa5qZ4dN11L+jbrSi6SuJ02E0WnDFgYWuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9VfebMm; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9VfebMm"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-202146e93f6so73639185ad.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 13:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724877986; x=1725482786; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j2NP7ED9yQeOL2K0nW20zcco+YfFdB0bQPpahpoJ62g=;
        b=P9VfebMm4vuzYaTz2QOW125do6sxW3nuHjJDBDFoXOswtcZokrxCohsuVtHh89xXuH
         BP7gZb47/RKnYJydEpxEw1TUWAkY8qrLA1fqeWFo1rVbfOBHp4zq4C9z7bM/LfmUa0ts
         8qa8yIJh7OjgZ0JLD9pgd/HFsQr/M44RUH4Xt4CnZTSUxfQImcjpVdHZVeS6A0hkUg5S
         Q4OzDHxKwr6wo1bVqTIIszwwmwTUdjaXljZPsK/P4NfV4dB9uFlkaziv1MY2fyInpkA7
         63jYioYwfPG4HumevFKrpcB9yXDmZ3riGezo/rBYMMX5gKjaQUDDKri57W86Bbm23P4b
         3+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724877986; x=1725482786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j2NP7ED9yQeOL2K0nW20zcco+YfFdB0bQPpahpoJ62g=;
        b=SkwzP5mTMZOXjlGjehNFMES/ocVWrtDVl/ArgzkOAJSmhCEc3HzpK83cO/Q3YmRo4l
         me/5V3w3a2xtt/IeGTP693BmIMxIPK48c99TkrrOYoF+VwmXCAQ2ZZ4y+9mDQSa+Gt7r
         Uaiq7vPleZslLuLvnD1gBxK8aXrFvJBtk6h7ulqgGZWi/yjrg/NcR+EjU1s4VZC/Rtpd
         dkdq0rIeFDaWU58dp68pIZVlZeopsWcdUv15MqIFFDof6RhyGPFpH0zV48fz0lTJiz8L
         rRYAnAo3hhcLtBBa+wF42WtbmEBSR+eLSlU2c0HGmoEnVeTzn0ATWtKyKar5u1lEd9QD
         s/Yg==
X-Forwarded-Encrypted: i=1; AJvYcCVL0h4JpRHy7/EAp/CJNTVOHcs+zAyS/KQhemzxGYoqembqqp1eUeyPr6mcmNdxXPyRQk9Z3kWLdj3IlPX5@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/qya14JpokJPI8fsEtpG4w/+qV3lcNJqByGZrHVzl4xMhptMU
	uVkyNN9GOuaB5UCBPbaySQiezLm0MI17QB8h4ZO4VhDgCOd1yHsIFEfO74lS
X-Google-Smtp-Source: AGHT+IF1PJ9A+TITiNmvfXWDWKmuCksVnECrUQ69s8nJM+FRJbDAx090f53Kxf0EIeY4e03kSaWIXQ==
X-Received: by 2002:a17:903:41cc:b0:202:1547:66b2 with SMTP id d9443c01a7336-2050c3ab754mr6212665ad.28.1724877986299;
        Wed, 28 Aug 2024 13:46:26 -0700 (PDT)
Received: from masingh-thinkpad.. ([49.207.54.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038556667bsm103351525ad.7.2024.08.28.13.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:46:26 -0700 (PDT)
From: Manisha Singh <masingh.linux@gmail.com>
To: florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: philipp.g.hortmann@gmail.com,
	Manisha Singh <masingh.linux@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
Date: Thu, 29 Aug 2024 02:15:52 +0530
Message-ID: <20240828204552.26790-2-masingh.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple assignments from a line

CHECK: multiple assignments should be avoided
+	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),

Refactor the _init_intf_hdl() function to avoid multiple
assignments in a single statement. This change improves code readability
and adheres to kernel coding style guidelines.

Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
---
Changes Since V1:
	Broke the patch into 2 different fixes

 drivers/staging/rtl8712/rtl871x_io.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
index 6789a4c98564..6311ac15c581 100644
--- a/drivers/staging/rtl8712/rtl871x_io.c
+++ b/drivers/staging/rtl8712/rtl871x_io.c
@@ -48,10 +48,10 @@ static uint _init_intf_hdl(struct _adapter *padapter,
 	set_intf_funs = &(r8712_usb_set_intf_funs);
 	set_intf_ops = &r8712_usb_set_intf_ops;
 	init_intf_priv = &r8712_usb_init_intf_priv;
-	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
-						    GFP_ATOMIC);
+	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
 	if (!pintf_priv)
 		goto _init_intf_hdl_fail;
+	pintf_hdl->pintfpriv = pintf_priv;
 	pintf_hdl->adapter = (u8 *)padapter;
 	set_intf_option(&pintf_hdl->intf_option);
 	set_intf_funs(pintf_hdl);
-- 
2.43.0

