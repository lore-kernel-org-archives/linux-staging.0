Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB6173
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 09:00:23 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t28so18573579wrb.4
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 01:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2aJrQvaucM3vbI19RzhFuKD4Vi8PiNlReESprnBZDTQ=;
        b=LXT7PgxzvRrrSXLL23VkVRAbW45cusxk08YzR0/zC6bJS86LjyjNliiyoUbLG3whyy
         JimGJmKuDCgandbtTmgQG6pj2KW8m6MZb5KBWkfnxQtpciIU9SeQZ7i6a+F9Two4xtFV
         SXNNEFiHvxQrIi0s410UF6mZ+3AyM1nPp3ZBE4MXR3UHUiODZ38FyIi2IABZoThs9WRh
         GWfMFJmf9JCK18UG/bAGi/myDduEYyehr8yvQW9hGT+CGWUrcKqJ3lwhBIcjJ+E4QVY4
         +wWdsl9eNT50zPZOsvDoMOO7+Sft4Uc/EvyA1hDuCaThYBO8itRBuWPqe+kvqaNtl9Z7
         lLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2aJrQvaucM3vbI19RzhFuKD4Vi8PiNlReESprnBZDTQ=;
        b=NQqLSzMgdgm/wDlS4KCgYSjjzgQo1g3eTWsitAaHGMLEiAVE4qZlsH40EBOwicseR+
         tB+VxNWJeetZy0isJL5+zJLOiBLntRFis5innSvFHCe97zBGpLrsdelmDmbvrkUBBp1p
         1uOyuINFyhbIxGFIy1PSwt6YrUx7LSu/mkjD1HWhqi6Rvu3cRfVqbEsnC0evoxFB0+pk
         x//GOhICBw+/YIMRzlnbEe4v+HVIyUnuVHi2ZDyJ5NVJXswVMuys+7lLqZ2aQWRJHQ42
         /5yjMM9x0gLZLIBkt4dAuHR/XFUEi94hi0IukkGi3j9lxAOnmHNEYD4egWmRkT+W+jP0
         AYTQ==
X-Gm-Message-State: AOAM532p8ZIZC9dHj//zEqqbQ3gWlzEdHz52RBEZCsFXyDXCbkELrueC
	EFqZCqL5auRt2T/p+iCQk6HDVA==
X-Google-Smtp-Source: ABdhPJwGsVHOmhzBXFQNEmaZ9h8U0eqe18R3RwplYZjEYvonz6BCx0ppia6Dy8wj0k5EAQSqS9PCpg==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr6844461wrr.106.1641805222149;
        Mon, 10 Jan 2022 01:00:22 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m15sm6263287wmq.6.2022.01.10.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 01:00:21 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] staging: r8188eu: further per-file DBG_88E cleanups
Date: Mon, 10 Jan 2022 09:00:13 +0000
Message-Id: <20220110090020.6800-1-phil@philpotter.co.uk>
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

Revisions of this patch set:
V1: Initial set.
V2: Corrects rtw_mlme_ext.c patch to remove empty goto label. All other
    patches are the same as V1.

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
 drivers/staging/r8188eu/core/rtw_mlme.c      |  95 ++--
 drivers/staging/r8188eu/core/rtw_mlme_ext.c  | 431 +++++++++++--------
 drivers/staging/r8188eu/core/rtw_sta_mgt.c   |   4 +-
 drivers/staging/r8188eu/core/rtw_xmit.c      |  30 +-
 7 files changed, 345 insertions(+), 271 deletions(-)

-- 
2.33.1

