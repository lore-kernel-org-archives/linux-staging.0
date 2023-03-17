Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E003B79C5
	for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 19:13:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id h8so24217435ede.8
        for <linux-staging@lists.linux.dev>; Fri, 17 Mar 2023 12:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679080389; x=1681672389;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2ix8EQksndO3G3brsWn9BU0CTLTfP5xpCqjBQ9yJVdY=;
        b=B1mdA0JH64t5QhGvLvDrtnfJvORC9uLmdmydjnERPB7xs/U4pR5qHCv2POdBoVELqQ
         Rmvwfc+HMNJw3i6ZcKXYCwLv20uV0S4+Mhs9QQImCuKBoSDzterC23zFdp0UMgdt8YuP
         LRSVm/sJreoDtM+sZx/JLygJoBWXVEelLsWDXC65apndx1Lo3mrq+/Tedr0yK/Bkpsfh
         d90yIgqb6X6IdDuZtn8ljO4Kh1BX1cqLsPRHuU2VStLV6LKJfgFfLpHftzyalVe4ZLBR
         jpT6s1Xi/Su58ToooUITzmgpbkJemAfq/EX5ZDu6SlWO3i4OX6qo+Ebqz9vLnbwjTx4/
         sNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679080389; x=1681672389;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ix8EQksndO3G3brsWn9BU0CTLTfP5xpCqjBQ9yJVdY=;
        b=Ig9/7PBEl3vsAmO1poqibyLqyh5pEjxvfuDZUCbRxeFLi9YnneeNBWO3A9YVs7jJeB
         cv1At76y2l8YfhnaIuzgqoI8mDh1DAUXBguRsmZjy6IEs8WpqeH6MHvTO2WwjPB4UhfR
         RDAUT1Vw/54TNDoHOkFucQPMRZab8N0cW2MwVMKW/iSi2wJ9AIy9k39Y74id8fTPQVLu
         cPf7oklAKKp1X4RDA7DqBj4Lk1ZOZSN78r/cYBQgboEs66m0Bd4kuAMK/dzqpxF/ZhqS
         iJxAZVICm+SxEbuoR7+SqPxq+GD3BtclHqNAJvddjeztZYJuI/iZpUfKz5gNwxn+AagL
         b1Cw==
X-Gm-Message-State: AO0yUKV0OQ1r2aPxHL698orVdwp4FygR4vGjl4megQijQ/MqXAA4bVTL
	hE1Pn+aDtCRTQQbySGWe4bU=
X-Google-Smtp-Source: AK7set+gWa5eeFkY2zUcgbbRx6eYyuas/RIcin5VhhKog9qGovRvXaqosB6h8Slx/lPp184235v+6w==
X-Received: by 2002:a17:906:213:b0:931:5145:c51f with SMTP id 19-20020a170906021300b009315145c51fmr4772714ejd.4.1679080389158;
        Fri, 17 Mar 2023 12:13:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id k19-20020a1709063fd300b00928de86245fsm1276913ejj.135.2023.03.17.12.13.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 12:13:08 -0700 (PDT)
Date: Fri, 17 Mar 2023 20:13:06 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] staging: rtl8192e: Replace macros in r8192E_phy.h
Message-ID: <cover.1679077522.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variable or macro or replace custom macro with standard
kernel macro or function.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (9):
  staging: rtl8192e: Remove unused variable rtl819XAGCTAB_Array
  staging: rtl8192e: Remove double defined constants bMaskBytex and
    bMask..
  staging: rtl8192e: Replace macro skb_tail_pointer_rsl with standard f.
  staging: rtl8192e: Remove unused macro queue_delayed_work_rsl and
    queu..
  staging: rtl8192e: Replace macro INIT_DELAYED_WORK_RSL with standard
    m.
  staging: rtl8192e: Replace macro INIT_WORK_RSL with standard macro
  staging: rtl8192e: Replace macro container_of_work_rsl with standard
    f.
  staging: rtl8192e: Replace macro iwe_stream_add_event_rsl with
    standard f.
  staging: rtl8192e: Replace macro iwe_stream_add_point_rsl with
    standard f.

 .../staging/rtl8192e/rtl8192e/r8192E_phy.h    | 10 -----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 38 +++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    |  3 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c    |  3 +-
 drivers/staging/rtl8192e/rtllib.h             | 15 -------
 drivers/staging/rtl8192e/rtllib_softmac.c     | 23 ++++------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  3 +-
 drivers/staging/rtl8192e/rtllib_wx.c          | 42 +++++++------------
 8 files changed, 41 insertions(+), 96 deletions(-)

-- 
2.39.2

