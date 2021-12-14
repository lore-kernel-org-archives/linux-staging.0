Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3903D2CA2
	for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 16:16:58 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id i12so14653961wmq.4
        for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5DMKsH1cCiElIcvlchVrud05bdBtUx8WxuBusFpvIlQ=;
        b=xty511YeuRTDMbnIO3IEz89SkP9HsC/N6v112nakzzwPZAEgplHV6cYWMBlRmVbNFD
         Hw9o23EQFloHp/o8WLnLIG8novQzwcegulCnIW9HO4iHXTwrNIjAFi1+WdrRLAUmw0o/
         iBVzL0UQN0KE8GZGl/kI2r0ltq4a5589tDlLl2gX+EIdiAcPEiDbZdsCp36tc0m5r6xA
         MRKh9sJx4fgRGTZBf7hh0N4CwZDx12GqMFoneAPR6StIRIwSLt30/JX+KZ+rabxlTmMi
         x31sQJJhVG+myeWdcppENgbBhOU9OmewYynqhvHtgw1d2kY1a0aTcyyw6UjiFvs+K6w3
         EEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5DMKsH1cCiElIcvlchVrud05bdBtUx8WxuBusFpvIlQ=;
        b=n15T0xSM+47Qf9+bEcCpNKhfy6ZTUz19iNy6BvwykBenoBuDTXK6619GlNQ3NuGzkX
         0+B2w2DZVTOTlgbV9wpy6QKRWogLFGETimHN1KnVr1C8ZLAblS29IrKOwAYyYCVIWY1r
         lNOhG6rSLuU9Bhp9onpW2wucyjSBgLR4U2UHri0kQ7aIdYTJ9W3+zvwvC83MsmvraDFs
         KiQPuyoECbqGsu1gK/65pxVKfHjrMnUEiznJ2jwvlB36pUVM52XNViPSWnA7X12jJD4K
         Kl8q1MvTi3/NpAfx8swOcescRFtp5JHaAObE7/f3jN19ubtpsL9UDv9FlvVb2VHz76ei
         lIgA==
X-Gm-Message-State: AOAM531M/T6C4N8p55/8l9NiwitvE70vcisE4AD9KVM0A0VX17K/6kac
	1v0G1cWRNcAjoP2DMWWxdeLA7fQfi3RDlf7Q
X-Google-Smtp-Source: ABdhPJxbC5ThkNwS+fn4bggjwWj1iTz5yWy2QITxtbnVLkM3XfCqpR8BEbecGTpn1TJ0uEhDwtG4dQ==
X-Received: by 2002:a7b:c257:: with SMTP id b23mr8287134wmj.67.1639498616631;
        Tue, 14 Dec 2021 08:16:56 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:51 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 13/18] staging: media: zoran: fix counting buffer in reserve
Date: Tue, 14 Dec 2021 16:16:31 +0000
Message-Id: <20211214161636.1886900-14-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214161636.1886900-1-clabbe@baylibre.com>
References: <20211214161636.1886900-1-clabbe@baylibre.com>
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

