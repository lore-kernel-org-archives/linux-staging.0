Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FA53822B9
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 06:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774851850; cv=none; b=G15+MZWNAkguTz6+nJFt/usX4BQe058mACXvDEl588P7lhkpmMcPnqkKjIJD0Z4SRPOJXLnoCnKCgJZT+wy2dxaoMk0bd92yKp80rdBjYV6/O22i16cYP2VzUHgk+PC6Jxv0rLXQx2e5KCHhs1Vh3DoB3XCG//JylNIAAstOyGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774851850; c=relaxed/simple;
	bh=8I1gqUDPTyZADw6OMMw+GnTO1rsujnFbgjzI+MvMNB4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KPEm0cEETxrlGdtjXMzJG3x23g49zJJMZAwbNbgAwpDP4D0f4wt+D0KCoov8pnn41I1ytUhwdMsl+8aYFkAPzyPJ8UL1JV1Sg/km12k0Lyy5m9AOeF4zMqCqaJ935JCXZc9nwrZ9oYqdbenKJ0WzaP+/u60iu47tVuGY5WVN6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bBecl/Zt; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bBecl/Zt"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so396501a91.1
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 23:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774851848; x=1775456648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D3Wg31UNehDnDV0cAD4UyzUhp4CAszzqdLdzTyF9F0o=;
        b=bBecl/ZtIdLjAwTqekaYLxjB2WLuOiHK7yB2CVlWOKy6zXJ9MHPJRIlDORloe3j3km
         qZyHhA580HPw77lzXvge/2cRHpeq/F2USpWtwEouxRJFM70FBzmPxWWsPSsimQtZ94JQ
         QFa+QON+mjukFT2vF5zLtyY/LInIzdZ1dtEYe9qoJNVaOxr73YumgknjkWlJ720nooPZ
         u7as7GWv4vWZY1lnJgNRTXSNh0tuTv4xA7YG4LmayDPgiFvGNJr0DnfVU+w+fuukOIFR
         MEpkjC+rfq5S/CcodsYzjyezSkUuNs26qn3Yl0laLcw2xGp5Hcf6iPc7FBkpAbRW7ZHq
         KinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774851848; x=1775456648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3Wg31UNehDnDV0cAD4UyzUhp4CAszzqdLdzTyF9F0o=;
        b=ArKFT7TwvYl/ptjAAbmdK44v3UQ6mZFboAvxMRVQTz7YRoGcerYBX8FDZ4u2AmsQoP
         mefj22eFyPaoP1OQjWqH+BKv4OPpsHvjgcQqmZpl7i98kYbWRQ+s2LVUPIV4HfvN7GTC
         8ktSHp1ezoqqQj8J7DvYQdtXn2dN47ajQTcsQ0HWbP3P6Gf+LdUH55kRqjuwiu+UXIpw
         jV/A7eixWTh/y0y8OC28WyWnY7TwVWUzmavMObbSgfrdGBYDZ4OydpItlgXkpOq2WhGQ
         H3JSFrtUV5FMGajIn4s4urWyR+3yvRiHduT7onW7jm+3eMGKDNUjlOjvZn+8e4S7UGoc
         2uzA==
X-Forwarded-Encrypted: i=1; AJvYcCUd1Paw1JYBv26J7NxGgJbSl6hmAExsicjTdFltomA8qEgZQpvRyEVfELLiQn/aTaa1fNCDjHgOnxNoZakX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3d4FrqhZ3qAvqDafPBD+43iGKN2r//UMaxZGtGij0QBF5iqpx
	Pn8xbM3KsQeSyk4ve5by5YAH7xHBy1ujlFDBQf+eF3Xa8Xwb9qX8rQEC
X-Gm-Gg: ATEYQzxaQFOYq7e3Kyh5r279tUkxzNmXtMYtzN2PjTIV8aC5kgPZGhxM/20vI3GQNsw
	1w5DVzqDZvMWnUpdSpFKqG7TSDXijOhtQC4SMUwbQSuwlttd3T2PG1qNLMYVwyvfyX5QZ/UFZzA
	OrZ0htIkezZVBRyhtxho/Krv9i9NUEnsuaIa0xv1izk14iGKg7LsCbNanEpe4Q0dS5wUKMwpYEz
	yiHDCTSldhj5W672IuBxX5/Omx69rEa+lfpNfa362ZAs63ASpIFrN18amqCx2t9ePCboTVhW+sV
	UiNUr12Ldlm0ATfjEXouJT+PokT4YGJvuoHQqyFoOeY7SBdrzVsxLkL4ay8afT2GWGKMPEcE8oO
	wQoBGZ4VTBzIMuXYwT0HMf7c98rg2LbKoVra+mzArzuAhZwXWv0vJkVAPD+tH54LUGlV3FvP5Hw
	u/xHik2/p+zBkV1V9izTcKj6UQmjt4D8caTt3Lvt43kntYYYC9LcAQaVZbZ+J99CVS
X-Received: by 2002:a17:903:124b:b0:2b0:663f:6b4b with SMTP id d9443c01a7336-2b0cdc40dc1mr129063005ad.18.1774851847628;
        Sun, 29 Mar 2026 23:24:07 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242679bb3sm67841925ad.30.2026.03.29.23.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 23:24:07 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alex Elder <elder@kernel.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haoyu Lu <hechushiguitu666@gmail.com>
Subject: [PATCH] staging: greybus: audio: fix error message for BTN_3 button
Date: Mon, 30 Mar 2026 14:24:02 +0800
Message-ID: <20260330062402.1454-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gbaudio_init_jack(), when setting SND_JACK_BTN_3 key, the error message
incorrectly says "Failed to set BTN_0". This should be "Failed to set BTN_3"
to match the button being configured.

Signed-off-by: Haoyu Lu <hechushiguitu666@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 444c53b4e08d..720aa752e17e 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -781,7 +781,7 @@ static int gbaudio_init_jack(struct gbaudio_module_info *module,
 		ret = snd_jack_set_key(module->button.jack.jack, SND_JACK_BTN_3,
 				       KEY_VOLUMEDOWN);
 		if (ret) {
-			dev_err(module->dev, "Failed to set BTN_0\n");
+			dev_err(module->dev, "Failed to set BTN_3\n");
 			goto free_jacks;
 		}
 	}
--
2.17.1
