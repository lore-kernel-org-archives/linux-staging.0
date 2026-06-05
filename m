Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8E36D503
	for <linux-staging@lists.linux.dev>; Fri,  5 Jun 2026 19:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780687756; cv=none; b=eDMlHA1atR0oAKPoJ/GRFwGhwBY81iAFpuK9mVYmsTYC1WtASye3gIdNz0PYd+80Iz1UIUvXhoKPBvGmiioBtNIquU9uaLajTlGLtudYTZYJGSv7SkZd3X9d5fUsAylWVWAFms2s0ikQ70ue+/VmHfzdPSw3kDjIb/QaJQQsk3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780687756; c=relaxed/simple;
	bh=R4OkoLItGyjO89wlHpyyioVJWYnxXcSq6mpFQLJQOh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+Q5P4cOOkVsOmWn2U9pbbJ35xHeKdi6/TEF+2aex1V7d44P8Qd/t7AhMF0JjOHMDY5rnuAkLN+bUBhR4XNJHWCw33/4Eu5OJ3qqfW8UKEEToGLjOwyVrJmIxNon9G+3hcmWjJNALzecOD5q4ayP5ATIm2456QvbCzSf5g6cPL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk; spf=none smtp.mailfrom=tumelty.co.uk; dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b=U2Xn4ys4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=tumelty.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tumelty-co-uk.20251104.gappssmtp.com header.i=@tumelty-co-uk.20251104.gappssmtp.com header.b="U2Xn4ys4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso12462555e9.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Jun 2026 12:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tumelty-co-uk.20251104.gappssmtp.com; s=20251104; t=1780687752; x=1781292552; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rqyuc30a31kxl+uTZbhiHfXsUecDU6zMIJmtbdO0sCo=;
        b=U2Xn4ys4K5aq3/r/mJI/zPcDy2+ARc/Nd3OPLV9p2WtY1ei43zQU/Qx+bFzdQ4mZKB
         abt6+3inHsKGxkysp90yO5+gskmezDNhgAFTBgTXWe0u5ZLz9rECMAhbtzj4B4QoGEvV
         QqrZm+KhDGt8cEvhSnF0ZLAh2uyHXSuftluA7xTr/7REpRjVIS4x5S9x7aCa2+Y4gLLv
         3op3w4/ZDPHiGhxl5rP2j5/PBDjDQ1QI/kQXHld+0F8KP3GMZp6gr3bToE0KXueafple
         7TkiIFOCrFtTXUDRTEoKyrIue2SkYfkMpBf4p4+kxRFNe9n4ZF9l48KmopfImf9xFyn/
         JKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780687752; x=1781292552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rqyuc30a31kxl+uTZbhiHfXsUecDU6zMIJmtbdO0sCo=;
        b=r7wjqJTcbkZUQgfHajZ09crCzjTfaxuKOdlgrJ4wuKde62j6XsxtnzqABf5BLwOwMC
         //pYo6YTsGZKfmEOhZhfaaQuW2PDWpQ9it5w3qyy5Y08gTiP0dUP+ZShRctKxrs4hw+h
         mY7D9vWUa+o40lcrOviRDu607UHAuAIVTFr3Sn6Kh8FpCYB+StFzels0GXRmaWaOh2PM
         ca+O2EewXOCbdvydZVHu91WO8ixgLIFz84akbUXySu33Ag6i6SFaHlVwn8NLYzwkT8l5
         qZ16S2WDGYItUhiFKKSdR8xJHeiCAP6hT4VATiCrJr+l79F0QNsK+zdyHyMomKewC/Lu
         5mUQ==
X-Forwarded-Encrypted: i=1; AFNElJ+3+rsVD+Y6JUlxwTJbJkWI+trFNfdzYiZzxvlTqFvGtFST0X+yvpeJeSBz9MHktiZop23m9wxckM9UR4CW@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8LA/EuWoAXN2fW7sUmUVloF0hBnLRgFRPjLxdYvmfrnR40QxR
	ziu7sn20CKzvzbd4oD8EUiU8lqYprKEwyojnf4HeEkaA4tey96XxqDJl1p/VD7awwq8=
X-Gm-Gg: Acq92OGfBgMbWNZ+lxyNlySWud4c3JNbKxV15PL/shgGO6wI7fs/ImEd2fN1EzJG4dk
	a3vAyqv5NOzwGqldzXWpR27LKA39dnAYH7RoscE5vNrdTDmYOZYDcT3YiJYg62P5w7dQHOffYUk
	W8kfEPFSWkuqiffv/CCVAiy6Svf/C8IOMMY/cM2o2e9ATSiMEYusJT8iwmuyGiyFcCw37d/eKc1
	CyGhKAoqkzOSU3X6B2kswhwzI4z1mHXRIieNBPX5qjHWrfQIQgGSr32UHZe3fNQfw9h4ydR+Dd7
	6yq7WpuR+g0l/+7eDDKZIP8fSaKo0pXvUpXAaZKbKKwbOxrRcrrzojHxKs84bD9YtJDeeIr+zix
	5Y8I1Yi9cHkbrODelkutQYAK1pymqq3t3HDSsx5Kl1hdcG+i3x2bfBarG0cJrwsifdOEfyhJMBR
	6xuXN1KiAPNKwXofSubyPRKakFMwu5i7bBsmQ=
X-Received: by 2002:a05:600c:314e:b0:490:bb60:68ca with SMTP id 5b1f17b1804b1-490c2cba7b8mr59213975e9.3.1780687752198;
        Fri, 05 Jun 2026 12:29:12 -0700 (PDT)
Received: from nixos ([83.217.168.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39e024sm231031185e9.4.2026.06.05.12.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 12:29:11 -0700 (PDT)
From: Rhys Tumelty <rhys@tumelty.co.uk>
To: gregkh@linuxfoundation.org
Cc: Rhys Tumelty <rhys@tumelty.co.uk>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: audio: fix snprintf truncation errors
Date: Fri,  5 Jun 2026 20:28:56 +0100
Message-ID: <20260605192857.78944-1-rhys@tumelty.co.uk>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

change snprintf() to scnprintf() in both gbaudio_tplg_create_widget()
and gbaudio_tplg_process_kcontrols() to prevent potential string
truncation warnings when prefixing the device id to the control name.

Signed-off-by: Rhys Tumelty <rhys@tumelty.co.uk>
---
 drivers/staging/greybus/audio_topology.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 76146f91c..b19febabb 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -1087,7 +1087,7 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
 
 	/* Prefix dev_id to widget control_name */
 	strscpy(temp_name, w->name, sizeof(temp_name));
-	snprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
+	scnprintf(w->name, sizeof(w->name), "GB %d %s", module->dev_id, temp_name);
 
 	switch (w->type) {
 	case snd_soc_dapm_spk:
@@ -1169,8 +1169,8 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
 		control->id = curr->id;
 		/* Prefix dev_id to widget_name */
 		strscpy(temp_name, curr->name, sizeof(temp_name));
-		snprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
-			 temp_name);
+		scnprintf(curr->name, sizeof(curr->name), "GB %d %s", module->dev_id,
+			  temp_name);
 		control->name = curr->name;
 		if (curr->info.type == GB_AUDIO_CTL_ELEM_TYPE_ENUMERATED) {
 			struct gb_audio_enumerated *gbenum =
-- 
2.54.0

