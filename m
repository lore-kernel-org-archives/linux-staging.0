Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42E3625
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 10:30:00 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id o12so4930372pfp.5
        for <linux-staging@lists.linux.dev>; Thu, 07 Jul 2022 03:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/JzY69fgYbq8dtADJobUrT4pb7r35M4xnJaXr87cK3U=;
        b=H+xC/JzJAjejawJ/efz248qDuBh0H+5AWjx2WlMJLt805GkmIURdV5zWPe3SrPygG1
         wvXk8j8wSw4+0mSRfzGu9x6xHzsMuth/4f9fz3CskDOJPr7bCA6d+X8nYMk+jUTYLT7n
         96UT+CbJkmtUBkoFffH8uPWNun1i/vewXE+xJkhP9ovGPFhGXuq3DKxoZYUjJm5fP9Ke
         D4j50fEIfYY+fZThRFkAi5Zu2j32BMR4U9TtWdybP0E9rk12BGq4nmax7vzrnSYPlySF
         yrvUiq0JaRL4SO5a1chl4opvxt0pKsWUioG22Np0aLXtrPTIMriMIM1YJEa1gTRL+n9A
         eW3A==
X-Gm-Message-State: AJIora9VPO6o2Sh9w/bYPkpuAyvHllfURnKZftZhgU43YavmflJxQNYZ
	5fRyWzgdiJfYLA+dNRrLfLk=
X-Google-Smtp-Source: AGRyM1sP5WYD/HQ6rAdWuX3ltvmMcNxBEYTPCu9kKK5hzBuh5N6HbxYmHp/HV+1kgm1U4f9RpXQjfg==
X-Received: by 2002:a05:6a00:1a15:b0:527:d02b:29c6 with SMTP id g21-20020a056a001a1500b00527d02b29c6mr49866585pfv.23.1657189800287;
        Thu, 07 Jul 2022 03:30:00 -0700 (PDT)
Received: from karthik-strix-linux.karthek.com ([61.3.52.131])
        by smtp.gmail.com with ESMTPSA id f73-20020a62384c000000b005251ce498cfsm2725939pfa.191.2022.07.07.03.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 03:29:59 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:59:54 +0530
From: Karthik Alapati <mail@karthek.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: don't use index pointer after iter
Message-ID: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There are some usages of index pointer of list(w) which may not point to
the right entry when the required entry is not found and the list traversal
completes with index pointer pointing to the last entry. So, use w_found
flag to track the case where the entry is found.

Currently, When the condition (w->dapm != dapm) is true the loop continues
and when it is not then it compares the name strings and breaks out of the
loop if they match with w pointing to the right entry and it also breaks
out of loop if they didn't match by additionally setting w to NULL. But
what if the condition (w->dapm != dapm) is never false and the list
traversal completes with w pointing to last entry then usage of it after
the iter may not be correct. And there is no way to know whether the entry
is found. So, if we introduce w_found to track when the entry is found
then we can account for the case where the entry is not actually found and
the list traversal completes.

Fixes coccinelle error:
drivers/staging/greybus/audio_helper.c:135:7-8: ERROR:
invalid reference to the index variable of the iterator on line 127

Signed-off-by: Karthik Alapati <mail@karthek.com>
---
 drivers/staging/greybus/audio_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 843760675876..7c04897a22a2 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -116,6 +116,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 {
 	int i;
 	struct snd_soc_dapm_widget *w, *next_w;
+	bool w_found = false;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *parent = dapm->debugfs_dapm;
 	struct dentry *debugfs_w = NULL;
@@ -124,15 +125,18 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	mutex_lock(&dapm->card->dapm_mutex);
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
+		w_found = false
 		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
 					 list) {
 			if (w->dapm != dapm)
 				continue;
-			if (!strcmp(w->name, widget->name))
+			if (!strcmp(w->name, widget->name)) {
+				w_found = true;
 				break;
+			}
 			w = NULL;
 		}
-		if (!w) {
+		if (!w_found) {
 			dev_err(dapm->dev, "%s: widget not found\n",
 				widget->name);
 			widget++;
-- 
2.36.1

