Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF52D3FC7
	for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 19:09:30 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id u18so20152356wrg.5
        for <linux-staging@lists.linux.dev>; Thu, 23 Sep 2021 12:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khs6fyMWQQ2ulAhLlVxbV3Pe3yGuhZnnaZwYc/ZZ41I=;
        b=ptLs5wTlayLGzt7vfE5v+H/Cp2oicBwOLoaes5qC2z6n6riaDVI4A4R1yWMILkuIkN
         PBgW2uBu4YWVJr5qG1bgmTY37cXPwBqDGVh0P28PBhP2mnC5gb1iyvjWobnmlvVFrTiT
         OuI1WxpFQA4FhiAf9/DkFRkzAh/EQPyjO6bchrL42/tFFRoq13l7ZVN0bNCQoISRSmYg
         JzKvbzhIEv0j/+p/ERW2CZZZDxIxdorUBYk3oDZv0vTTctBjfgdUsbu7kh/zzrWnvHHZ
         FErXWrThMmlYl7fYc9f/FFCdkIwkWjZq26qKU9GzZurzWt3maECY+/8zwjKC9zOJfxs1
         KTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khs6fyMWQQ2ulAhLlVxbV3Pe3yGuhZnnaZwYc/ZZ41I=;
        b=8LDPgpF/LlFiJuXqzfJewpYNW87gOf0QidpREdRl4ZKOKgON9E5s6HPDvimIB0Qw2q
         kSMzv/0dPyEjnubt46ZvsMGPcljDd3dFMpsvlflJ8IdlXHBboyQ02h8/pTlZPTZmWZPe
         KbwzRrw8LqVLiJkNw4+5MagEx/xD/vVZMNSpgYzZwPDdWXYUD9x/U0T5hMsnOWCXN8/m
         JzOnXKpKbH8ix6Z6DU5t/txDptaNQ5++VDVvwYzWGqpEkDRziLwFRpC6Pld07XYoQ71z
         8ayt+o9p5feK2N4H6dOZi5bD5qtImIAtfhdqHroKhTUOiXKoVcrbOCilGZJ+K/NFtMCi
         r/nQ==
X-Gm-Message-State: AOAM5309LIziZXT+pALslQsAxdKkKQPxjSD6yTIlI9B/6l31yH13N79H
	VHx4EbZFmW9lzeJihBD0kjk=
X-Google-Smtp-Source: ABdhPJxwbuJQa39YsVtrGLZC5E/w0kMteeAGUzIj6NLPbxz14eOCmLDXV4Ld0TvVx4e7kUFT/p1bvg==
X-Received: by 2002:adf:f988:: with SMTP id f8mr7171708wrr.54.1632424169242;
        Thu, 23 Sep 2021 12:09:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cad])
        by smtp.gmail.com with ESMTPSA id e28sm6323591wrc.10.2021.09.23.12.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 12:09:28 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 00/17] staging: r8188eu: remove unused functions from rtw_cmd.c
Date: Thu, 23 Sep 2021 21:09:03 +0200
Message-Id: <20210923190920.3580-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes all unused functions from rtw_cmd.c.

Michael Straube (17):
  staging: r8188eu: remove rtw_cmd_clr_isr()
  staging: r8188eu: remove rtw_createbss_cmd_ex()
  staging: r8188eu: remove rtw_getbbreg_cmd()
  staging: r8188eu: remove rtw_getrfreg_cmd()
  staging: r8188eu: remove rtw_getrttbl_cmd()
  staging: r8188eu: remove rtw_led_blink_cmd()
  staging: r8188eu: remove rtw_readtssi_cmdrsp_callback()
  staging: r8188eu: remove rtw_set_ch_cmd()
  staging: r8188eu: remove rtw_set_csa_cmd()
  staging: r8188eu: remove rtw_setassocsta_cmd()
  staging: r8188eu: remove rtw_setbasicrate_cmd()
  staging: r8188eu: remove rtw_setbbreg_cmd()
  staging: r8188eu: remove rtw_setphy_cmd()
  staging: r8188eu: remove rtw_setrfreg_cmd()
  staging: r8188eu: remove rtw_setrttbl_cmd()
  staging: r8188eu: remove rtw_setstandby_cmd()
  staging: r8188eu: remove rtw_tdls_cmd()

 drivers/staging/r8188eu/core/rtw_cmd.c    | 500 ----------------------
 drivers/staging/r8188eu/include/rtw_cmd.h |  18 -
 2 files changed, 518 deletions(-)

-- 
2.33.0

