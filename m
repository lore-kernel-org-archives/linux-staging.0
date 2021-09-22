Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837743FD1
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:06:07 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id u15so10389336wru.6
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N48xzJX83krJz5vioP0fMzs94uTfOkuwlYCRYiwT9ok=;
        b=bhUehmFBdrPbCuDxYZxUb3RwTBf/Y1AT+fq43j5FYYykOi8MRRnWP32MSJ4Qfc96RM
         Th3zj22e7wUiKExGgQvl7vCQ/09ysiOvWd4WQi6s16f7neWhOclB2LyVbviwHfNVVKbh
         o+JnFzSOzHJTPOEQEYfF0m30bjLm53So+rW0TkB3SaBmC5FAcDdFXX/DvL9ttbz8aDwD
         hUQuPDTMdiYD8LZp0fPcWqUQlDmpCy+n3YER4IF7edbmO727ytM1lKlFazXeBAixC3g5
         hzI+xlsk0GjKOrFKou0MWGgBP8TlnIiADNs98vCBADYWXPRE+ieTcTVWgFPJaL2Usort
         bIjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N48xzJX83krJz5vioP0fMzs94uTfOkuwlYCRYiwT9ok=;
        b=cu7gRJ1BtpCzRenWWI1zk4ojMKu+QRMyWwKhuDQDr/yGrnyPZWW5K4ClSYCJO9GPvy
         /xm8Xrc4KKSMvE04nS1OcZ0TGFAAH+tXY1xT8Pr+FDMASI+bC2sQLYZ8nZnAA39gETOp
         3tT6+IiUKugCEIZI6JrzkLK7MynpJmZq1GF94DyX5TcmON9MUsARVDywAN5/fe9My6Y0
         9U3gQSTHjEbmwUD1bndwt7d5/jJkr74zQmfDLIhfHy44g5JaJXi1mNBLuEMdzqQCRFH3
         voKtw344qFb78X9L94pEImH3VDth3hyxyjJnDrHyyMChLyu2J30dk+owg7jGzdOzz1L8
         W0Ew==
X-Gm-Message-State: AOAM5318QYWTOy0wl4U5I7gXRrD/cm+v+6e6s4B1TP2jLCt9j6UAZc86
	QMa16bF0dq3Nq+hEkSIf6Uk=
X-Google-Smtp-Source: ABdhPJxgFBsdlNvO/nD+r27Wo2kkQVsiUvsdR6QzHw925+S6Iqo1RLqTBcPMSA9tDGJ2hgEGvvgODg==
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr919303wrd.200.1632341166053;
        Wed, 22 Sep 2021 13:06:06 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:06:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 47/47] staging: r8188eu: remove rtw_sctx_done()
Date: Wed, 22 Sep 2021 22:04:20 +0200
Message-Id: <20210922200420.9693-48-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_sctx_done() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c    | 5 -----
 drivers/staging/r8188eu/include/rtw_xmit.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 6213244450e7..896ed91d3814 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -2188,11 +2188,6 @@ void rtw_sctx_done_err(struct submit_ctx **sctx, int status)
 	}
 }
 
-void rtw_sctx_done(struct submit_ctx **sctx)
-{
-	rtw_sctx_done_err(sctx, RTW_SCTX_DONE_SUCCESS);
-}
-
 int rtw_ack_tx_wait(struct xmit_priv *pxmitpriv, u32 timeout_ms)
 {
 	struct submit_ctx *pack_tx_ops = &pxmitpriv->ack_tx_ops;
diff --git a/drivers/staging/r8188eu/include/rtw_xmit.h b/drivers/staging/r8188eu/include/rtw_xmit.h
index 01e8b90becf5..ea8e82e0b4be 100644
--- a/drivers/staging/r8188eu/include/rtw_xmit.h
+++ b/drivers/staging/r8188eu/include/rtw_xmit.h
@@ -185,7 +185,6 @@ enum {
 void rtw_sctx_init(struct submit_ctx *sctx, int timeout_ms);
 int rtw_sctx_wait(struct submit_ctx *sctx);
 void rtw_sctx_done_err(struct submit_ctx **sctx, int status);
-void rtw_sctx_done(struct submit_ctx **sctx);
 
 struct xmit_buf {
 	struct list_head list;
-- 
2.33.0

