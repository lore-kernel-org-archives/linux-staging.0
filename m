Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E833B3D75AA
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 19:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652745; cv=none; b=EbVvXhOh3c+RB/2VvHeq1kqMhbrLiFM0MnMMOhM07CmgLFPHe7KRvZ/4w04Y13JSMi62xR1D/2svgb1hoEKyrE1M3CtFKSF/zDtd0LDNs7W9V/IHDb6jaXjh4USp+8ofqYc4R4IPP9P4Yerl1R4sOV0gID0u6fp5+jB8M35NmUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652745; c=relaxed/simple;
	bh=lzUuXacpsKZw/bH+ygy2T07UohNcA3KvZSz6Y/nno8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qk3QIqLwIJ2xQeKLH4Yqfvt9cHFk36Xeax1VyLZEw0aXH5NGOnnEe1FTI8YEjfCfpBXyyjPXsQ7jf38pHNFjD3Ez0oa/eR1Xoc6gc5Xa1grezD45moTHdqzxBjZZg/JxYNF4DFeMudvqh6SXy8YJpVPpSGxpLdJBdezK2bZfvus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0vEurUS; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0vEurUS"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38a3225d59fso10291131fa.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 11:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652742; x=1773257542; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bBJGOy0OOAgMAK5PSuL/HK/WXyhWbeT3AF/z/W1aHgA=;
        b=U0vEurUS8gFT45eysWqAaKTbQgrvK02toGwaykqlSitB+eKieyhE4pZFMMC7+Q+pKJ
         SYW7W4+VN4RbaXFPboaJBErzuV8UUkunBP73hzVnjQmi+CXWEk8PUkyJdPa0gAiklQEf
         7luXT1G4aIT6BGJX/mtVVPAo2rCDVHHSb+XWVSZYLRcVfyYpYWx2B8IV7bOOCdiHP1im
         rlZLFGLMblfKkSYr9rOPhTv5sCVRoy6HIrnKBO1o0hv9Oo+rcJegCwawcZB+Syxuy9ns
         MuG4S7X1/+vfZhwPxjQ7t/l+9PpxwpLpBuJC8lBe2oED71ObPA5Votrwtaz+HLF21Vez
         2K5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652742; x=1773257542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bBJGOy0OOAgMAK5PSuL/HK/WXyhWbeT3AF/z/W1aHgA=;
        b=dzcMfD9uUApGumyNLjfXetLVAwUsk5sRNW310f0K+6GOh/4OERDfgU87dGK3aZzBmY
         NQ1McTRd4p5zndp706gJaTccYz+nTCoocJgnm2jhDk5TknqME0FfwybMJN6ffAoiKIQZ
         rSBeYe0wPU/RLzsRzcKlZ9BhDsQc0iA35ptGyxCss4RIVVjQOKyIIuPdyf1UVR/QJHOT
         o3z0n7jOv5ClRYt4zaIcKbXnrsux4qZe6EQ1QbgWWQWsqbakIhFMbCytff1rI3GRtH8n
         8MT3tpbtRIi/OWQMasyOKeuIqvJVgInaiFw4r2evaH4IgIyL8DPNakl6Z6K4EFHqP0PU
         Lkhw==
X-Forwarded-Encrypted: i=1; AJvYcCWOH8zzGghQiSceU0W6Ryqgk+6E4wqUUizOyPDBkPOVpAEmT56V2GEPjdguQjvE2NScet7IrDkf56+CTzrY@lists.linux.dev
X-Gm-Message-State: AOJu0YyTCSDy35PhBhCmfGfe+3cDug3l7g1pI4U6BbcagiGMrPdazMER
	HNErd9AgOmAuYBmRP9Xo7bpTzluLDq/AjZZ2q8YOFwJRw8g4GyOgNDQS
X-Gm-Gg: ATEYQzx9Jp324nn+KZI0hQHYr/vau208xUsl5etfBk+XSg5NDHejr07EJ+9/7Hbi9Yt
	n/fyIyfgg9D3wO2kVDLTg8eLMiB+dou47wKfZ8FvoVMVGArPPzEjCf6l33rv6LC6YWP9Iv0ETkQ
	Bvb41dNh1PBrhWLNBTnMBDF0Bg0b7r+z0dhivEJyYEWM+x0/OSDimkiHSr57CTk8moTNIaT4R3t
	lFdr0H9F6A7kKWFvDRo9IypFVzGH/JLBfuO/75ZDSpYycFX/UGGgj8knsfVCeCSB8QWZcwSxCDZ
	d3T/XKOHc+FNDNZR8Ow3gZT9giA8gvGuiBahqToPfvUUeHR+qtyt/M9kAtQ6YyuMvP3JPFuCAWi
	uXrlBoBXbvrhJlkl50AH93f0yMlaTzRaEEqmEMrPLpAGaZut/lYdi0QC/XmQk/gAmww9XaiRfiX
	TpOwruNk6GfobvhWCQQYwsxeDeXyxUv+XeD6YMr51mv01bjvUuE6yAd5VI57LFzQB8+L17c6sJh
	A==
X-Received: by 2002:a05:651c:110c:b0:386:7cfd:55de with SMTP id 38308e7fff4ca-38a2c57d069mr25584261fa.13.1772652741992;
        Wed, 04 Mar 2026 11:32:21 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6ddd3bsm723044e87.0.2026.03.04.11.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:32:21 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: greybus: remove redundant 'int' from unsigned long long
Date: Wed,  4 Mar 2026 20:32:06 +0100
Message-ID: <20260304193206.4992-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace 'unsigned long long int' with 'unsigned long long' as the
'int' suffix is unnecessary and not preferred by kernel coding style.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..0ef88b7d24de 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
-- 
2.43.0

