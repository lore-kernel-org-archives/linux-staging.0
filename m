Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A513FDC
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 19:04:44 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id az22-20020a05600c601600b003c6b72797fdso1895483wmb.5
        for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 12:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVJWb8LinkHQCCL3OEMPLofWcYqIXePWNOhHjmWLRqw=;
        b=NMOPm+dvHYdIom1uWR30BlxD5xKPHp+URKzsDbLi0b+cd/lseiSgTFgRpP7zG0zIDX
         rqhvGSWQinjGCDQ60/8+cVoKDU0B+jQ+n10ooZje+bwF627Ef/BLTifB2cyPprhw509u
         gFbVaQUzn3Rx17DhEFfmzqJW81hhC6Dsa3wd2mtn+5sxErs88gauW2G25Up2sOntAbPc
         cpai/fnXxEbVc45g9Iub4XciRpc71VYMXKgEG7164rDXHS7yS/7pK7YwmAkrMW9dSDEt
         RQJwZBbrquL0U0/c/o6hSegJpe+hbQyr4tFfB5rDANJKSf9vbf3cI68e7RT5Q2YwNXVk
         Mv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVJWb8LinkHQCCL3OEMPLofWcYqIXePWNOhHjmWLRqw=;
        b=zcfBY7vieDr11hUwFxO5GWAswuYdSoFQn3o0OGqK2nTJ64+dLTX39aAyFxV+o4HXXJ
         h9HUFwtOiU4v0O3wq1SbpVvZGHiflUqakPA7osa5mHPyi3qnNC8Jdf6WbCAVy2wJ4Zef
         hCRrLuZhGCfJoHLSsw/FVVbR+j8ZZ2PJhCs2aOONJFkWL3S8H/ZBIknNzfn/TRO2mqhR
         bwOwI5YbeZx1NHQekhGwU2xFZRmiFXkQcraJCbdV2HHt4AI+PgvdVHR5wP0aFmXCpbfb
         pjmTnozVGS+6xrYFnmWBQoumwp6yY8sbfhO2T8RbzXnrrJnjVWBc9MS/qJZop1QRSKAt
         4eyw==
X-Gm-Message-State: ACrzQf1JGLj4y9YIEaM/Dc//onVg0EhzF57hQxpiAmJsgXdhjS4uahTS
	OUF6MmP4lkLDIiJBedwVrjI=
X-Google-Smtp-Source: AMsMyM79HAzMq1nShbl86qRMhpja4H1oxvkb1fEOsl/iKIKOjZoCR3cLtws2+rMNHRdT/SA/XfftRA==
X-Received: by 2002:a05:600c:6885:b0:3c4:de24:638 with SMTP id fn5-20020a05600c688500b003c4de240638mr8616264wmb.183.1665428683164;
        Mon, 10 Oct 2022 12:04:43 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id j38-20020a05600c1c2600b003b3365b38f9sm10753380wms.10.2022.10.10.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:04:42 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH 0/3] staging: r8192e: Rename macro defined in rtl_dm.h
Date: Mon, 10 Oct 2022 20:04:36 +0100
Message-Id: <20221010190439.13131-1-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename macro definitions to avoid CamelCase which is not accepted by
checkpatch.

No test performed on HW, just build.

Dragan Cvetic (3):
  staging: rtl8192e: Rename RateAdapt..., RxPath...TH_low, RxPath..._TH
  staging: rtl8192e: Rename RateAdap...20M, RateAdap...40M, VeryLowRSSI
  staging: rtl8192e: Rename WAIotTHVal, RegC38_TH

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 14 ++++++------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c    | 22 +++++++++----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h    | 16 +++++++-------
 3 files changed, 26 insertions(+), 26 deletions(-)

-- 
2.25.1

