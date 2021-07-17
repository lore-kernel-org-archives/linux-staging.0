Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F4272
	for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 14:56:55 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id l7so15516484wrv.7
        for <linux-staging@lists.linux.dev>; Sat, 17 Jul 2021 07:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3rld2y4g3oKdC1plK0u/GeRkKkJxxY7jgCFCd5QmmiI=;
        b=dEnJvbFyIWpioDrk7Cjp9ER9a8Wty7gUM8B2lyId6bjBkwevFBYKNS8t/I3AyY8Qdx
         AFHUpyQE1xBRyRxhbCe61oDMmU960OvAjJeyEgSwk9T5gk/5i74BixC7+sqHOM4N8yDJ
         BueZNOAwv0TBd5ReCzJ89I+7YciplQKgi2+prRpUcFjk8DFrNNh29nEoq4RU/8OsmSlv
         yqrhIBuVYlghbocwqMboTAPrGZmilWfy10tpQ0osTY1JLZ3FpoBEZkFp4kEc798SD0Is
         5XH4z4IPiFh7TYt4Kzj9+BD7Zpdt6umQzL3CbQ7Q/oKdBCbfUekHAYCmF1z9SDWO4+Ww
         rDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3rld2y4g3oKdC1plK0u/GeRkKkJxxY7jgCFCd5QmmiI=;
        b=QIQKIL45rhzd0tIyoOPGnxP+weOyDGXAJAadz6C3Fu0FNn1KFM+Q+9Dc9M4OUnctR2
         9yYWnsu9IaxT8I6aEw+tRe3cXgYTa9QQN0XwPy0yVYupkfrUfO1LakjErnPX4zBgKxy9
         m5gJiiMKBLESiBJQCPyGBuk8FS6Chgw1BAsDRK+OgfYMRj7HGCNlVP56gQzITuDXeh7i
         oXwTHcCrGhK7JGyTc2k8FIi9tjZYyKqBp5fe3+A3ix1TD4kQNYmZ2cErHz74y6mjkBdQ
         jCi6nDUloSvfErjwjQBbJ6Pm6WgKE6kUi8I4TOR+kloKelnVFqyN/6h/0bcLIZkHNfm5
         DTsg==
X-Gm-Message-State: AOAM531NV2EBluYfJv/M1dxwggs+bo2gGZfZsjb3CK8UNqf+imuBE/kK
	d8CLLEC3aWfx5DP4i9uqltE=
X-Google-Smtp-Source: ABdhPJzoqAlgjnQd8+QeC7of1G75LpwzUvcEEOTR2mAdDmt84TAKR4/DvNxjz4qBOCh0NAv0qG6lUw==
X-Received: by 2002:a5d:434e:: with SMTP id u14mr3802047wrr.378.1626533813549;
        Sat, 17 Jul 2021 07:56:53 -0700 (PDT)
Received: from agape ([5.171.72.101])
        by smtp.gmail.com with ESMTPSA id a207sm16851597wme.27.2021.07.17.07.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 07:56:53 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/10] staging: rtl8723bs: add get_channel implementation
Date: Sat, 17 Jul 2021 16:56:41 +0200
Message-Id: <cover.1626533647.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset adds cfg80211 get_channel implementation.
One of the benefits is having displayed channel info
in iw dev output.

Done some code cleaning as well.

Tested-on: Lenovo Ideapad MiiX-300-10IBY

Fabio Aiuto (10):
  staging: rtl8723bs: add get_channel cfg80211 implementation
  staging: rtl8723bs: convert IsSupportedHT to snake_case
  staging: rtl8723bs: fix camel case issue
  staging: rtl8723bs: fix camel case name in macro IsLegacyOnly()
  staging: rtl8723bs: fix camel case in argument of macro is_legacy_only
  staging: rtl8723bs: fix camel case name in macro IsSupported24G
  staging: rtl8723bs: fix post-commit camel case issues
  staging: rtl8723bs: remove unused macros in include/ieee80211.h
  staging: rtl8723bs: fix camel case name in macro IsSupportedTxCCK
  staging: rtl8723bs: fix camel case argument name in macro
    is_supported_tx_cck

 drivers/staging/rtl8723bs/core/rtw_ap.c       |  2 +-
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 .../staging/rtl8723bs/core/rtw_wlan_util.c    |  4 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c    |  2 +-
 drivers/staging/rtl8723bs/hal/hal_com.c       |  4 +-
 drivers/staging/rtl8723bs/include/ieee80211.h | 16 ++----
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 53 ++++++++++++++++++-
 8 files changed, 64 insertions(+), 21 deletions(-)

-- 
2.20.1

