Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B769E3876CC
	for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 08:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782377965; cv=none; b=pjPvlqA/lcKeqoXW+u38Pe8ovjABRh4avJLF+cKFB/L98Gs6QN6+g1C1GFQXBW8u2STbssiu4pNqNKkobA5JPYXHnPfJiSnMO2PLrL/YsMvlm/Shdvu4S25/f6ZKFL9pMSovro95umQDnF9XOUrjNSh5pfHRI6kctwmSIVKmel0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782377965; c=relaxed/simple;
	bh=QYbm7Kq0P+lDQ4OXGzb+yWcVuThB7esv0y2SaqAHAjo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s7mRs3K9p1yb/CEemYwuiXLaD7afMQIpJ9Ng3RgpvqenRM7FqyuxZhxoFHvNHonrLyAWQB9rXyiZeprJ0URh49cVhMNygjO2IbBRpDnKCWN89CJoWfJOZja55BUrJrT3BBlk95NYz/veN61Y7x29+R0JI/c+i+blyjvp09qS4bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH5YwXDa; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH5YwXDa"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1363fe80fe8so3903191c88.0
        for <linux-staging@lists.linux.dev>; Thu, 25 Jun 2026 01:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782377964; x=1782982764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCM013gVUsehWEh08mLTPsFaPHwwdbfEWMEh5CAkbII=;
        b=PH5YwXDa67Ixy//OyAmXuB0f94AhJy7s9s7f9MTXCCbiMu8wdRbLqmcbH8K5+DXfZt
         YStm4VLSbUHSUIiEFpxfb6S8P7t1eQbHaUmEhIKh8hN3LJLAaBfsAdHF7AmAJnE2Sa8b
         925pBzwHZBUp5kiNJq9uj8tYsBGc3E05Uyl5c33B9KYyTtb7OU47xMSOcEgN0OtqCWv3
         nGmlcA3wlHfFTxcKKvVyzYgYxho21GydYnqJdwkF6G/WMGHLNcXFPU5dMdGKMSCboOLP
         25izL6ryYevZHGzhvORkiujswVlUTUYQ21txaM0A39wUdJY0lfNzeEKIzApZjXFo7Vqu
         hm/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782377964; x=1782982764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UCM013gVUsehWEh08mLTPsFaPHwwdbfEWMEh5CAkbII=;
        b=j4zbOB023AKFSnCeYP83boB/LhWN86aJI55nsSsk7nCYY2xsWxPSVPuyZAkGiQXQry
         hMWzssSjq/D+Sc/7l0SYl82lUVCEjbLZ3wBOxJudkwzzTohF3qwmlrFnZjiB7iayf/0O
         OFgzdjTFvsd5i8KdVaYGqUNHeIlWDGszpA4Zz1q9Qrqv9Z6f28jQk3JJ/TEF2UELarEP
         2IFJj+f24q+FDY3K/C2L0WPnbhibmNQfEzQbM2IlpRf0raaYbSxRvkgY3AYBqs1jixll
         VLa6/A9E81r3vH/mXgTDMw1Kt/r6uYtIsf3EZR8H1Gov3bmDbmfkw/nlT/JVvYXSkbLD
         fIEw==
X-Forwarded-Encrypted: i=1; AFNElJ+yZGsWQuAlR9Ay1Nz6qRgiHsCE26ctNKhJp99mw8DBgSBzY749lSjv+7LEHDaYaNYTSdGdghTfua/M3J6C@lists.linux.dev
X-Gm-Message-State: AOJu0YwSAw9QGhf2u9lNOCgrfy+3UCXa6Nc+FNsv9wkNhUkpyEVpS4I1
	qbTmZfTMHo2FCNMyAWbK1ldBWMog96bQRyVF++A4SePoTBeTXM0hUKT0
X-Gm-Gg: AfdE7cl6qjCF3pXEo8DFDppFb09M5YH6KP/SiaBngDFilIC4pLW9V097g2/1K0PZb2V
	VhDiVQde6/lTPajPTbJJLxBvnhGQRwMQ2yDpMxCy0hH7e+0NrnYpBypH+fx3x4D7TlYmU7WSsVj
	lOGSG35WppggwgUHmxkHwfDzT2EW5C2WuUA+lgolJNOQCozhkzBt4W13erLHEn+uhbnTwbj8Pt8
	QSD2XE4PXpEBolDjJLiK0IOhdrHMhkraRpND3D3KMGvFW5wcUd1b3O3ZMcIAN5rCjqR/7SokFoE
	EAnO9aK00Ty2mnjcsXktcY/qTLovQb8KSHOWwE0T5+UtxrLlzHkn7gxqzfV8V00LrzFfYy1AiIb
	WFuWMG644gKE5ltw1KieYyDePeSaOmebbTEDijkOr4xW0BruIEvdfFfrgssKPhrK9IO9+IKMMpb
	fZqlY9wnbY1qvP84LGHpwLJkbRECbzvUGK5w==
X-Received: by 2002:a05:7022:62a6:b0:138:22f:9a2c with SMTP id a92af1059eb24-139db9e5923mr1519102c88.5.1782377963766;
        Thu, 25 Jun 2026 01:59:23 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f318e7sm6226496c88.3.2026.06.25.01.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 01:59:23 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	suryasaimadhu <suryasaimadhu369@gmail.com>
Subject: [PATCH] staging: greybus: add comments to mutex declarations
Date: Thu, 25 Jun 2026 16:57:40 +0800
Message-ID: <20260625085740.222486-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments to mutex members in gbaudio_codec_info struct
to describe what each mutex protects, as recommended by checkpatch.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/greybus/audio_codec.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..326770b99 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -70,8 +70,8 @@ struct gbaudio_codec_info {
 	struct list_head module_list;
 	/* to maintain runtime stream params for each DAI */
 	struct list_head dai_list;
-	struct mutex lock;
-	struct mutex register_mutex;
+	struct mutex lock; /* protects module_list and dai_list */
+	struct mutex register_mutex; /* protects module registration */
 };
 
 struct gbaudio_widget {
-- 
2.47.3

