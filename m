Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0C8301026
	for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 18:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763403609; cv=none; b=bxV1lSVDD4QoKneW4R+yMeN5ydh6LsGexPaQ2TmW26VrWY84XYsQa+yMCcetyn1M4GKj+0OCQQCSboubEGNXf9W+HEGMND5rYUUcOYip3g0VdHB8vHOb4Z2b1G+uuRQFFgXcBiS0ujDfyB21Q4068GgII6VcvcZvHELUPK1LgOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763403609; c=relaxed/simple;
	bh=rGsj/P09Uj7Q1g9X9r11uASDOBhZctm2kwPoPFWRJF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TJFXcyvrEnNPMlwa3YpADw5t5IzgUObBGaR0r76RrnY+at4lFFOW+i5SLDbXgn1x4kcai8NGQWkRFI0WJlCYrJpI/gxucgupfwFhFkXMm4TzXRWs4pghE6T1ZDOtcv7DHJ+aSJ2NIbiujb/sOT62gYDB423p0p64Njb5HEzxiys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cigtLr2s; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cigtLr2s"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29844c68068so45638535ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Nov 2025 10:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403607; x=1764008407; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9F75l1r3oOOy7hzlk2PY1Dr+TRiS53YcsjFMUPJpnJ4=;
        b=cigtLr2sHA0CxvWX89+SOcU1bsnCY6+Ex/ew6o3EyGqh+uxIe2lpiOhtrZSnNgDP6h
         yrmmRBVC78vGEdzBVLqvqhGxnsabNGFEOTg5qkEocuJyIUD7SoWJ1ahLyIaY7JzzoUbv
         HLBi5oqf0Pk1ZWw66GDz3j9zbJ9/LMGgkENr8rSybAKm3kTanS6z2P8Aq0Wlsrs8n16k
         p+bZ9DDJP8dPEjumiwXcb9l8fg3RRxAEqmHLBOOZd0MxyaRZK7znaROBflxyEPjwJ7ne
         6heg9GuiOHGFr+1hxcEqdGBnjZll8VT3b5cqYs0CzoG8Dgwws4rkUstkSz856Kn/TrWZ
         6tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403607; x=1764008407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9F75l1r3oOOy7hzlk2PY1Dr+TRiS53YcsjFMUPJpnJ4=;
        b=Ys4ME0lhxAIT9hzHOGBmBmQYJf0AqnLQmLZBiETjOg8WdwnrTUgQ3ZvOF1p02889YQ
         hEnNsD0i6qO9eranOP7oKlILkAWqV/ukLECfgQu0w5e5EgAtplUXngvB/I8vUo17odA1
         aRU47rkSccY+MnQHzg0OSZbWGYMQWlIp0lbK0mjq5JuVuDMV/Awg5iZHECLgr61POTpN
         LrVATIdWFJUb14ezrnUfH+kiX8Xauar98LBuBzt2xOPIEWYIKciRZxN/3Mv6qgjbanTj
         plTJB88LWNzKfWhDx1U2zcztaNnObWAkPApRTa07Hc4X8p43ba+SSeOQajj5ivXTUyDG
         ESvg==
X-Forwarded-Encrypted: i=1; AJvYcCXxJyJMwpoFh7t3qyBPeD6ES0StVII4S9WU1+BYxoWLHgfYrS7xL8QJN0GIW9ZARC/I5eIgzfQ1AkNX2cfh@lists.linux.dev
X-Gm-Message-State: AOJu0Yxbjfb5RHfe3X7lmX8wq+1D3zabm/aGzkFVLocGS7FgqiNp7l0n
	6NQH+fxnvzNS+a7/dIx8b/nfiWCx3faG9eMEOfyEiUV3y7D58hYdW4xq
X-Gm-Gg: ASbGncsQ8pbY+I1YgNrlq++W9m+KTvESPZocFycj/KdaoTG4ny004DT68WU3OEVODN6
	j/f86hRIzX2Lf39T4Kvbanzm9TdoQIpmxmBth2qJuH7E0coAN1x0ZQBi0hPDh7WPZsHoVNITlqE
	WPAvbKNUtL0OdRNoYscp7EbbAws6vacmXyUdtRCeKiZZCx68STycy8Uo1teDSKqoeHWZJqfzrsk
	QMoi6wET1YDdZsGPV4YH3zJttf16kqnOCVClwLg/y3baCeM16/yPLZW7FjK8lpw3E49S9PPKCvD
	DoeaBmacY0lgdtzEu9PbcX/OXlcdQLn/9QwixW6b57KnIBen1J76uEnn6DgjRbXQdfrgG15103t
	Epez9fw26VFC1CDAyttUdYtjN2dc44fhaaFkzHAPD8G/1MLqCpwTKlRKx9QgKKffBhXVbvDhQeZ
	jRGihnsgtKLqrannyYAFsAS85Or1J4X9JrKUk/
X-Google-Smtp-Source: AGHT+IG45lzJLtg0H+Ny1+OT5oV1Sd35S5MOVN+EqIhQLIkJKEPMtV3Z725C1IvuE8ALddQ0zIVFSg==
X-Received: by 2002:a17:902:da4f:b0:295:6d30:e26f with SMTP id d9443c01a7336-2986a6ec220mr170360965ad.22.1763403607168;
        Mon, 17 Nov 2025 10:20:07 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:06 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-staging@lists.linux.dev,
	greybus-dev@lists.linaro.org,
	Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Subject: [PATCH 04/13] staging: greybus: audio: remove obsolete INPUT_PROP_NO_DUMMY_RELEASE FIXME
Date: Mon, 17 Nov 2025 23:48:09 +0530
Message-ID: <20251117181818.118139-5-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The commented-out code attempted to set INPUT_PROP_NO_DUMMY_RELEASE
on the jack's input device, but this input property does not exist
in the kernel and struct snd_jack does not expose an input_dev
field. The FIXME is obsolete and the commented code is invalid, remove it.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 2f05e761fb9a..cafce125d5d4 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -785,12 +785,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 			goto free_jacks;
 		}
 	}
-
-	/* FIXME
-	 * verify if this is really required
-	set_bit(INPUT_PROP_NO_DUMMY_RELEASE,
-		module->button.jack.jack->input_dev->propbit);
-	*/	
+
 
 	return 0;
 
-- 
2.51.0

