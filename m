Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A6A142642;
	Fri, 17 May 2024 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715989114; cv=none; b=g6pZzUAczKzlIlrgGUUAy09puS08pLg/t4q/IF1ywPPu9HSNvD4VKGMhIloSTnkvU4A80ZiV1ygGHRAUXTFsBJ4ygNl6oRRfbcxm17sokBSeNCtY0R+zA3YrjBkxNGtz/KZtuM/BrZLv4RRMgV0Ruh1/qWw/t9RGDSF0FdlL8Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715989114; c=relaxed/simple;
	bh=qAGg3p02CzshPTR3Olk+XX9L/LU7qQre5bMGAyQj6y0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FzaniMj4y3ae+0SlIxMFhqnjsEP2fUn3662EuyxABM9Hjy1shMEXChRSM+THbCBqglDW0FB259REyjEORb3bPUnpMhZi0NFHs0RrgxuF/pel0PeJ0+iGMztQp1cCaLMDWs2aEBV4wxJHi93Rw1fHGbGO+C75x7PHT277sB4m7jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vfj0kfrz; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vfj0kfrz"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51fdc9af005so2233099e87.3;
        Fri, 17 May 2024 16:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715989110; x=1716593910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s9H//QTWRYsZ8CFoh3lKgy3kB9SwxktnsEXW1iP/ZhI=;
        b=Vfj0kfrzMJPJwNYZwoM/uzxGEYb3rrC5y4RLjm+qNhUvpJ+2/AAc7/3o00hul7Bo/e
         JbkQvW+SV9g3D1pyciGGgCVX5SufwUZjwvXqbRBlMFlPm3h7rXGHoyp/SyXJBeXAtpc/
         cJaiA5xT4+zuogqB4C3VF9j6dFdChLzpgFfbLuwAB5lya2Gn03+OCmGJHm38EujmSV0p
         iVp5kV79Fd4Y5GXNt3psxPOmmY9s9lCgubTNFSxIxElwmljHuCE+dmGbSN8A0SPd6DAj
         K+NXRkr/jC9ElNBveiJia+u3Ui/N2kzmxhGXo1KePA+5dL+QrBzhbPGTKzwMCw5Yh9hW
         i2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715989110; x=1716593910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9H//QTWRYsZ8CFoh3lKgy3kB9SwxktnsEXW1iP/ZhI=;
        b=AUQt8ivwyihXkkNyEVouxmfqPZzFKhyk8f72eNKC1d7Vm2HHIKKUj8daK/1aqCDkVm
         furOiYaA1xTU5OScbkqaiTlAxZTqGTqjNg2eosVtwsbfL1/PKCEpZFZ0IqzQnOcYw6EF
         Dlm1l8iYXDgo7+JVT0Zr5LkHNFs2Qvp+JGnXimjDcGqZU9plvR9LL3bIpIau9ZWnINI/
         +dbuslsTy1i5ugXHwteGTqg7G3NlRDGCEi4/c8byS/pdDiJBwcPkiiGeNC4oPFAqXY9/
         WEM0CtAzav2h1zMk/iRKxkgcTKaE1jelsPF+zBz2h3JmEwClBickIIssXBZ2/95B/foR
         4mZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSR3dsyLIW0T/UEVk7zKa582MqSUuAGZbLFJ2cHs0LvgwCCoRWR8sZDFUCvwXu8qYpBXDUvvB7qeCOXTMugr0jKdAkNwqZyrNO
X-Gm-Message-State: AOJu0YzOPVyxvz5h9/5QOZ14hlKZfyLiZnMFvYwgxON6xxGzyiQL5zwU
	EJquKJ2N1tIgFS6/G8acV/l4TtRZzqTZtAO/8KxtDtf2zk5aC3Bw
X-Google-Smtp-Source: AGHT+IFaErxkK8QmTqIKSlBWlqDGbStWQOEEvoXxfSx+yl+QzEoB9cgAW3Ayf6V8blHmOHuSQHxOmQ==
X-Received: by 2002:a05:6512:1308:b0:520:36ea:9375 with SMTP id 2adb3069b0e04-522102783ffmr23154832e87.43.1715989109520;
        Fri, 17 May 2024 16:38:29 -0700 (PDT)
Received: from michalis.. ([2a02:85f:fccb:8700:ae86:838e:b741:f781])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17cd0sm1156810566b.214.2024.05.17.16.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 16:38:29 -0700 (PDT)
From: Michail Tatas <michail.tatas@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michail Tatas <michail.tatas@gmail.com>
Subject: [PATCH] staging: greybus: audio_codec.c: Remove redundant parenthesis
Date: Sat, 18 May 2024 02:38:06 +0300
Message-ID: <20240517233806.36849-1-michail.tatas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parenthesis as suggested by the checkpatch.pl

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 2f05e761fb9a..dfb5322964de 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -305,7 +305,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	dev_dbg(module->dev, "%s:Module update %s sequence\n", w->name,
 		enable ? "Enable" : "Disable");
 
-	if ((w->id != snd_soc_dapm_aif_in) && (w->id != snd_soc_dapm_aif_out)) {
+	if (w->id != snd_soc_dapm_aif_in && w->id != snd_soc_dapm_aif_out) {
 		dev_dbg(codec->dev, "No action required for %s\n", w->name);
 		return 0;
 	}
-- 
2.43.0

