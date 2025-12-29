Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B56B32B99B
	for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 16:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024903; cv=none; b=mUWDmNKIYwEiTxswOkSy0O7N7ux6nvBc/UTrv7mFSYw7nydn6Yx07H09HvR/CjHT93jkuUOLWrlZU+2ZSU0RXFRsIZ29w4Yc74Efqijz2W2nFQqpxnn7AMW+fztebuzUUGtBj0icImxT0gFE/iAdsz0sKqBXGQ7YvAfd2aF2wc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024903; c=relaxed/simple;
	bh=zqKC7rPRb+1A8U1vjoSUUDAR+V7jd+ZLS5SgUnUF+Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuAQJWGcbi5w1QG4mrJK//OU7zMSzR/wI1A1YCkH+RyKyDA2OUbima2kGTLGYsjI4SKUztVmdgolyY4Sf1InK7XEDBFpnMm5hN920ztwa16g7EeKPYr4OrE+Et6yZFxSNNkWSFSO3OOe2dLDmUckvAOAKYebjaA9fj7Lx8+PmOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiStLRmJ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiStLRmJ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c05d66dbab2so9816806a12.0
        for <linux-staging@lists.linux.dev>; Mon, 29 Dec 2025 08:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024901; x=1767629701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzK+w+H8RvWc+LC4WYW+lek5HoRHUGRqhYzMXVSZBxk=;
        b=kiStLRmJPzCquy02dzpld3KC1iHEnbhl6JK6ov3ZLD/DBfjEw2CiyRDpOXD1aQOeOc
         JIRfO5azyXO4Dxy+Pmn+AYHSJc2eQRARlLdCPT4E5WcWzePFeENy5E7hUzH9tITs4lir
         WBxl9AeJyL0b1ZlPJfBrqX3Ran4Me6le7y7Tg75laS4mMlEB5dkS2OJBKBMiA+T3cUya
         Z1spyj2ZweDDY/h7NZmN4sCBqZm67mb3173R2gYDHtFaIPAsKQM3mO+ITZu+ylHXUbWI
         hq+AJj4pnkkiaoh8aFx0ZbZ5oV6nrf85QE8VGuuKsfMh8VgPjqlXDL4m82XQ2reNvqU2
         5ItA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024901; x=1767629701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OzK+w+H8RvWc+LC4WYW+lek5HoRHUGRqhYzMXVSZBxk=;
        b=tEJ3rnC34XrkfCgiNvW20uX4Tk0I+KMmBHj8IjEFkLSGXqu+cGGHTvvkuBr6vGagmj
         0aPVp7D16puiKDC9gLGwTm7raCyQk0o+GSE5jhfMTkHpzEc/SzHBJpOx4O+/bpuwicux
         idqxNsJfanBOqJAyKk2Je2qciQXNufu6uK+Hh62l/ep8cSj59Z2ljm0xcEgdERG58eZR
         bGzx4Vl0cRpS04VrrCBKz4Ojp7fGifTDo3zVJsihbniJSdM+ex9kjAmy1nDBCEn5KGU0
         2jbuIZlRHwiNi1ZC00Ovx+5pFIG/H6ZCJAHmvXdFHxNAkPfGszgCh76tyBuXrid3Ha77
         vXuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUimkSZJ5h5pZEbI4p0wk5SUa5G1C9lP/8ayEOKhEgLsF/ZhlLT3aqLHU7M05pZQGwOdMBXBX4bgWavuPsQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz2DZvH7LNCer4WS43N5E0luh2IZyBGsEFjeMaJGMcr//69/Z1
	rYMyuVG1UKF/Wgr2KHJnG9kZtanV9zEfJzMIO/W4kZEO2G0m11Vkd43P
X-Gm-Gg: AY/fxX6hvYkiYr26ZckU3NHFaXYVjazCWY5O2wRZgtHWA6nMaMMqRUG291S7ebLkz3X
	WbIpVvGrLgkMI4yW75mQRZH6chaBJNsbuRRUYv3sl2vJV/BPZpMUia/f05J/Zj4ksCu1GLhVDJY
	X3NXBeKXykcUOBrZRjKbzBP/dMzcGR4MUaaGlRUK3My1lcFSZSf2QJxPi+WEB+RBMfEuy6CAJSk
	ABUvFiTQVmWwav4F6L4CIiVtOCtkBxml0SquB2NjdNfAn8FCWnN7zo/EzIH5gx4pj290eHgrWyr
	gO0vJL3eQW/aSdVW90rTyrh2IQlISvIqCRdRIAmOSO0pqcakgabIkORezOiM9j2tcY74MdRMF+3
	dAvk7kMRK9hODplfEtJDN5H4QygATCJ/wB6LV0HTwFD1WcWOKq5fF6opnvr5L78TiLODoQ2cl+K
	l842c+WgJ4ifmbB4wlvrtHl0DGgqsbKKwF5sUo0I3za+CB7ODMexT0Ji0/UPfP75qeVlank6M1H
	YpLutAWLty9xQuuFw==
X-Google-Smtp-Source: AGHT+IFdPTpzC3arH+K4JHUQR9Zufuq2dWPr6gJab3paqws/ln11AQhFRO962HJKGZY2FlAYmtwbKA==
X-Received: by 2002:a05:7300:101:b0:2ae:5468:5de2 with SMTP id 5a478bee46e88-2b05ea1805fmr22566640eec.0.1767024900523;
        Mon, 29 Dec 2025 08:15:00 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05ffd5f86sm65616647eec.5.2025.12.29.08.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 08:15:00 -0800 (PST)
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
Subject: [PATCH v2] staging: greybus: audio: avoid snprintf truncation warnings
Date: Tue, 30 Dec 2025 00:13:46 +0800
Message-ID: <20251229161346.188805-1-sun.jian.kdev@gmail.com>
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
---
 drivers/staging/greybus/audio_topology.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91cddc..4293ab899390 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1087,7 +1087,8 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	scnprintf(w->name, sizeof(w->name), "GB %d ", module->dev_id);
+	strlcat(w->name, temp_name, sizeof(w->name));
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1169,8 +1170,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		scnprintf(curr->name, sizeof(curr->name), "GB %d ", module->dev_id);
+		strlcat(curr->name, temp_name, sizeof(curr->name));
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.43.0

