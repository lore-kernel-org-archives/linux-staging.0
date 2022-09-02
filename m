Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503F310EE
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 14:37:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5461DC433D7;
	Fri,  2 Sep 2022 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1662129452;
	bh=4P622UOknA/VmH8i66gt8bdS6WvFSwysuSf4IiMOeiM=;
	h=From:To:Cc:Subject:Date:From;
	b=2XfWyANI3DXGdm+59zRpRVM7vKPJ4+22cOxYWewPvstZ3OdMUD5owac7EPEkWk7zM
	 tzGmVkon/n1qJPq0O5VhH+aTsxpHkWnhYYVbhiU41Ezevyjgl8xaNiMCa4/4vi4FO2
	 u4OrIisrX5U3B4AEiRJhPO4Ts8uDPRAHlrw87bPg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	stable <stable@kernel.org>
Subject: [PATCH] staging: greybus: audio_helper: remove unused and wrong debugfs usage
Date: Fri,  2 Sep 2022 16:37:15 +0200
Message-Id: <20220902143715.320500-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207; i=gregkh@linuxfoundation.org; h=from:subject; bh=4P622UOknA/VmH8i66gt8bdS6WvFSwysuSf4IiMOeiM=; b=owGbwMvMwCRo6H6F97bub03G02pJDMlCopK2VlUqF6VkZt366PShec0HbvWTfDqnJry8xZjc7/B1 x9QvHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCROk6GeYYHXurO+8occDPBYr3GzG fLMy5mLmGYZ7b0ef0Gvd+Tlk875nxrWste9sitDwE=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

In the greybus audio_helper code, the debugfs file for the dapm has the
potential to be removed and memory will be leaked.  There is also the
very real potential for this code to remove ALL debugfs entries from the
system, and it seems like this is what will really happen if this code
ever runs.  This all is very wrong as the greybus audio driver did not
create this debugfs file, the sound core did and controls the lifespan
of it.

So remove all of the debugfs logic from the audio_helper code as there's
no way it could be correct.  If this really is needed, it can come back
with a fixup for the incorrect usage of the debugfs_lookup() call which
is what caused this to be noticed at all.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
Cc: stable <stable@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/greybus/audio_helper.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 05e91e6bc2a0..223987616e07 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -3,7 +3,6 @@
  * Greybus Audio Sound SoC helper APIs
  */
 
-#include <linux/debugfs.h>
 #include <sound/core.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -116,10 +115,6 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 {
 	int i;
 	struct snd_soc_dapm_widget *w, *tmp_w;
-#ifdef CONFIG_DEBUG_FS
-	struct dentry *parent = dapm->debugfs_dapm;
-	struct dentry *debugfs_w = NULL;
-#endif
 
 	mutex_lock(&dapm->card->dapm_mutex);
 	for (i = 0; i < num; i++) {
@@ -139,12 +134,6 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 			continue;
 		}
 		widget++;
-#ifdef CONFIG_DEBUG_FS
-		if (!parent)
-			debugfs_w = debugfs_lookup(w->name, parent);
-		debugfs_remove(debugfs_w);
-		debugfs_w = NULL;
-#endif
 		gbaudio_dapm_free_widget(w);
 	}
 	mutex_unlock(&dapm->card->dapm_mutex);
-- 
2.37.3

