Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BE671
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 12:30:09 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id j2so12892760wrs.12
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNOemOTras9F985BUt7jkfUSz/FQKfSLHckmy+4u2+Q=;
        b=md9URWQfYhzAQTs7BYUAnfuxfNGRiN53UUQ/YA2W9aitulTBiv8NN4mQlQhd5At3rs
         oaHzBlzJp4INtOR4hSDVNS73nct0M0bYd6+HwQPoL1FVEfm93HgIsgjqmc8evn2X5XOH
         HFzYg+dGt6K9YReAe43WstwlsWvN0TBbRJmy10m5jbPPpT2jmLHekhgBCu50mMYLloVK
         X6MSQcKqxTR4pTI5AAUfRCAsu9WGYmI2jGoq8CyRr/E6WfGPgSdSbZWR+ujLV/CKKOwY
         volAOKsjEYI717R6K3Ch7M798cdE2NgsEyP/5UXVb+wG9OQwlIG8ujf/vsxBN+08PnDK
         UhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNOemOTras9F985BUt7jkfUSz/FQKfSLHckmy+4u2+Q=;
        b=Vl6eAB7+oiz7JJYraSwqPWBCgLZtX6qEvY9fmauGwLTM2pnyc8/4447+xSqXz2WHiO
         VHARxuQkD5stKTUspEnNlfOiiXbtna2JzZ76ga/vLU6glyAfcAKVrnd2fHEME9UAiMJp
         /80NvUfFS6hC5eew+eIi+mzjiK4v7G+LPBP65eeXG10/1op+Tcd8TiCI1fF/8ATcZ+Oj
         rgYoJTPylTUX+BafqKyXAZQQ6FdO0hK6eUdOnTwKpMIOnCMshX9YmbOaXrN44zU2J71s
         qGJIGdq4vtJ4qoKjEPx49uA2rUrgoY2pSDSPdqFrMfLYeTvP+e+bVWvm/bnDFFN2qOfo
         nd3Q==
X-Gm-Message-State: AOAM533oS+tzXBgAMpxON514FuSFMVjLVLif2ERNOItXXxQMU2dkUNfF
	JOJdaCmp8BZnqUuIOZ1Jn1A=
X-Google-Smtp-Source: ABdhPJzNQ4Gl5Z3wur+aWLx0vtZrsxh8ujxdDjR8m61DMLQ43MHn20VbthpJGAwyMO6FxsWj4GKpQg==
X-Received: by 2002:a5d:6a8b:: with SMTP id s11mr4401630wru.88.1624365007782;
        Tue, 22 Jun 2021 05:30:07 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id e12sm20920883wrw.34.2021.06.22.05.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:30:07 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 16/17] staging: rtl8723bs: fix check allowing 5Ghz settings
Date: Tue, 22 Jun 2021 14:29:41 +0200
Message-Id: <f18b7f00357b4919cdc8183be18427632c16ce77.1624364582.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624364582.git.fabioaiuto83@gmail.com>
References: <cover.1624364582.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix check allowing 5Ghz settings, only disabled and
2.4Ghz enabled states are allowed. Fix comment
accordingly.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index afefc2c8a2ac..e73fb13f8968 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2572,10 +2572,9 @@ static int rtw_dbg_port(struct net_device *dev,
 				case 0x12: /* set rx_stbc */
 				{
 					struct registry_priv *pregpriv = &padapter->registrypriv;
-					/*  0: disable, bit(0):enable 2.4g, bit(1):enable 5g, 0x3: enable both 2.4g and 5g */
-					/* default is set to enable 2.4GHZ for IOT issue with bufflao's AP at 5GHZ */
-					if (extra_arg == 0 || extra_arg == 1 ||
-					    extra_arg == 2 || extra_arg == 3)
+					/*  0: disable, bit(0):enable 2.4g */
+					/* default is set to enable 2.4GHZ */
+					if (extra_arg == 0 || extra_arg == 1)
 						pregpriv->rx_stbc = extra_arg;
 				}
 				break;
-- 
2.20.1

