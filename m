Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6D7322A
	for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 20:05:55 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id pb15so6624569pjb.5
        for <linux-staging@lists.linux.dev>; Sun, 23 Oct 2022 13:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nNelz6psOVZvSdJm4dYtPRIHqRerfX2/bz4SfbnUV0M=;
        b=Xp2i7pQ6YdRkMmb3NqArPS7+CKXjjGodgOQz04VliMqLh9z/B410y1zU9naf8/fjO1
         SQE4f0B+axTeHDrqzq0RmmMErWjyeYUFY8CpJIeNTKrsb9F03drqDdGQIiqPeCGIq729
         3Qj6S8XYjCwm9Ikt/9Gr11/ptRIXi+bUZ9McPsLFVqSTsaiIf16zrUJ6qvLLMTnyJcTJ
         yfxuOsm8K7Bim0Ona9cf8dDcseInkv3LvgCUoJBwYEgpBI2ioTkClb9E93xsSbWDDx+M
         2LVjwZYDkYgjwkQw9ohHfvvHonCeVNQE3ywqkMVlVTnvQByBqxqSAq0poTlcm1QJc3Ub
         +mKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nNelz6psOVZvSdJm4dYtPRIHqRerfX2/bz4SfbnUV0M=;
        b=ieEkyZfoshOkKzUGJbgGuNg0giKGxXT1ipRI7MTfsMP8HFTTUL2BWAloYMAWm8KmZ3
         IKPxYfT/mWwspNrkYZRcSiNpbFVqOdnDj9EfyZ/Pt5inhGOW32SnI5KiY7JLQwCAhmMB
         NpzJ3p1h19joYkyot1FoExTv0ppYUZHM/lP/1TGq5sYaBTiMEmGcDXH3AFqfDRozKu33
         PZ3fej9HleWFLZoVRP8Nxh3bzd0+VzPRzpmXNOmzSVuA4/rO9SgvG0Be0FkpJy6MXkA3
         9zLDpNwhBc+simZIEEBgXqdmcSJxMy0sFrz6UTPPVnPrQqxPOdWkKBJdTHiWK+w/fS87
         e5aw==
X-Gm-Message-State: ACrzQf3Pr3CdRc38vaLgs5aQf44I4/252LVwp7IV2XWu6eEqk8bQzT4a
	NBl3o/7GD1YMRGG9/cc0tTC32Z5y2WfxYOHp
X-Google-Smtp-Source: AMsMyM4oIJdUSzUpG7D8ydxO97fEzgQ+9pqqYZ054cRX2SoOmQidSkCoAJiel+mlXFzZhaixTTylTg==
X-Received: by 2002:a17:90b:3b45:b0:20c:2eae:e70 with SMTP id ot5-20020a17090b3b4500b0020c2eae0e70mr34726662pjb.240.1666555554776;
        Sun, 23 Oct 2022 13:05:54 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id e13-20020aa798cd000000b0056bc0578c7dsm1130649pfm.110.2022.10.23.13.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Oct 2022 13:05:54 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove unnecessary variable in rtw_recv
Date: Mon, 24 Oct 2022 05:05:30 +0900
Message-Id: <20221023200532.259276-3-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221023200532.259276-1-tegongkang@gmail.com>
References: <20221023200532.259276-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return _SUCCESS directly instead of storing it in a variable.
This can prevent cocci warning as follows:

  Unneeded variable: "ret". Return "_SUCCESS" on line 1516

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index bb5c3b3888e0..9e98aea09583 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1415,7 +1415,6 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
-	int	ret = _SUCCESS;
 
 	nr_subframes = 0;
 
@@ -1513,7 +1512,7 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 	prframe->len = 0;
 	rtw_free_recvframe(prframe, pfree_recv_queue);/* free this recv_frame */
 
-	return ret;
+	return _SUCCESS;
 }
 
 static bool check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_num)
-- 
2.34.1

