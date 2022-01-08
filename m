Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E8F2C9C
	for <linux-staging@lists.linux.dev>; Sat,  8 Jan 2022 00:55:52 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id r10so6460502wrc.3
        for <linux-staging@lists.linux.dev>; Fri, 07 Jan 2022 16:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iZK2bzn+VEDYvJEehx01sEshek4cKVaA9ZGbUqbBEFw=;
        b=yIVJvHoywJPDV6cBJz149GUftE+KZM3Q1atR5w5tggD2zxAIjjYJozDAFWJ/r9plPD
         iK1nG2KWKPxzmQ26AKPYG4uRs6nlBMwIov8BbyFY2NgkCVwm048PYtEFD5JIumPvYvfa
         l0V21FLpnrPYhXT0bezdTZ1ZDlLbzrsuxIxR9XqJ9rhRg8GyDGhY+7RgUugztdCKOnfl
         gUlMLj4jPcBajw/NOGw0GrqpL0H7NuBcy2wvv3mGuZGScBe85bAjVBXzNkRmMzJHJFlm
         OCRwaaUk3YVz75ASnnhxd8Hn4FyPjZhbP46A2/DsPY0YffNFq0EFJ16ITWAMOWzKFc96
         rW/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iZK2bzn+VEDYvJEehx01sEshek4cKVaA9ZGbUqbBEFw=;
        b=owMa0T3kRJpCrdRsRU4qpEyMx1ABR7+u5DcDhZYXFyMTjCTOertcELR09rbnPt8YHK
         00jdWwCdbZRzBsDLsrIC2cofDUUzrmNZatAIDom/73R1o/tOmix3skoC4LtqioUKYlyz
         A2BudPFVV6SG/a4S32liTJWh1cFM3+iMPbJF1qkTklui6DVCF93GHvdJMXw+dhX2C6cc
         S5QOT2sEZoEmFrRVuYIIVGMGSyg3mr3WtzmmAWCP89SbtsqR/EnHmLMHetLbrygFBZTz
         anq282caPoTHaHoKQnlnue94D/QNcCTCv3mN0cGYnbgiggzlio9RHBY6Lfn8H0JhgxqF
         uv0g==
X-Gm-Message-State: AOAM5329t/LSqskxFIz2u58equs1njicPN8TL+icb+00X1c55xgBNXZ5
	+rEtVDTG8cfHT7YiBXSCOX2JWg==
X-Google-Smtp-Source: ABdhPJyPTOTFXwAeO3W22g2S4nkN99gz4XBTEooWa74uAVTrPNrs+faG/TTL55i+ucqSkU1KlOzD0w==
X-Received: by 2002:a05:6000:124a:: with SMTP id j10mr55212148wrx.110.1641603351412;
        Fri, 07 Jan 2022 16:55:51 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id c18sm238853wrn.81.2022.01.07.16.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 16:55:51 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: r8188eu: more DBG_88E to netdev_dbg work
Date: Sat,  8 Jan 2022 00:55:45 +0000
Message-Id: <20220108005550.26264-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Another small series of patches to convert more DBG_88E calls to
netdev_dbg calls, or remove them as appropriate.

Phillip Potter (5):
  staging: r8188eu: convert/remove DBG_88E calls in core/rtw_ap.c
  staging: r8188eu: convert DBG_88E calls in os_dep/xmit_linux.c
  staging: r8188eu: remove DBG_88E call from os_dep/osdep_service.c
  staging: r8188eu: convert DBG_88E call in core/rtw_cmd.c
  staging: r8188eu: convert/remove DBG_88E calls in
    os_dep/usb_ops_linux.c

 drivers/staging/r8188eu/core/rtw_ap.c         | 145 +++++++-----------
 drivers/staging/r8188eu/core/rtw_cmd.c        |   4 +-
 .../staging/r8188eu/os_dep/osdep_service.c    |   2 -
 .../staging/r8188eu/os_dep/usb_ops_linux.c    |  24 ++-
 drivers/staging/r8188eu/os_dep/xmit_linux.c   |   6 +-
 5 files changed, 73 insertions(+), 108 deletions(-)

-- 
2.33.1

