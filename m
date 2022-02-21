Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23FF2568
	for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 21:25:26 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id vz16so36556413ejb.0
        for <linux-staging@lists.linux.dev>; Mon, 21 Feb 2022 13:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nVDTTWQgHFeL3Z4LBBVvYUyauggJWpdgcasV3J7UgOs=;
        b=KBwq2co572wFjFwOjkiuBKxrbk513P2a3q1cyMsPdcrqS6PsiDNt+uVR6I+wUY9hot
         hWnDpvPCMasCAnC/C4Sn7dkUE8h/3WeAxvW66DdxZxW3hJf1xeI/Yf3hECujD/yzPf/y
         jYzr1kIwUpD0qWMJIz55divIHmfuFW8CjoRtFoXoeP/aNIxFxRwezEbTqAyKquTw7XSi
         mOQ9EkWbyqjyGGDv/+QKz55Lr883LLq07zPnR8bKTRy7atB67i40hThv+LPMZQkOU14i
         +J6nQwXaJ0S+FXuAgYO0BMCnzP3roxImoFzPlAfDchd4JI73KUn4hFwqaHU0ZRJCSKnp
         i/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nVDTTWQgHFeL3Z4LBBVvYUyauggJWpdgcasV3J7UgOs=;
        b=Ego3+bNZ8+pY+WL9Oj3I1jmRutW8XzI5G8HesloAzd9LqmY4vlfWwfAmVF9uHbJUWy
         LhLa3oMTV5QBgEuE7kGjHtzkocujgb4rRurprxvEHWkm+2GSfI8gVQpfTaIUhz9E7/fO
         4v7BfNI87dyjiYjjBP3cNJ6YSjY3f2cBpmQX/PV9EoVM9S+gC+8x78L+KfB97ngTEkrl
         3MAlnaLihkUU0ui04Wfu4of4uvi3ZPOufC6erXVzgg3DtVrGVL/zNcRUyaRPfptnOCxz
         OM1pFyzzsiJaflJ7b906K5BKpED7v3baCUz0t0WxjK4aiIs5rSF9QmlE3rLRGAaPsGnl
         nTlg==
X-Gm-Message-State: AOAM530+XtcWfVA+SgtMc5EQMuIBvsv+Via08hgQ9jNgtBo0sngKmkqi
	boMZGtN8otusckGx5vD8VGE=
X-Google-Smtp-Source: ABdhPJzD96yGsJKvfZ8rYVMlWsj0ov6XbqTZOXDzvInq0ZEs5lzhYB+XiB5nQQDuhVo+vKa/sQhAJw==
X-Received: by 2002:a17:907:205a:b0:6cf:ced7:4e73 with SMTP id pg26-20020a170907205a00b006cfced74e73mr17397238ejb.536.1645478725413;
        Mon, 21 Feb 2022 13:25:25 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id 2sm5631226ejl.2.2022.02.21.13.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:25:25 -0800 (PST)
Date: Mon, 21 Feb 2022 22:25:23 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] staging: vt6656: Remove ftrace-like logging
Message-ID: <084064a5c94aad940600ae62d6c21bb26629cb2c.1645477326.git.philipp.g.hortmann@gmail.com>
References: <cover.1645477326.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1645477326.git.philipp.g.hortmann@gmail.com>

This patch fixes the checkpatch.pl warning like:
WARNING: Unnecessary ftrace-like logging - prefer using ftrace

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Devided patch into two
---
 drivers/staging/vt6656/rxtx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6656/rxtx.c b/drivers/staging/vt6656/rxtx.c
index a31947f2620d..5839b34b2e93 100644
--- a/drivers/staging/vt6656/rxtx.c
+++ b/drivers/staging/vt6656/rxtx.c
@@ -58,8 +58,6 @@ static struct vnt_usb_send_context
 	struct vnt_usb_send_context *context = NULL;
 	int ii;
 
-	dev_dbg(&priv->usb->dev, "%s\n", __func__);
-
 	for (ii = 0; ii < priv->num_tx_context; ii++) {
 		if (!priv->tx_context[ii])
 			return NULL;
-- 
2.25.1

