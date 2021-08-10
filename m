Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38BD177
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:50:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r6so384244wrt.4
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 16:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dgCC0YOf7alekbi8MdvlXK56+sDB+GJd5c/lxkOlPuY=;
        b=Q2xnzjETCg53ufHwPhf5vy+CyZD0S2aQ0xhvEwatgEly2lXL5vzSv4obL/OVqKYZYO
         TkUDycDsHa81Ml2Tz10JMvaDp0P83I6G0eVpOBGCScRPxJL+KNogw/pMddk5Hnj2lqIz
         jpTALSvIm0lPjicGyOiWs9t5F+5y7KF3tH6OylscdI94IHCm1pBrRJULqCagyhdDqezN
         A/E7uJBejjKADUA0YihLAal/tAwQ7mLi6eJH66O1ZA9n8jz6YKs5WHbFgkpwUA7rC341
         PW10LcOH3YHI474zs1RVwdhuUelI+CFPlYuUulpRt5lBAAQHmE4Ouzlru3II8bU5QYmA
         hdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dgCC0YOf7alekbi8MdvlXK56+sDB+GJd5c/lxkOlPuY=;
        b=gGd7c/Ah4GOXAD/nvox+VouV3r4ljhfiD7ggMbmUQY0ofqFtk92esDPH9znylHpYoD
         GFnI5EGsMGQh0VBsH1bDCpjSnCUr5AUuh0muAZ22hWAlYxJskUU9PmvwAJLZmQ6+b44H
         At+XKv4hihLhxRJaqulA4GhY7zKn90g2X+TAQD0GGWnu08VdeelT6eDBnL5mUDwMcoH2
         RMUE+YCf465F9GIUqkQv+RVL+lZrmK03b9Z3DBvZOg3KMszBbVRvX6OTlwN/c8r4zXu+
         TWUnep7Ddj8qwnKFFouApvHsdmck5kYWok6qkaY/uJh1K/OR08PmjUsp0qV9GR80wmzc
         MxfQ==
X-Gm-Message-State: AOAM533VJis9BfqOuNVNha5dKce0TBz97DutqWcWsl/K0oWWtaDouAgh
	9b694H6EGzesZwg4f5fDvkG8ew==
X-Google-Smtp-Source: ABdhPJzeoZqIhDhczyejSeuRem2SFcX2ZP3zOnekVu2KDDeUdi+VgMktKpXbigx4ZxIQguPP30a45w==
X-Received: by 2002:a5d:5302:: with SMTP id e2mr20151107wrv.47.1628639449094;
        Tue, 10 Aug 2021 16:50:49 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id p14sm13881220wro.3.2021.08.10.16.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:50:48 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] staging: r8188eu: cleanup several warnings
Date: Wed, 11 Aug 2021 00:50:39 +0100
Message-Id: <20210810235047.177883-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series does a lot of cleanup, and came about due to me noticing
that the Makefile contains several lines that silence build warnings
about unused variables, functions and so on.

It accomplishes does three things therefore:
(1) Removes the unused functions no longer called by rtw_ioctl, which
    was deleted in a previous patch (with the exception of the android
    code, which I will add back in once ndo_siocdevprivate is merged in).
(2) Cleanup all build warnings resulting from removing the offending
    Makefile lines.
(3) Remove the offending Makefile lines so that future build warnings
    can be caught locally before submission as well.

Phillip Potter (8):
  staging: r8188eu: remove unused functions from os_dep/ioctl_linux.c
  staging: r8188eu: remove unused oid_null_function function
  staging: r8188eu: remove unused label from recv_indicatepkt_reorder
  staging: r8188eu: remove rtw_mfree_sta_priv_lock function
  staging: r8188eu: remove unused variable from rtl8188e_init_dm_priv
  staging: r8188eu: remove unused variable from rtw_init_drv_sw
  staging: r8188eu: remove unused variable from rtw_init_recv_timer
  staging: r8188eu: remove lines from Makefile that silence build
    warnings

 drivers/staging/r8188eu/Makefile             |    9 -
 drivers/staging/r8188eu/core/rtw_recv.c      |    2 -
 drivers/staging/r8188eu/core/rtw_sta_mgt.c   |    9 -
 drivers/staging/r8188eu/hal/rtl8188e_dm.c    |    1 -
 drivers/staging/r8188eu/include/rtw_ioctl.h  |    6 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 1538 ++----------------
 drivers/staging/r8188eu/os_dep/os_intfs.c    |    1 -
 drivers/staging/r8188eu/os_dep/recv_linux.c  |    2 -
 8 files changed, 127 insertions(+), 1441 deletions(-)

-- 
2.31.1

