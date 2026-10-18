Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EDF357D0B
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326921; cv=none; b=uEt462u7ua4D9sQDLk32DCD3GZFEtMql8Z4XHIMwg1qt1sxby+P0pt/9tVeEgXk033554fkRpnQphBXfg0bZmy7Mr7IMDJgB1QmpDFI4qJbT63viQk2Q/f4ImFrWhhHwE2IXO9zUOqxpZo9fgT47dnaS8IS/bY/TkMwtvNDuCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326921; c=relaxed/simple;
	bh=cg0uRSb4UEPzp01kbIS5zd8ide7ZgMWxvA/IgBjUUJg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TVXQBRu0IinhFrAcZLAyodQtIPHcnbrTTr+innwRLxODwr4p65AwEbBy1F8fU1MyeQTVROQovtQ1DPqfCIQLpfzQKWtCeC5yymhS5SiS7L55+yOUxKSBoB1/gVl93gcxyP/yooFw4uUkTdJjpKYaTnHFc80i/N+GzoJ+nRWlC5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwYExQ7v; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwYExQ7v"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48b0584ad71so746502f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 05:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326918; x=1792931718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZRC1saK2lzqhpBjjhBU/Y8Q9XNxMDtAH2y6pyCBfUk=;
        b=ZwYExQ7vWiDpqrQkH0x15gaC5prsr3Qgx/sDvg/R7TzOi6Dv1ngee0SPP3auH9Txqk
         gQJlj/nGgGaDtWgKE4Ow1aMZhPeIaNBvnkQylhx7LOAYUEsuc7QI+aKlPDhPt8gnjI41
         QESylFxg6NGDq5SjpglFytX62usVbZvetWp7klTxfUmpZm0QodIauZ/6i7b8AmJckhkY
         xDXFOSc/aiVpFj52jPDJm34RbDthpaY7XRvmrvm2BD/5SKGL03MY5NR/QPBqm5GkTjeh
         DTBTckOnbpSiMQMpiCsqZMG4SBL0Luev9QtPNWjdqCYshh9ghRwiNWQS5d8D3q1USAwE
         NCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326918; x=1792931718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZRC1saK2lzqhpBjjhBU/Y8Q9XNxMDtAH2y6pyCBfUk=;
        b=TOUkWLkyPeWtXlkbzy7Yw8YkQY/3LdPUvx82Anw9tLBJTsyJXEVfa0iyT93BJxYQKF
         PgxyvYkPXyIv9W6NQkxdxB+6dBtTghUpD/6++3SJKTl0y0Yh7LZn+w0dLc4GEQc5g7m4
         Kd6AR9X+usPL1I9kwj/4s+BKi/smVKzQtTEdUOaRR496l6p9pZLaK+PgpyWuipipcJpw
         QggAxMqSPNC73pw8Ct8TZpIqyiaRqbmA9eImQHSMwMqlspUTUlb8C3gekp5Ogx1gyR5R
         gPzomd1R5N4ql+hGQHPDJ3GT4Viw1J5HIWDG+X5byCLBCMrJFh3ZY11J2bibi2ZsuN66
         u3+w==
X-Forwarded-Encrypted: i=1; AKwUvBx2o1f4K9QaVK99Fwpg/Gpm5OIUtYZy+QGcLRAQUGCd83H94jYsNmqOLmW58c1OQm0dmG8bgn38oweG1G++@lists.linux.dev
X-Gm-Message-State: AFq9FYKJObY+bvQnrdfS/APw7n8UYF+F3RyUYEz3iHf85IYj44DzWxvG
	5cKyNnt73v4z6ceeeGXJ7oNZtoSo0UNfWjrjvQm3MFZ7fPcaO4qnv+1ftz0gHN5CDQdgfg==
X-Gm-Gg: AYBFou0SjRsG5lZQ8p6Q/x2dLsn2BpZHcU/eLlbwUtcr+53jGdljgnz4/KMOm/FDCnz
	CjdYklbCVgxwhM6Fg/ac2ZI75VVA9ay9hmjmUTguW4TKxCzoKZYtAG6xGgC+otuzRisivrA0OG6
	ppbFXcsyeW/5iTosydKyxHKpa0OQ19iGO0xtey1Gg1/wLInhL3nScrYnxjHOrg8sTQf0T1FtkZ8
	is2ZqbAgGUymUp13Lh9yNMyU0Nz1Lf0KMPfSS3YswnEXq17c1YX8m5BCDofniIPJ87gJL+2A8F3
	cbu28YrKA1fTTs4TmZc0/rGON+D3kU70SA6c1MuSWvlmJWtGJdwKy5nKRemRDQPWUAmSPr+/c93
	gEWpESk+JX7TZcf5Sf+4Ipg7Bbhpe+/USCNzfO6/xO86/lkaMQTlpM/XjYo8VMecgzBnHiS+9s7
	aTcUOB0vDCztjD63lxfznIVFRwYZhNj3ZXRGbL34R3XD2SgGOJGo2avrG+B7SHvwpR5aagf2oXj
	24dxRgDrA==
X-Received: by 2002:a5d:584b:0:b0:48d:f831:2688 with SMTP id ffacd0b85a97d-48e079767e7mr10390179f8f.3.1792326917977;
        Sun, 18 Oct 2026 05:35:17 -0700 (PDT)
Received: from kali ([102.89.22.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a0dsm17000429f8f.47.2026.10.18.05.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:35:17 -0700 (PDT)
From: Bashirah Lawal <bashirahlawal017@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Bashirah Lawal <bashirahlawal017@gmail.com>
Subject: [PATCH] staging: fbtft: Fix continuation line alignment
Date: Sun, 18 Oct 2026 08:34:30 -0400
Message-ID: <20261018123430.148379-1-bashirahlawal017@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Bashirah Lawal <bashirahlawal017@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index afa8f1c740c5..d58b1247262b 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -38,7 +38,7 @@ static int init_display(struct fbtft_par *par)
 	write_reg(par, 0xE5, 0x00);
 	write_reg(par, 0xF0, 0x36, 0xA5, 0x53);
 	write_reg(par, 0xE0, 0x00, 0x35, 0x33, 0x00, 0x00, 0x00,
-		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
+		  0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
 	fsleep(250);
-- 
2.53.0

