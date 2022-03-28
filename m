Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0620435A
	for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 11:39:51 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id lr4so19615251ejb.11
        for <linux-staging@lists.linux.dev>; Mon, 28 Mar 2022 04:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qbZlyK41top+fUFxaArbnfsAsaJyOPV3CRdd0agBOs=;
        b=eiav2mIIB10KaNLFSu2fH/zVh1VhcZp/GYAuzUkyCYBXYMisjBWmSh70c2CNQ3Ng44
         F42KDPdbDtkeKXVs6reqLAEGIu4nn6yiS0hEImIWzXsKs2D9ePOqpjmZm9eJPvIjuvUg
         oaPFnkWdkO5Usm6odR0NbSgn16QIpAXFx8WGlh2fVfPn9AIprAblqlbai2REppcFCfVZ
         2Ah+xvvXnPKkTJZ9PjMqgpQZ3kjcK7GIcXYCCgoN7lCftwFo3kzrM/qTt0hvBakW6Vax
         NP7zSqWYvpBP5iIaTZD0RjO1vWO9hK+KJ1q+xvNYBdbNqZj+tTHM4UC9UuxW/PIrfcYt
         LlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2qbZlyK41top+fUFxaArbnfsAsaJyOPV3CRdd0agBOs=;
        b=XuVvXPagYWuyuJV+3Djgu2glRvUsRAsKoa4xPbzvpQI1stqbEuVyKbVFC5vu2hLqLY
         hHPZkejgtoqTIAvF82kMpGIdqyFob/v8h0kpjPCSnaOdH1mkrgwRvMbU17l6WROuzAn1
         37ofWpzRCIltQmqms0zvWQYq25A7yuYdzX1ks451rUcbw76U4S9v69HUW8w8oYLUaM/S
         l92Ttf2CX9jAJKpV6jbfoKdv1oFS52yyzIngl5roYB1ceAUf8axMeEH6p/HCsGC5BTkU
         mk4VZN6hp/NWCzu3DFxZy1JsrQ/iOynjDh/tGSlIfUL3ZxFBVhp0qWnyOaRSxn/Dwr9v
         1Qmw==
X-Gm-Message-State: AOAM530gvqoaM3KzYoW6nUBk8uNcyIttX4V81pJJc8Tj9D6WSBWddX9I
	MPRni+MWyJab21vJruWK5+I=
X-Google-Smtp-Source: ABdhPJzJz42IY+2x7DyRmSbgEb2NLTDjQIn7jkFcMRAFbG0Iemn3uf6JdQTV4qH/pOdp3qCgfwX8+w==
X-Received: by 2002:a17:907:1c89:b0:6e0:cc9:345a with SMTP id nb9-20020a1709071c8900b006e00cc9345amr27563502ejc.332.1648467590086;
        Mon, 28 Mar 2022 04:39:50 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id hq39-20020a1709073f2700b006dfc58efab9sm5938556ejc.73.2022.03.28.04.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 04:39:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/9] staging: r8188eu: SetHwReg8188EU() cleanups
Date: Mon, 28 Mar 2022 13:39:31 +0200
Message-Id: <20220328113940.6396-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes some cases from the function SetHwReg8188EU()
and moves the functionality to the callers. This is part of the
ongoing effort to get rid of the unwanted hal layer.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (9):
  staging: r8188eu: remove HW_VAR_RESP_SIFS from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_MLME_DISCONNECT from SetHwReg8188EU()
  staging: r8188eu: rename some macros to upper case
  staging: r8188eu: remove HW_VAR_ACM_CTRL from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_RXDMA_AGG_PG_TH from SetHwReg8188EU()
  staging: r8188eu: remove unnecessary if statement
  staging: r8188eu: simplify if-else statement
  staging: r8188eu: remove HW_VAR_TX_RPT_MAX_MACID from SetHwReg8188EU()
  staging: r8188eu: remove HW_VAR_BCN_VALID from SetHwReg8188EU()

 drivers/staging/r8188eu/core/rtw_mlme.c       | 22 +++----
 drivers/staging/r8188eu/core/rtw_mlme_ext.c   | 27 ++++++--
 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 38 ++++++++---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c    | 12 ++--
 drivers/staging/r8188eu/hal/usb_halinit.c     | 63 -------------------
 drivers/staging/r8188eu/include/hal_intf.h    |  5 --
 .../staging/r8188eu/include/rtl8188e_spec.h   | 10 +--
 7 files changed, 73 insertions(+), 104 deletions(-)

-- 
2.35.1

