Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4110318131
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 23:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772062879; cv=none; b=Pv1kieaTj4ZeA36Wt86JIeNzVNMG8wJUufYxTivfbDI+wQeBse2EX66NPVFZvAO06uTGsb2d0MHfxDxGt3ywaS3Uh58xmuC/b5c6nJ9WiLnsi7dDEYiUGayCHD+VnNIkPv9dJE2eAZL3Ob9R83GRECqfinok8H88x3QYJsUkA5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772062879; c=relaxed/simple;
	bh=k48kyUfLRMJqJEgYLACBc4tu1ckGof4OXrdgbzaFsjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ul3VXdT+rkt1FYaGrO5ZLnhAwK91tUBoOM7iTny4lCT4Nhdij4DCaNp+RscsSE/jt9zHW7GhGh4OKBgUKPCpAv5RO9xTZOnvl7NY8iGetYpVTf6/h7CbHFH04dyqqeHnejz/z2KRxpz3TV1W8rthVgwaYeo0xdVv4o8djD4eKGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4cdlc2+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4cdlc2+"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43987b97701so145755f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 15:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772062876; x=1772667676; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=896H1+Wxt76OuddQ568kaIniMJJA3risn5GSiPmJdUU=;
        b=X4cdlc2+hxlAvsP15qYf9MNPmg56ZTq+29HdX9Xk9wg5OqgpuKFOaC8xjfo7RYnebh
         ytdLlk4AePcJMF9iqeHTWFqOGrKCYNp7dGFhs3WEgJgdynSQDQ3RmvESinZ/AlFs5SBM
         E8+PTgKp6Ne+3t0YYH5tHWYJQszLXNjm5OvldObEmwHPYK8WawEF3GBpncE4ELxpG1uC
         GjddEi9OW6DZYNi2STtvvFCS3721mo/BO56BuJIX0uXrmm00lizr9Gg+ZM1kQZuLJZhR
         NXJBRB202Uaxxgj0nsEogchzFd8tsHZL9hzDW88FFd87P+DMhoAPiyJvp7z8onEphPxg
         pkdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772062876; x=1772667676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=896H1+Wxt76OuddQ568kaIniMJJA3risn5GSiPmJdUU=;
        b=Us837FhkzTPOm4bXqm7IRz/DwxljOt9R4VcQLQ91df4Xg9NwLns6H6ry7CMBUajpm3
         QNc/ByZw40SnbBT1JPm4RLILZNy848lPN/twIrmHRY3LStPYHnKZPgl4Y1KrsDKNIc6j
         RiksyuUttdkkFi4Ty2wMBEW7VB7JHmf/7FPEo3Ms010kHM7vgqoTsxN1NC8w/zfMveU6
         hMNKBNbTNLYvK2e1wRz+uJ2hl1AHB84J/PnRytbfJM9rs6yq9GqbpbPyY2tF7266GBrw
         yydvghznxNAKLWwh2CF7urBJVNv87I4MIDWMlR2Iuwo2ES5+ZLYasf+0P1fF8JlJqZAG
         C2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUQpYpqrA02KMuPwTis91pDUGW614hsX/pvtiBYpL/z7QRIR8ltBFTWcH18lwhz56Dc677KCWeso0i7JG6E@lists.linux.dev
X-Gm-Message-State: AOJu0YzT+LpVC/4giRJpUHvysfFttYjgoKjCgOkzsUKl7QrKSrHU6w2K
	vgfI5SZ+FdSbZc9GWgeZGZAWUNfx6BCDMbzIGm2Sahn86y3YT51Nhehm
X-Gm-Gg: ATEYQzwIymGMRiYRB0rKiJjxzFr1kNNzhHjOoGQfv7hR2V87H6X71OtxawVERJ83G9h
	Hl8CI6pvJD6CVFc0YzQzdk9Pbq4SDDL4sgxF5MTWMDEaPnbX0YxX96rldyhA1ukRAQjXwZG5rUB
	R1B3t1UqOI5F17BJifTZuLnlayhlGQT0Vqe5cnvpPGyYAAzpXtdZZ2yF91yGlcEqqhbnPPaT30v
	Ds8jWuJUNXFSjsoGTyUTtqsjDW4t72MnAvayslYQsnMSywH5fq4wL894OAevJ4FMBkju2fJm8fr
	7SQgMSUv1E8rLony/qhXOZP8GtWa2g50at/Fk65M9omawZZ15s7HihVJSO3MNAGsxo5r2zwGgqm
	fbyk5EI6N17E9bGFKDo1uENORDkKmjy6mctOYpNL3kv11EBHjotZB0h2WAB7oBDVq1Mt7WzWjTM
	tdgR5T0bvQl44JCpp6Q/CgF1DFDDRweaORq0xtk9I=
X-Received: by 2002:a05:6000:2890:b0:439:938a:3de1 with SMTP id ffacd0b85a97d-439942aa1e4mr4235351f8f.16.1772062875848;
        Wed, 25 Feb 2026 15:41:15 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3fc12sm35307352f8f.24.2026.02.25.15.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 15:41:15 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>
Cc: "Jose A . Perez de Azpillaga" <azpijr@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: fbtft: fb_ra8875: replace udelays with fsleep
Date: Thu, 26 Feb 2026 00:40:36 +0100
Message-ID: <20260225234100.152320-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225204602.134218-1-azpijr@gmail.com>
References: <20260225204602.134218-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The write_reg8_bus8 function uses udelay(100) twice to wait for the
display controller. In non-atomic contexts, fsleep() is the preferred
API as it automatically selects the most efficient sleeping mechanism
and avoids busy-waiting.

Update both instances to use fsleep(100).

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v2: Switch from usleep_range() to fsleep() for modernizing delay calls.
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..fe95ec6da064 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;

-	udelay(100);
+	fsleep(100);

 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)

 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	fsleep(100);
 }

 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
--
2.53.0

