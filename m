Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50B970
	for <linux-staging@lists.linux.dev>; Fri,  6 Aug 2021 00:40:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso4926141wmp.1
        for <linux-staging@lists.linux.dev>; Thu, 05 Aug 2021 17:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oISZJr8Fi5GT7T+pxi9D17g6rw6l8wM7jO5drTaEEK4=;
        b=kN0CLFbFWMQ4cIrPs5JEohh3co8KFaSsU7OdRzME8Ive6wCTyl+48lLhM/b4ctrkFq
         PJYliLqXc0z6f6xEfl6FCGWHfXYXL9b0dvbS/2bG7vAJ8U2tUtuXNC7N5PJRYg0zbtfY
         dwP8vL2J60WkIJ9KtWdetrzWW4Yodv91p/fBgxmruprtd2VeJD2YK5RWhyfCN8pa5m7P
         RnxtafT7uNO2p38DnBizOBPSmiFHORZ2jxQVOzIJt7vhUim2w5ZHjJv5yX5rwuGXll8J
         Wz9MGBoGNNFh4f+X2b1P4fLOzHBOyWJG44D8gh76u7o/PkY5U5aWKakg94YndkQOkhEX
         snkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oISZJr8Fi5GT7T+pxi9D17g6rw6l8wM7jO5drTaEEK4=;
        b=nOGmILoV82ne2XxgzLr9cpBXUVLR30+19fM/jGYyTMKUo0kZ2fUKM8YGPmTeRXj39L
         rRUk/9vu9mAluc8sT/XZVEcV1ysbfBjAsOGTH1jnc5WHJNZisg6AnNMj3pCRbfWuPP/+
         PsRF41UcMobk/fqnxMk1xvJrwJWUmVMPmnCRDGU4ZCgL0vHT3PK2AH3kgEgm/QEuefkK
         XGrvl1knGfsCySQZwPmfkpb08Ktfj9cXV8XBReUQkD5gZ28xEnRav7xQTQCvYhEB2bMO
         mri8/tYQbMLybBMMan6B4TbTaMTRxqZ6sVtvZAGB/LFmG57BGLct73zKZc1SYFWy3roa
         4AQw==
X-Gm-Message-State: AOAM532ADGPeWXvh7OqiqCsACRdGX1oCokMJeyFpgHyY9/qqHZ5LZHaC
	M9Q08VZAQr7vTUXOTR+DEOfmZA==
X-Google-Smtp-Source: ABdhPJz3bhWxi7JOdsCUygLq0dX5WsnnzbXYpj9WGzm7a5l0pdNXVD77SR6dU7ONFEBy7afgydOtbQ==
X-Received: by 2002:a1c:a4c1:: with SMTP id n184mr683384wme.8.1628210437202;
        Thu, 05 Aug 2021 17:40:37 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id y19sm10727181wmq.5.2021.08.05.17.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Aug 2021 17:40:36 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	martin@kaiser.cx
Subject: [PATCH v2 00/11] staging: r8188eu: remove core dir RT_TRACE calls
Date: Fri,  6 Aug 2021 01:40:23 +0100
Message-Id: <20210806004034.82233-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This v2 series just contains new versions of the patches that could not
apply to the staging-testing branch due to the level of change caused by
other commits. It also fixes up some kernel test robot warnings
introduced by the patches that did merge properly from the first series.

Phillip Potter (11):
  staging: r8188eu: remove RT_TRACE calls from core/rtw_cmd.c
  staging: r8188eu: remove RT_TRACE calls from core/rtw_ioctl_set.c
  staging: r8188eu: remove RT_TRACE calls from core/rtw_mlme.c
  staging: r8188eu: remove RT_TRACE calls from core/rtw_mlme_ext.c
  staging: r8188eu: remove RT_TRACE calls from core/rtw_mp.c
  staging: r8188eu: remove RT_TRACE calls from core/rtw_security.c
  staging: r8188eu: remove RT_TRACE calls from core/rtw_sta_mgt.c
  staging: r8188eu: remove RT_TRACE calls from core/rtw_xmit.c
  staging: r8188eu: remove RT_TRACE calls from core/rtw_recv.c
  staging: r8188eu: fix unused variable warnings in core/rtw_ieee80211.c
  staging: r8188eu: remove two set but unused variables in
    core/rtw_mp_ioctl.c

 drivers/staging/r8188eu/core/rtw_cmd.c        |  66 +-----
 drivers/staging/r8188eu/core/rtw_ieee80211.c  |   4 +-
 drivers/staging/r8188eu/core/rtw_ioctl_set.c  | 218 +-----------------
 drivers/staging/r8188eu/core/rtw_mlme.c       | 130 +----------
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  39 +---
 drivers/staging/r8188eu/core/rtw_mp.c         |  12 +-
 drivers/staging/r8188eu/core/rtw_mp_ioctl.c   |   6 +-
 drivers/staging/r8188eu/core/rtw_recv.c       | 161 +------------
 drivers/staging/r8188eu/core/rtw_security.c   |  44 +---
 drivers/staging/r8188eu/core/rtw_sta_mgt.c    |   8 -
 drivers/staging/r8188eu/core/rtw_xmit.c       |  83 +------
 drivers/staging/r8188eu/include/rtw_mlme.h    |   2 -
 .../staging/r8188eu/include/rtw_mlme_ext.h    |   4 +-
 13 files changed, 53 insertions(+), 724 deletions(-)

-- 
2.31.1

