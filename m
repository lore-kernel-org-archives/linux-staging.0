Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C61370
	for <linux-staging@lists.linux.dev>; Tue,  3 Aug 2021 23:05:38 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m28-20020a05600c3b1cb02902b5a8c22575so143484wms.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Aug 2021 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dExigQFq2bikAAyS+Bb2dcMDAwUeWzaGvsu6udgmIRI=;
        b=pe6Sakxo5vFNLsVkv3ZXJsBMud3HGwLWNJn0Nbeeo/S3k1vmOP7rGznnAkrrWgDr2y
         spdS7f3paybA/mEd9K0lpfWCHjjEhMBF/gjW7EfqyX4xDNfiS8mWMrLw9sErWn6fhiNm
         f71yV49mqQlDxOjDQoSbNt1DaEwQX18ERW6t3Mc1JzSR9q8V9R6VSOruip1uK37CYJcU
         5zHHmDV8cyzZdcdNWZ/JUE/C9WKX0eFNIvFVqypI27nP7wH6IzVbK2Fg1TriGZPleT05
         dniLkzpoyWwJBFVLyS1QtXWkUqbIFpXQGlkAuugjGkb3XZkEFEt6Aiu555Er8ZXNJfOB
         Nt6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dExigQFq2bikAAyS+Bb2dcMDAwUeWzaGvsu6udgmIRI=;
        b=U15DHBChgtsQCwqq5ZacDH++5d2JMaKlBy4SKXfA2UqueJafRoVz6pvp2IVJKiHP9Q
         elK8RMfmo3X+vuoMBoGI2rrLP9Q0CcoqJPclC1L7yMI6Lbh/Rl0cV8K1i2nvo3y7CGcf
         1NtqLGlJfHAfwb2+YN5sIbX+iu+6KMZkVRfC0X4FW8Q5Ej2WQmsZ3HcAwv38lyGKZbeS
         24Ergt4RBqiLlr1WjioVDb26O+unlBwHsOuJDt48qicrWTIZwnplIIFQzcj7JH5iTxo5
         YsolnI/oqC8iVfigShzdyL6ntKqZmObS8LAs/RQ27LkDFWWWxWedt+RLWqUogv2QshQX
         fbLw==
X-Gm-Message-State: AOAM531ChDdvbFSo+NOxc2m7Ez9mu5s3JHMT7OaMGdADGj+7iI2zjUFR
	bl/nx0ZzKPzF2O3dUO4YPkRpiw==
X-Google-Smtp-Source: ABdhPJzr19GCXECagYssGyk+ieKXA/aA1BPUQOIN8TyfH8I5xBposjYZUMoQqDwWI+c0TcOw6gt3xQ==
X-Received: by 2002:a1c:1f10:: with SMTP id f16mr6562109wmf.140.1628031937341;
        Tue, 03 Aug 2021 16:05:37 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id i29sm330045wmb.20.2021.08.03.16.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Aug 2021 16:05:36 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: r8188eu: remove hal dir RT_TRACE calls
Date: Wed,  4 Aug 2021 00:05:27 +0100
Message-Id: <20210803230535.74254-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes all RT_TRACE calls from code within the hal directory.

Phillip Potter (8):
  staging: r8188eu: remove RT_TRACE calls from hal/rtl8188eu_xmit.c
  staging: r8188eu: remove RT_TRACE calls from hal/rtl8188eu_recv.c
  staging: r8188eu: remove RT_TRACE calls from hal/HalPwrSeqCmd.c
  staging: r8188eu: remove RT_TRACE calls from hal/hal_intf.c
  staging: r8188eu: remove RT_TRACE calls from hal/rtl8188e_hal_init.c
  staging: r8188eu: remove RT_TRACE calls from hal/rtl8188e_mp.c
  staging: r8188eu: remove RT_TRACE calls from hal/usb_halinit.c
  staging: r8188eu: remove RT_TRACE calls from hal/usb_ops_linux.c

 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c    | 20 ---------
 drivers/staging/r8188eu/hal/hal_intf.c        |  3 --
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 25 -----------
 drivers/staging/r8188eu/hal/rtl8188e_mp.c     | 43 ++-----------------
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c  |  1 -
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  9 ----
 drivers/staging/r8188eu/hal/usb_halinit.c     | 27 +-----------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 38 ++--------------
 8 files changed, 9 insertions(+), 157 deletions(-)

-- 
2.31.1

