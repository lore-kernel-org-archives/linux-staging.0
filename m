Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5657349B1ED
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788288995; cv=none; b=qioG1mmfhni9oXsDT8+3Awwgdr5xAiOFgpVqH/clFY/B6YnKMf9BpmZYb29r8Nx/jNWdtgTfRumBu9bhGsLvS3MrDNyo7vee/7dRf/lCahy0AHaZEo8yTlWdx4QOw+zqWn9wu1yQG1m5KeKAfg6Cr7bpoZFGZ1oeaXU++WPRfX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788288995; c=relaxed/simple;
	bh=7KrXHOp6zx7Jw6ThttjXtk/cJjaQTyVHIQRYMzgXhRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EyyEm6oGn6HjXIeNJrZRK+HisGrBzE328tGR46mGQfbwi8od/LLQwFe2/1900A1Zl1te9KHXfwGtoDcONY8Ll9NBln2S/BoF0XgW87YG/Un8Y8tDZDzsN9u+4tGK9BGbUiZLcz952qzWeK4bpPghT+yVDp9KNV5zbi4Vt6RmbQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQbAakuF; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQbAakuF"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-45837e52d8aso220073fac.0
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 11:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788288993; x=1788893793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDIKr9yFcCSAzvW2dhM+SCgv0HZ3qnZUYRj5rrauH8A=;
        b=cQbAakuFxxw6v+o6U24a2Hutjj84JJ9MsaP4oOkX+cK/ACDztoGKzf7BMMXw/RqVFU
         YNHeRRBgHQSb397esCKnt8bawtq0J/NzShodOD7yOV1gsMInXY3zXI0KkUNs2SfJtqya
         kXXpx/9a5CYeTFOxz3qK/6tBlONK8/zD3gLSHo5I/7AtT3df3mbeTlEh2KNGNto0I7tG
         R3dK0WEJGFpHffaTIyr3z6ZhHgoDY0quSHb3O/J45agHLcAtWENI7iXNYN+s5fRSiANp
         X9/eLD3vc90O5qAn+NVqvkAmSGL9G0lz0QLKyAzRjY+RQu6YFw81uu0MgqsnUCK2qW3o
         HtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788288993; x=1788893793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NDIKr9yFcCSAzvW2dhM+SCgv0HZ3qnZUYRj5rrauH8A=;
        b=onrDZIBRDMVPE1gEumOttRScupXx3g79PufkjD7M2Sx3a3B4Wd7qxT7Jd0Dc8dS1Oe
         ljMzHe/rEglaAfb56qn+0fc6Z1udUgbywq+g+gbgg9J2QKvaXygttS8sCa23zVzkjg8H
         epevfNdBaK9uTpYFRL8OUi3mfIPUJHwxa0jdzs40yq25V0undzk4BMz3EJzSwo2sNb5N
         hiFdczafgqYvS5UvfZp5gSoCFyijtclP18msdGrLbYCNah9Hxr/fOZgRz3kbvAx6jykU
         cnscWvd/HVs4znzHHZTenX6id5hreAtFiDvNdfWID7qbV/TZgi0tfqmvTLtpnKdKrjpS
         zWlA==
X-Forwarded-Encrypted: i=1; AKwUvByEqg2VCLKsM/5xLTMkSZ7pgl0zYdkrky4y9MuGKVY1Ed1dslaCN0MtwGVhs9BFyrsVD4yADw5FkZ7sDK9A@lists.linux.dev
X-Gm-Message-State: AFuF++lM0ZdJtoLoD8SRg0c1Fqjk+M+gyOsBlAVXflnwiUl6RZLXqy3o
	7pCBlO0otP47Ez7BPydijJN5rbVfFbJ49HJxT7pUgRXI4fv776Sqe6Z5
X-Gm-Gg: AYBFou3g0O3jmQa9FCApCaqQdZI9GnodjIEi08hs9xJGxTk1CIl3lqoHK11cG0GDrhv
	yDndvIHsX4aKZf9eRmH2akZRiPkRq+H6LtnWJp4C+HlEEYEkeHu0cJL3DVkdyTUgEfU32F/2wkB
	LizsgNLvRk9mQBgfpg9eEOKh9aMqL93eqAlWQuLFe7D7qYmzJnkxDHUXXjv9B6am1UNtdcyLedB
	YqMtkFVX4tog2Igo7rQB0isCmjOB5kB6fg/N1zJkALKH7X1LXaPXvhDDstjvfCPRYTQD3BScGgm
	fWD0cqhbrUqKCq10cds65DlsYlHsru7dcD6OljbLJyE08zOhbN/htKW3LRyfLwqVXp2S0wYdGGQ
	GqeM+Hii5nPMrQRRmIE77EUqPCkei9aaaTFuGoAPhtg64D/csvPAnlGJEsgtnRAQBaXKBDm41dc
	oroQO/89fADp4RKkj/GD55Eqws/VLwiSGZ6FaV14xiz9iDzBdWHiuh5H30os4H3SWH8y6FpH9XS
	Fzqq1kxRWT8bcU4lNX2LyasE7YxG+kS/loSFP2ygtr28iA=
X-Received: by 2002:a05:6870:c20a:b0:44a:e965:b9cf with SMTP id 586e51a60fabf-46af57240c0mr10645373fac.14.1788288993098;
        Tue, 01 Sep 2026 11:56:33 -0700 (PDT)
Received: from memorizer.localdomain (47-163-111-11.bng01.bytw.tx.frontiernet.net. [47.163.111.11])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm778124fac.6.2026.09.01.11.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:56:32 -0700 (PDT)
From: Yudi Yang <2000jedi@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yudi Yang <2000jedi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: greybus: audio_codec: fix stack overflow in stream name parsing
Date: Tue,  1 Sep 2026 13:56:00 -0500
Message-ID: <20260901185600.2725678-1-2000jedi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intf_name and dir are 32-byte buffers. Parsing a module-provided AIF
stream name with unbounded %s conversions can cause buffer-overwrites.
Limit each conversion to 31 characters.

Fixes: 60e7327d54b2 ("greybus: audio: Find data connection based on id")
Cc: stable@vger.kernel.org
Signed-off-by: Yudi Yang <2000jedi@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 6daa4e706792..c3fefe1414f9 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -311,7 +311,7 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 	}
 
 	/* parse dai_id from AIF widget's stream_name */
-	if (sscanf(w->sname, "%s %d %s", intf_name, &dai_id, dir) != 3) {
+	if (sscanf(w->sname, "%31s %d %31s", intf_name, &dai_id, dir) != 3) {
 		dev_err(codec->dev, "Error while parsing dai_id for %s\n", w->name);
 		return -EINVAL;
 	}
-- 
2.43.0

