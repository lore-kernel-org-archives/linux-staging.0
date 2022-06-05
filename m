Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF30523C7
	for <linux-staging@lists.linux.dev>; Sun,  5 Jun 2022 23:18:39 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id h1so10812281plf.11
        for <linux-staging@lists.linux.dev>; Sun, 05 Jun 2022 16:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g3BmJglTAjdnPLCGYhrHUrRvgHR+8N25cKSWQP4OWdo=;
        b=ZAA3tFmKdv+hsGYm0P0OrG8/DX9rjJq2pyOvCXV69jvY+yDW/qejLqet7DFf4kJGkW
         a166XTuZRJPK82neRxN6fzYaAF+pqPSOVt+HnFAALjE9v3PGWFsfhpKRDS8NbFKrXQ4Z
         PvDD4J3CIthf1j8sOj8qIUfa94RLiByPZ2cMjVOMwbTmxudUsltxSC3Jq5jWReWbl7bd
         NeBTg1T93iIDg0dgzHUh8zwtZqJCOSNGKTgIuq4PlFgA5JvlpqTGd0RJ6onZtFgHs4o2
         HbKPNQnB4K/+EnfQqfxgyGkqjjbKbdi4Gdauzrj8sKFO8vGupI8A9zux47P51yWf1/M0
         9AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g3BmJglTAjdnPLCGYhrHUrRvgHR+8N25cKSWQP4OWdo=;
        b=snawF9ffoOuMdjtY/bWFNOZUjysTNge7YqrKQctlkdTPN1xRNITUDnCKqkwhcjOfC8
         1Ua/5QG3czbTz85K5cyyX2PznCqmOk9SI+2wPK2xhsStQ5xtOEKxfIr9qMA6m8Le+eOW
         zZHsQ7WMMW6hZdqhG2+tYWlpAeaACGWkuLOKxqcSlIDwzW2ERxzBDy7qJG53ukREPrq5
         4egwrTIJR2QG6gaRHJRQbTi8XmGxd/dX/OjiDTxKNseL2tPo/CcTPBu8fad5rt1Z1sA7
         o5gCR8xQW0ZvLbTemg5uBNtBPsVQBBEWR5PB77BNDok2xWXg/K4i2ktk8lA3tij2hkJ0
         BLlA==
X-Gm-Message-State: AOAM530672pBwN8Y1W3sHrZ7nOw2uuL5M55etDEDkdu2xm7wFuKxANyk
	QajATmh1N2Fvt1GVFQeWAjg=
X-Google-Smtp-Source: ABdhPJziDtmWG7/wz+O6OHwkY+cBzggnGgVgcvrHu3ixyvAj7J0WuFlqaijreDNHDRPBf4RSn78ITQ==
X-Received: by 2002:a17:902:d48e:b0:167:5752:3b43 with SMTP id c14-20020a170902d48e00b0016757523b43mr11355808plg.52.1654471119415;
        Sun, 05 Jun 2022 16:18:39 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:1c1:4202:28a0::ec2b])
        by smtp.gmail.com with ESMTPSA id f21-20020a170902f39500b0015e8d4eb1d7sm9051948ple.33.2022.06.05.16.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 16:18:39 -0700 (PDT)
From: Jared Kangas <kangas.jd@gmail.com>
To: vaibhav.sr@gmail.com
Cc: mgreer@animalcreek.com,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	kangas.jd@gmail.com
Subject: [PATCH] staging: greybus: audio: fix loop cursor use after iteration
Date: Sun,  5 Jun 2022 16:18:06 -0700
Message-Id: <20220605231806.720085-1-kangas.jd@gmail.com>
X-Mailer: git-send-email 2.34.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gbaudio_dapm_free_controls() iterates over widgets using
list_for_each_entry_safe(), which leaves the loop cursor pointing to a
meaningless structure if it completes a traversal of the list. The
cursor was set to NULL at the end of the loop body, but would be
overwritten by the final loop cursor update.

Because of this behavior, the widget could be non-null after the loop
even if the widget wasn't found, and the cleanup logic would treat the
pointer as a valid widget to free.

To fix this, introduce a temporary variable to act as the loop cursor
and copy it to a variable that can be accessed after the loop finishes.

This was detected with the help of Coccinelle.

Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
---
 drivers/staging/greybus/audio_helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 843760675876..07461a5d97c7 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -115,7 +115,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 			       int num)
 {
 	int i;
-	struct snd_soc_dapm_widget *w, *next_w;
+	struct snd_soc_dapm_widget *w, *next_w, *tmp_w;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *parent = dapm->debugfs_dapm;
 	struct dentry *debugfs_w = NULL;
@@ -124,13 +124,14 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	mutex_lock(&dapm->card->dapm_mutex);
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
-		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
+		w = NULL;
+		list_for_each_entry_safe(tmp_w, next_w, &dapm->card->widgets,
 					 list) {
-			if (w->dapm != dapm)
-				continue;
-			if (!strcmp(w->name, widget->name))
+			if (tmp_w->dapm == dapm &&
+			    !strcmp(tmp_w->name, widget->name)) {
+				w = tmp_w;
 				break;
-			w = NULL;
+			}
 		}
 		if (!w) {
 			dev_err(dapm->dev, "%s: widget not found\n",
-- 
2.34.3

