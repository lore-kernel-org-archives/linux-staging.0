Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58EDB7A
	for <linux-staging@lists.linux.dev>; Fri, 10 Jun 2022 07:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5CEC34114;
	Fri, 10 Jun 2022 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654847672;
	bh=DBQYB/NWje6Nr8mT58sp4vpMjE0yrhfHsUXtKYObB0w=;
	h=From:To:Cc:Subject:Date:From;
	b=dfpTaBopnWG8CcOHUvKfiXJy+VJv1UcOzVc6Z6N+l9InOyBVJwFs849QCxxzYSuYE
	 EW99L4QqeD0vt0deGSi4RRQGZLn/BRQkWg9sQKk7CdXWoK6+LCkk4fbuCTicgkM9vp
	 /BV/G6fv3ANFXgcuGbSmHfJtVMkPePd1mvH6kfzTsk9fOxLbveFqWaocqtFJNq50M+
	 4WsgShqDTwrP+wdCsuQsAnFQbjzJMgCrF8KRV6oiY+u43X75v9HJ1bPUL/JaHppo+A
	 j2ZVHOVMtOInwISsrCLAUAffB0Knc60YzO/I30TIhiz4+u15AX2HM+kn+J6tZA16Bh
	 Kvzis5ZaKrdBA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nzZTP-0004vk-7o; Fri, 10 Jun 2022 09:54:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jared Kangas <kangas.jd@gmail.com>,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] staging: greybus: audio: replace safe list iteration
Date: Fri, 10 Jun 2022 09:53:47 +0200
Message-Id: <20220610075347.18917-1-johan@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No entry is being removed from the list when iterating the widget list
in gbaudio_dapm_free_controls() so there's no need to use
list_for_each_entry_safe().

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/audio_helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 07461a5d97c7..05e91e6bc2a0 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -115,7 +115,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 			       int num)
 {
 	int i;
-	struct snd_soc_dapm_widget *w, *next_w, *tmp_w;
+	struct snd_soc_dapm_widget *w, *tmp_w;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *parent = dapm->debugfs_dapm;
 	struct dentry *debugfs_w = NULL;
@@ -125,8 +125,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
 		w = NULL;
-		list_for_each_entry_safe(tmp_w, next_w, &dapm->card->widgets,
-					 list) {
+		list_for_each_entry(tmp_w, &dapm->card->widgets, list) {
 			if (tmp_w->dapm == dapm &&
 			    !strcmp(tmp_w->name, widget->name)) {
 				w = tmp_w;
-- 
2.35.1

