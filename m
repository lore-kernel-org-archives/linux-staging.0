Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543A2C9E
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 17:14:34 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id w1so33387658edc.6
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 09:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H93GgQCSgG0O/jTR8LDdgSffd2wakqUespS2pln07lo=;
        b=PO0fEiBiu/+InhmXUrzzB6P7kc3Vloy/04TzC+F+dEqz/um0F+HCIawLUGxbgJwg3J
         RWFIhpLjIrxxTNjtFkAezixe/cYfAoUn2k+MnZz6WsPw/QPa2CvcLTW8AMp1Lzaon2/l
         zXehGYjlTqwcbUcMGGrx0HFHOe01jofjT1EB4wvvl336JyyYi/MGqrqrp12NkLMUuvx4
         CzW6hIIxRkoOggnbrcbVWtTbS0T0D4ZoEXl1syWnmfvg9e1WoPGuXnA4sDxl9/creISU
         SekRC4tVXuR8kx49skuG6lsqZqp6k0JUPXFUJMkO8sJUeT9zcJ4IuzvOSm/5BYEeLZG5
         60aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H93GgQCSgG0O/jTR8LDdgSffd2wakqUespS2pln07lo=;
        b=T6hHrDVBR8ViTqth6Tzt1PaRaUlUf0iy0U+TIgOTol+8pz+OV9glnBQ6g+DbTSzK0E
         wl47l5pBdbsNiouMFtlELYmPMqcryfBR+F0bRM4dKbnAUBtBzQRmlkOMKbQA760U5QWw
         68rSoGsiSeqKPqUSOH++eMI3fq8DpZCA2LTE+JvHkw8zwZDihKbkIT6AJaiOy8NKx0kv
         Rd5i5ixNLz4o0ImCjyCGNeOTXsvzCpA6K4Prk067t4/oYpg5ArN01NTeXGAgrxE4UqYD
         +jcluRcEmPwLpw3rev59m3eO32kmrN1/rNoW/mvcfTTV/NEw4JXcAvGE6LyP4L2hOFiH
         YC9w==
X-Gm-Message-State: AOAM532WEQtQJHcsdKru0SzVRyvBkTzoQafIppaVV+PkNoM0zdCgVhKq
	IPe27JPkwIw8/8/swKbSGXs=
X-Google-Smtp-Source: ABdhPJxnhCh7P5U+N28zF8E0CWbKe/NHE06FuYLFrTgVbLVXcg6EJlGf1fehK6RD/TKfzJpwp4MPVQ==
X-Received: by 2002:a05:6402:2210:: with SMTP id cq16mr46819762edb.32.1638724473283;
        Sun, 05 Dec 2021 09:14:33 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::b792])
        by smtp.gmail.com with ESMTPSA id ch28sm6071773edb.72.2021.12.05.09.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 09:14:32 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 00/10] staging: r8188eu: misc cleanups
Date: Sun,  5 Dec 2021 18:13:32 +0100
Message-Id: <20211205171342.20551-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series consists of various cleanups.

Tested on x86_64 with InterTech DMG-02.

v2:
Removed patch 11 and 12.

As mentionied by Pavel the hal data allocation is never checked
for success. I'll work on that and send a separate series that
also removes the GET_HAL_DATA macro.

Michael Straube (10):
  staging: r8188eu: remove RF_PATH_{C,D}
  staging: r8188eu: struct odm_mac_status_info is not used
  staging: r8188eu: remove macro PHY_SetRFReg
  staging: r8188eu: remove macro PHY_QueryRFReg
  staging: r8188eu: remove macro PHY_SetBBReg
  staging: r8188eu: remove macro PHY_QueryBBReg
  staging: r8188eu: remove duplicate defines
  staging: r8188eu: bWIFI_Direct is set but never used
  staging: r8188eu: bWIFI_Display is set but never used
  staging: r8188eu: remove unused macro IS_FW_81xxC

 drivers/staging/r8188eu/core/rtw_p2p.c        |  3 -
 drivers/staging/r8188eu/hal/HalPhyRf_8188e.c  |  6 +-
 drivers/staging/r8188eu/hal/odm.c             |  8 +--
 drivers/staging/r8188eu/hal/odm_interface.c   | 12 ++--
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   |  8 ---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 60 ++++++-------------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 26 ++++----
 drivers/staging/r8188eu/hal/usb_halinit.c     | 12 ++--
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  | 16 -----
 drivers/staging/r8188eu/include/hal_intf.h    |  2 -
 drivers/staging/r8188eu/include/odm.h         |  8 ---
 drivers/staging/r8188eu/include/rtl8188e_dm.h |  7 +--
 .../staging/r8188eu/include/rtl8188e_hal.h    |  2 +-
 13 files changed, 49 insertions(+), 121 deletions(-)

-- 
2.34.1

