Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7B3173
	for <linux-staging@lists.linux.dev>; Tue, 28 Dec 2021 13:55:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D690C36AE8;
	Tue, 28 Dec 2021 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1640699745;
	bh=o9QG8yiIHBeDVV2wCohop+8PiLu2SkLHqi375SZTvoA=;
	h=From:To:Cc:Subject:Date:From;
	b=c5nmRaRC/Z1At1jCUXPEaiboPu5ZKEDScaD195HtOjN1ehZG09xSSOiOsJYKs4zqG
	 9Yw6w3ocGrofjgn+KJ2pf1+bS1bqn7HJvaCT0XUR0bhF7OW31Lv1SenyeRqT/QeLk7
	 4MS0N8OaYNJZww+9me6Lon3huPeZe6ecBSQGuv/0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: greybus: auto_manager: use default_groups in kobj_type
Date: Tue, 28 Dec 2021 14:55:41 +0100
Message-Id: <20211228135541.380275-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1625; h=from:subject; bh=o9QG8yiIHBeDVV2wCohop+8PiLu2SkLHqi375SZTvoA=; b=owGbwMvMwCRo6H6F97bub03G02pJDImnxaNvPfcujbQTT41cuqT6vrByx679Tr09u6f+7Jru+m/7 BlWGjlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZjIhkaGBSdD7wt9dplnVX5PQ4Tbdt rl2RsmdzAs2DHp/PuTN4O9Jsgbf7/MKp3r1nf7LwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

There are currently 2 ways to create a set of sysfs files for a
kobj_type, through the default_attrs field, and the default_groups
field.  Move the greybus audio code to use default_groups field which
has been the preferred way since aa30f47cf666 ("kobject: Add support for
default attribute groups to kobj_type") so that we can soon get rid of
the obsolete default_attrs field.

Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Cc: Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/greybus/audio_manager_module.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 525cf8f8394f..0a0f0a394c84 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -142,11 +142,12 @@ static struct attribute *gb_audio_module_default_attrs[] = {
 	&gb_audio_module_op_devices_attribute.attr,
 	NULL,   /* need to NULL terminate the list of attributes */
 };
+ATTRIBUTE_GROUPS(gb_audio_module_default);
 
 static struct kobj_type gb_audio_module_type = {
 	.sysfs_ops = &gb_audio_module_sysfs_ops,
 	.release = gb_audio_module_release,
-	.default_attrs = gb_audio_module_default_attrs,
+	.default_groups = gb_audio_module_default_groups,
 };
 
 static void send_add_uevent(struct gb_audio_manager_module *module)
-- 
2.34.1

