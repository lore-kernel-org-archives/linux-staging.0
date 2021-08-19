Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DBC72
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 09:03:32 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id dj8so7754983edb.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 02:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vY3GZJPMYn6vS4R/74kCrYt0CIjzYgwZIOWTM7q36E8=;
        b=T0NvdnO2TesKoZtHGxcnTTxmFcyUfm1UzjTlAeKm1yATm/iDmXpv9wRpVrqS0SEYeQ
         lUXqglioAKyHW4pR/+yWwASFMfm+0LaT4A9eiK/znr23E8S50SWP1eqmwFqkjU8Zl+hJ
         Wv2I4vxq8EHB6NgVP9OMK8/ZtMaGWV7I6oaKEoClyNFuRxhMGeUhV9BDN326tzMaZxyj
         4QGVI6RcGqVkPLDU5Ajw7iZpqcqpMxIfCVjADOrpLb9caJ+AdHC29GHDA6PJ24AVw5m6
         WLJ4f3Ur6au8yazSnGThfHw0dsUyrHYqMeEC6+KQf3Z2Ip6zW34fBVbbascSzCnk28yJ
         Tr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vY3GZJPMYn6vS4R/74kCrYt0CIjzYgwZIOWTM7q36E8=;
        b=jXgg4euxKasLsMsNNSYGeDEgKZO4GukPR9eulO4pZxEElbKrl7v+p2MQfv/Rg0RtCh
         53G6TcGbxYoQkl17wh7Yh3V179e/LF/PShAq3m3X7E8Y+Trk3hg1F5zjwzlns+Du8ZF7
         43PBC9SASqdLkq4LeBm7VVKkMI/e4CgmkydzTjMr6SaN/JBtey7ZctzUpG8IBCmGjT8L
         tKGW30CwmyxhCa5immkWEDdNVhM8rRLzRZExUvQG60SRqB5+YQ9yN8FLEZl2aSXu6Q/a
         dZBbyKg/NC7GJ93ctgMZQEwfYAwSovkeBBjz9pW71Ojl6ZcCAKEuHMroBEtfG5Mqt2ur
         GEOw==
X-Gm-Message-State: AOAM533jPPKdFQZOYHKHt0NfQ5pEkO9M27cw7kxXERLqiLmOSF8p6Vx4
	NN74+vqB6dLtDmzt+A3dvbU=
X-Google-Smtp-Source: ABdhPJy5ELko6QdKjpbICRNWBsnoqBK4LtKLolcWhKm/6cjTFZ9YArV1BxEWU7jehojQFSUI5dxppw==
X-Received: by 2002:a05:6402:4d:: with SMTP id f13mr15240964edu.275.1629363810471;
        Thu, 19 Aug 2021 02:03:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id cn16sm1386687edb.9.2021.08.19.02.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 02:03:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2] staging: r8188eu: fix scheduling while atomic bugs
Date: Thu, 19 Aug 2021 11:02:14 +0200
Message-Id: <20210819090214.3269-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These allocations are sometimes done under a spin lock so they
have to be atomic. The function call tree is:

-> update_beacon() <- takes a spin lock
   -> update_BCNTIM()
      -> set_tx_beacon_cmd()

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2
Added Fixes: tag to commit message.

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index f6ee72d5af09..b7df269e4149 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -8129,13 +8129,13 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
 	u8 res = _SUCCESS;
 	int len_diff = 0;
 
-	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+	ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
 	if (!ph2c) {
 		res = _FAIL;
 		goto exit;
 	}
 
-	ptxBeacon_parm = kzalloc(sizeof(struct Tx_Beacon_param), GFP_KERNEL);
+	ptxBeacon_parm = kzalloc(sizeof(struct Tx_Beacon_param), GFP_ATOMIC);
 	if (!ptxBeacon_parm) {
 		kfree(ph2c);
 		res = _FAIL;
-- 
2.32.0

