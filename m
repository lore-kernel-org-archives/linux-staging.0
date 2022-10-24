Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA736AD4;
	Mon, 24 Oct 2022 20:15:40 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id y12so13056279edc.9;
        Mon, 24 Oct 2022 13:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JN/xnHSP6Pihw6a6lZykPULIKG9MjkS5qFCv+jz3gxE=;
        b=N+mfby8BkFCNhHQz7lyhNuAhDS+hrHknVOORsYO4JvozUCR/K0WBM3Gkg+waQhOIJU
         ScQUzjqOj3QzhJsGYier6ZIGKS1frZcxct4YTR2WB2IR76EZtDACbTGZF8/6t0sLZgcE
         zsCQlFhC1wwE/b8wxRBf+NGjmvb9ujEBStU9ZVNtEhULQhK4bCSIZqOpHKRNGNv+Klk7
         c5Z5UwpUK9WvQnvtbgKFnH48IachlfG3LEgdh7U7zLAUF51XEU0Eo7HNa8KuuiEehQrT
         VshVg1k6XWtl6UuAxRFdarT4wCFj3F2pjHuoR4ecbQs9vnZ5+kMd1RKj7kGVlNP9aPZ7
         xf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JN/xnHSP6Pihw6a6lZykPULIKG9MjkS5qFCv+jz3gxE=;
        b=akFOqj8iHpdkErs5l7gWj3oMTxhxsoiNs9Sy/2oW1bSdD+rgw0wgR09KcJeMTOHO5u
         9OLaVJnXLQQOAOcVJ94MgG4N0j2NgUNxanI3YRkFK8OqA6jEMTkqN+zZQj07SGn1vsgf
         MGBNDPFX96QN8EiC75YWtYEfyTFZemXviMJGjD8izX9JoWTm5bwNZ130dvR2R4UoMqnb
         0DeVlxD8BqfepTs5jLyVx9c9xpJZP+mkCzcLj9oJP8wIJMJdI1cWCi2c3N7h46ioNRbT
         MvvJmqYeGhPT0m0pE/ELV2xAXKclHttKWSrdIUemCUMnQUOeQsV7xw+5749qL0qN0sQf
         gMSQ==
X-Gm-Message-State: ACrzQf2/SUrkAM5NtI501GubahxcGdK/D94rCWbKPlDvAqbTqhzmHXLy
	Ivrzp0ToIpNrEkDmjcjEvCA=
X-Google-Smtp-Source: AMsMyM5NCp8Ra8AQSeVxpj+GvLgPxRsEc1A1IvATEsJOerZ0+NbOQamGtZVb7tuTMUFX77oXzqaiww==
X-Received: by 2002:a05:6402:1d4f:b0:461:d2ed:788c with SMTP id dz15-20020a0564021d4f00b00461d2ed788cmr5199794edb.418.1666642539269;
        Mon, 24 Oct 2022 13:15:39 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id op7-20020a170906bce700b0073d638a7a89sm332023ejb.99.2022.10.24.13.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:15:38 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 09/11] media: cedrus: initialize controls a bit later
Date: Mon, 24 Oct 2022 22:15:13 +0200
Message-Id: <20221024201515.34129-10-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024201515.34129-1-jernej.skrabec@gmail.com>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While it doesn't matter if controls are initialized before or after
queues and formats from open handler standpoint, initializing them last
helps keeping s_ctrl handler simpler, since everything has already valid
values.

This is just preparation for follow up changes. No functional change is
intended.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index 8cfe47574c39..70b07d8bad2b 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -354,27 +354,27 @@ static int cedrus_open(struct file *file)
 	file->private_data = &ctx->fh;
 	ctx->dev = dev;
 
-	ret = cedrus_init_ctrls(dev, ctx);
-	if (ret)
-		goto err_free;
-
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(dev->m2m_dev, ctx,
 					    &cedrus_queue_init);
 	if (IS_ERR(ctx->fh.m2m_ctx)) {
 		ret = PTR_ERR(ctx->fh.m2m_ctx);
-		goto err_ctrls;
+		goto err_free;
 	}
 
 	cedrus_reset_out_format(ctx);
 
+	ret = cedrus_init_ctrls(dev, ctx);
+	if (ret)
+		goto err_m2m_release;
+
 	v4l2_fh_add(&ctx->fh);
 
 	mutex_unlock(&dev->dev_mutex);
 
 	return 0;
 
-err_ctrls:
-	v4l2_ctrl_handler_free(&ctx->hdl);
+err_m2m_release:
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 err_free:
 	kfree(ctx);
 	mutex_unlock(&dev->dev_mutex);
-- 
2.38.1

