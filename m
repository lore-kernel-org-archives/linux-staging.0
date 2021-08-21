Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD2D3FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 08:18:30 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q2so11567664pgt.6
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 01:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJAC/f07BpsuUiR9wwzNtLb3iU9MWyJ5HfzOTPegqZA=;
        b=Qymu3qti9HvPD6olebVf3QwWfgX7tqoAtvo+fiNBoVq/jnCPaBG1NSrQQ8T8KZaS94
         N2k/WhlmnTj8XDw/qD0i4fFmTvMi0GTazJTFFZrc58/LlJBsN/tD+qL9OJ7eBWiOeUal
         Far2W5nnFNVO/W7tAMnRZd4Egzl50gA6utOzsKMVAxhFmzVlJlU70p+ntm2fLFVwz7Mu
         I6T5k2ISpRYWK/F9sigQisKIQinVBcczpZUEN6hSY0cAbw4A3wNHddQvIU0gQeX8lBiH
         64G2du0pTuNiweoer+hpd5Nj+1Rf5VrXxFEXTZdwnVITZ+suazbNUWVKQgKQHpsWn8vM
         xX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RJAC/f07BpsuUiR9wwzNtLb3iU9MWyJ5HfzOTPegqZA=;
        b=pHoIHpD6MUV8rrQffbuRnP4g1PAcymo02aGJKuX3WhxLbEpO3NJePQwkhIBJagyaUi
         vr9ZhixagvPHzY8l96GD9nVECnreb2JbQMn0ORXXOF8bF9K43HXtOlP24Qca++QEnvPL
         Hzj5j8nxYw5b5eVJEhF+tSqzFO1BdIrBGKuq694AKdv1czQGmQvswpwHv8Z7ocaTIBg9
         SXQfzXvofnSBWKEolFOnGI+VZ9Ppt3wDugR+Y455babaoKfqWcszKXUSrutFeiNdxO1n
         tuwZWxWmFYLCIU753aFvCHQJp340GEPkQM656x0SlVc+JvXFalsDevO7H0ZQyOq2hq/B
         kjVw==
X-Gm-Message-State: AOAM5321SlFUbo5bqi6AEfjWcyj8lKZ+AijnJicPSw7kbXuMdU8hcYMa
	5rPfg6zoRP8GZyE+j80RbEM=
X-Google-Smtp-Source: ABdhPJxzipel1SxX8sboBYvkUiTP+xSip/Yj3F9h8DRpn7dFGrHF6KW/f67RUv1KYhOwEuidv20vnA==
X-Received: by 2002:a62:1ad2:0:b029:3e0:7eb7:a6bd with SMTP id a201-20020a621ad20000b02903e07eb7a6bdmr23968580pfa.51.1629533909800;
        Sat, 21 Aug 2021 01:18:29 -0700 (PDT)
Received: from localhost ([203.205.141.70])
        by smtp.gmail.com with ESMTPSA id e4sm10803463pgt.22.2021.08.21.01.18.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Aug 2021 01:18:29 -0700 (PDT)
From: Xiangyang Zhang <xyz.sun.ok@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	xyz.sun.ok@gmail.com
Subject: [PATCH] staging: r8188eu: Fix a resource leak in update_bcn_wps_ie
Date: Sat, 21 Aug 2021 16:18:24 +0800
Message-Id: <20210821081824.14745-1-xyz.sun.ok@gmail.com>
X-Mailer: git-send-email 2.19.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "pbackup_remainder_ie" variable is not freed when "pwps_ie_src" is null

Fixes: 15865124feed ("staging: r8188eu: introduce new core dir for RTL8188eu driver")
Signed-off-by: Xiangyang Zhang <xyz.sun.ok@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index 1127e9a52458..2ce982390c7b 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -1300,7 +1300,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 
 	pwps_ie_src = pmlmepriv->wps_beacon_ie;
 	if (!pwps_ie_src)
-		return;
+		goto exit;
 
 	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
@@ -1314,6 +1314,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 		pnetwork->IELength = wps_offset + (wps_ielen + 2) + remainder_ielen;
 	}
 
+exit:
 	kfree(pbackup_remainder_ie);
 }
 
-- 
2.19.1

