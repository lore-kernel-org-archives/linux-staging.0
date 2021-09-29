Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4B672
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 19:27:06 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id dj4so13150976edb.5
        for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 12:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y488e6CDLwLyyYkVkTYy429bQEA/xkkUxIrk51eKMFQ=;
        b=B8Hid2T3zOSBobHK4/2b3MBnfmp50HXZypbsZsvwJ0G5HeSXfHCwjyepk+hlQuxqaM
         G4dBioCuCVrFrLDDOC3tZcZBwpSdl8egDoOizvXmlmOQRd87m8lje6kxHee0i6O3Xiwb
         /A38Hu5Rhry3IRk4EmXu4l7eOpDOZnessX2nr4O7PUbdNdg1glDuARR7+E1MEgaTruqo
         YQEoai50XfrBNdeYxWDKxpX5kTn2SJk+5IOgaD4t6xF0eO6DxnmmlD8s30krfxCrZg2o
         /Jn4dqzpoEiqNbvaVvJaAtXgyT81rgAjdwikK7XySZ8cMa3XWHNSt69MmTzLsZUPS/c9
         ejdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y488e6CDLwLyyYkVkTYy429bQEA/xkkUxIrk51eKMFQ=;
        b=WcnyVslCAiOo+mCLh721L1MgTZZCD46XmzCw72hzaPeHjgzcBei3lBHMODX7bY4cBc
         xcBC5o+uWZLOLrkSbf1ldLEKhYolRwuGyUsU/D8KD5PFLIrSyeApMiFANvL2WVBst6/J
         jD0NfBFkEOMjQO8MBPLd6XbBNfC4DsFHXW7rruYOraHsRNKdXNkipGIWKhK6J+JBXM8k
         lafQnf7/DtcpWQQ7E8pTguRiCoUSS+6jmi+0PAvGpnXEVxh92sGRfUm3NUVQNUjuu6F3
         QCgOS+5YoSR282rZ9lbg4GWdWB5WcY118w1vE08qiD7Nq2UwFgOtOf/kO3tHhg5pM3Mv
         +Bww==
X-Gm-Message-State: AOAM531NPDBwebRCQwkdS2HsDRxVuorTt9LOS9qN7ry+m3zOtGbOA/Vw
	jL8OV95Y0Z5JaDu25Idhw4Y=
X-Google-Smtp-Source: ABdhPJx+psJXY9PhCGxcGtwgnSI+CYXay0ul45XOPMp/fo+7y+MBowaKa4fzL4PxouYpqZr8v4Os0A==
X-Received: by 2002:a17:906:7ac4:: with SMTP id k4mr1924983ejo.430.1632943625192;
        Wed, 29 Sep 2021 12:27:05 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::bfc8])
        by smtp.gmail.com with ESMTPSA id f10sm449019edu.70.2021.09.29.12.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 12:27:04 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/7] staging: r8188eu: remove some pointers from struct hal_ops
Date: Wed, 29 Sep 2021 21:26:50 +0200
Message-Id: <20210929192657.9569-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some more pointers from struct hal_ops.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (7):
  staging: r8188eu: remove SetHalDefVarHandler from struct hal_ops
  staging: r8188eu: remove GetHalDefVarHandler from struct hal_ops
  staging: r8188eu: remove init_xmit_priv from struct hal_ops
  staging: r8188eu: remove init_recv_priv from struct hal_ops
  staging: r8188eu: remove free_recv_priv from struct hal_ops
  staging: r8188eu: remove inirp_init from struct hal_ops
  staging: r8188eu: remove inirp_deinit from struct hal_ops

 drivers/staging/r8188eu/core/rtw_cmd.c       |  2 +-
 drivers/staging/r8188eu/core/rtw_mlme.c      | 14 ++---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  |  8 +--
 drivers/staging/r8188eu/core/rtw_recv.c      |  7 +--
 drivers/staging/r8188eu/core/rtw_xmit.c      |  2 +-
 drivers/staging/r8188eu/hal/hal_intf.c       | 56 --------------------
 drivers/staging/r8188eu/hal/usb_halinit.c    | 38 ++-----------
 drivers/staging/r8188eu/include/hal_intf.h   | 33 ++----------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 10 ++--
 drivers/staging/r8188eu/os_dep/usb_intf.c    |  4 +-
 10 files changed, 34 insertions(+), 140 deletions(-)

-- 
2.33.0

