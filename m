Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51182CA4
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 09:00:25 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id r9so23577897wrg.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 01:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/xQgPdF4pLZ7rSZV7wFE+mDlaQQE7y+ojmrtCNp2S0=;
        b=vPX2VV68MOY1eCHU1t60DVAlc5eimiyLlz36nNeJCKTQZW88FB74k9JudWskJqwcks
         r92jEngjqVp+Ulc0PXtwXu4fTRT8F3FNyIN2My2BLwoRdloOWQLkZMuvZcYSW2ui3lQs
         cINHok0lXhgRzzqQ4zi6bOfgsCn7+U/lHvPj3oHyeo2zNfKGAJXSh4gYwmtrG+sFV7Hz
         zmDEOH1G//V0fAkxLXH1tnGBPxXGZIoaRqEzL6BMi1R71nOwJFwEQsTygYmfHqLjBou3
         JvSWUmOnacK78oVyjmquJ/0gM7xIEO3IR2KGZ4GKM5MWSxpvkVAGeyVjB3n4p0/c5Pam
         9Gqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/xQgPdF4pLZ7rSZV7wFE+mDlaQQE7y+ojmrtCNp2S0=;
        b=iudC0o5vbl7brpXcYH7Qt19LBsVKFY18orj/XkCrBdUDFvMYGuU2w39hxpKObZQBpW
         T0lvwYZTvGHubn+xTYOuu6VlurpONtBYC2mOMRV9m5Sf3TRyHZtIrv0jIbyWW4yNKzuX
         MQBKAzQhJbRHLrxUz7iEM5r5ymFY6BXdzptAWLa/fY/THyk0dlqZLVVVkbDKw9MCudjN
         IQhmaUMi2qqh4yDExuWJ8VnQSet21rLBm4GYYOrbkBLU/img3yRhF2/anD6oKIxesq3L
         VEZWmPYwNyp1MUHGtOs21xj6YONcpIPqD+jie+PI2fg59Uj1Y/pOiRYw810h7r0YONq3
         ZjFQ==
X-Gm-Message-State: AOAM530yt38/sCr0FS6sBjd6HbcRmRSZEeLiD8amuFNo4aglxUSqpYot
	xFD/BbD6D4qAbWwPFCl84g9fUw==
X-Google-Smtp-Source: ABdhPJy8hTmBIq37DVE3XIEhQd+zHXS4LX9DeWilqOHMHy12jJf4seF9jFUkXJ4ahVE73ZVEeLUXLw==
X-Received: by 2002:adf:dc12:: with SMTP id t18mr65858842wri.566.1641805224160;
        Mon, 10 Jan 2022 01:00:24 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m15sm6263287wmq.6.2022.01.10.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 01:00:23 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] staging: r8188eu: convert DBG_88E calls in core/rtw_iol.c
Date: Mon, 10 Jan 2022 09:00:16 +0000
Message-Id: <20220110090020.6800-4-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110090020.6800-1-phil@philpotter.co.uk>
References: <20220110090020.6800-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DBG_88E macro calls in core/rtw_iol.c to use pr_debug
or netdev_dbg appropriately, as their information may be useful to
observers, and this gets the driver closer to the point of being
able to remove DBG_88E itself.

Some calls are at points in the call chain where use of dev_dbg or
netdev_dbg isn't possible due to lack of device pointer, so plain
pr_debug is appropriate here.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_iol.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 7e78b47c1284..923da2a9f6ae 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -12,13 +12,15 @@ struct xmit_frame	*rtw_IOL_accquire_xmit_frame(struct adapter  *adapter)
 
 	xmit_frame = rtw_alloc_xmitframe(pxmitpriv);
 	if (!xmit_frame) {
-		DBG_88E("%s rtw_alloc_xmitframe return null\n", __func__);
+		netdev_dbg(adapter->pnetdev,
+			   "rtw_alloc_xmitframe return null\n");
 		return NULL;
 	}
 
 	xmitbuf = rtw_alloc_xmitbuf(pxmitpriv);
 	if (!xmitbuf) {
-		DBG_88E("%s rtw_alloc_xmitbuf return null\n", __func__);
+		netdev_dbg(adapter->pnetdev,
+			   "rtw_alloc_xmitbuf return null\n");
 		rtw_free_xmitframe(pxmitpriv, xmit_frame);
 		return NULL;
 	}
@@ -49,8 +51,8 @@ int rtw_IOL_append_cmds(struct xmit_frame *xmit_frame, u8 *IOL_cmds, u32 cmd_len
 
 	/* check if the io_buf can accommodate new cmds */
 	if (ori_len + cmd_len + 8 > MAX_XMITBUF_SZ) {
-		DBG_88E("%s %u is large than MAX_XMITBUF_SZ:%u, can't accommodate new cmds\n",
-			__func__, ori_len + cmd_len + 8, MAX_XMITBUF_SZ);
+		pr_debug("%u is larger than MAX_XMITBUF_SZ:%u, can't accommodate new cmds\n",
+			 ori_len + cmd_len + 8, MAX_XMITBUF_SZ);
 		return _FAIL;
 	}
 
-- 
2.33.1

