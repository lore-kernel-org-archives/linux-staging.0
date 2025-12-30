Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1916F2AD0C
	for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 01:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767058163; cv=none; b=iioD/nsIJjwUBc2FFypseDuQGMfLQER5eTTIvAB1gGcDIa5+qH5QWAMx4HIOIp/p5hzNV6edmcQ/5Y1dqyQmlfL/MgXyQZqiEdQdKfRa4eYrDQrwbAoYKtUSPS0Ve5btohNTL9Bzn9nRbmvmUruJuIxTk+NlQstxdj4ylGU0IPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767058163; c=relaxed/simple;
	bh=z4smCjzgbyLxVTyyQxI8x701+sbXiGbMsA0OzVfWxsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCfXqlijbBZQC3XV8iCBVWVb5C4ImB1YbyZYJjVcjc8E27LHkx8hJRVgGpaUGEgtAezhVvTi7e2CRaDPHaNyblbyqkN0JhVKOGNGVOIKLuYsUnaJW3QoYUq60fyyCgMyRGZL/RKTaHNVm8u6ZO3bTcOAUk0tBa9/NIz51++a8qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+VVojXl; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+VVojXl"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-644795bf5feso8163155d50.2
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 17:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767058161; x=1767662961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4VMCEyZbX49K+uJ8S0Aycwo/Q5cQrq3uBbh2PVpI/g=;
        b=a+VVojXlIxZQvmCN6BEhoHlNhJj/TaMmchU0roFwD7rVSUt5yhwEjHHeRGC4LaU/s3
         ILzESKmHy2Yx4PMmFrv0DxGrh8nBDIIujFj1qrsWFocZumygnOw1gnPl+qHpdFby4PKJ
         6Fe5/Kc1Sq4pnY9Vp7/jeHaK1AHHHW+XuL79JwQYpzkO21tIpChRpgQmkt2Qsp6yJuVP
         d/o/JsVToqeDOthWCOTsw4JerX4qa/r8xyNhYSv9AhnSwD5RwzZb0yS46VeSyXVlk/wV
         mLHF6x8QOdXvJy8ypwjYWoH6IDqECkn2dVq34Jh4YMY+KkLqjR+Y/8k0sxErtifXNyu7
         unnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767058161; x=1767662961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H4VMCEyZbX49K+uJ8S0Aycwo/Q5cQrq3uBbh2PVpI/g=;
        b=XtWHHo3b0VG2red0Sh0HXPB+bSlx7PqavcPWKad195GzMc+vi5QcR8OlOgT3tq2lGj
         BgEmvpG8/OErltFY4fWU+RWY+r66I1YbEEPf/G1Pxa9Kocl4+3yFzR2DBJslqHYZQdEy
         sp/PfwN66pxmun3kqkfua1jLrFm6iasVe+0cTjPVjUv/K0WvobXPoLQPyZ4tvlV19RHg
         6fO96Hnc1J1qGq7KwSrsYPBIGY+NNJ0lqAyp4gskM66vEc57xHKO9nUnIuZBA1GyQGnV
         8fhL6Nbxjcmg8iIRg5GTuy8IiUNt8H6B/F7lgT8K5SVfV4f2LLquCdHxHcfLEBW/u9WI
         +NBw==
X-Forwarded-Encrypted: i=1; AJvYcCX1aTytvDK/4HQxL3qx9DkL6dtGxZ/HAZTvenU4lzpZmgv+Rq+srpat/i+Al08uDGYguiDX9CDvW2ngHXrX@lists.linux.dev
X-Gm-Message-State: AOJu0YxTNCnCnPZVksS3pMQAZvz7CsDFl/jZh3pP38U+6nSPv9R+9nJC
	Vomw1fbAoMWUIithqK1NlLeuN+uQN0J/R4O16YSfFK3MUcn0m8RWboPg
