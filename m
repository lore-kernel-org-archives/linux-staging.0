Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6527707
	for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 13:29:19 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40471c054f9so6727095e9.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Sep 2023 06:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695389357; x=1695994157; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TVLvJ+dOPpuR79o+2fomapIC7IP8zBabO9ASUwcyNOw=;
        b=kMWWexd2UO4hAglVJIBA2ZrCexmKqLpRut3dZOE7Yfq+9dkpQ+pYinZJrdhxbJPc17
         +MdpEOTqqSzDoUpZIhd/DxWmSaQTFiYszLgb5wG517dPkV9Cu+aBE9zNzHJmKRLU5NzH
         ULU12/MgM0hh2+AXg5lxAGWW0+Eb5FLzilOFq2hHBnZxwiUpo4AxW566lZxgRLlwv6aM
         A5R1abPDyQyhNhNZqn2GlAsQkOw0jzMkov+xfijL/0diBYCO2i/+9+uREqTWJkAkJrAp
         ZkVqO/Awa5nf6p5djQL20L+881CLTuuXLVhDyBna/6cNivIQfzh9XShAyS0K1nBPvyNh
         p7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695389357; x=1695994157;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TVLvJ+dOPpuR79o+2fomapIC7IP8zBabO9ASUwcyNOw=;
        b=FwhA1AqNdVPpqZqruL/9xDkc06YqccazPH05UWMYYv4GAYu/vsYJT2uLyEIGv3H+9Y
         tMqIgnTcDWXxCbUqlB1zjCF7/HqMufP6lr+pmipakxw+zhl0wAWXQ5bRbcujkoAoJ9RE
         Sp1sZ/GV45ZpwX8Qm9nFNjSfCgkbQ2wvQ6mRu3pwD7TBn+N+2PsCLivB0yKZFmgV5+5Q
         2lsrub6H2Fzf5vsl+VRkNSMKGMQYDh5ZDDkcfgsBY29r5LPS9Ly9tb5KLw+6CBpA4wqK
         kzXAjuYL0G3noVOE3Lxfmbs3PAIHK6km2zoA48jP8E/INOKB4kGfpCmj3dDyFd0dfVBr
         fNJQ==
X-Gm-Message-State: AOJu0YytaS92yd4Oj2iuDHl8NJrLYIxu1sJYEa7T1Vjh493FuRYVaVpH
	fA+e88QDwhPf4HHAQgEaB64=
X-Google-Smtp-Source: AGHT+IFuUHm0KscA5Acf+Cq9svi9Nx9WdrlevWXm4I2gzt3CA3G5jow7/GUNA2BqyxxfLkYiHF6CEw==
X-Received: by 2002:a05:600c:1c20:b0:405:358c:ba75 with SMTP id j32-20020a05600c1c2000b00405358cba75mr3962139wms.0.1695389357176;
        Fri, 22 Sep 2023 06:29:17 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d654c000000b0032148618cc4sm4464524wrv.29.2023.09.22.06.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 06:29:16 -0700 (PDT)
Date: Fri, 22 Sep 2023 15:29:15 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] staging: rtl8192e: Remove mode IW_MODE_ADHOC functions
Message-ID: <cover.1695387832.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unsupported mode IW_MODE_ADHOC because this mode is only partially
coded in the driver. This patch series removes the unused functions.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (7):
  staging: rtl8192e: Remove mode IW_MODE_ADHOC from rtllib_tx.c
  staging: rtl8192e: Remove mode IW_MODE_ADHOC from rtllib_rx.c
  staging: rtl8192e: Remove mode IW_MODE_ADHOC from rtl_core.c
  staging: rtl8192e: Remove mode IW_MODE_ADHOC from rtl_cam.c
  staging: rtl8192e: Remove mode IW_MODE_ADHOC from rtllib_softmac.c
  staging: rtl8192e: Remove delayed_work start_ibss_wq
  staging: rtl8192e: Remove rtllib_stop_send_beacons

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  44 +--
 .../staging/rtl8192e/rtl8192e/r8192E_dev.h    |   1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_cam.c   |  61 +---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  22 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |   2 -
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |   6 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c    |   5 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c     |  64 +----
 drivers/staging/rtl8192e/rtl819x_TSProc.c     |  21 +-
 drivers/staging/rtl8192e/rtllib.h             |  23 --
 drivers/staging/rtl8192e/rtllib_rx.c          |  38 ---
 drivers/staging/rtl8192e/rtllib_softmac.c     | 264 +-----------------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  10 -
 drivers/staging/rtl8192e/rtllib_tx.c          |  11 +-
 14 files changed, 22 insertions(+), 550 deletions(-)

-- 
2.42.0

