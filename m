Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE51B2C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 14:28:36 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id 5so29587434edw.7
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 07:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mycPYYzNiy40/QpQ966UCwEVtMGhxE3IcAOGWpXWkHY=;
        b=Xwyw9Ecgu7OEjt+tqPeAThlTdTamtQyQF5yxfjhGsfULy54V8gdNzVPOa08FGAHfNm
         7sJzEmg/z7IT9mCFLBd9IZBBbKdONdhDXCgfjVHUE2QNjvdmgXP0kgzdksjo/5YGpzmL
         NdIynIh78w0e8tLz1nC6RsXeWIAmLWHIJL/VdhbRsKKcCe6m6BxgMLhgF1Zh/hc79wDJ
         fS4IV/IqPLC6nHtwxneif6urdjEjW6ACecDnVW+Tgdk6aLrgDnbMjI/Jfwjk7RaEc7/l
         czWKJMe+4TUqt8lbOxF6Hoexth+TucKBZdgQCgJRvpRQxgKgEFeyoOh87Ju2Kgv4uaoc
         IFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mycPYYzNiy40/QpQ966UCwEVtMGhxE3IcAOGWpXWkHY=;
        b=6wMZSH/2dnzZz2yftRPsUYhLIKpzqr7x4nZ0rCB3YE2MZCmTMqjTxhl5ixmVMqDXXO
         LriiPX6WE9aOmRBHswvsGHCEijrclUnKjHd7CEou/MztsaYUEr8f062bvbtcVZx6K8KL
         RUjjbpiGN92JQQeYgTVIB6Cjp1hrPBzYpXE1AaBBQ+UZoPdbzmgAZKzy3V6XfFFJwzzt
         MCjTK0n1SgHREyykJ1dY+mGMCm9Z3bHQyDBWF0BE9FPPN8m3uHOACsvvq1N+BTxSOmBp
         pzNK087mPgmCa5PIFqSPebgi6Nx/V7z2mMwiuqtMFB6512lT0aU4WkTtErRhK192x9FN
         spRw==
X-Gm-Message-State: AOAM531Hohr6j076MOx9YuEj+2G4XYGphWvRxdK7qx9C+/kolJkPgvqr
	8mZ9kreLS4w9bcOHnwJdT2c=
X-Google-Smtp-Source: ABdhPJyQPKRGwHPaRMBKuAqQuiuaNmagiV6GxgI9HlXVz0jm/s8NZw7AhYTTss9FHr3mhGqHMhrxMw==
X-Received: by 2002:a17:906:af0e:: with SMTP id lx14mr21156096ejb.76.1634480915156;
        Sun, 17 Oct 2021 07:28:35 -0700 (PDT)
Received: from localhost.localdomain.it (host-79-47-104-180.retail.telecomitalia.it. [79.47.104.180])
        by smtp.gmail.com with ESMTPSA id p23sm9094537edw.94.2021.10.17.07.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 07:28:34 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Martin Kaiser <martin@kaiser.cx>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: Remove redundant 'if' statement
Date: Sun, 17 Oct 2021 16:28:12 +0200
Message-Id: <20211017142812.4656-4-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211017142812.4656-1-fmdefrancesco@gmail.com>
References: <20211017142812.4656-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a redundant 'if' statement.

Acked-by: Martin Kaiser <martin@kaiser.cx>
Acked-by: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 6fb79d711692..42084b029473 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -254,12 +254,6 @@ int rtw_cmd_thread(void *context)
 	while (1) {
 		wait_for_completion(&pcmdpriv->enqueue_cmd);
 
-		if (padapter->bDriverStopped ||
-		    padapter->bSurpriseRemoved) {
-			DBG_88E("%s: DriverStopped(%d) SurpriseRemoved(%d) break at line %d\n",
-				__func__, padapter->bDriverStopped, padapter->bSurpriseRemoved, __LINE__);
-			break;
-		}
 _next:
 		if (padapter->bDriverStopped ||
 		    padapter->bSurpriseRemoved) {
-- 
2.33.0

