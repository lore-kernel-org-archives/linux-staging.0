Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA3B2FAE
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 17:22:36 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id bg10so5725983ejb.4
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 10:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I61gN2qyHfQVc0lXEisvsSshJTx/hjGvwxAqAi4L41M=;
        b=mQeh1ZOB58Xp4ghWny/k9KagUmjj7tiQrxMEkzUU8AJtPIWT6WZZImN6wIvKB8KyCY
         A+hfHCQRcqO8rt2v+B0p5bo2Ioej5IWO6pqGWAFrePNIh7OycZhNQN2PgTZEYp/436TO
         MXaI8aC3+9Jy1vuwCdE1lfKHGYHFWwZpy+v1Xc7g7YPd1aJc5WqVDN7Va+vSIIxu7PhB
         yRqXmT0fOhmCC8Y2+wTvL6VubWMkh7k4997DFqWVm+qGMewJq+Xkp5CV+/0s0oYrG6sz
         n74SRu3wu1GpsLv4QIfaUeo6DqAVx29Xe5Rl2QgWqaX3+tsxsrtvbknlWwJ8AQmyNpdn
         zXTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=I61gN2qyHfQVc0lXEisvsSshJTx/hjGvwxAqAi4L41M=;
        b=EkyTKT9FKu06m7CHerifxSsJCfgmLMYRi7vFl6dkPDlJlycbQYOX+HdFpy2IY5KRyQ
         s5Zt+kztV5JYUdmg2Z6Wst8iY/wRqOSzTbsA7gB1NRZ5/FWuRd0M3CRzoZs78YXpGtdg
         Tn7I85a3vHlT9+YGkyXNDg7Bl2Xe5kjBNyqNiZUg6ckipvGEoITZ6PAxfjdyUBiZ144D
         /VHhfDpyZluc3dqBDHX2uxMDvJjOT8g66Qn5gtnoSil1oT9WG1zVYvU2ajHtIOmWO0S3
         xGKh2Nuj74TnWvalG8J/IqvvymC0DKp7Ukbuqpd3VkV7BvdWebXE9CN5MmGY3Mx9ZVKJ
         bH4g==
X-Gm-Message-State: AOAM530cAlAvVGg5qPuIYJVcDYtZl7OuNfa8oZWmp9167uFTxmRyiN1d
	0DBRWQUyUN785Wgm7NkXX+8=
X-Google-Smtp-Source: ABdhPJzZHiAnJyLP+Iks60sV0TEElSwYYK4adIyA/DBg3K62WmoCz8LytOn97+kMRFDrFe7ZBShkgA==
X-Received: by 2002:a17:907:7f8d:b0:6db:7227:daea with SMTP id qk13-20020a1709077f8d00b006db7227daeamr9338204ejc.100.1649265755199;
        Wed, 06 Apr 2022 10:22:35 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id da19-20020a056402177300b00413583e0996sm7912730edb.14.2022.04.06.10.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 10:22:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 0/5] staging: r8188eu: use round_up()
Date: Wed,  6 Apr 2022 19:22:14 +0200
Message-Id: <20220406172219.15565-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series converts the driver to use the in-kernel round_up()
and PTR_ALIGN() instead of custom _RND* implementations.

Tested on x86_64 with Inter-Tech DMG-02.

v2:
use PTR_ALIGN in patch 1/5

Michael Straube (5):
  staging: r8188eu: use PTR_ALIGN() instead of RND4()
  staging: r8188eu: use round_up() instead of _RND4()
  staging: r8188eu: use round_up() instead of _RND8()
  staging: r8188eu: use round_up() instead of _RND128()
  staging: r8188eu: remove unused _RND* from osdep_service.h

 drivers/staging/r8188eu/core/rtw_cmd.c        |  2 +-
 drivers/staging/r8188eu/core/rtw_security.c   |  6 +--
 drivers/staging/r8188eu/core/rtw_xmit.c       |  7 +--
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  8 ++--
 drivers/staging/r8188eu/hal/usb_ops_linux.c   |  2 +-
 .../staging/r8188eu/include/osdep_service.h   | 43 -------------------
 6 files changed, 11 insertions(+), 57 deletions(-)

-- 
2.35.1

