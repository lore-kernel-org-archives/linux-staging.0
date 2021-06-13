Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5644372
	for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 22:41:53 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id t4-20020a1c77040000b029019d22d84ebdso11724107wmi.3
        for <linux-staging@lists.linux.dev>; Sun, 13 Jun 2021 15:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIfUvlRYRh95NKgqkMImuAxTY1NXOpBQWAoWFLuAQ4w=;
        b=ru0mUj9P3GuRSe7bANL5bgJtl4PZi5kDlROAwbPU+ZmOFYE58pjwvzgJ6hXghTetdK
         02a68fmmAc4UlAAIbxVUibgb4dI9z1JGFhf0TOl7HiJ2TsjTUVkElk7TZjTq2iGb1I5I
         hCbhp9LnyTWNPYyGJNBK6Rh5lvIcuTiqI2K3Za7m0b3O+Sp/Zma7BUKsplAGxYKOVMUC
         fINbyjld1DpU5pAZoM7Lgqi/fiiAD+WnAByVefL9wdlJLAmUT/FaNAzAKQT3EKMUH3fh
         MtUjxIgektCHrrLFlQ1S+POBlzH9hVmt1NHSPlmLF9BKm98TwpAyFZ/jo8O5S4rXrHGW
         MRNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIfUvlRYRh95NKgqkMImuAxTY1NXOpBQWAoWFLuAQ4w=;
        b=XZ4vkWLW0RtNuCQh2D9GdQ0DHHci8IK/rFxtvPbhDCkDr+v/eAlVHm91ZUNOvpBuQ7
         w44k1huQZYVpH8gIC4KE7j5SDOP3XsL7s+CYTH6iuH1GSp5RokRazvDIIzw3PClBOPL3
         x/ZjwJM9+cnO3Fvjkli5ayHEbqCx9tPfd+lP4OPJI03RmkIgoeg+gGlK25hDA+iA1EXN
         3Q0buZJA1WM6FYVLHWz76aRW+engRyGsEHq5g3qqyS8tRWPKgoqgnq00KIJW64/Hl9cZ
         WVkE8RZYe7Eh5YbnQ11nxUtMm8XoCRC+EHda1IccNjgkoJtrhrXHbP0xY4Mdp2+eGch9
         r2vw==
X-Gm-Message-State: AOAM530NNNcpF1BOqC6W1pCWI9VnfzSC7zoRVNZR8fua2qqnfz7pDuOU
	ZMGYOonqNNL+quas2Ais1ThuBw==
X-Google-Smtp-Source: ABdhPJx6w6LqgbO/INu6Sj/TZwIiwKXSTZngipchlCSeSj25g9ZRIgsxTaw8oZweByB1tBkRKhZSXg==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr29599904wmc.5.1623624111817;
        Sun, 13 Jun 2021 15:41:51 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id w11sm15120618wrv.89.2021.06.13.15.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 15:41:51 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	insafonov@gmail.com,
	linux@roeck-us.net,
	straube.linux@gmail.com,
	liushixin2@huawei.com,
	gustavoars@kernel.org,
	christophe.jaillet@wanadoo.fr,
	yepeilin.cs@gmail.com,
	dan.carpenter@oracle.com,
	martin@kaiser.cx,
	simon.fodin@gmail.com,
	romain.perier@gmail.com,
	apais@linux.microsoft.com,
	mh12gx2825@gmail.com
Subject: [PATCH 0/3] convert more DBG_88E calls and remove dead code
Date: Sun, 13 Jun 2021 23:41:44 +0100
Message-Id: <20210613224147.1045-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts all DBG_88E and DBG_88E_LEVEL calls in
core/rtw_efuse.c and core/rtw_xmit.c, and also entirely removes
core/rtw_debug.c which is dead code and contains only functions not used
anywhere else. This should contribute to the continuing effort to clean
up the rtl8188eu driver, particularly with regards to its debugging.

Phillip Potter (3):
  staging: rtl8188eu: convert DBG_88E calls in core/rtw_efuse.c
  staging: rtl8188eu: convert DBG_88E calls in core/rtw_xmit.c
  staging: rtl8188eu: remove core/rtw_debug.c

 drivers/staging/rtl8188eu/Makefile            |   1 -
 drivers/staging/rtl8188eu/core/rtw_debug.c    | 187 ------------------
 drivers/staging/rtl8188eu/core/rtw_efuse.c    |  27 ++-
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c |   2 +-
 drivers/staging/rtl8188eu/core/rtw_xmit.c     |  60 +++---
 .../staging/rtl8188eu/hal/rtl8188eu_xmit.c    |   4 +-
 drivers/staging/rtl8188eu/include/rtw_debug.h |  25 ---
 drivers/staging/rtl8188eu/include/rtw_xmit.h  |   6 +-
 drivers/staging/rtl8188eu/os_dep/os_intfs.c   |   2 +-
 .../staging/rtl8188eu/os_dep/usb_ops_linux.c  |  11 +-
 10 files changed, 69 insertions(+), 256 deletions(-)
 delete mode 100644 drivers/staging/rtl8188eu/core/rtw_debug.c

-- 
2.30.2

