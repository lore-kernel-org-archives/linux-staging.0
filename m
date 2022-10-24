Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9394A36F
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:49:32 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id g24so2900465plq.3
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 01:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K+s6WZgeKaPfeQHcekkW8Ox7ZRAZvlVZ2Z557UTtxdk=;
        b=Xjhv4+BfmtiQqKzLdyZt2chX1y1vr6iFD9xqFMS0L2XzozrhputSf+9xH6/p1YmSrr
         BnaUeuXuVCRFZj8UkEzeiQQW9udTbSuMGqQhIex3q2rCrT5rG6R8Bee92gySstNkxPz3
         PW2O25T9O+k+yGOCA7kMbpQi9s3z61l/RSwkqxgXO2cld6aA/m+TEZLiD6sroVcrjyD5
         oBcBzYORhP2XZWdSeSOPkboCP5v1vs0cJ/1ffJRN/nOjrSw4K7MUdoZVk2wWEPF7s528
         6SXvArfkBTgke1X2vd6H4DzmB7wEZLtPk9sH77TpZUiRpZRpl0lA+sThvrmSJVWRGRsj
         S7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+s6WZgeKaPfeQHcekkW8Ox7ZRAZvlVZ2Z557UTtxdk=;
        b=BctoUTKlCVyGAZy3l+Z6afVWYXT2WqjnXd+gQz0jacArcq+kmRS4G4MxZ5dPZgQAq7
         W5RNo/lFeA4oFtdVI/R3KDiJ82K/eTiG1izRIjekUw9EumQILcu98ScOceDCjf9Voc3N
         OSi3BdIqvIjbsKvVk4E7xkS/s+IAarFdjL59zJWeUk/z0LqXg9CYMrI4fQ0CchsnUCH4
         mnUFmQq1Qcsn4seoCS/Q+RSQZJBVq0lWlgj27MSEqU8XUol3yZlHsL/RXznkpAlPpWN6
         C/Youg1w7U04DryJz88X/YXpNCkQrNIK+Fp+Rhm6Sec9ZbJl2+4eF8xC3D/ilX13eYsn
         N3/A==
X-Gm-Message-State: ACrzQf2FKE26WuUS4pcnH7XtTxkpX8KwUOYp/p8peIrLYSQByrLLAj+U
	EmW+QfYYxBSOgwzdnOzlKi4=
X-Google-Smtp-Source: AMsMyM4jDEauWeYK6sBISqpDmbUgxT9fVFb1s3oYUQOqMjQoJn/OyABs8Xkk17efbv3H4Rg4hG6F8Q==
X-Received: by 2002:a17:90a:3e81:b0:212:cc3c:b02f with SMTP id k1-20020a17090a3e8100b00212cc3cb02fmr20029696pjc.67.1666601371746;
        Mon, 24 Oct 2022 01:49:31 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id r2-20020a63a542000000b00434e1d3b2ecsm17245124pgu.79.2022.10.24.01.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 01:49:31 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v2 0/4] staging: r8188eu: cleaning up unused variables
Date: Mon, 24 Oct 2022 17:49:21 +0900
Message-Id: <20221024084925.262289-1-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up unused variables in r8188eu
causing coccicheck warnings. 

Difference between v1 and this patch is that this patch series
include making function amsdu_to_msdu in /r8188eu/core/rtw_recv.c 
into void function.

Kang Minchul (4):
  staging: r8188eu: remove unnecessary variable in ioctl_linux
  staging: r8188eu: make amsdu_to_msdu void function
  staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
  staging: r8188eu: remove unnecessary variable in rtw_ap

 drivers/staging/r8188eu/core/rtw_ap.c        | 5 ++---
 drivers/staging/r8188eu/core/rtw_recv.c      | 5 +----
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 4 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.34.1

