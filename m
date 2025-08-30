Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D12D6400
	for <linux-staging@lists.linux.dev>; Sat, 30 Aug 2025 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756575551; cv=none; b=n+ezN2YIEHNMfX+isvFedPlUcuBh+MTTR8nG9F54NApPQw8BTkeWSNer1t/FNLUPN864SQFZdPHiNHPLXvyHQKvbuDetfjCxcsJqDU/AKkHtmrIzCa20xJotGKhm513CVokYTXbK9/uABAXrPDnzHGjLAFcsdcXCewwbfpuPtuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756575551; c=relaxed/simple;
	bh=t14jI/u1SV+Q5BrfgSBejLw9iZW+We1ooUjKGSA+KFU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZP4e6r93aX6Fgmef8cuvsIkJonE7OJ20jpqe21YYtrcbAeblgdcDhydMRpIVv+hrK/o7WSMm8eXdLc+CqiqqZaPqZU9/E3VzdacNOfvI8jlKTK59hiDqSIr7/61c7zMxYAc3b3gZYsuJ60IazkECtT7YTRX0HEfIbHjMKssLcrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXSxWrvI; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXSxWrvI"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24602f6d8b6so6744855ad.1
        for <linux-staging@lists.linux.dev>; Sat, 30 Aug 2025 10:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756575549; x=1757180349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xOoCafVA6rbpLZQPmX36iB5alrObXaK1nsnhC+086Mk=;
        b=UXSxWrvIJEXzNOCIWeggKRAu60ecGFAOCLvOQsNgiYJWkth5yHwoAut0dpwXDP8sjJ
         CvHgkyl9FMh94YCpwA+cl09XG4bpRT9PmHLSIt41tfVhvJNfQmDwAPVEKLkh73tMxNoY
         wcPDeMXsebplBo0+VujIszWWyLtvFVmjo+Hl4LlcvTZWtek0m1O6OHbcAVsFrZbklFVm
         apN8eLaFDxfdqCb8XyOGiRqb0QCsunWnDdbabJlQig/eFr0TZLgIEsOQkAa7gbYepn1a
         MAaJZrhQmQpcAJedSSsBTkZr3emGs94O65ghTALZjVeSv7fq5fmW7lzcqbgtkxl4LWIg
         VP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756575549; x=1757180349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xOoCafVA6rbpLZQPmX36iB5alrObXaK1nsnhC+086Mk=;
        b=sr2HGpXYlhkncDuzMVuPlver9Yh0cnUpwNyqu/Hwh9vWGryGgXCwDgcoBH7IGn0yH4
         MP4RJVoSUI4s9pJliT39jX0yyEPfNd+BxJCPltaYruMcBE57qfSVtTD1iV7Oy069XaF4
         aJLuJW8sGPv/MNPj4IeMevrK/rZT1Wc0sWsJRGAqc1VwHOC3w3ii2mpO4B9HX9FTdJUE
         h+UIVCSIDYzhToQeBil7o2oC/gPFsuVy+7gEZWv5vyK3AepsdZojMV3ezOBrwvPBeJGO
         Xy2NZx7Z2sw/VUFIbXPqqUemfRsYB1SXR6KpwRHQGcIgRLgkxlUysbiYFcUOGfxED0wE
         tTAw==
X-Forwarded-Encrypted: i=1; AJvYcCVggTGzqpXag6PT1msj6Cnry2+HHsKyJF5ji0cjfMtOTar/LQ1xFI+k3TPRHRoRxpKJ2A+QKD7UFfgpBbV/@lists.linux.dev
X-Gm-Message-State: AOJu0YxD5OOgpLJPbG/7GWQHtFj+EQPL0IG96xLiQkCGfCzITZRMAf56
	MFIkTDakSAR1M8DMdQet8lvUlAN+q5uewc/Ynaokj6+/GwGkR6d8LwH7
X-Gm-Gg: ASbGncvHj+jPzQDC6yFAVktVKhDPt6yH4CXHAanpgYZa8d/3lxVEbjiDggPJEXDNsa/
	MT9FElmzaJZSfI22bbeCUvGaQY+apbAKUYIEfZ5NEhy2vtY1/naHz0bCCkSPUzWQNClTnV+aWg4
	GskI3P/cTGeIix+QKEewXjUDRJElED2CQsIO0gKW5YNBAvXT0x3kk30ua5SEqYbOQMuVCJE8VIs
	Ld8CiwEOdBeGShyp+GGws8yWy4Uoyu+MGTMjlw4v9HRBMqo1Ny6JRcbviSMb4/PaaeCZnv6T+gh
	lE1rNmccnOPjq8d4L7kc7PkxLUC1RJXoBh/PR3oX4H3Hnxa56n8tNaNuIeLVcsMlTA0cG4OaMqB
	olYnP6AHH5ySCTJMffrOT2WzCP+m2VNH6lbtjLga/Tw==
X-Google-Smtp-Source: AGHT+IHTDqX8ysZkgx+mDXMRZKsxTFu34Ov03/Jj/KOA6Fo+OIeYKzdlGZBtzPGukVtx80QGvKg5DQ==
X-Received: by 2002:a05:6a21:3391:b0:203:cb2e:7a08 with SMTP id adf61e73a8af0-243c8457780mr3986145637.5.1756575549342;
        Sat, 30 Aug 2025 10:39:09 -0700 (PDT)
Received: from raspberrypi.flets-east.jp ([2400:4050:d860:9700:eabe:57a8:cf74:875e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd28ad39csm5154525a12.27.2025.08.30.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 10:39:08 -0700 (PDT)
From: Masaharu Noguchi <nogunix@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	dave.stevenson@raspberrypi.com,
	laurent.pinchart@ideasonboard.com,
	hverkuil@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masaharu Noguchi <nogunix@gmail.com>
Subject: [PATCH 1/2] staging: greybus: audio_topology: avoid -Wformat-truncation
Date: Sun, 31 Aug 2025 02:38:49 +0900
Message-Id: <20250830173850.323897-2-nogunix@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250830173850.323897-1-nogunix@gmail.com>
References: <20250830173850.323897-1-nogunix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

    - Fix -Wformat-truncation when prefixing device id to widget/control
      names.
    - Write the prefix with scnprintf() and copy the remainder with
      strscpy().
    - This avoids potential truncation and satisfies W=1 builds in
      drivers/staging/greybus.

Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 6ca938dca4fd..5bf8b5e29dd8 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1013,7 +1013,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 				      struct snd_soc_dapm_widget *dw,
 				      struct gb_audio_widget *w, int *w_size)
 {
-	int i, ret, csize;
+	int i, ret, csize, n;
 	struct snd_kcontrol_new *widget_kctls;
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
@@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	n = scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
+	strscpy(w->name + n, temp_name, sizeof(w->name) - n);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1138,7 +1139,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 					  struct gb_audio_control *controls)
 {
-	int i, csize, ret;
+	int i, csize, ret, n;
 	struct snd_kcontrol_new *dapm_kctls;
 	struct gb_audio_control *curr;
 	struct gbaudio_control *control, *_control;
@@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		n = scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
+		strscpy(curr->name + n, temp_name, sizeof(curr->name) - n);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.39.5

