Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F330E83E
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770016095; cv=none; b=AMB2o/DXbY5Ssu17PPTUWKSfRQll9ZphalkO9IbqDdeIEJEklxthvGrxkzorF/A33r1TwNGqRY0MoXB/Z7iOedq5bGL0m3X7VVw1sc6+dc/BOWgMlY0cPpbfC82S24WaDdr9sxcw+yT80acXtim+w3AaQCnqzPKuDvgjc+70VTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770016095; c=relaxed/simple;
	bh=keSFSSoJmTQ9ZEFdR6RLlGSsW79EHDdmpBIvuyCafNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CpKpHumz0Mc0NXjklABNZdgZLSHW14npmLP5ih7ialvP4EgyWle7gvK616d1FoHwA2Kw9lv0PIfZ5A8J260yudDrBoaqxLJZKhaksY7kBZzU34Xd8H+llNOcbKOC78n/TssysoaW4T1IqP1GFGbiSLXf7RElDsS5G+z7qBfbuUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPiiP09R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPiiP09R"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso36552105e9.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Feb 2026 23:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770016092; x=1770620892; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rdkk7vn8kMeLco1/RDWdVAeYpDYAyLgBI31oaR+yjr4=;
        b=KPiiP09RDvhOzWkx4ZFVXoS4Pqddf3S/IV235vD0bQxkdXvWyNyegoXkRSzfuqBJiK
         S3jScS7FLmqtfHciwUw4YBsYb2J1vWS+wnKVayoLOxLqkjT/I7+s+E6KSKNA8JMDd/xk
         AjpYBDj2uLKMyScHjMZe7g5u/J7U9c9kl5fpeecKy1OtRNk8fldGpmw++qPyFnTefJWx
         6qg8VxRSsMwO7N3OI014L0IqQE3Te8pxTJmAN8Ujxtb9bIetDlutmPosJrHuy/iJ8OIm
         +k6sybnw2GT5J5vyjSa6lPMjUMhWc/fmmdwEY60wPigBcZIxSP0jF5xxXeZgGFvj/6M9
         PIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770016092; x=1770620892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdkk7vn8kMeLco1/RDWdVAeYpDYAyLgBI31oaR+yjr4=;
        b=WJmefMs3qBgVwG5x83sKxip6/u3kRFzpCmFxornDOGsXv6rm9kC7PZ+E/4MZjvFCVf
         Q6RE9BdNKbs6EEpwPFrukggk3IoqwVS+Cl3ik5m7+cJCVAiJRWF10hw+fN/+LVcDS61e
         fTOyJR8WRkY8NBqwML5BG0tudmsqdI7CS3MywPRrFRuemqFhofqEiBsvFMAwD/ySUYpc
         rAJqohstcVD3vbQ0y6g4YIiBke+yqKnkZbx9hDcXn4I4yUOojYerzxcQICx9UpVzLz23
         2I3m8G0OyS9TSRQxnwyIbXyAeLp7tpjexKzbiIWZxBEwjieNu/xo9aGErbdb/gh3RNWV
         I6sQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8++lb7X7fccUbLFowYDAgST+pwfTBI38z167cb12rhu7zQzYbS+hTT6ccrGDyKCHadqeZn6zzoBaiMd3w@lists.linux.dev
X-Gm-Message-State: AOJu0Yyip3xpDtSOYX8MMh0prr1Q0XwsmOcDUOpqDHB6iB0ms8OaP7gz
	JJ4pM8kV/KGYvrJ/MjaP9n5klJ4nau0BD0xyb4Z/G7itpaaDIXQBek8=
X-Gm-Gg: AZuq6aI6vRcw2Fxccbm8EPwY/QOeMhiwie03NcvDV0/+MaGXscdUPqZhyqj65AV6YGx
	uZT4G8ApALj3NahoerU61D3NjGSkTyMP4s/MaVhUQU8ge/zcCeh2cRWQ1AC2VkCuLNdnqfU80JA
	B0gRsFqMUW4iq33yL8IWebKA8ol3UJ2cjJDl131J/mU5Q9kDDacPK0BqGEjJXhmDlDDYgf4vNY2
	gaDbNuGm2i4c7MuXz+n7XyfZl2hzS5OGr6//wYgW6p0p3deCE5nAbvAnnfE7hjZQNUheOPy1inp
	ML1+0wN2H5CfxJus0NAg6JVmeiGJLoiv1mBNm7VffyEU6GFdei6iE5Ek38BQOPzCWPvBLRTbqX3
	qiBFw8FELOYnTZyyfjkTEiVZqexlhL7WfLorNYV+GTa0BvkE+yDmTf/xDJ95iKdWY3zt7eo+IG7
	qCq0h0jzhj+ED0y/nydsHBtu3ynMW7C+K8tsbwrOd9h3pyZDKAXNCRwITIsUu8Aw==
