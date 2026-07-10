Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCB043B498
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702348; cv=none; b=AeBZj1nSMRDpfIyJs9nQJB2yCtN9uLmawoG4kvL4YYYIO1qpcW0E6/WwGGy0z8I/ueuvtWxO/0ae9ro4k104It0WbYzEshWC/uC2O4tgYN8DfvhcZgZ1xoizIGS2E6ZzbDvQPAJ80yKwo8GanGRc6geODEPCAPgF/SFxOr8MAlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702348; c=relaxed/simple;
	bh=ybXThdb8YNkCq6X4LJyVBVC6349o8ldhIsxR5hQoczE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CkJ9818zJlpk7r8hwoJa3mMgSddU1PJrf0qoGEGcXICVBI6pGEqO6qH5Z9obIilzEohwaB9b18SdRHr2SNcEJ4Z3GRncRV2Y+ir8UjIEjSwLNBBuhd03tVDYucl+PgMs4Hv2RDcc8Uhw3twR4jndeAJx2/GuR/Iy1ErYuVEwZHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qjcgG85k; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qjcgG85k"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c15c257a488so180662566b.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783702346; x=1784307146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hDDHxi8liXFKFtjJI/yfOFvWT94SUChIAEfvKIYsQ2I=;
        b=qjcgG85k1TQp/Qm46QpE5jzFGWe393rFG25WgouBLhLTPwyi8akeTanwJop2WBBiQa
         shwmDzKBMrTESRy8ghRe7i5C9CiRyqDZXzM7OjimwvQXW4IARMVTuqXmQCoG3927fI0T
         PahTclaEeRuaE+kU/RQGMkRncaFL4YjO0qP4x6xunNotvQ7b+7qBL5e6ma5ICuoJKJ3t
         fjXPMQlNDBeqaoyLPOFjCyOXf0a+JxhvEjd+HmG+I755oM4bI1E2IgrDa/p17nowR9Sm
         GRffZb0OAbwtt5rKGdAL921YQ/zIuXg9sCr5fsjjXYL7SzO2sgcAONifeu40WMrVAnr9
         4p3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783702346; x=1784307146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDDHxi8liXFKFtjJI/yfOFvWT94SUChIAEfvKIYsQ2I=;
        b=Z0aZk/mAUO+YB+LNXRoM/8C0QLjMKustUw1YzMdBqZ8qFe7kypuqKM3H5XmT+Yk//c
         V3/j71l2iMA43I0TZv7ezpNsct3MGHR8tdQZ7hsy6zbMlhHj95nE0lJ2+qyJM3FWLOuj
         8ec2tvFAmIr4Wx9mhWcJEq50lRKOlPY14UQGeO6KT/rR7M2lMfIqaxaiKwmYp28/rvsX
         bvpItye+moPL5ZmBYsb75Af3C+PfeZqoB0Uj8m0kGgVZiDYUpGgEcCC97xoJVNK5J+C6
         PlCeQg8hBA1l4aBcaCS1+UHgQdquqFTr7zuzTOIAZo7VZLrY1lqTK7w/n6Ji6DJZIKfe
         rE3g==
X-Gm-Message-State: AOJu0YwUs/76ytDmo5ojpRm25rWtn8HtMZBgiCokoHdBkQS1qi41ldEB
	5DSfrEmW/ogcbsVBtqZLpuu+mVlG5nAhgTSrN6MFhHwGW1eX/5d1fyIc
X-Gm-Gg: AfdE7clizfGxNa59xF8gqxyFpWJoqNF0ATg20AzIL3v4gM4UYLimb6ZdIlVBVP1QX9H
	8WCKzTLMciBB2S0H/THrtm9mksOqEyvFtf1QaTL6LMdIvuf6tjHPlu7hUbujhtFffVJdTMZciWH
	UOJqdD22ya+th78LASHLHaTgH2DyfnfHmgzHyqddgy/fMHM2IrzjYis014T3EoU6Zk6pXg90WiQ
	QqFDeGmYPgAbrNZ2aE/iSoYj30nDvxZ3/ieg/iX98K7dTZntliDVAzdLT+7i2KuQ+hsRTRCXF/S
	+pZg+SaZ/WRT8tzXL0GN4ue6y5hm2nDGfOP++A18Wn3cyZzFDTavfHsRMbx+iCTCfsA6i3IgIyM
	DZlGzKzMS0s+jRRgd+n+ivhKhXpBpW/7kD4IbRPE3oa9wxebJ9+9u+kEqbx+2Epit/0zJj3CgX4
	KVKIUhGt763g==
X-Received: by 2002:a17:906:ee8c:b0:c15:a444:5cf8 with SMTP id a640c23a62f3a-c15ce1433fdmr540888466b.33.1783702345492;
        Fri, 10 Jul 2026 09:52:25 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm643050266b.0.2026.07.10.09.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:52:25 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 0/5] staging: rtl8723bs: remove some fields from the
Date: Fri, 10 Jul 2026 19:51:07 +0300
Message-ID: <20260710165220.68599-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remaining patches from v1 for cleaning up struct hal_com_data.

Changes in v2:
	- Fix the build error: remove the unused local variable
	- Rebase on staging-testing

v1:
https://lore.kernel.org/linux-staging/20260709182627.16327-1-nikolayof23@gmail.com/T/

Nikolay Kulikov (5):
  staging: rtl8723bs: remove unused 'EEPROMCustomerID' from hal_com_data
  staging: rtl8723bs: remove unused ForcedDataRate from hal_com_data
  staging: rtl8723bs: remove unused EEPROMVersion from struct
    hal_com_data
  staging: rtl8723bs: remove unused EEPROMBluetoothType from
    hal_com_data
  staging: rtl8723bs: remove unused 'bTXPowerDataReadFromEEPORM'

 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c   |  1 -
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 30 -------------------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 --
 drivers/staging/rtl8723bs/include/hal_data.h  |  5 ----
 drivers/staging/rtl8723bs/include/hal_pg.h    |  6 ----
 .../staging/rtl8723bs/include/rtl8723b_hal.h  |  4 ---
 6 files changed, 48 deletions(-)


base-commit: cfea8865cba0264777a3cc464ffba64f0102317f
-- 
2.54.0

