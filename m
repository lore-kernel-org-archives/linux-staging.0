Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C477EE
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="OYX51HYG"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-35d725ac060so9717815ab.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296785; x=1703901585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ctlNalyuZXM7QXcaBDfVpD88vAj0W7y83ft+PwjwWck=;
        b=OYX51HYG+3RUOykBaXLWlGkHQBwu1YP196YtTwHKL2qh8qNEEjbKO1H/UC0tV/lViv
         w7mkDNNIzqxTHpLMcC2SPpJTgXvP2nkqHOs1xCZknRcdwlc3zZ98Mm/Tp51waG70Qm3i
         Jk9PwnkSHMSLQHaz8z18l4eWVwcezyDvQP3/N8qUR36XXHWDso0TSVnMsNjAeKnKFxrU
         ibmK5Z3El4X39HTwPRbgAd7QXbr/XZWrFsadk7YSH8dmtzRmNeMtLdTCG/ufy4CtTYpF
         N1IlWM7ovpLyoUugb4umTDHTNhex/9sOiP8AXpgjDBHzyg72riSPQ0z0TjTiejIgW0xg
         cNYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296785; x=1703901585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctlNalyuZXM7QXcaBDfVpD88vAj0W7y83ft+PwjwWck=;
        b=FHcSkm7taYu8ti/kQmvsoNPFoKNKHhvshI+ybxuAX89axDpzXTcTSC9yJoa6xuVsFi
         HeWFUyKQQJFG6iR7e6D4SpAkP8hqtIr1hyHRoXnR4VzXQ+6IdBoGzQE/lTycFa1ndqLa
         gTkntsVN/eMlohTIna27l4V2CJTzSxwEJJTDyl8sDg0FIEzi1VO4fLG8YQmey2qBc78j
         LAtXbxcpsJkuzsAdHsiRxeAjrbhCk831BvZ2s3uViy+Dy/hA61WJ1IlHLOjQb5obqKCN
         ff6foLqRV/223+msyD9GDbxn9ZvkhvHNpXwcKt0DCybqCqZH7OGKYez6v3SD4jBcXwb1
         vBwQ==
X-Gm-Message-State: AOJu0Yx76lcZjmLEGomKOYC7JSCwEVfTeqjwGr+lHDGqtxyUWFgLa+gx
	IjnyCjycVuzVNbFLrFdshUPkDWRFBmHrYg==
X-Google-Smtp-Source: AGHT+IF5iZbH+XBKyq6KWJhJMJ6yH+JHGBoWYXlam+kXP2sbUznmPLw6x/MoYYUYHORJ9LOwfLUcRg==
X-Received: by 2002:a05:6e02:17cc:b0:35f:e2e3:803d with SMTP id z12-20020a056e0217cc00b0035fe2e3803dmr2117785ilu.2.1703296785388;
        Fri, 22 Dec 2023 17:59:45 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:45 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 00/20] Staging: rtl8192e: Various checkpatch fixes related to rtllib_softmac.c 
Date: Fri, 22 Dec 2023 17:59:22 -0800
Message-Id: <20231223015942.418263-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes various small checkpatch warnings and checks.
Thank you in advance to reviewers.
regards,
Tree 

Tree Davies (20):
  Staging: rtl8192e: Remove unnecessary braces from
    MgntQuery_MgntFrameTxRate()
  Staging: rtl8192e: Remove unnecessary parenthesis in
    rtllib_softmac_new_net()
  Staging: rtl8192e: Remove unnecessary parenthesis in
    rtllib_association_req()
  Staging: rtl8192e: Remove unnecessary parenthesis in
    rtllib_rx_assoc_resp()
  Staging: rtl8192e: Remove unnecessary parenthesis in
    rtllib_ap_sec_type()
  Staging: rtl8192e: Remove unnecessary parenthesis in
    rtllib_association_req()
  Staging: rtl8192e: Fixup multiple assinment in init_mgmt_queue()
  Staging: rtl8192e: Fix statement broken across 2 lines in
    rtllib_rx_assoc_resp()
  Staging: rtl8192e: Fix function definition broken across multiple
    lines
  Staging: rtl8192e: Fixup statement broken across 2 lines in
    rtllib_softmac_xmit()
  Staging: rtl8192e: Fixup statement broken across 2 lines in
    rtllib_softmac_new_net()
  Staging: rtl8192e: Rename function rtllib_MFIE_Brate()
  Staging: rtl8192e: Rename function rtllib_MFIE_Grate()
  Staging: rtl8192e: Rename function rtllib_WMM_Info()
  Staging: rtl8192e: Rename function rtllib_TURBO_Info()
  Staging: rtl8192e: Rename variable QueryRate
  Staging: rtl8192e: Rename variable BasicRate
  Staging: rtl8192e: Rename variable skb_waitQ
  Staging: rtl8192e: Rename variable bInitState
  Staging: rtl8192e: Rename function rtllib_DisableNetMonitorMode()

 .../staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c |  4 +-
 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  6 +-
 drivers/staging/rtl8192e/rtllib.h             |  6 +-
 drivers/staging/rtl8192e/rtllib_softmac.c     | 90 +++++++++----------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c  |  2 +-
 6 files changed, 52 insertions(+), 58 deletions(-)

-- 
2.39.2

