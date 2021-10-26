Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90012CAA
	for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 19:34:30 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id p14so103801wrd.10
        for <linux-staging@lists.linux.dev>; Tue, 26 Oct 2021 12:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DMKsH1cCiElIcvlchVrud05bdBtUx8WxuBusFpvIlQ=;
        b=6CjYEZ3CK1EqlDI0t9dOdnu+cEXmTY48mhlJAD2Y6dEbYN3h17xoHRuCjK5us/YsyH
         zUoh1FykakIYHSs9TTp1cDHyhFdnW83GJ9SD05thlpOlTeXqu7NU801GNQSGOOLSIo30
         B4P4N7mCDYFFDLHgLcXeHpx7mMMN4eE2taQ9+hErGyWpQI1komcrm9HnTHge0jExbOXv
         3/Oji8Y7Int6PI/He22xbDcY6Fj/Xg5844j83Q2At/w/vXq08JEhY9+F3N9b+XkR5TcU
         UlzhncqYhjEvfp7KWC6ah+Th+2pRgQN1JH365RkEW58LQrstcYYD1KdZedGTZUcCt4Ss
         h9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DMKsH1cCiElIcvlchVrud05bdBtUx8WxuBusFpvIlQ=;
        b=VKNKuyMBBwt1PiFfNdTIMpQdIyIWvDkGF7sxe2dcE65dV833Nm0L4Hc8lOuNn3SITo
         vQLtgrgdK8jCx6t1NjKK8prDSCRoR4Wty6mQ1+25WsXqZLfOiW1Uyq3V0fkI9TmNL1gP
         Jkys82upL5kTCFODIulFhvPTI9DvUBwtnDBcJBGp9xdbA2JzFW6l2jjoi83Oc+VEJ5ml
         PehUFDObFs9fuHkq7V5QhD16rbjdXnkbWMtrScdccF0p+3sDOKkpI8Rhry9pEzO7wxPc
         6LUkHFzJtoqNHTZ2QX1FAUAXUZGhCMVxeYJnJWyhxkxNKz0wEdaYXRhNA5KypDfqQTMm
         GCAA==
X-Gm-Message-State: AOAM532+YI+HlMLUYRD2cz/wYDmzfyQWAN6srVa3xv8Mb1/JwQSnc8pX
	qQBjih4GjEKGfvaYh5uhr7Lh2A==
X-Google-Smtp-Source: ABdhPJwpDrxahnldZNraYy8KvooyJn1BfvcSwn+IV16qVBBvx/SeqaLGvIMJfKdV+KIXuJDy4wCttA==
X-Received: by 2002:a05:6000:15c6:: with SMTP id y6mr34034952wry.382.1635276869433;
        Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:29 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 13/14] staging: media: zoran: fix counting buffer in reserve
Date: Tue, 26 Oct 2021 19:34:15 +0000
Message-Id: <20211026193416.1176797-14-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After each capture, zoran driver complains that it remains some unused
buffer. This is due to a missing count handling.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/zoran/zoran_driver.c b/drivers/staging/media/zoran/zoran_driver.c
index 31993c266976..32d76876c683 100644
--- a/drivers/staging/media/zoran/zoran_driver.c
+++ b/drivers/staging/media/zoran/zoran_driver.c
@@ -887,6 +887,7 @@ int zr_set_buf(struct zoran *zr)
 		return -EINVAL;
 	}
 	list_del(&buf->queue);
+	zr->buf_in_reserve--;
 	spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
 
 	vbuf = &buf->vbuf;
-- 
2.32.0

