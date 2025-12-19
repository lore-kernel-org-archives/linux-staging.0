Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D70296BC1
	for <linux-staging@lists.linux.dev>; Fri, 19 Dec 2025 06:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126086; cv=none; b=LqZwWmvkDKkl2pAhZZCz12QTv1t+4SoODKLUX6orSB3Uxp2ErLq5La8Cfo9hb+g3ypx4QHL19nXv3+YrJvEDecWY31casOfgSsYk3UNS2R1zKe1TdyZm/JIDJ1oRp72Lj0EKuecJqnkfR4xqCyQ/cglM2csiWElkNaAkmhEJD8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126086; c=relaxed/simple;
	bh=scYf50g6y14xfdlPzahynnEXdZil0lgiOquX1VFql9E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NwO/rRA+etk76mzWXsw+vYUMDPOCBVU+PJBIkeZ8rqkaHnTj5ccGXHbMEz+RjlyWTyVVaKO8ovEYtfR2HH8HV8j0YSJFCThfYIidvx57ytG7E6q7FTQiffZbiuCkyW7TS2JU+VlZHigqe7GPawH+BNcOWOp6DJsBl1g7wWvOVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJ/dfaRj; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJ/dfaRj"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b80fed1505so1554012b3a.3
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 22:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766126084; x=1766730884; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+PR8TCJCi+60YzY6prbkmmlQDzgwkx3eCc9KBS48tc=;
        b=ZJ/dfaRj8ubA0VoLAg720sGsedWwHeo9CdVkPVoe/WfkNSeAX1WEEtuVB3d8acI4D8
         ipwPeLJvLkNkGNeypgI3+sgdTawtYHQQxlwjDIcvAbyWOE5L2y2TmuOS8ZcdAzTdL/Ej
         uDr8Kbo2uPdMeBcru7T7IR2L7ptLeeTdwFet0F/vVAu9dZowdmbA+egZgHZmhx+e5d0q
         dqUxOHB5vfahCCWbCg6Se/pu8Dv7bqH194dLMuLV86GvqMgay236MT08Spr7XbY4fg8Y
         Xkpa5FANhlbuGBINPa5u6pJ/cCxZRckVdJU0xXiKKHjDYYJCNrCMNcUt1gLHnKAISvQf
         +HzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766126084; x=1766730884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V+PR8TCJCi+60YzY6prbkmmlQDzgwkx3eCc9KBS48tc=;
        b=WiK00Vi2cjB9hUnvPn+fSDMGadLR5ourr/eecxDC/wORmjPn2euy2SPNT0SbjOfAqq
         DLx7KkzjpTL4RPuzpgutagLFU36jxrpRwOk+IBTmlHo9HGaNjNSTEtKUDZKsxSzYLGTx
         iJNkV979S7GzW23G6tEYRD/leuW9zbiSk2MwhLwMMc2UBTvoiBEG4QfN/CdT2pB4RmMA
         Slr5//1d51AiXCGFgYCyE9IZfccCZtbYPLUXYd4KiXtN4X6vy7jPZBI5UFYwHSp5NTCY
         5Vl3H6E2ToQ7xA+MhjSccAQywalkwHcWWgOb5ektmQAmQ/toZhJ0XLj9l20pkOEqA4gX
         6DQg==
X-Gm-Message-State: AOJu0YyzfJSy3rLXWPLE/dZ3jbfQ66mU6TR8fjGBX5oShyan4HqPHETp
	kDXkAY94qPoLO0O0mU5wMXj4sZ4SSrl9hjiq+7AZPWKTZpHQL/KNa4kNGu86SA==
X-Gm-Gg: AY/fxX7WW7vrHihyZLsn18xE4iRn7OliiZdmqFvyarpovzmM3/AGRWxmho9GCuqxDlZ
	n/30Fvw/+BVExbTwR7q/eE6DYm8mOsUbrpBMc5Vf5Hwr5DB5/Rif69nTvtMV8HVlS1yNAkWlFiu
	eDUGiQz3gvDVEs/EI02xngIxU0k1GRylrONiEfJuNlCJ0/WBWnItveRMnP7nqAz9D4I92qzw4oR
	5GX3RUeHEaPryS/Iq+9d734XJEGQ9xejwNjHhG+kL77DilhWKQnOkW8qEUSUFQnFEpvhv8VGC32
	aq9xhzUzdrWRzMuE4wWi9D83RNMWXCzvdxnJ99ge6E+PQU/sR+7yyZ2bkfwMm46Ds1zD9k57kqM
	f/24VdRMaZ5OXI85AwooYbTgbWjlyGkrduxdVZov+m+mQKlLtEA0mLJkT5vcLQqg5Q3iqrPLDsC
	qrpqST6JXCMXg38xdXwH8b
X-Google-Smtp-Source: AGHT+IETK81biSvM1J3R1zln2IFQGiY1+KyIUbMrkDWB/pN/EISExbXgu6s8v+qf0Lt/mhg7DYT67g==
X-Received: by 2002:a05:6a00:35c9:b0:7f1:7b2a:ab5b with SMTP id d2e1a72fcca58-7ff648eba2emr1784646b3a.27.1766126084159;
        Thu, 18 Dec 2025 22:34:44 -0800 (PST)
Received: from DESKTOP-MOQC9AF.mioffice.cn ([43.224.245.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a843a18sm1282071b3a.14.2025.12.18.22.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 22:34:43 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: linux-staging@lists.linux.dev
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH 2/4] staging: greybus: audio: avoid macro with side effects
Date: Fri, 19 Dec 2025 14:34:13 +0800
Message-ID: <20251219063415.46818-3-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
References: <20251219063415.46818-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gbaudio_dapm_for_each_direction() macro modifies its argument and
evaluates it multiple times, which can lead to subtle bugs if used with
expressions that have side effects.

Replace the macro with an explicit for-loop to improve readability and
avoid potential side effects.

No functional changes.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 drivers/staging/greybus/audio_helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index b4873c6d6bed..6264cafe9675 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -8,10 +8,6 @@
 #include <sound/soc-dapm.h>
 #include "audio_helper.h"
 
-#define gbaudio_dapm_for_each_direction(dir) \
-	for ((dir) = SND_SOC_DAPM_DIR_IN; (dir) <= SND_SOC_DAPM_DIR_OUT; \
-		(dir)++)
-
 static void gbaudio_dapm_link_dai_widget(struct snd_soc_dapm_widget *dai_w,
 					 struct snd_soc_card *card)
 {
@@ -98,7 +94,7 @@ static void gbaudio_dapm_free_widget(struct snd_soc_dapm_widget *w)
 	 * While removing the path, remove reference to it from both
 	 * source and sink widgets so that path is removed only once.
 	 */
-	gbaudio_dapm_for_each_direction(dir) {
+	for (dir = SND_SOC_DAPM_DIR_IN; dir <= SND_SOC_DAPM_DIR_OUT; dir++) {
 		snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)
 			gbaudio_dapm_free_path(p);
 	}
-- 
2.43.0

