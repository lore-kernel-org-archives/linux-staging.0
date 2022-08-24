Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678187E
	for <linux-staging@lists.linux.dev>; Wed, 24 Aug 2022 08:03:56 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 12so14372235pga.1
        for <linux-staging@lists.linux.dev>; Wed, 24 Aug 2022 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=vLuqniAMwqY6ECfkYSPT1Bkq/cd7HE9h4EEKEFfMYEk=;
        b=WInXrY3qRgrPgpReqwCl4R8vLZ1EJa31NKnxJoyTy4qEipQsgpGYSdIVq1ejlCAPpN
         OlZbbEC+PBY5Ibu9LEGcwdwOWEAXizp8VI7vPIJWCTosW5UvtKi2r2oODfpXbsKzQ5Ik
         Oq1VaFSfGf/6SKvBA1ZqQyF523w+ERzFvUdztoRbFQrdLliOMaMjg3hUgtRcRwozPnO0
         BSwsDxGJ3fWMIQb/gNRFp2wL/WMH2r8vlIFG3jbrw2eFlkdHQf91UGyeaBgv2Lkn7jgA
         PS2gtDtIjimMqU4P3JItk4TavlGYQf7Y4b0RKxNmFjYlXFth/so5CW2VpfTvQjAuH1Hp
         9wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=vLuqniAMwqY6ECfkYSPT1Bkq/cd7HE9h4EEKEFfMYEk=;
        b=4heizbP+OqE/tf4XYGs+aarkFfRTFRXgxwKm53Ql7VCKvs0Y/7BiUEDcaMBgt112S4
         I5+EcRXQ7K+2HjUsZmV5oHcNirKNalT4WFJNlrvHoYNjGuHUJjYze6nf8VqDqGRCNuQ/
         Ly1B0KyYIPBH3F74Vn/7lRsF85AHSu/WVPmS6CSwMZZ6bV0RRqqsXuthp96pq1PH+G89
         tP8kECMTZ9RO+QmdDVxKQwSmn+NOG38t5tzXcuQgeGwY2D+x+sbxwjgptWH8lUK6sAGR
         mUj1tXYZ2hPdUUc7Zb4JlsqeU64VIq+QU4r/3LzPkfR/ARiYMXCRVCgc+UH/rsQsfVFa
         2C7g==
X-Gm-Message-State: ACgBeo1C2iRx+p8ySwbSalHPHSx4h5zRNi0hGEz+zAqSdVCsQ+4GdFSD
	Gkl/d1AsD3SdeJqq7dzlgjI=
X-Google-Smtp-Source: AA6agR7MlcgjgtEOya/NAybABl6gcw7J21DmWRhCKXk8BHL8WvNnBdvkEdqRcGH18AtoUgBC6YY0fg==
X-Received: by 2002:a65:6e8f:0:b0:42a:c7d3:f2ed with SMTP id bm15-20020a656e8f000000b0042ac7d3f2edmr8386132pgb.209.1661328235880;
        Wed, 24 Aug 2022 01:03:55 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id x187-20020a6263c4000000b0053656fdaf88sm8153571pfb.69.2022.08.24.01.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 01:03:55 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	paskripkin@gmail.com,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	jhpark1013@gmail.com,
	makvihas@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Minghao Chi <chi.minghao@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] staging: r8188eu: remove unnecessary null check
Date: Wed, 24 Aug 2022 08:03:50 +0000
Message-Id: <20220824080350.221614-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Minghao Chi <chi.minghao@zte.com.cn>

container_of is never null, so this null check is
unnecessary.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index 56c8bd5f4c60..d089da7e90e0 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -1442,10 +1442,6 @@ int rtw_select_and_join_from_scanned_queue(struct mlme_priv *pmlmepriv)
 	pmlmepriv->pscanned = phead->next;
 	while (phead != pmlmepriv->pscanned) {
 		pnetwork = container_of(pmlmepriv->pscanned, struct wlan_network, list);
-		if (!pnetwork) {
-			ret = _FAIL;
-			goto exit;
-		}
 		pmlmepriv->pscanned = pmlmepriv->pscanned->next;
 		rtw_check_join_candidate(pmlmepriv, &candidate, pnetwork);
 	}
-- 
2.25.1
