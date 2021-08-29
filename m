Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6093FC2
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 23:45:45 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id u16so19906969wrn.5
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 16:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TmFVJ/7PWIFtYd7lCFfi01jjFEkduMKijZK/60kirjo=;
        b=moBjk59GicnB1y9qNxG/7OG/zIwrK9Kyvtc5ATZd/uhq6FOtXwmLYwZHvw4liL+EI1
         xQv0naaRkUS8LsS0/AWiNUipZ61dM5IhJ0KogyaOBDVDaaneWXzmgEcwIKZT4+U3XAT1
         2NQz3zUnI3Nxfp4Vqs76v0VRE1oFAgTKt4mLi/QfWicWZD+zRr4+NzlvoFyxjJxMI0Xt
         hfKaP/kXnmuMbxaETFGLPHM//Xv1fTQ0A78/RPUAsltDdBoQQR9hRvP1y26PhroMtBQP
         sZIP9Hz/EdA7NoPYKr7oyF06m3ounH0+FoJfOoMhy6V4gT+H9lQCSNlAC7JevSJUJ+I2
         m5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TmFVJ/7PWIFtYd7lCFfi01jjFEkduMKijZK/60kirjo=;
        b=ABh9eBmFi9sT+LDIdpnluOLZ9qhu/Xuk5VLvzQ5I/GiBZuyxC9YB2QLHac6hr8xOE6
         IHKmYd9DhZzx2NC++ZMLfVaCEPDYta3uyk9NWVIY8YPCC36KwpUdN2YVm9utNCainDje
         ZAxTZ2CkQ70kPs1U0K2GpPSBYqvs+YZPd9fZ+E+M73e9XQsHrCgyxoeVyPXTHALebSnh
         9ScDnS5LKZ2xr7XD1J1sgYrw346k8vRbvWep8axYALUkYh+pxqXpeuwnmD/0RSZa/UeV
         wSSNaOVmjC7ymYC3lOq9pFwVPE/BXh8vfF7ueNBetIq/1C7jx5OHAnZ/ur8S9IysGMs3
         Jwlg==
X-Gm-Message-State: AOAM533Dby5R5R/clkmR9+BrLkZk+XuipUC2MWmXb0dmQiIioeu19I8U
	V2/iSy/fjxXzJlc5n+tec2D4Pw==
X-Google-Smtp-Source: ABdhPJxFxTPvXOG8mZj5ldMsL+P1A/+xz3/uHjPAUfO2Pb/sKUhQyxx/8xyLC/Mer4y/OWGAS+tqeg==
X-Received: by 2002:adf:f552:: with SMTP id j18mr22114020wrp.273.1630280743477;
        Sun, 29 Aug 2021 16:45:43 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r25sm14500574wra.12.2021.08.29.16.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 16:45:42 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	Larry.Finger@lwfinger.net,
	paskripkin@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: r8188eu: cleanup c2h_handler code
Date: Mon, 30 Aug 2021 00:45:38 +0100
Message-Id: <20210829234541.946-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch set cleans up the c2h_handler code in the HAL layer
of the driver. In r8188eu, this field of struct hal_ops, is not even
used, so dependent code has always returned _FAIL. For this reason, we
should remove this function pointer field, and the wrapper function
which checks it. This is done in stages by this set, and helps get
the driver closer to the pointer where the HAL layer is
deleted/integrated as necessary and no longer a separate entity.

This V2 version contains a small change to the return type of
c2h_evt_hdl, based on feedback from Pavel Skripkin. I've also folded
currently received Acked-by tags into the commit messages.

Phillip Potter (3):
  staging: r8188eu: remove c2h_handler field from struct hal_ops
  staging: r8188eu: simplify c2h_evt_hdl function
  staging: r8188eu: remove rtw_hal_c2h_handler function

 drivers/staging/r8188eu/core/rtw_cmd.c     | 25 +++-------------------
 drivers/staging/r8188eu/hal/hal_intf.c     |  9 --------
 drivers/staging/r8188eu/include/hal_intf.h |  4 ----
 3 files changed, 3 insertions(+), 35 deletions(-)

-- 
2.31.1

