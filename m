Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06229CA
	for <linux-staging@lists.linux.dev>; Sun,  9 Jan 2022 21:54:31 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s1so23278391wra.6
        for <linux-staging@lists.linux.dev>; Sun, 09 Jan 2022 13:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p59DSvWE9IMx8qmJZqkeAExPWC4n0KTZsniTKDZX1oc=;
        b=kLufeGGzoXH7blj6kIRfzTwYoOWF4rzNY/xapzgzTUSCKXqtgv+B+4hwwSRGZ5fM5I
         HV4bnpP5WRjZDFbx9xNeZz6x0srLVA91F9azQj8yJTj/vR5jEVBCLS0iVPqKEwCd/4xh
         6CD9BsEsvI5VLGNhXkB8g2tLa4NfU991XtVfBcQ/i84W9xsf7zCr4HzuiapJzrJ9nmXF
         X/FVAdj7atm1b7xrFT0Xvu3jFYgsGM6wJEeMO2o4JS0mdWJHUHDxTqpN/PeikmlUCCFz
         F97ay8OpfbLBPKGAjH/Qdl0U1/3Tsn5AnXNv9rvTBOm6sBwZWu6smEvDVpB2+LpXpH89
         CmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p59DSvWE9IMx8qmJZqkeAExPWC4n0KTZsniTKDZX1oc=;
        b=o60h41Wu92IafV67BayFmQzT4Pt3/7U8ORO6mU+dxTloo0suqQV5sPpp877iQshAhy
         4BFiseqWXgRhzyh/PbNRRj/WRJJyFyfUKihV170YMcGfcHGrMbJNjAVZJnoTJaEHRMT7
         vNCWNlRP5QxBWVRpsNNwWPqOFWVWvynLwW0D//VOa6YLVj28dtBQ5MHHVE+kCthv2wLr
         +myEHwUJ88Dr0aMX502FslWCvHcXDXvuRr6Ormu46YX9ub9RPCqxxfKEG9N5IItaqzwL
         jCLWXi+V66zbLdinedHWFPvl8Gp+kTVkGTxFldA9QCw80Acz33AHsYTD0FKdU19zMbeL
         oLWA==
X-Gm-Message-State: AOAM533PxLpv7/9WjGo/ZiRTyW30ABvRkaeWqpmLUmbfF6ZPUDmrm6YB
	CGMUfxnp3BKOHiQCOsHDROlT+w==
X-Google-Smtp-Source: ABdhPJy0Q+lQQBSx72VEsVvHyWYq9bvuUcUPot9tx4YSqIjvTvvSzmQpx2HDXDT7x0kKHTGsuluJpA==
X-Received: by 2002:a5d:610c:: with SMTP id v12mr62061841wrt.410.1641765269719;
        Sun, 09 Jan 2022 13:54:29 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id r13sm5065650wmq.28.2022.01.09.13.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 13:54:29 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] staging: r8188eu: further per-file DBG_88E cleanups
Date: Sun,  9 Jan 2022 21:54:20 +0000
Message-Id: <20220109215427.887-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series has more conversions/deletions of DBG_88E macro calls,
per-file, as I've continued to chip away at them. This converts almost
200 calls to standard kernel macros/functions such as netdev_dbg and
pr_debug as appropriate. It also deletes several calls which simply
aren't necessary.

Phillip Potter (7):
  staging: r8188eu: convert DBG_88E calls in core/rtw_ieee80211.c
  staging: r8188eu: convert DBG_88E calls in core/rtw_xmit.c
  staging: r8188eu: convert DBG_88E calls in core/rtw_iol.c
  staging: r8188eu: convert DBG_88E calls in core/rtw_mlme.c
  staging: r8188eu: convert DBG_88E calls in core/rtw_ioctl_set.c
  staging: r8188eu: convert DBG_88E calls in core/rtw_mlme_ext.c
  staging: r8188eu: convert DBG_88E calls in core/rtw_sta_mgt.c

 drivers/staging/r8188eu/core/rtw_ieee80211.c |  36 +-
 drivers/staging/r8188eu/core/rtw_ioctl_set.c |  10 +-
 drivers/staging/r8188eu/core/rtw_iol.c       |  10 +-
 drivers/staging/r8188eu/core/rtw_mlme.c      |  95 +++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  | 427 +++++++++++--------
 drivers/staging/r8188eu/core/rtw_sta_mgt.c   |   4 +-
 drivers/staging/r8188eu/core/rtw_xmit.c      |  30 +-
 7 files changed, 344 insertions(+), 268 deletions(-)

-- 
2.33.1

