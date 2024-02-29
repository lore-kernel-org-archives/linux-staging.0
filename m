Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178E7CF17
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 12:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709208346; cv=none; b=R2JQbkxDV8dgVHBmQhrYzo30pZNFp8E/B1+X1QwF0B3F1nfYTo/4leO9xP2CeQh/5Z2HMdGGVShaTY/dy6oYp2EjixZFzl6squpYIbJqUNOZ7YNWQXUgVR87oBEUmpAisiGV2M4iTJ7MdGEVbCjv3FGBKoX5y/c9iANiZW29uzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709208346; c=relaxed/simple;
	bh=/bbb7l83hj76pskoFmjDlhlQeqTmupIOHZ/UQmFJtMg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=bM98s3dkl0ivauIxiG/N8l11aj/6xVDggKRSOfU6LjZcfDk5VrLqgUkdT17Kr1X7CSkzVf+oLjK8M15gXvpKp5Kk0v35Wm9P4GwdORMgN7VZ2neQjRj+QzJGCxPAv5bW5if5prCCMdAXrq0y/hcqNm4QUQ1wwDvcjXsRVmUy894=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i33jFVWs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i33jFVWs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33e122c8598so198173f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 04:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709208343; x=1709813143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AKTrC5BUEoERGt6YpPOVR4/EueT/sWktcgEEY9nn3IA=;
        b=i33jFVWsalrGp2iXe0zBryokXaJ6eUAKpSHeKXVTwSOZrL/TW9j9Oyczmuq0T0UgDA
         uwpaHFQv05Rf0O9v/dYdbvphNwZNVtFwxWRGsHeBpLn9EYyDtTOCZ6mkI47C3tTYYPh7
         /uKYOeexurjJgh8cnD93Xg6u1of9Q8/maut1Uie+XSAvtFmdWLKwljakq10M/+PNHCeU
         R1LDDGcYzCYQYld4axYsByVtf+98vdN894gbmqn6OSQDAEfa8A/yewENdQ8QBkUwqi/S
         w2LBESIuD/B5GGwr2DtJXfCIb49iWsiloFi6zqRLE+WHtAyV8SmbZfjwcSnZYFCoh2IJ
         FxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208343; x=1709813143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKTrC5BUEoERGt6YpPOVR4/EueT/sWktcgEEY9nn3IA=;
        b=TTkzl1aL0CbDohOdj22G6tiD90owIMTKdtmfeeHMT87MHnaxPTg19lsnx6ARFBWWto
         1OWcE0JbhuXhMb/BSf4+2ZrxzG6ZPkJPs4T4FEk5qlmjlKE0cJl5dDpkBB0FQDGWcR1j
         SH7Jh2X3CBjjr0L43i0IOZgtQ+8zORwFuG6fqpciKKaPP5ViSQWUcwSJhSsWOR0zCxTg
         kbS3oGTTYfoBzvzZc5wNOIslJF0f38v2fSVqBWsz0xPyKqABUOr6ZQ0Q8D+0taCrk+3O
         I7uA6ooJpJ4aJQFQmWuhnnd8zfTKBrifpgWayKEgE2+BLCr1Ou+JCP9hjv28PKvmMsVa
         sdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnjzaQBR93/YKcU7OtXw1OxSXiliCfGIhJMGXUGLV2iDGIfT7b9VFoWXGb9vHXKBLDL5HtKN5ZKRCojHPN7Ew+ek4pdhhw2CsiZWE9Uw==
X-Gm-Message-State: AOJu0YzpX/y90TXYXKGBZaFwWkHh+j2SF7ja3qa2ky+kaio2JfpcUyDY
	UGXqO7UBXhy6U1C9hf8D+Xcd0E3XJMiTu1e16f28q4fCfcS8Mw9e
X-Google-Smtp-Source: AGHT+IHflToI7cmVEoLUgAq6Qi4/DXWnunqwZQL/91orV5BJE1B14iuKUeIa2YpviLArwrKjin+VxQ==
X-Received: by 2002:a5d:484a:0:b0:33d:297d:75a9 with SMTP id n10-20020a5d484a000000b0033d297d75a9mr1311981wrs.24.1709208343075;
        Thu, 29 Feb 2024 04:05:43 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id dp14-20020a0560000c8e00b0033d8ce120f2sm1588446wrb.95.2024.02.29.04.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:05:42 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: greybus: Remove redundant variable 'mask'
Date: Thu, 29 Feb 2024 12:05:41 +0000
Message-Id: <20240229120541.219429-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The variable mask is being assigned and bit-set but it is never
being used apart from this. The variable is redundant and can
be removed.

Cleans up clang scan build warning:
drivers/staging/greybus/audio_topology.c:764:15: warning: variable 'mask'
set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/greybus/audio_topology.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
index 08e6a807c132..5dc4721105d4 100644
--- a/drivers/staging/greybus/audio_topology.c
+++ b/drivers/staging/greybus/audio_topology.c
@@ -761,7 +761,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 {
 	int ret, wi, ctl_id;
 	unsigned int val, mux, change;
-	unsigned int mask;
 	struct snd_soc_dapm_widget_list *wlist = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_dapm_widget *widget = wlist->widgets[0];
 	struct gb_audio_ctl_elem_value gbvalue;
@@ -802,7 +801,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 
 	mux = ucontrol->value.enumerated.item[0];
 	val = mux << e->shift_l;
-	mask = e->mask << e->shift_l;
 
 	if (le32_to_cpu(gbvalue.value.enumerated_item[0]) !=
 	    ucontrol->value.enumerated.item[0]) {
@@ -815,7 +813,6 @@ static int gbcodec_enum_dapm_ctl_put(struct snd_kcontrol *kcontrol,
 		if (ucontrol->value.enumerated.item[1] > e->items - 1)
 			return -EINVAL;
 		val |= ucontrol->value.enumerated.item[1] << e->shift_r;
-		mask |= e->mask << e->shift_r;
 		if (le32_to_cpu(gbvalue.value.enumerated_item[1]) !=
 		    ucontrol->value.enumerated.item[1]) {
 			change = 1;
-- 
2.39.2

