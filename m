Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5981125C7
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 18:12:35 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-988c30a540aso148127466b.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 11:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687198353; x=1689790353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+9yzantCwRm4FcYrNICqbhK8i/swOUSMka8dPN5+64=;
        b=CeGYnMzigtPR/nqfkfnU4ejWwYkY8x92hJCLspMad9X9dfeqH/MpjHAOdux37fyKd3
         pAQjdRBqvmVczLZ8iaw0Eo/niR3UhEeSNWzcLyt6w2ciBx27/yZMscMDfQR36tOGXxC3
         LC909lVEdZ53y22JQb3IiTpSFoK+oLbJmcEU8I2d/rpxwk3oPCp7LhTtrtQYqzHOxDMt
         ULDl12qyOixveL0w0OMLWuF7lfU9lNP1KmDv9ATD9vhlsDVNRBRGaL2xJlqpLWSvhgrP
         BK3yGV6tqY83NNYDQbBBNcN067ndTX3YyAkNwasRuQp7Fj8AyQuHwU1aHXNn0ux/7alX
         N+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687198353; x=1689790353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+9yzantCwRm4FcYrNICqbhK8i/swOUSMka8dPN5+64=;
        b=GImqQ/Vd8CGW08j/+SwOQKbOUhFgu9ovCHIAkNSQr8eUgcykR6AJKcp06B4oiY1N3j
         tGibUcb/M3pzxkXqED2X9zN/HteREXfhHfrxhKbXe0aPQsYiLdpSFdA8u7kpkhOsqAJu
         j31keY+c9bVyTFE4Mfu9mXo8RNj0ELs2KR2L8lu4z9HvNosZtS5mUmIFoqiz+Mb0DR4R
         2SFE4rxUtm1BnfFAD0BAwqR/f+MY0D1st9/6L4eu/H0yE7r6snrxuKmQUqJL+ADEu0nz
         h2q7jP+RcnabrO3lcnKld5IFA8onUAcc9Ukixl5d/uVWcneYZk0dF5V0U4jFAAFiECAv
         9uJg==
X-Gm-Message-State: AC+VfDyTpA2sIT/Al+HfgRO5gL90xQsmJpBcXewxdup0JBRYVlMgCQm0
	SxDcM4EtzMmPmGzU1bjQqIo=
X-Google-Smtp-Source: ACHHUZ6IEh/9j6fKs7xILtT7GKtRkvBhhp02lyKwWifu/78E8OJlga48C9TCvaocwOqN6Hu7bnM1TA==
X-Received: by 2002:a17:906:4793:b0:96f:2315:29fe with SMTP id cw19-20020a170906479300b0096f231529femr9809250ejc.0.1687198353486;
        Mon, 19 Jun 2023 11:12:33 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:dcda:2154:7873:34])
        by smtp.gmail.com with ESMTPSA id lf4-20020a170906ae4400b0098822e05eddsm27361ejb.100.2023.06.19.11.12.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Jun 2023 11:12:33 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
X-Google-Original-From: Franziska Naepelt <franziska.naepelt@gmail.com>
To: franziska.naepelt@googlemail.com
Cc: eperi1024@gmail.com,
	franziska.naepelt@gmail.com,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	johannes.berg@intel.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	quic_vjakkam@quicinc.com,
	tegongkang@gmail.com
Subject: [PATCH 3/5] staging: rtl8723bs: Fix block comment issue
Date: Mon, 19 Jun 2023 20:12:30 +0200
Message-Id: <20230619181230.19070-1-franziska.naepelt@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230619175703.18826-1-franziska.naepelt@gmail.com>
References: <20230619175703.18826-1-franziska.naepelt@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch block comment issue:
- WARNING: Block comments use * on subsequent lines

Signed-off-by: Franziska Naepelt <franziska.naepelt@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index abda4e0f0bf5..b65b5372bbcb 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -328,11 +328,11 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 }
 
 /*
-	Check the given bss is valid by kernel API cfg80211_get_bss()
-	@padapter : the given adapter
-
-	return true if bss is valid,  false for not found.
-*/
+ *	Check the given bss is valid by kernel API cfg80211_get_bss()
+ *	@padapter : the given adapter
+ *
+ *	return true if bss is valid,  false for not found.
+ */
 int rtw_cfg80211_check_bss(struct adapter *padapter)
 {
 	struct wlan_bssid_ex  *pnetwork = &(padapter->mlmeextpriv.mlmext_info.network);
-- 
2.39.2 (Apple Git-143)

