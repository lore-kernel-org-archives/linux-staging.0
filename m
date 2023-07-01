Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16EE8830
	for <linux-staging@lists.linux.dev>; Sat,  1 Jul 2023 10:22:39 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b6985de215so45236841fa.2
        for <linux-staging@lists.linux.dev>; Sat, 01 Jul 2023 03:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1688206957; x=1690798957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b7ztS2/YuspzN8dr6Cszov8eINdOPb7ES0wdsgpSETU=;
        b=qE9ClLyDGIQVk6lK3tl+1wB1faJtgiF4dXaD0FBMSjU1maCOgJQ5E+ps9EHiPXqWHR
         RHp/hX1HKFm9N2ke/5gygjgyIbsIqIwLh/mX75P4zkzYDML1TGFraywUhtSBezTRvkRR
         ztH73D3uWzcjj177RvdNaQWlKC2ydAsiRT1S7hGUC2iGz0i9Gd/aR3zwxVp30o2BthaC
         OiwEyhf7M4G/7hbmr8H3MXj2kKW+nLPJnecZLNcBwwEb1e+kAo9qmGteP3tldqRCKOLv
         +cQlH10AQYzE15T1O9X8tW0FEvLzoxnc4QCoAqi6F2LIeYCrlv4FfjVPW5ChrUgupEet
         UWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688206957; x=1690798957;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7ztS2/YuspzN8dr6Cszov8eINdOPb7ES0wdsgpSETU=;
        b=WaLg+TkUcC2SqueTvg+mia2TaC9MsPLiQ3yWCubIDl87voV10ZrPPTflMDWV0hXdd/
         jRzNgSLTCX37VIJ7PIwarRMDRDtsZXjdNJvM/hh+JyRVSMtPUl6ZGVdt7wF3EaoQYDxR
         IpExyWpum9XYBO8Dj/2QUz2klIuouzg1KVLh46DuxkybueCjCj9fcImAb7hsHcD4EE7e
         cUMdByc5Bni78shFfKxIrUOVCER0rgU+yS9PRLCwi9zp5OmhfnHtQyfRrnpyTio7oTDK
         y03uvNW+hFbnYhS1Mla51ERupA3zP305JVO86QcwTRARkCmhvqk+q5+SoO8GF1WPq/9m
         w+ew==
X-Gm-Message-State: ABy/qLZVY9eBh6ea5Hm/AvliiQlo/5Gc0d7j9ydXbfh0cjne8nV8Mktu
	pwY/vvHHoxb7F88CjlGpSIdbi1H8Hwm3fw==
X-Google-Smtp-Source: APBJJlEb7pbVUyHFOEsJrzzu2ifqVihvcHGkgpq9vleSGT5UTlnJEVODEq09XV3/ETLPAONHkbnTpw==
X-Received: by 2002:a2e:b60f:0:b0:2b6:cd12:24f7 with SMTP id r15-20020a2eb60f000000b002b6cd1224f7mr3523688ljn.44.1688206956661;
        Sat, 01 Jul 2023 03:22:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:185:3db5:c5f0:49bb])
        by smtp.gmail.com with ESMTPSA id jt24-20020a170906dfd800b00982cfe1fe5dsm9073393ejc.65.2023.07.01.03.22.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Jul 2023 03:22:36 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	quic_vjakkam@quicinc.com,
	guozihua@huawei.com,
	eperi1024@gmail.com,
	hdegoede@redhat.com,
	tegongkang@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	philipp.g.hortmann@gmail.com,
	Franziska Naepelt <franziska.naepelt@googlemail.com>
Subject: [PATCH v4 0/3] staging: rtl8723bs: Fix some checkpatch issues
Date: Sat,  1 Jul 2023 12:22:23 +0200
Message-Id: <20230701102223.5308-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of patches to fix some trivial checkpatch issues. Not all
issues have been fixed. I intend to submit another series to fix more stuff.

Testing:
* Build the module
* Boot the kernel with busybox in initramfs
* Load the module
-> No errors or warnings

---
v4: Fix sign-off email address and cover letter header

Franziska Naepelt (3):
  staging: rtl8723bs: Fix space issues
  staging: rtl8723bs: Fix alignment open parenthesis
  staging: rtl8723bs: Fix remaining blank line issue

 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 164 +++++++++---------
 1 file changed, 85 insertions(+), 79 deletions(-)

--
2.39.2 (Apple Git-143)