X-Gm-Gg: AY/fxX4ygKKd3Dqw6icgDQzewbN6FOpCp6yRt4HhmrTFFJBql/GVsFMD6dCnGXouOg0
	fek4DCOwRutWwDII/+Ig+5tzZkpF+qJO4tQDidQ41Dv/sJr2I/pxHjky0jeMNzvXlD1wZKB27Mb
	YTpXhQhuvlXBDURsUOZ56vytdYOMt4hkdvCAjr3uO3pTlNqydfHhI4UuQ5xP4fSaN4IurEjRLVK
	R4a5ev9GQj+QBia6VRJfpt82KqrcYamgYx0lB0SgdPAZ3QRwOnim1DpWf/UaHn1GplBeVg6g9M+
	IIGeE7Sf63GjC9Qx5eImrP30nUVCcHJBBaUcZ+VziZBYiJ9Y7b0WsMlMXq7NE8d8xa7aCp6R0Hh
	onuqnYtCYn52drYZjy3INU9qZU8jR5PstjUBtODfb+Nic5Ra7H0S8AKa/WN0TjdyK7a6aMe7G/J
	Pf5kMnLi7Tq7LdCooz0tjSLKyaiIHM5OH0HrWI7uLGusHutWfuRKrqfVcAmSYhWjTuRhoL4IHZ2
	gvkw+I=
X-Google-Smtp-Source: AGHT+IF1uzGQtNSUKHpaPWieWb5HEiYm+y5X8EOW/a99wtyLQIpk+7wpFwjEXhRTJomY9pVjrkwUNA==
X-Received: by 2002:a05:690e:310:b0:63f:a283:9ac1 with SMTP id 956f58d0204a3-6466a9010e8mr21297850d50.46.1767058161011;
        Mon, 29 Dec 2025 17:29:21 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb4376656sm120691687b3.9.2025.12.29.17.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 17:29:20 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Johan Hovold <johan@kernel.org>
Cc: Mark Greer <mgreer@animalcreek.com>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v3] staging: greybus: audio: avoid snprintf truncation warnings
Date: Tue, 30 Dec 2025 09:29:08 +0800
Message-ID: <20251230012908.214959-1-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
References: <20251229112649.137391-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

W=1 reports possible truncation when formatting widget/control names
with snprintf() and a %s argument. Use a small helper and hide the %s
pointer from the compiler's truncation analysis via OPTIMIZER_HIDE_VAR(),
while keeping the existing snprintf() formatting.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>

Changes in v3:
- Replace the earlier scnprintf()/strlcat() approach with a helper
  keeping snprintf().
- Hide the %s argument from compiler truncation analysis using
  OPTIMIZER_HIDE_VAR().
- Add a small local length limit macro with a short comment.
---
 drivers/staging/greybus/audio_topology.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..35775067897c 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1009,6 +1009,19 @@ static const struct snd_soc_dapm_widget gbaudio_widgets[] = {
 					SND_SOC_DAPM_POST_PMD),
 };
 
+/* Limit %s length to avoid -Wformat-truncation with snprintf() */
+#define GB_NAME_TMP_LEN 32
+
+static void gbaudio_prefix_dev_id(char *name, size_t name_len,
+				  unsigned int dev_id)
+{
+	char temp_name[GB_NAME_TMP_LEN], *cp = temp_name;
+
+	strscpy(temp_name, name, sizeof(temp_name));
+	OPTIMIZER_HIDE_VAR(cp);
+	snprintf(name, name_len, "GB %u %s", dev_id, cp);
+}
+
 static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 				      struct snd_soc_dapm_widget *dw,
 				      struct gb_audio_widget *w, int *w_size)
@@ -1018,7 +1031,6 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
 	size_t size;
-	char temp_name[NAME_SIZE];
 
 	ret = gbaudio_validate_kcontrol_count(w);
 	if (ret) {
@@ -1086,8 +1098,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 	}
 
 	/* Prefix dev_id to widget control_name */
-	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	gbaudio_prefix_dev_id(w->name, sizeof(w->name), module->dev_id);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1143,7 +1154,6 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
 	size_t size;
-	char temp_name[NAME_SIZE];
 
 	size = sizeof(struct snd_kcontrol_new) * module->num_controls;
 	dapm_kctls = devm_kzalloc(module->dev, size, GFP_KERNEL);
@@ -1168,9 +1178,7 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		}
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
-		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		gbaudio_prefix_dev_id(curr->name, sizeof(curr->name), module->dev_id);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.43.0

