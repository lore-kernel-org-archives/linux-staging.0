Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E141C04
	for <linux-staging@lists.linux.dev>; Sun,  2 Jul 2023 12:14:57 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6689430d803so1873617b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Jul 2023 05:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688300097; x=1690892097;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DntoVejHzUbHw/NVUKBMPCnwyUmjZxJJvZNMunsjz2U=;
        b=TZ0auGwBpAA34z5ux4Ti1uCBf+dNqx1vvBq47z1hhYWQtFwFH6M5xKYRmFCgSkKhwF
         R/3cCHwkK4lbwe1K3Nm+4mi1p8U45QsjC7kSMiwh9u60KGr/PnZ5Lim3fNrdVDDDpFhC
         xzI09Feq19Xpx6f6lxSOGEKHeaih+WeBR5IappNLR+PNvBZXcKQIzJhLvasFO9v8a3aB
         YgKfpvHcWZE0aWlMVhyAkwgOjw0UG+hM4y/qGTfpeKj/II6oXr7bKlz10JhdmlDSIAhl
         gdJyNdzMKyLA3jnI/qImrgeQmrpOw80oIQ/TiFg7K+UTBHgfWiz6AqADNHIMSavQ5NFn
         sOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688300097; x=1690892097;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DntoVejHzUbHw/NVUKBMPCnwyUmjZxJJvZNMunsjz2U=;
        b=S60NGe35NBEQg/oCun9R7u0LbRrn+z7tR/ACS0IJm2alX39a7NCZ7XyOcle/c2b4oa
         2BsT9hiFpjg86gFm6drNnW30r5sBA4Jfbh2OMDQnRqS/Cvxl4+Xg7aCt1V3tTn8GKBzk
         xbfwOHj7K91dIBia61jNeV09CZPzMDgv1LcBydlDvS6QqNJYtlKx7GUpxyPximjHGPH7
         gY/KLAfnVQbwNTgr/9KZ6UcZSsh7ODAYQyOuvsL/zR2smIZmVizRgjk7oPS6QIuukZUE
         Qal/SyR+lfyxaGwPxUencA8DnvW+PE/BkbyOXD4nzAdzzKNEHTSVPmWQPPmdz8YP6DZU
         /EfQ==
X-Gm-Message-State: ABy/qLY9NwTA7vYsG0HjYDljYuEUiERs9aHUbQmG9b937a+47oIiFaPd
	vb57oSxyd8e17PGq2udQNvc=
X-Google-Smtp-Source: APBJJlGYLwl9SAOzS6EirIrfOIWXQT6mVPsrD5EOuD1iouxZhpiFuZrjPUk5Docf0ium9XGDiOH45Q==
X-Received: by 2002:a05:6a00:1891:b0:64a:2dd6:4f18 with SMTP id x17-20020a056a00189100b0064a2dd64f18mr9674054pfh.13.1688300097163;
        Sun, 02 Jul 2023 05:14:57 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.195])
        by smtp.gmail.com with ESMTPSA id e25-20020aa78c59000000b006732786b5f1sm11185655pfd.213.2023.07.02.05.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 05:14:56 -0700 (PDT)
Date: Sun, 2 Jul 2023 17:44:51 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH 0/4] Trivial code cleanup patches
Message-ID: <cover.1688299890.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Rename variables in function _rtl92e_dm_check_rate_adaptive 
to avoid checkpatch complains.

The patches are required to be applied in sequence.

Yogesh Hegde (4):
  staging: rtl8192e: Rename variable currentRATR
  staging: rtl8192e: Rename variable targetRATR
  staging: rtl8192e: Rename variable LowRSSIThreshForRA
  staging: rtl8192e: Rename variable HighRSSIThreshForRA

 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 38 +++++++++++-----------
 1 file changed, 19 insertions(+), 19 deletions(-)

-- 
2.34.1

