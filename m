Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDBB7F
	for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 17:49:43 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id r17so15246538ejy.9
        for <linux-staging@lists.linux.dev>; Sun, 11 Sep 2022 10:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=pPPmEhZFME2nJneDVNzT2ko3F6Kn85qH2e/NdwR3mTY=;
        b=ZHoP3/hh697Gv8CwxUR/6//HdZA/uJDHS/Sxf2bSba4VjIozwv6+fWT4J2msxeAh5U
         rPTld0BkuOGn32dOQN7ejzhaeARYGjz1nau3U1YtyZBf+UHdr5fFpPfC7I4xNXBFHjZa
         blGD30yjinzqBOnZdYm7GtcrbaG5ho5K5Eo4I24vlyI7TAbJD/zjOHFf2w1iZbvMo6nt
         FtdNm+RDNk73gbXpQqwGqHa4PYEKlHGR26cItRc2kPsUzJKghnY38Eb8PcLp4hxQZO8N
         MPYEPXnuull17yuqf5Wt7ucRF+e6UeX5/5tllS9WzSpHFp7Kr+CH/iOc8oB+I9tjAmrd
         IPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=pPPmEhZFME2nJneDVNzT2ko3F6Kn85qH2e/NdwR3mTY=;
        b=WCQDYFq33M0ufEp3AhO13fiwCP5GY/M86eokSPOhoPyBQsc6zrwoZIqpj3j4MWmNUC
         hbG5d7G7zASgqwgljKLD7HImVByOC3VTjZhkabYsCyg+dxdp4P+RCiU5gWksbWvtzv41
         uU46hTPJf914tafC9O46Y7TkOvV/SgkZRA08NAA8kfEPOXV5kMV1JTiSvQk3jNHEuFW3
         1RrzJABJM2mBb2c6hUIBwKYpvVQ22fMCkpGBqVzxl8f8N1RsF4mfRHNLGYtsA4gSiuuP
         gWre/vqPXo0IdbI8qP6sY/fCyj7BvTvghvAwE2EtHhr5hiOKt1R++xsLQ7aSLHTOFdhO
         RMiA==
X-Gm-Message-State: ACgBeo2A0fUFJj2S/WCrlLJwfOZUlzf0WiMxPopYZbnkjFdRsDcqmtSN
	Hu3fT68fOnBMdlyGBUKzJ1s=
X-Google-Smtp-Source: AA6agR7+/yEqjMO2d5PwaVdr/iK1JPL0B2OUft0DU+5NbB8iewMTjyFu7AwoeesyYZIOZ1ml5jDm7Q==
X-Received: by 2002:a17:907:1c01:b0:6f4:2692:e23 with SMTP id nc1-20020a1709071c0100b006f426920e23mr16167601ejc.243.1662918581603;
        Sun, 11 Sep 2022 10:49:41 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id u5-20020a1709063b8500b007336c3f05bdsm3265393ejf.178.2022.09.11.10.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 10:49:41 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: remove recv_osdep.h header
Date: Sun, 11 Sep 2022 19:49:30 +0200
Message-Id: <20220911174933.3784-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the header recv_osdep.h.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (3):
  staging: r8188eu: make _netdev_open() static
  staging: r8188eu: remove unused prototypes from recv_osdep.h
  staging: r8188eu: remove recv_osdep.h

 drivers/staging/r8188eu/core/rtw_br_ext.c     |  1 -
 drivers/staging/r8188eu/core/rtw_cmd.c        |  1 -
 drivers/staging/r8188eu/core/rtw_mlme.c       |  1 -
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  1 -
 drivers/staging/r8188eu/core/rtw_recv.c       |  1 -
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |  1 -
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    |  1 -
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  1 -
 drivers/staging/r8188eu/include/osdep_intf.h  |  3 +++
 drivers/staging/r8188eu/include/recv_osdep.h  | 23 -------------------
 drivers/staging/r8188eu/include/rtw_recv.h    |  3 +++
 drivers/staging/r8188eu/os_dep/os_intfs.c     |  3 +--
 .../staging/r8188eu/os_dep/osdep_service.c    |  1 -
 drivers/staging/r8188eu/os_dep/usb_intf.c     |  1 -
 14 files changed, 7 insertions(+), 35 deletions(-)
 delete mode 100644 drivers/staging/r8188eu/include/recv_osdep.h

-- 
2.37.3

