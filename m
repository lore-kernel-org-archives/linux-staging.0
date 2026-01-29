Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC181318B96
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 15:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702239; cv=none; b=haWLy1XpBozil3QbYiGFgf3mYgIC9UPFEAdvFWiQY1w247KWK0LWK8e+34pB0uI/eE8VZRw/B0+edovTEpp/iWxUIP8+q4rbmVAo0WI22jYdff3QzpG6Yvsy6U1YINtkHpt12wpnTt4sqEFGmiW0rjgMwTRVS1f5g37FnMEAZZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702239; c=relaxed/simple;
	bh=iEl4QeT0sP4Q462iAv/9XDsZzOo4l7yGGgW2OWFLz3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T7WH0rRr3aHOVbU7ahNLLv/jJJxt+leqOJgiLOGEN0+9YqYgfOhscqU2TCMfAnXau1z+6n37i+jxvKZFwARO+VvvoDAy9mhr0o0SwXpLAHysA9z7PsAoOcUIYrKlqh2uuyiu2brM/KTdqWBM9AJYkYZw9ePPOYDKJn5HVX5LNIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjxuS1Qf; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjxuS1Qf"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4359a302794so837189f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702236; x=1770307036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=M/YXJr659kQyGuqRZspjFjoc/YXWZOVMHAdFeJQjIq0=;
        b=LjxuS1Qf+xvfEIINLpTlUo2GlqkFqjSG+Xit2/3biwV5fJFBBVV1nN3i5QAfWMOkU4
         eg/TNu4HQ62UFVQSAsqKiay40DF2tVfO9aSKOP7wRB4uyaDjicYyq8mXnmSLzQOAmW4h
         HSyGGmm7lkZ8zKco4zCf2K4RP6z6gau8a5zG5/dZVGuN8yqiAgq9YSZS0TO0CBxbuJp5
         hqRoUA/IlkfPz9vy/Lx2egiZwop6vNipj84QHGHZNXZuVGY6pr6TSdmvPLltZIFXkVXo
         FHXp9G6GbeNs4oZ4rBvkPMn2XPwcSIm/HD5veKwnsxwl9mvsnYL9QzBcLV7DhGTPJn9F
         d0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702236; x=1770307036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M/YXJr659kQyGuqRZspjFjoc/YXWZOVMHAdFeJQjIq0=;
        b=TtZCYEwJvSog4Ise08sgKjX1NRxfKoyLR4q7oY9MKnI1E/9NYcUR5KnvSMJineR8gg
         1oscs2UfiHWE5SkvThkynEPhWYfXBiSJjWKWL4ETNRyOGi+uhMPzjiclVfEdcl8HjtCx
         zFfw9mdbT+qvPeFuSEcJqOhV/UoybQM1zWdTzL58mGdsz+s6+kx2Xei5Uc+jjhMFP2Yf
         OQRjq7TuD2AvmivW0f+f0VlORURtpKfpGq3SkWm17OMnh+kpy6WX0sh5RhsgoyADpdl6
         ue319swp6hhiJg6apcIeNm5DHDaOFrfXJIpARsMDa76zn89FRescLJGS07F7FHrfGQSe
         B0Sw==
X-Forwarded-Encrypted: i=1; AJvYcCW+M36Ru6caTiYefgEsVpzPnpzxDuvnDsdu/4iruedu+ww8O2nYUdvi/toqakyS2w40DtTKeCMvtJoq1KLv@lists.linux.dev
X-Gm-Message-State: AOJu0YwAfFkMtzp7x3y97wlMYAs+lYSiRdKGzNtd7jvt28ZwToQHU0Mn
	wld1EwH64kvA9yIBMSiNBIs7qj+c9Lyd0Bhm9tDTcR+lh8SkGjLImPQ=
X-Gm-Gg: AZuq6aLNPWsOw8HOs8LRmShk7hlGmbglgHTPXTgpnCWFkTCxmQJrCw+s1++GGz0UZpd
	nyIZjWQBnKzVmB2Aoo/vGqoOixuG5VUp9kwDN6r60nfHpc7dfByVueDGTeClZ9XVhdr8lKZmHQT
	qlqa/HRRz35xo89rymjPeFWdg+KrIarmQFgp/cHD50UhARTEMkdYMEOLqhr+ff8cXJXD6njLbqL
	g3Ak5x/xm6caFtYRQxtXI3G5PnV6zdMhXrtKaDtwk8FHz6IWuk5zQgOXU5OuBGD6osd2KM8C66+
	LvzH82KMBynXEAbPdTaNVT27OVSimi8L5vm8pbeeC+EZngl31QL8Ci2Z0GEYWIiVkgbU1uep/A7
	SnKl+smXOYTQWnJXQiz6eF9hlLnYgALWHIPOAu8FYw27RmdbSrYVb9Sn19jq7IHYIs+XOTTPPl1
	fMGBVqfss/ZOk=
X-Received: by 2002:a05:6000:400e:b0:435:e3fe:7409 with SMTP id ffacd0b85a97d-435f3ab5239mr80395f8f.44.1769702236079;
        Thu, 29 Jan 2026 07:57:16 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm15749231f8f.16.2026.01.29.07.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 07:57:15 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v3 0/5] staging: rtl8723bs: Cleanups and OOB read fix
Date: Thu, 29 Jan 2026 16:56:49 +0100
Message-ID: <20260129155654.5565-1-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors the rtl8723bs driver for better compliance with
kernel coding standards and fixes a potential out-of-bounds read.

Changes in v3:
- Reordered the series so the bugfix is Patch 1/5.
- Patch 1: Dropped memcmp change, kept original byte comparison style
  for clarity (requested by Greg KH).
- Patch 1: Added Cc: stable tag.
- Patch 1: Updated commit message to explain the OOB read logic.

Changes in v2:
- Split u1bTmp rename and spacing fixes into two separate patches.
- Split hex modernization and the WMM bugfix into two separate patches.
- Added a Fixes: tag to the WMM bugfix.
- Removed an unused variable and dead debugging code.

Luka Gejak (5):
  staging: rtl8723bs: fix potential out-of-bounds read in
    rtw_restruct_wmm_ie
  staging: rtl8723bs: rename u1bTmp to val
  staging: rtl8723bs: fix spacing around operators
  staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
  staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c

 drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  9 ------
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 32 +++++++++----------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  | 32 +++++++++----------
 4 files changed, 37 insertions(+), 44 deletions(-)

-- 
2.52.0

