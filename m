Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86B532E121
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773782237; cv=none; b=OcrlfGl7V8Udndj6uYb8df89d+QPSqfCvZXHBMKfSZRwGFj5+pHIybAO3S/fFjMHjDmMNtL8WqOIZweFcBJ2qeQKElTQ20yGpLOt9CKVZT+egbNDwhSlUgOTxNouINuUelbR6RCGp6tuhe2UH+59DVjpnqKJulpdD40gdSNAcnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773782237; c=relaxed/simple;
	bh=1S9lDlu/x97TsP/WWrDi53PQd5spyLKCkNoNsuVAow4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XnjzXpRnOUvffRw35j2u48CNzn56jubZmd80cq+OHKfPsnOoHrZwOJZpGlZTf8FmVEDFJLE/Gm2T4WIjLvnTo5ZD/2fizPy5qTp8MyMyUXaSp3v4oEHow/rA6wFxTRcWmesJnT6EF/Hrn5A9eQz2h8wxgjxCnipeaBqmSa0sOGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V4zTRNnh; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4zTRNnh"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a49fc06b4so47893671fa.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 14:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773782233; x=1774387033; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0fyMktyhZQ4/nntQbVatF5P/jsJ0+yYs8f8wPeGzK8=;
        b=V4zTRNnhGpvM8RVTNI6QUnHW9HN3+x34Y0vNbX+57vEggeW9pqLg5ix+3Lq7P+BrI9
         HpQyxLcHf15+P1dK0ct9H+T8/C6gxRrjASWqRbQFcRtXIGV5qAKkQN2GI9jzJ3Bh9gYQ
         8qvrI8k2BXyvdUfbxYjNI+NjyCxujLgFxFgpw1KV2nTqIdLuZHZ6SZmtNjGx4KWoNID7
         QFPdsEBy3xyN5NRrDfnBUr+PzfhtgME1m9LESGnZ/TozkqtTJP2ySO1X861xGvYN+vyU
         5fs5K3RjiK5HcEAMAFhjZpdFwjb4bTKg9MjlpKv+NxfJHlxfoUpPafGW3wnQj0UEkMx7
         PxCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773782233; x=1774387033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0fyMktyhZQ4/nntQbVatF5P/jsJ0+yYs8f8wPeGzK8=;
        b=EusL4qYzN4wut1k0M5J4e3VscJNR9JI1lVJA7p6FFA5n1j3J/lL8onvO/nVycsrrsZ
         DR/NUmvy8jPd2fr0JXj+dVUOQCgSxhq7nk0ilS/cO+0cilpvHKgcOx6S0EIPCRY5yjz5
         gNsc15WVCD6JweCpm3+0DpAotWx1wNYD3XYei0Pfiro9CP76MmH1+BAfjX8PSmxMYYPb
         1sWyLOXsNbmLieDImlsgVD6B2icJqC0YBD6KWOScfRxF3aZPrIK8EGNKIxrsWDlVflra
         e31Sbt7yFSA5GGRJ0p8O11qwGY+Bx7dsSoituJGDrcLPACw+UKxWV/4ZTvSvVACA8/Pu
         aJLw==
X-Forwarded-Encrypted: i=1; AJvYcCVvjr46LI8nra+Yuq//ncQKh8rBkPbh/P7L9irqbXy+cRC9NmoJRfx7rvXAeyjMllBPwWSuC90LpZbdAJCg@lists.linux.dev
X-Gm-Message-State: AOJu0YyJRSO4hUyaIECPrtT4AN9vihtq1bNvKfA5Wq8M7i9WqU1SRvcw
	VJtjNxe1D4VV4cig09x6xzZ7D00UZ2twQNKlS7PQJ+JusJvuoDz85Ub3
X-Gm-Gg: ATEYQzx+9m6raSM1AwDrwVkrNTPG1MuBCMN+sM3zA6dEb/SUKNwMcgwU36dO37mpobU
	K5mr+wzmh2AcNZPInSv14NQcScQ38O0i81W397UDAKspaTs4DGHybe6kX5xlelQJaQHBJNl9VJQ
	10atdcn+ZPhrWz1KNj/+rvKvg1mki8YdyTlF9Brbw3dYP/MwI2tXeYdDbp2xE/9JjBg+z+dSQ/T
	STQA/HqHmcE3/CdEAAiUc/TsRE6Rn7U8wQGymab+FxufwjaVJ1FRCKwc5SmtKZnJzxEZ6CtU7OY
	iQ4lLTPnHoCq53SvRBWFMfxQzQhYYWkrIM4XXe+rUca6Oqicy/MKyUDawtIxfNWviAlXxcnFzEC
	gQaXdLya+VdbhMlDndBBOHWlHDILWtzO7Ngg89QH6OHzIObjPB4Kv7PqFblneWk33Cm0cKa1Jlx
	VObL6gFT/wI5nw1jGWRS0/hSIPpRjai2w1lVAxZjcIH5Zpa41Urs2rjvq9EZ+F1ep2CmEgWs4rc
	g==
X-Received: by 2002:a2e:3218:0:b0:38a:4197:862c with SMTP id 38308e7fff4ca-38bd57ed443mr3342951fa.9.1773782232850;
        Tue, 17 Mar 2026 14:17:12 -0700 (PDT)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bd54bc645sm1716991fa.30.2026.03.17.14.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 14:17:11 -0700 (PDT)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: dtwlin@gmail.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: greybus: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC in uart.c
Date: Tue, 17 Mar 2026 22:16:51 +0100
Message-ID: <20260317211651.8098-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace deprecated DEFINE_IDR and idr_* functions with the modern
DEFINE_XARRAY_ALLOC and xa_* equivalents in the greybus uart driver.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/greybus/uart.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..6af0a3b4d2c4 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -67,7 +67,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -342,7 +342,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -360,12 +360,15 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 static int alloc_minor(struct gb_tty *gb_tty)
 {
 	int minor;
+	int ret;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	ret = xa_alloc(&tty_minors, &minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
+	if (ret)
+		return ret;
+	gb_tty->minor = minor;
 	return minor;
 }
 
@@ -375,7 +378,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +987,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.43.0

