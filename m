Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607AC3FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:57:57 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id y198-20020a1c7dcf000000b0030b69a49fe9so412887wmc.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZoNFXCBufWtJhOJmpIuy1h9miKEbhcOw8w1A9DjaL6U=;
        b=E34AJvo20m2f7HY596GaIhoE+Bei6vl2fk/zOr2cjfjBn0e1lI3boKUnXDrJNWweNb
         VTiwEQrZWfmVD1TpMyo4mVg137P0JXgVjFk/Skmz+CSZ3JeFe7wccoZDasDFRcorPfYw
         jT31Qp/yjB0k4kxCp3War871sfM5ehu8LYM+zyI6NhaWLXpRXyYnOrXfRRqtItzYnbnE
         8pva2HPI9CzrKZ0akR9FDTkIYE8DsVxfIuigvTy12s/Gb3sqCPfv9a24jbDcUME1GoQr
         trieBS5IcsNz6uA6yAmdvS4gzkMHW9+W05qPt+GZe4xKhJWKGGquNTTPswGsM6QWv7mT
         rRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZoNFXCBufWtJhOJmpIuy1h9miKEbhcOw8w1A9DjaL6U=;
        b=F9b2bcrqum4Fydzs1jxzeoNlejea7oIAYwSFLio77U6v5G2MIWFnDjXCb8UAdZsO82
         c2zoJKxWXAgptFFf/BlgHE+TUffa4QN/kWbnrxdIqjINZMyP6YFzFPJQHe8hjcODVmGF
         NeQSgJOwFNZE5Fb/uTG0u7bNholvSpctTTLnMbTcK7NbDKOiNXmW2rv377NGMAd2VnxY
         SZqzzizTrZ+Bh1L/RwyVSZUkj07jgoeh4jBykvhAmaaN7rvfEG39vYMpw3AgazDlSwZd
         q0ZOu6GAQi+vN8CMwTR1z20YsH4ZcNguPrUVXCHkB1IR+0XVTcMPyT9f7BqNlgc7d0M/
         2KyA==
X-Gm-Message-State: AOAM5311uOncKzvgE/W2rkHIzkwO/VrbcSxo0UTyWJlXQiMeq9evkL8j
	ccu3UFoDyRBYrSDiaeWszDA=
X-Google-Smtp-Source: ABdhPJxTz9nVaELkeHHe9Y0eNM7B557GRqoGCrddHd0uI9DYiwed58eUX602taYk1M02URXMnq6r+Q==
X-Received: by 2002:a1c:751a:: with SMTP id o26mr15181235wmc.94.1631959075819;
        Sat, 18 Sep 2021 02:57:55 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id o26sm13013287wmc.17.2021.09.18.02.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:57:55 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/8] staging: r8188eu: remove unused code
Date: Sat, 18 Sep 2021 11:57:19 +0200
Message-Id: <20210918095727.13591-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some unused functions and the unused struct
rf_shadow.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (8):
  staging: r8188eu: remove odm_ConfigRF_RadioB_8188E()
  staging: r8188eu: remove ODM_DIG_LowerBound_88E()
  staging: r8188eu: remove rtl8188e_RF_ChangeTxPath()
  staging: r8188eu: remove unused struct rf_shadow
  staging: r8188eu: remove HalDetectPwrDownMode88E()
  staging: r8188eu: remove rtw_IOL_cmd_tx_pkt_buf_dump()
  staging: r8188eu: remove rtl8188e_set_rssi_cmd()
  staging: r8188eu: remove EFUSE_Read1Byte()

 drivers/staging/r8188eu/core/rtw_efuse.c      | 58 -------------------
 drivers/staging/r8188eu/hal/odm_RTL8188E.c    |  9 ---
 .../staging/r8188eu/hal/odm_RegConfig8188E.c  |  8 ---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    | 15 -----
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 51 ----------------
 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c | 43 --------------
 .../staging/r8188eu/include/odm_RTL8188E.h    |  2 -
 .../r8188eu/include/odm_RegConfig8188E.h      |  3 -
 .../staging/r8188eu/include/rtl8188e_cmd.h    |  1 -
 .../staging/r8188eu/include/rtl8188e_hal.h    |  3 -
 drivers/staging/r8188eu/include/rtl8188e_rf.h |  1 -
 drivers/staging/r8188eu/include/rtw_efuse.h   |  1 -
 12 files changed, 195 deletions(-)

-- 
2.33.0