X-Received: by 2002:a05:600c:8b52:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-482db476c30mr138179245e9.9.1770016091514;
        Sun, 01 Feb 2026 23:08:11 -0800 (PST)
Received: from LGPC ([31.223.131.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cde00e8sm371369315e9.6.2026.02.01.23.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 23:08:10 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v1 0/5] staging: rtl8723bs: code cleanup and style fixes
Date: Mon,  2 Feb 2026 08:07:47 +0100
Message-ID: <20260202070752.3391-1-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses several items from the rtl8723bs TODO list:
1. Remove dead code for other Realtek chips (RTL8188E, RTL8812, etc.)
   that was left over from the vendor driver.
2. Convert PSTA_INFO_T typedef to standard struct sta_info *.
3. Remove NDIS_802_11_* type aliases in favor of kernel types.
4. Remove the redundant MAC_ARG macro in favor of the kernel's
   standard %pM format specifier for MAC addresses.
5. Fix all LONG_LINE checkpatch warnings by refactoring lines
   exceeding 100 characters using proper techniques (temp variables,
   function signature breaks, comment placement etc.) rather than blind
   line wrapping.
These patches improve code readability, remove non-standard constructs,
and bring the driver closer to kernel coding standards.

Luka Gejak (5):
  staging: rtl8723bs: remove unused code for other Realtek chips
  staging: rtl8723bs: convert PSTA_INFO_T to struct sta_info *
  staging: rtl8723bs: remove NDIS type aliases
  staging: rtl8723bs: remove redundant MAC_ARG macro
  staging: rtl8723bs: fix LONG_LINE warnings across C files

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 144 ++---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  36 +-
 drivers/staging/rtl8723bs/core/rtw_io.c       |   4 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  16 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 103 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 500 ++++++++++++------
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  |   3 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 123 +++--
 drivers/staging/rtl8723bs/core/rtw_security.c |  11 +-
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    | 215 +++++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     |  62 ++-
 .../staging/rtl8723bs/hal/HalBtc8723b1Ant.c   |  35 +-
 .../staging/rtl8723bs/hal/HalBtc8723b2Ant.c   |  29 +-
 drivers/staging/rtl8723bs/hal/HalPhyRf.c      |  36 +-
 .../staging/rtl8723bs/hal/HalPhyRf_8723B.c    | 166 ++++--
 drivers/staging/rtl8723bs/hal/hal_com.c       |  10 +-
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    |  22 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c      |   4 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c      |   4 +-
 drivers/staging/rtl8723bs/hal/odm.c           |  28 +-
 drivers/staging/rtl8723bs/hal/odm.h           |  11 +-
 drivers/staging/rtl8723bs/hal/odm_DIG.c       |  38 +-
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c  |  19 +-
 drivers/staging/rtl8723bs/hal/odm_types.h     |   3 -
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 103 +++-
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  64 ++-
 .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  54 +-
 .../staging/rtl8723bs/hal/rtl8723b_rf6052.c   |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_recv.c    |   6 +-
 .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |   5 +-
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  17 +-
 drivers/staging/rtl8723bs/include/ieee80211.h |   2 -
 .../staging/rtl8723bs/include/osdep_service.h |   4 -
 .../staging/rtl8723bs/include/rtl8192c_recv.h |   8 -
 .../staging/rtl8723bs/include/rtw_ioctl_set.h |   3 -
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 +-
 .../staging/rtl8723bs/include/wlan_bssdef.h   |  12 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 136 +++--
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   |  17 +-
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |   3 +-
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c |   8 +-
 42 files changed, 1384 insertions(+), 690 deletions(-)

-- 
2.52.0

