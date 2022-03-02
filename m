Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DFF33CB
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:03 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id gj15-20020a17090b108f00b001bef86c67c1so2762836pjb.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eoKQqCbI8PxL6l9piEDwf9eS8EFbrh6cCOCe/ltlwc4=;
        b=ASeGJrfLRf/uRKaUvdh8TJg8raWbVzeyEUkn4pekIqzqxSAXb/GNo5doCQv013EQiA
         Wd3ZjFZ5fKmPdd5sr8m8IUU3yWd2ci13b9omZL6ugqsdjz97AHAD+lEp/UQeddhywZmp
         yR1CPpQXKzLYxO6zdAag+spSYMLJvZg8ecQtTUqk2/3ceIwdIwkkL2EBY1WePGmd37hP
         KxKM/wxUY80ySGPxgYxPDoadheG92qG0iunt/EUR3oUNpQHFTJBVksuj0XgmxkuAuOYA
         Gi91nHAtBmtvVOgR+j/zFsmoRcQcEsou4GfrSSytvOY6/N3d1Pz4Vy940W9bCYc7lI0x
         yeBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eoKQqCbI8PxL6l9piEDwf9eS8EFbrh6cCOCe/ltlwc4=;
        b=woQsOwO9KpjcvKLBMzPd9IBWMHtp2XDOGJJXkDQF2Kw0wEERc+bHm2wXlPuwps1ESu
         AMyK1BaGOm5kxXO0PMDLICHVnPBtfm5Oo3Urerr25PbI1XKvH0ywkUB6eqL1fkeUNhQP
         r7G6b1NQyBKFGI31h2zzB7pIQFBR2SK5q/ezqmemUzjGB93kCCai2WDDz/XybLcrTj6+
         2Yp6qkcVvzhGQwDMEWnS1QIxkRn46qtgWi6rlgfBFqE6j7rr3PObf9Rp+kpt7NxNKfUC
         EOfDnQnnowENlpFngvXXPhMTS26wQ8ZvEQXi3+kc3LNyQdqIR4G6bzvIlvUWlVqT5FzD
         AerA==
X-Gm-Message-State: AOAM530Af6R5r1vf2bCH/PHb0Tx6weDgTSyiWekBQGvNzWAcs3jBvwy2
	QyNe2ONTJapFyp2TYFyz6joGSA+R80dD2Q==
X-Google-Smtp-Source: ABdhPJwc8llIZdxMOho86N5zl7n2dsqX/toWP1I4HBVNCQHLPvrwfS5Xz8R4VJlL5puQky/fDmxwMg==
X-Received: by 2002:a17:903:2284:b0:151:9670:9012 with SMTP id b4-20020a170903228400b0015196709012mr5002543plh.110.1646254083196;
        Wed, 02 Mar 2022 12:48:03 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:02 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 00/16] staging: r8188eu: convert functions to return bool
Date: Thu,  3 Mar 2022 02:17:21 +0530
Message-Id: <20220302204737.49056-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are many functions which return true/false but are marked as int, 
uint, s32 etc. Mark them as bool.

Vihas Makwana (16):
  staging: r8188eu: mark rtw_is_cckrates_included as bool
  staging: r8188eu: mark rtw_is_cckratesonly_included as bool
  staging: r8188eu: mark rtw_is_desired_network as bool
  staging: r8188eu: mark PS_RDY_CHECK as bool
  staging: r8188eu: mark check_indicate_seq as bool
  staging: r8188eu: mark enqueue_reorder_recvframe as bool
  staging: r8188eu: mark recv_indicatepkts_in_order as bool
  staging: r8188eu: mark cckrates_included as bool
  staging: r8188eu: mark cckratesonly_included as bool
  staging: r8188eu: mark is_basicrate as bool
  staging: r8188eu: mark is_ap_in_tkip as bool
  staging: r8188eu: mark rtl8188eu_xmitframe_complete as bool
  staging: r8188eu: mark check_fwstate as bool
  staging: r8188eu: mark IS_MCAST as bool
  staging: r8188eu: mark IsFrameTypeCtrl as bool
  staging: r8188eu: mark rtw_endofpktfile as bool

 drivers/staging/r8188eu/core/rtw_ieee80211.c    | 4 ++--
 drivers/staging/r8188eu/core/rtw_mlme.c         | 2 +-
 drivers/staging/r8188eu/core/rtw_pwrctrl.c      | 2 +-
 drivers/staging/r8188eu/core/rtw_recv.c         | 7 +++----
 drivers/staging/r8188eu/core/rtw_wlan_util.c    | 8 ++++----
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c    | 2 +-
 drivers/staging/r8188eu/include/ieee80211.h     | 4 ++--
 drivers/staging/r8188eu/include/rtl8188e_xmit.h | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme.h      | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h  | 6 +++---
 drivers/staging/r8188eu/include/wifi.h          | 4 ++--
 drivers/staging/r8188eu/include/xmit_osdep.h    | 2 +-
 drivers/staging/r8188eu/os_dep/xmit_linux.c     | 2 +-
 13 files changed, 23 insertions(+), 24 deletions(-)

-- 
2.30.2

