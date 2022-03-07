Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E528E0
	for <linux-staging@lists.linux.dev>; Mon,  7 Mar 2022 14:36:28 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id p9so23615370wra.12
        for <linux-staging@lists.linux.dev>; Mon, 07 Mar 2022 06:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CeIhj+xlbNH1tbRacxDrcMILHX0PhWKDMIaEBWJrU/0=;
        b=L9Yy9MzJkNzV/4C4etsj7XGiuZUF21kwtAR0Kpsb8xVBwxFXRDOY0SHCeC9pHGeCIr
         eXS7pcBvdlYH+iYGPPnCfKfgnuUANcL66LChHy+NdG2AcBhTVSH+2pwiTszUh1RQEt35
         VmcuZCb+Wkfsx8x1GLdfUT990PIwmIi2z0014LwVppPzA01QJ+6KrohYMnoI1l1KQnzu
         kUeqz/ibg2YsIXINHBcwCdiH/EAYyugzNK7sjhbbAtP00I65BX5N8a3+ZaKTezIkQck9
         pXfV4lcBRtdV7tj5MQz61/zpG0ucxZySFwtCjUpmFEQ00CnYOQIRhTaoQ9snz4kPTlj0
         vTFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CeIhj+xlbNH1tbRacxDrcMILHX0PhWKDMIaEBWJrU/0=;
        b=0SlEBlW4gROYCV1KtMjh7dBtAy6s/O/KTOadnIy8yPY/esAdphcMstGZLlfdI56bjv
         4tKoc2rWkEI0LcVyjhntYziT4p1Ag/FUuEf2GIR9yNqIj9rR9nuCkCgx8qihaA+YFSaN
         e4dltg51korZrH/rmJ5a3Aiy977alpuUC9LegAnwXmyOgp43USHDxAI9JpQTZNksx+nR
         +OflrNRwN7xeXaztI8Wep0A9ifCTp7/38uZ1YS7BVfdRImqYAFMiG4lyNE8q2MSCAiYb
         D8hrR4uSrDumsfNE8UVv1jG74m8UiLn66cb6hvf/0mRrUbKIwzmpwmFINyK88C4228XB
         frDg==
X-Gm-Message-State: AOAM533RB802l6zJIXSbHKcWbmmt3fZdT3PJk0YJnetehOmEDpABUSQw
	HXNEiCI9v7PenzVFNxsa2Is=
X-Google-Smtp-Source: ABdhPJzAxxaAb26zhaHLIkISgqgjxNtoRShsy26CNag6U+fVlySw7Ij39E5P0na4aYKZjESTeF9bLA==
X-Received: by 2002:adf:fc08:0:b0:1f0:48ef:cec7 with SMTP id i8-20020adffc08000000b001f048efcec7mr8170366wrr.540.1646663786801;
        Mon, 07 Mar 2022 06:36:26 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id l1-20020a05600c4f0100b00387369f380bsm14428800wmq.41.2022.03.07.06.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 06:36:26 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: remove redundant assignment of pointer tx_key
Date: Mon,  7 Mar 2022 14:36:25 +0000
Message-Id: <20220307143625.136189-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Pointer tx_key is being assigned a value that is never read, it is
being re-assigned a new value later. The assignment is redundant
and can be removed.

Cleans up clan scan build warning:
drivers/staging/vt6655/rxtx.c:1311:3: warning: Value stored
to 'tx_key' is never read [deadcode.DeadStores]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 0de801b666da..53506e242a96 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -1308,8 +1308,6 @@ int vnt_generate_fifo_header(struct vnt_private *priv, u32 dma_idx,
 			cpu_to_le16(ieee80211_get_hdrlen_from_skb(skb) << 10);
 
 	if (info->control.hw_key) {
-		tx_key = info->control.hw_key;
-
 		switch (info->control.hw_key->cipher) {
 		case WLAN_CIPHER_SUITE_WEP40:
 		case WLAN_CIPHER_SUITE_WEP104:
-- 
2.35.1

