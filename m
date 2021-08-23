Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6C73FC0
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:02:21 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id u1so10387125wmm.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 05:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jNvlRovpXI4/yiNj+yBTSjAklyY67wlpFcUrW0vobjc=;
        b=Vh06A6X5BK6nsBWLgxiHTpAsx9IoANP2InVt0EtRgxnp+ye2/2tx31hVUBLqkRiiVS
         SWvCjHVzEa9XVe/yrnFAI0SM9f35F0RPo8AKjHsWfo3WnixOvg0d3kE273ATkDc0xCDq
         vxRCE06728IztBn72xkjOWX+L8Qw3J9NWPo00pqqkGvVntQeKdbGJvKlGSFvmcn2L4k9
         hK7p/DZVZ6pvXfLXKedq60hugd/oBccJ0v3msLfdWZTde8vsieN3DjrVKP4+jDVbZst9
         tBof1h1/C1qGu83n4j6vv15cJMEOR3UrZCwFCHOisNZw1Jh7ebzyv3xpAFPxWuuRGB0z
         yUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jNvlRovpXI4/yiNj+yBTSjAklyY67wlpFcUrW0vobjc=;
        b=rsp3kFqmV/IIL171MWQzL55W2xY524iznTtJoIv9fR3CH8klGlL+p5bykiBzIU+wpx
         Sd18Acbs8tG0pzzBnaukgo37W/aGykpE0+26W4GbKjfE18Tl6Uy2VIGj3wFw5H7JMtyA
         qnBrcbJpvjzeOobmmVybMyFptYfiLNN2ETvGN9yPt8Yg91vJ8tqR96uLlrn5TS2muzj2
         4wChE6moyyi7XfDIfV8DKnET+o/gBIu99AZobqKTxmB2VJQUhHadskG8jelOGTUtAZ8s
         a8lhoLVWq17xZJqv+Ul2TNWMe7Fk8FEb4Jpbsiwh9T3nTJa34ewphMfelSV+UmAFMsw1
         UVsw==
X-Gm-Message-State: AOAM530XRE02nsQc8hujadGX6M3nz1c4688Z2WStKJWP9lrDUMOxyIYC
	aexM3/DczMdjy8ZpmXrxuD4=
X-Google-Smtp-Source: ABdhPJw1U3bhnDR4DGHufWdD9asrsVTC+iE0x9DW5K9NvXGKRdk1n131old9+dXDhMOh83w7OK9eRQ==
X-Received: by 2002:a1c:f706:: with SMTP id v6mr12328443wmh.167.1629720139764;
        Mon, 23 Aug 2021 05:02:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id g5sm901332wrq.80.2021.08.23.05.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:02:19 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/8] staging: r8188eu: use is_multicast_ether_addr instead of IS_MCAST
Date: Mon, 23 Aug 2021 14:00:58 +0200
Message-Id: <20210823120106.9633-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series replaces most uses of the custom IS_MCAST macro with
is_multicast_ether_addr. The goal is to get rid of IS_MCAST.
There is only one usage left in rtw_sta_mgt.c, but that one needs
more effort to verify that the buffers are properly aligned, so I
left it as is for now.

Michael Straube (8):
  staging: r8188eu: ensure proper alignment for eth address buffers
  staging: r8188eu: use is_multicast_ether_addr in core/rtw_mlme.c
  staging: r8188eu: use is_multicast_ether_addr in core/rtw_mp.c
  staging: r8188eu: use is_multicast_ether_addr in core/rtw_recv.c
  staging: r8188eu: use is_multicast_ether_addr in core/rtw_security.c
  staging: r8188eu: use is_multicast_ether_addr in core/rtw_xmit.c
  staging: r8188eu: use is_multicast_ether_addr in hal/rtl8188eu_xmit.c
  staging: r8188eu: use is_multicast_ether_addr in os_dep/recv_linux.c

 drivers/staging/r8188eu/core/rtw_mlme.c      |  4 ++--
 drivers/staging/r8188eu/core/rtw_mp.c        |  4 ++--
 drivers/staging/r8188eu/core/rtw_recv.c      | 20 ++++++++++----------
 drivers/staging/r8188eu/core/rtw_security.c  |  8 ++++----
 drivers/staging/r8188eu/core/rtw_xmit.c      | 15 ++++++---------
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c |  3 +--
 drivers/staging/r8188eu/include/rtw_recv.h   | 10 +++++-----
 drivers/staging/r8188eu/include/rtw_xmit.h   |  8 ++++----
 drivers/staging/r8188eu/os_dep/recv_linux.c  |  2 +-
 9 files changed, 35 insertions(+), 39 deletions(-)

-- 
2.32.0

