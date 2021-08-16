Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06EC96D19
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:45 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id r6so24381350wrt.4
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CvQg54t0uTxeQkYvMZ3G2AVNpgHBvBBNyXUjt7db2UE=;
        b=HzitVE70ItCW+A326W4yF5iUm8zGewGNyPbjYefs+01iOM27VmHd4i69oVZ9UeXiKt
         SaSVfgaLKuYDBcF13Z8w/NnIwkpuNhetrym59zlMAgF0jRcWn0ojuV/0lAXCojDyV447
         28Lrea1FVk86ElyqUxJ2TA+xC8Lj83+nhiAi/dyGZQCRaC8d37Bx+GwV6x4PndRMt5aB
         jjeXbY7dAUTVpe3EggbLys3mBRivEdm/GYqrbLLbtoAhlOuxL0uTBUZUzMbmcUS1t+Jw
         4L6O7bhZbcFM3D2KLAa6IRpIIw4XkkknXTSjPepbYXbf2nbxhMrYO0Wm9U3d08OZlc4e
         tipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CvQg54t0uTxeQkYvMZ3G2AVNpgHBvBBNyXUjt7db2UE=;
        b=n455nyeDIeYSrVB+MKTqSbNdpeTPTOARUESZV2ESjrr8n9ZWzO59qs029P+w7K45Dx
         ahpVNBMmDs/rpPxmYPiKFM+uITix1zqm8Ib1TM2+f5YG+QaPHEe70WumThnSPnbyI95p
         Wc2QDjMxCZOi2Wk4xKLLFPvaVMpegT/koUI8i7tlssMWCapINwuPond7iV/IljEQHC54
         QLAvz4nvjU7/Qe72oS29BT0RQmSfXbQogV86hx+rigmYmgPvvaEGltPJGtO3FzMpm8q0
         vHaQOD3gJerEcj8cra18kTRPEQdFJJrMvlcQdRiYHaGwSHeo0jPN+PtDKrFx0tqTcUcf
         /xUA==
X-Gm-Message-State: AOAM533nN/IkeZmhQzWc9fmp8BmkVlTj2W+YvlZF2Zy0ibnXEsf5OXXY
	RdU692dOMMT2eesSWp24hyI=
X-Google-Smtp-Source: ABdhPJwk4S0aDt8ktyP8CFhIjjCZpyrz5TQGzLMpJlDnYzqt8RzM9Cm4mcjoJQ9WMZK0AYCeX5UxKQ==
X-Received: by 2002:a05:6000:14f:: with SMTP id r15mr11256695wrx.18.1629129584481;
        Mon, 16 Aug 2021 08:59:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 21/23] staging: r8188eu: add space around operator in core/rtw_sreset.c
Date: Mon, 16 Aug 2021 17:58:16 +0200
Message-Id: <20210816155818.24005-22-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing space around operator in core/rtw_sreset.c reported by
checkpatch.

CHECK: spaces preferred around that '|' (ctx:VxV)

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_sreset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_sreset.c b/drivers/staging/r8188eu/core/rtw_sreset.c
index 5084bc036424..8e1bc62e74e5 100644
--- a/drivers/staging/r8188eu/core/rtw_sreset.c
+++ b/drivers/staging/r8188eu/core/rtw_sreset.c
@@ -45,7 +45,7 @@ u8 sreset_get_wifi_status(struct adapter *padapter)
 
 	if (WIFI_STATUS_SUCCESS != psrtpriv->Wifi_Error_Status) {
 		DBG_88E("==>%s error_status(0x%x)\n", __func__, psrtpriv->Wifi_Error_Status);
-		status = (psrtpriv->Wifi_Error_Status & (~(USB_READ_PORT_FAIL|USB_WRITE_PORT_FAIL)));
+		status = (psrtpriv->Wifi_Error_Status & (~(USB_READ_PORT_FAIL | USB_WRITE_PORT_FAIL)));
 	}
 	DBG_88E("==> %s wifi_status(0x%x)\n", __func__, status);
 
-- 
2.32.0

