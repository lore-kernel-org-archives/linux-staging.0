Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC472
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 09:25:22 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id l11so8037521wrx.4
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVbcKYMfOmhTBBsQIKq+07W8pgc80trDsJf7FkANsyo=;
        b=mMdgY/sfu+S8ZUjtkWVbrgcjUjGDUPBg+A3xzqZnft33Rq9/q5NkcMxLIW0KAuIpzT
         F+INo97PcvPMd5paheBcYbx1/z35ll+yTAzaIRM1xHdeDm6HPqhzc7PC4iBABi9kHBck
         mhwhVCw8xEnJWVbt/8lNwe6WGXdhknYFbYrtFE+i92DRCUbKMSs1aHeEsDf5yVgu6y8U
         KIGMo+RG76c+0gEVFfcdvhLrqW8tOjlHEHMdN4JpiFbX4AspA7/ijzi80s3p+TGkmRYa
         KWp+bz3CsUjNV+YzPN5pWkiqvKxQrGKkxNUwX0nf8KKjaLBlB4gxCLEC8NQEVF3wJmcq
         yWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVbcKYMfOmhTBBsQIKq+07W8pgc80trDsJf7FkANsyo=;
        b=lErcMGSvKzG2lYkzzfblqXWTIHQ3zXfJIMTrXook04Oomvu99rVF/43+EIT3Kl0tW4
         5eY4cfWhGPiVmTfICsax1xkdQzpsvxLntJEqhBLxUCha0F1M51/1xSxm2LZb2b7gB8Oq
         sXlvWEDejZC6K1cg0FBw32xNYsJYgv8uTQJ2pMNJgPTaN1+YHbzivF7MMz6IMeYutMEW
         klf91S8i2lQPmbRr04g5vpdsSQeF2Tj0ayab8tPnIUTslDZ4o0TUK0fYxLkLKKYIntya
         sBKXQTvUoKy/L+otC06FoMYfFyZR0K5Skwgz8MntYIsESGkHjNSvaOo01XpM5wmbpSq3
         XLHg==
X-Gm-Message-State: AOAM531wXcy/IJ5kduXNlPfKYbIIX8vVzSo1eTiDs3P9qnp8EXs8pVkB
	2qedZBx5JmXJDMZ6eFERoxk=
X-Google-Smtp-Source: ABdhPJyHozq0YMg8bxQjLoGBNKnUWXYB5289Ru0LhbFMjm55G4bUm6gaSbltCnOb4n1Vb3ga/kDjJQ==
X-Received: by 2002:adf:df08:: with SMTP id y8mr2622512wrl.124.1629365121386;
        Thu, 19 Aug 2021 02:25:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::687e])
        by smtp.gmail.com with ESMTPSA id d4sm2354928wrz.35.2021.08.19.02.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 02:25:21 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3] staging: r8188eu: fix scheduling while atomic bugs
Date: Thu, 19 Aug 2021 11:24:23 +0200
Message-Id: <20210819092423.4349-1-straube.linux@gmail.com>
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

Fixes: 79f712ea994de ("staging: r8188eu: Remove wrappers for kalloc() and kzalloc()")
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v1 -> v2
Added Fixes: tag to commit message.

v2 -> v3
Correted the commit in the Fixes: tag.

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 5325fe41fbee..508ef1d330a1 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -8130,13 +8130,13 @@ u8 set_tx_beacon_cmd(struct adapter *padapter)
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

