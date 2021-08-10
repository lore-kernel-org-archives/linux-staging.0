Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F686D00
	for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 23:50:56 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id u15so636020wmj.1
        for <linux-staging@lists.linux.dev>; Tue, 10 Aug 2021 16:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0vH97/uCd+lf2pt7Za/zqAhi1/nCsR1Usl1LMbLR/fU=;
        b=C/9R/2Zqdotfvk8edzl9VTuojRPObLLxvQs+pWnpFbL8zb5hOgDBgg4bLxAOsMY9Qk
         LBv5axnGw/RSLAtzO3MVjF5LT+Tw6cwvqrut3wANNWtU0dvbyjcp8MHiNmxist8a7Va7
         LiyTVYu/hmMh9moyJNPzpuXRB7/titM1GfkXFByV8dMqMBhO0nxvOLbzJGBJpFVER7R2
         hkpTOU0r6xEk3EzdsRzBEJ8GFUfkR5HVfqDE5wK/YUQhGbyyOSRlkfzxhWPuOI7qQbW3
         d7+9G2IbvFOawl5RGB7wwGiVtL+Xoma07RrzJu4YCHxten9oSfx2ZkFT737pAISd2X7K
         spTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0vH97/uCd+lf2pt7Za/zqAhi1/nCsR1Usl1LMbLR/fU=;
        b=PDmT5j12NG9VoJThPA3N47FQ/yKu+plVuPCBlLvadHPIO/ATjPBCwSr+b1BrkhbXiH
         fafaOnzjMiz7rLK0I01fyQPDUfq/WGFgFOWaWGpMNWPuraiNr50hZ4LhIgumcJr4Q9tZ
         Fh0ZhCgsmG12oSlFlW5D7IuPpgtPQNa9jrHyY+S175PmYqfN8v2oKz2TgQNzFZcIbkpR
         0MoUhPHFJKA5bbBJDhNMEXp+xuvmJYWzQUtzZDnvWu9l5p+7Uew1S9Pxq9aUneug/fa3
         Ap58pFDEP0pmmhJ5TNTkaRwh9TGfig5x3UyTJLLP3RNRhSsUipohH+uK4r/Bl9UHnZik
         hkYA==
X-Gm-Message-State: AOAM533pOGaWuRh+l/3kIUGOiS8CKgELm0Gi5bRYQpR5mUGIkfFVe1ix
	qaHp0n/DjZpEr5qN9GGsRs7DVA==
X-Google-Smtp-Source: ABdhPJxnzVytmkauOXAhM+QlQVMFffIABzlzCVUSxpZSyTtKRQ7R7+x+pUA33PgF1QizONYAbOkByQ==
X-Received: by 2002:a1c:8093:: with SMTP id b141mr19189469wmd.177.1628639454510;
        Tue, 10 Aug 2021 16:50:54 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id p14sm13881220wro.3.2021.08.10.16.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 16:50:53 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] staging: r8188eu: remove unused variable from rtw_init_recv_timer
Date: Wed, 11 Aug 2021 00:50:46 +0100
Message-Id: <20210810235047.177883-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210810235047.177883-1-phil@philpotter.co.uk>
References: <20210810235047.177883-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused variable from rtw_init_recv_timer function in
os_dep/recv_linux.c

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/os_dep/recv_linux.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/recv_linux.c b/drivers/staging/r8188eu/os_dep/recv_linux.c
index e0fbc5751391..74d76b2baebb 100644
--- a/drivers/staging/r8188eu/os_dep/recv_linux.c
+++ b/drivers/staging/r8188eu/os_dep/recv_linux.c
@@ -211,7 +211,5 @@ static void _rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 
 void rtw_init_recv_timer(struct recv_reorder_ctrl *preorder_ctrl)
 {
-	struct adapter *padapter = preorder_ctrl->padapter;
-
 	timer_setup(&preorder_ctrl->reordering_ctrl_timer, _rtw_reordering_ctrl_timeout_handler, 0);
 }
-- 
2.31.1

