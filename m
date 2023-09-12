Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8D933D2
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 19:28:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-401314e7838so18389765e9.1
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 12:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546880; x=1695151680; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ruTPSjX5I+z1vbTXALsdSF4OmeUSujoWTMjNVvMqPrw=;
        b=dkwABlMKfUbd1/K7Pu33k/YX0OVserfiqlMK+qMenXOgNJxpL87mJQCuJzGemR/a4g
         U3jbY4IR783viEoSokILIbjwL2eo+CsvRj6DUsjsCYg8yTf+JGkSyUqOTVhMGE7Xv8T8
         geCwIb3hO+vR6T+5/3xoUs0qQpENXqXi4EMsLye4r3CA3Nu9GftxrG+y5oQoqJcI1Jyx
         Q+fBwHK3xmvyAlRSFIlFW/yQGi7l9fYebad7xHSgtZ4bRvpzwFpdqswKUCs2Sq32Z7+U
         SwxMRtOM6RmeABCmn6KkRKvjuNQbEVGedMzA2XP3jRbYHbI+J9fVRPpUsXMBkocDbMLy
         ZAvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546880; x=1695151680;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ruTPSjX5I+z1vbTXALsdSF4OmeUSujoWTMjNVvMqPrw=;
        b=hfcg1vj0j7biBPokojOisyCmVQbFdlWy951Oc9yGQ8OjIVfAmFPvuuOPQ5U3P3yhIW
         5C8OUDA5XFLRvssaXukSJEUgqAEj9h6vU/vGJJDi7XtgRRok3lvg/ONMVeVrtVTtWA9D
         5YIKs1Of39frJAp6eg0R19BFAbKzZJOjgvFxjGB0brDvNRjJPbegHRmr80o1xqwcPbjO
         +A1bMVHluZEXG0pCA0mOc/u/fVS2XjH6uPPfOoinOYEe3N5Eamjwzgw65fhpx/AFwh0y
         +BI9V0jFD66a2d0A9/mafzd4pfVhJm6dyzqOMEYxF2kgcvdy6Z+tv/WgLwotzOkZLU4h
         +X4g==
X-Gm-Message-State: AOJu0YyvYd7uHV8o/DOsOjqsmFDEjTkN92NMI/soBMpLHRitKN3juDDL
	nPcdc68wMMWWtBeNiLx7L1I=
X-Google-Smtp-Source: AGHT+IGMK4b0WtqbjV1wbaE7LGmvJ9YiMhF6Ll1MmsFrSFl5QxYKlmXC/3efJ+R2kQ33d5ayKgxMGg==
X-Received: by 2002:a05:600c:3c8f:b0:401:faf5:85c3 with SMTP id bg15-20020a05600c3c8f00b00401faf585c3mr354591wmb.0.1694546879670;
        Tue, 12 Sep 2023 12:27:59 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id m24-20020a7bce18000000b003feee8d8011sm16859103wmc.41.2023.09.12.12.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:27:59 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:27:57 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] staging: rtl8192e: Use standard functions like
 ieee80211_is_beacon()
Message-ID: <cover.1694546300.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove useless equation in debug output.
Use standard functions like ieee80211_is_beacon().
Optimize code for improved readability.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

---
v1->v2: Only patch 4/8 was changed
        Take wrongly removed definition of fc back in.
        

Philipp Hortmann (8):
  staging: rtl8192e: Remove useless equation in debug output
  staging: rtl8192e: Use standard ieee80211 function in rtllib_rx_mgt()
  staging: rtl8192e: Use standard function in
    rtllib_process_probe_response()
  staging: rtl8192e: Use standard function in
    rtllib_rx_check_duplicate()
  staging: rtl8192e: Use standard function in softmac_mgmt_xmit()
  staging: rtl8192e: Replace rtl92e_disable_irq with rtl92e_irq_disable
  staging: rtl8192e: Replace rtl92e_enable_irq with rtl92e_irq_enable
  staging: rtl8192e: Remove rtllib_get_payload()

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  6 +--
 .../staging/rtl8192e/rtl8192e/r8192E_dev.h    |  2 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 18 -------
 drivers/staging/rtl8192e/rtllib.h             | 24 ---------
 drivers/staging/rtl8192e/rtllib_rx.c          | 53 ++++++-------------
 drivers/staging/rtl8192e/rtllib_softmac.c     | 11 +---
 6 files changed, 22 insertions(+), 92 deletions(-)

-- 
2.42.0

