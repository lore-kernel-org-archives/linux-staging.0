Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9892CA4
	for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 16:16:59 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id o13so33203272wrs.12
        for <linux-staging@lists.linux.dev>; Tue, 14 Dec 2021 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jsAZmzA84HYr0fSj6Nj30TuRXcwtejrxLGTaWhzAlMQ=;
        b=Jkgd5bP2htU6ML5q7CKo+fwr8qGgeOdl7vKmxlxevccWOC5a+p7ykDSeeS2ziPy/s+
         GEwgjtqrspok2T/pINKHxN1vu+b8eIloHYQjoLvRfacYMNDLKmmlRfanyR19mttzDchO
         P6CspvtzORLWonE9y0FaoQLjH7lRsOt8yWqhoFGe/nZDwfF2+QmoL4nk6uEF/Hk2fhcE
         PDRcBz9jK9PlalTp6Cfzuz+56i+EcgKCKeXQ6SuLUkJlBA0VMCNg6xytq12dUfzI2x1G
         DGGO7aB1qSddlKfLoF9drhc1ekejuFpy4g9vlr/CgjnmWA0Uu7a1BsSR7AIpSsxtwU9M
         B/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jsAZmzA84HYr0fSj6Nj30TuRXcwtejrxLGTaWhzAlMQ=;
        b=EI7YL8rDGGslAvBIW8hM6gMvvEBjO9T15dfzcTGK9VCk4kiwbnswA+NSQPnWUj6jyF
         Qx11ZPM+UT2ezVVONuWgJ83rjPwFfPy0JvzNv3ahB/0IMu4pLUZTjEf5CegxxgLR7KPa
         sIs3Fu5kIEvhRADFY2EA6j7zWREt758OrFsm4UoJfDuIlF4U7NCCZ3Fg14z52hxJ0Yd1
         8BlmaunaPNNK7QqrDzJnAv895EhYUK+LlMILYZZT9WtzoKfoMAZWEcrlUAXLqeJExA9F
         6vcfyfh9iHgq7b73n3cSdW2YeeRxgeti7BlwoRz567l0bxmGNWIORwQB9onmDfupQHgo
         Ri4A==
X-Gm-Message-State: AOAM5333KYy5+Cv0i96a25ggblgmGj2HJq5Bo8o6zOafvgNXDeHxcsFv
	ZWbIiniFoM1Kw+4A5sjcvFj2MA==
X-Google-Smtp-Source: ABdhPJxnf2p7/7jIa5LrKasySq737CXPpzkhbrROQqeWGNd+jJArY7j2Vhv5EdFT0fhauh2j0pcoHg==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr6781251wrr.152.1639498617427;
        Tue, 14 Dec 2021 08:16:57 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:57 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	mjpeg-users@lists.sourceforge.net,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 14/18] staging: media: zoran: calculate the right buffer number for zoran_reap_stat_com
Date: Tue, 14 Dec 2021 16:16:32 +0000
Message-Id: <20211214161636.1886900-15-clabbe@baylibre.com>
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

On the case tmp_dcim=1, the index of buffer is miscalculated.
This generate a NULL pointer dereference later.

So let's fix the calcul and add a check to prevent this to reappear.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 5b12a730a229..294e459307c3 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -814,7 +814,7 @@ static void zoran_reap_stat_com(struct zoran *zr)
 		if (zr->jpg_settings.tmp_dcm == 1)
 			i = (zr->jpg_dma_tail - zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
 		else
-			i = ((zr->jpg_dma_tail - zr->jpg_err_shift) & 1) * 2 + 1;
+			i = ((zr->jpg_dma_tail - zr->jpg_err_shift) & 1) * 2;
 
 		stat_com = le32_to_cpu(zr->stat_com[i]);
 		if ((stat_com & 1) == 0) {
@@ -826,6 +826,11 @@ static void zoran_reap_stat_com(struct zoran *zr)
 		size = (stat_com & GENMASK(22, 1)) >> 1;
 
 		buf = zr->inuse[i];
+		if (!buf) {
+			spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
+			pci_err(zr->pci_dev, "No buffer at slot %d\n", i);
+			return;
+		}
 		buf->vbuf.vb2_buf.timestamp = ktime_get_ns();
 
 		if (zr->codec_mode == BUZ_MODE_MOTION_COMPRESS) {
-- 
2.32.0

