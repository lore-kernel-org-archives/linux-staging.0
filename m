Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FE22FAE
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 14:02:16 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso4466958wmc.5
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 07:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4V48O9fWoi3LlM7GFB2BgAQTwCbhZkKtIH4sRRIdbCs=;
        b=JIuekk3nuNJ9AbToC1X9nKGtC+9mv+ZKeoFXhtPx4zcFDF0Gi+pKJgibf3DvMHNhdU
         vF8igxxlJaTv6e8kwr0LZJ3rnlR3biIDAVRVa+aHOj1MYYTwXf13npnkv1EAp/c4AZr9
         kMhtOgwHhePOE7sfk1GHtEUOBWlie5KNxnEyAVBfwD09RT5/FeuU7Sx7sezmF03Qw8Sk
         1tZs9bQFHEjaMuSlYOn7g87hkb4vCqILO/K5Lpm2vOoro/w0PfI9zS8Zp+5923ubCUWm
         dueeMojx5rqcsW7covDHTMblrDS7ULZiaaeCKQYTcc+YQD9UqFY8QoGXACnjJGqPTcDz
         7BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4V48O9fWoi3LlM7GFB2BgAQTwCbhZkKtIH4sRRIdbCs=;
        b=lUoY5mv5NRZi856T0SiYq7D48tdwHAs/skTRO43ny3UY4eeAtHDwDLG7B6ga29h0Be
         66J2aQB5quJgDaqvx79FFEs2Zl5FqpXlpXSysNXgG4cPXyI0uDKjsYuByu45sFozpdAG
         vLy5Xel5kYEYOUbmmtyXzKCiJs7QEqs2Yy/pzQX8z9He4xjU85Q8fJ4w8VOsfUotoJm3
         qZRUy/prTuSvENW8O6KIaYsVYo1Tgp0/HasfulL4EYgHZkGTbX6Ake3g8UktcxieEDtW
         WVgyduzBP+QuZ8Tl/43ZVgZOJCeSCq+JlRdVREbXCGo8NtwWLmjSbstcPSidwvIAH7Mo
         QPow==
X-Gm-Message-State: AOAM532cghpOEITNVkrXIcjLiaruvRKw/CnDrfZ6V/ncHP/WBHvKsrjX
	yFmQiIFRrCLG6FvW7GR4ozc=
X-Google-Smtp-Source: ABdhPJzConzuwapZDx2HsNsCo2N48PTabf0pZvQDszimuVbdYG7Wtav3jxlxeVdF6POOA+ebNAEtHQ==
X-Received: by 2002:a05:600c:290:: with SMTP id 16mr8819248wmk.187.1629295334532;
        Wed, 18 Aug 2021 07:02:14 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id i8sm5300576wma.7.2021.08.18.07.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:02:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: fix scheduling while atomic bugs
Date: Wed, 18 Aug 2021 16:01:22 +0200
Message-Id: <20210818140122.10066-1-straube.linux@gmail.com>
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

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
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

