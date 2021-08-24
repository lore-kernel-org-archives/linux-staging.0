Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1983FC1
	for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 12:37:33 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x12so31063732wrr.11
        for <linux-staging@lists.linux.dev>; Tue, 24 Aug 2021 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GJYXr1tQ9EygzFDus9BYevQzwoxX27JUJzZM6AwoQ/Q=;
        b=TOgfy24VyrFMnXNTA59pq37fgDL8mWQIBDKcQgeUVv5/CQn2vnZXNJRWbyMwKua2+8
         ZcE4FGtH35GNqxil4bU9Ev4idaYfT2Wn12HdpaI2rOMhy8UwS7Wbtmk9lYEnWiZRGuSJ
         PuQw+pv0uTwGAnHTxMWBSvGN2LXZtyeMZk9d/kCWxwUXA48H7WptNM29YlyuSwVCou8f
         gKf6kWC3+k8+Vjlqc2KRxRd0ujsm8kvEwkWhVno1bGBb8zNdpkeonM+ufDsPUavVIeHm
         sEKgaQHiEMTPNIHV1DmEuKXjo0+rOLxItLGdcHZW14pbh8PTUm93BJX0br+jeOm0slVB
         wr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GJYXr1tQ9EygzFDus9BYevQzwoxX27JUJzZM6AwoQ/Q=;
        b=uYHPjBUYrzaMnG/4UeF8mrohIn8Rw62LUN0f+Ow8a+Jsab3hF0nn4L/Yezah7KpnEM
         vrdJEAGe7GQoC7IKqvY3Bv1xoiG29Kgx0M/kk1TS0qOOYaSAE/pKBsdgPBsJXnLDAMYT
         g3TIQnytjwGNVcYwVC4MIIGQf60BdynFEb0blV8Fsn1P4MNRzwq1vkkG2Ydi5DHOiVg3
         eNXg+Th+O2szKFdnM4hOwR+2sAPAke2/drzoDNjyC/BvMPyoaTsYh/XMpKjI1TU34D1X
         SWaYJHV6G0NY3W8QXcnA+ES6PtBNUNLy+Klsg//wp3+PCoa5zCEWeo+Zzg7iOI4WvUT6
         MKUw==
X-Gm-Message-State: AOAM531eKAtyWqX7XDKe7tnxbSL/Hkz7ZQH5s8juRuvhOK9QukThDo42
	ZDRUJKbCMr5PzT9GXpCuUZqUjMWYSF4=
X-Google-Smtp-Source: ABdhPJyiunSCyQgCKbvtnEsWdpjVKt5/WbMN7JYPDMA2OuKfxpZmurGv6Lx2yJd2BtCoumCcpdOkMw==
X-Received: by 2002:a5d:5107:: with SMTP id s7mr18742280wrt.283.1629808651721;
        Tue, 24 Aug 2021 05:37:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::5d87])
        by smtp.gmail.com with ESMTPSA id u23sm2137450wmc.24.2021.08.24.05.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:37:31 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/3] staging: r8188eu: remove unneeded header files
Date: Tue, 24 Aug 2021 14:36:18 +0200
Message-Id: <20210824123621.10801-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the header files if_ether.h and ip.h as both just
duplicate in-kernel definitions.

v1 -> v2
Added a patch that removes the header file ethernet.h.

Michael Straube (3):
  staging: r8188eu: remove if_ether.h header file
  staging: r8188eu: remove ip.h header file
  staging: r8188eu: remove ethernet.h header file

 drivers/staging/r8188eu/core/rtw_recv.c      |   5 +-
 drivers/staging/r8188eu/core/rtw_xmit.c      |   1 -
 drivers/staging/r8188eu/hal/rtl8188eu_recv.c |   3 -
 drivers/staging/r8188eu/include/ethernet.h   |  24 ----
 drivers/staging/r8188eu/include/if_ether.h   |  94 ----------------
 drivers/staging/r8188eu/include/ip.h         | 109 -------------------
 drivers/staging/r8188eu/include/rtw_recv.h   |   2 +
 drivers/staging/r8188eu/os_dep/recv_linux.c  |   1 -
 drivers/staging/r8188eu/os_dep/xmit_linux.c  |   2 -
 9 files changed, 3 insertions(+), 238 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/ethernet.h
 delete mode 100644 drivers/staging/r8188eu/include/if_ether.h
 delete mode 100644 drivers/staging/r8188eu/include/ip.h

-- 
2.32.0

