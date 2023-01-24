Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E68F70
	for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 22:03:00 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q5so10613548wrv.0
        for <linux-staging@lists.linux.dev>; Tue, 24 Jan 2023 14:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h5xdmH8zlirHZvICJzGt4pGii8srq455Z/ItOrzAZQg=;
        b=aHNklJ0HIJQwu4SkMQYfXjiHPeRgQXwJVpitL13qVMTnqYZ+vXHFQxnznYsfM81crp
         HSi5+TIPAWqjgZ1hcyzaXDmKx8g4TybXtmEWZSp0pYZ2HvGiVkeBUSiOwP6L5ZkfA3gl
         f6Bm0a0fSK3R593lmWhG+EBmXU6lc1O1ZZmj4KvjezIDwS2MzrRS6EsKEv8ovlWLU6eV
         /KtVIP4qgMPRhUlHyuK+lZW5fWYTsJUYcAtB87No0R2M0r0K2C4EqtVEgLrawk/3xXXM
         NXXeW7pKvhTW6HHeU/ML/2WCLecM3MmZm5Zqfh13+Dce7hbrlDjOZGXA/UD+n2Yie0ZL
         qPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h5xdmH8zlirHZvICJzGt4pGii8srq455Z/ItOrzAZQg=;
        b=dYxr/x9kBdDBUW1ecAEeV1+FvxU1I9v5j/eceqke89Ha+oEqjnEQuq0v8mdYTiL+pE
         Fuc/VuutaQN4Dfr0mHoTkIQHqgWaTAV8hvJ86HWf5Oc6c2tcNMeDMSN6ExB288fCkkad
         J2joVQoOpPVleVbTCtbmeG0fG/Z/+icK5kTMTKVrdkPwe8cfK+hN85fX11lr1mEloiWz
         A0MjyfiF82aAYwDGv/8hcWmgT7Em/G6ZfKmTu9NyVNsOoBpu51ZRQ4BMUtN6GDIfGr3a
         6TvD8iAgSyePmuRP8LWsVJUEbCZ84+cbfkoGNfbiCs1iOfS9ml4kbRFvwe7vwS3MveXY
         jBJQ==
X-Gm-Message-State: AO0yUKUYtusjNtly+ibYB+7+71hDt+pSgxm9/BLjX+nwexTtUPHjbm+t
	JOCIod99sqV9D7F9D3k0EmQ=
X-Google-Smtp-Source: AK7set921/XwPrntnbplCcgKatUjdrG/tZQLt1MFSBg5TKP1SHI7hfy9vi341iOoUkdCQixGIxKLCQ==
X-Received: by 2002:adf:d239:0:b0:2bf:b2fe:a2c4 with SMTP id k25-20020adfd239000000b002bfb2fea2c4mr408061wrh.7.1674597779150;
        Tue, 24 Jan 2023 14:02:59 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b002b6bcc0b64dsm2897164wrr.4.2023.01.24.14.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 14:02:58 -0800 (PST)
Date: Tue, 24 Jan 2023 23:02:56 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] staging: rtl8192e: Remove unused variables from struct
 rt_stats
Message-ID: <cover.1674596722.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variables from struct rt_stats.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (11):
  staging: rtl8192e: Remove unused variables rxrdu and rxok
  staging: rtl8192e: Remove unused variables rxdatacrcerr and
    rxmgmtcrcerr
  staging: rtl8192e: Remove unused variables rxcrcerrmin and friends
  staging: rtl8192e: Remove unused variables numpacket.. and
    received_pre..
  staging: rtl8192e: Remove unused variables numqry_..
  staging: rtl8192e: Remove unused variables num_proc.., recei.. and
    rxov..
  staging: rtl8192e: Remove unused variables rxint, ints and shints
  staging: rtl8192e: Remove unused variables txov.., txbeokint and
    txbkokint
  staging: rtl8192e: Remove unused variables txviok.., txvook.. and
    txbea..
  staging: rtl8192e: Remove unused variables txbeac.., txman.. and
    txcmdp..
  staging: rtl8192e: Remove unused variables txbytes.., txbyt.. and
    signa..

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 25 -----------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  | 44 ++-----------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h  | 31 -------------
 3 files changed, 4 insertions(+), 96 deletions(-)

-- 
2.39.1

