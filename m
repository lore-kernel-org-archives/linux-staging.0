Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9012D4816
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776421078; cv=none; b=l61wSuDYiaWgECheFtEilYBXxcXKEQlOcT3/qf66tS3/yKCsMJmugIlcPsaw3hoG/UfY+fRankc74ZcvcP0NnDlKhax4UAFTAGWDkmO9lp/jIzuy0TsfMyd7UXkEqDlSY/qFW1j3jn9hV3ZOXShrzwss3LTpDDqfGckYSIXs7dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776421078; c=relaxed/simple;
	bh=wcBO9jGFdwwVPdrukUVB7ZxstBGjl7lPflRRPr6TIuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l+ScKLroH6jALdlM1wVkq1CJuNLBxqd0BZ4toClzTT57cJM1/SJcof0S2osdaYvY7uHijQ8b1YG/aweB/07uQwxDtgnt2UCFRFw/1TKXoU6nOMOgNuZX2M/Z7k5/PY64+zCMVjH3sPRqJnGIw6jVC717xkvF1ZOVnAbhtk99XC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9TQMhG5; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9TQMhG5"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35fc0d7c310so388959a91.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776421073; x=1777025873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8iE4usfHbukw4GyIkJMsnZ0QQYr3hxZC7HTo6J/YluM=;
        b=W9TQMhG59uwj0LCL+VARp/ytLvD0BEPP++expV2Oh8mUwkMHOkrVxAlpd8Y8K7KjXa
         wUHanGdWyVCjMAvhnz9KMcndXGE7jZUVFT3JrK7Wnr6eAaZlIvkXsCVK8B/hhNdCECTZ
         P72O/Sgmxbtq9qiJIG6SRIB/2gGeQecDIrtPPna8hOvfZ856JC7H7lOJtvv8wMKFkghW
         xfbx1Y3e2/MfBtpMpLLZXwt/Yxcq0F53uwtUbIPSkOlS2fStMsJltHfZC67pXrGZXj+q
         kyZqwBN/i6bwNPxIMlGC2wW+tXGKuWg3NGJFMyEhd63A866sT6SLomNgX6yGUM89UJJx
         uy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776421073; x=1777025873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iE4usfHbukw4GyIkJMsnZ0QQYr3hxZC7HTo6J/YluM=;
        b=IgdxDLX1Zq+mONtbXB/Hyp8JWzstVtmLKdq6piHp4mEOXKx+OU5pxf22HgCMV+rj9O
         eDOzwxOKLwGOh6kB0f4V/j6dsslsUFTQtnoP5JpPkTWGAl6CNNwec5ctWIRNkcfqwYw9
         Iszv22B2jLlCntexuikeTQAy8quDLiAqXI/NqNWRZw+ZYfNccmIwa/V2cHyudZP3BuH1
         k+rSTwaYTT0eKjYFGRPPgi+QPQ4CzzBRevYqTrZmJHu3qdZ19nVOMwxg+KXQ5ARXNxW5
         ewNQKBBgZHLZBAOzbH2mdv0/Nn4yhtTDS/DLlJ29fk2jBzbk9E4zqHcFh1ihkBSIVBaQ
         BvRA==
X-Gm-Message-State: AOJu0YyC6yfX+mpPac4qE4GxLnPhhdUUW2IQec0McYBS8M+TMPN5Fq2m
	P1CUnCFhIw67mxKzSb0iAX4+cUDf2aQ/J/42ICFGrj+7gTYl2K63Qvq2f3x+Zh2y
X-Gm-Gg: AeBDietJDU+RwnSh+5LytO3R5EgmDsWEnbh00wqn4AfSZJ62xoaz0nFAdpcSHJcwb+5
	tkiDScwVB1DSy0w8kpWyWM24qkkBiV+IHbEDHiWpiCUqfSmM6TboF/1HC54ECNSLZXkk9xQOgw5
	v1dHpPgPi2id0NjWhi/rjtgjkg4t3aV25SqJLwgox4QULdFi7zVKdGEc89JymIaEwVdpEgXlHyD
	D3TboCrhc043Ct+LcFJxgUMEv1qlgstBdne2GwQoYxzf5ro6B7hKi+v+Xbd2sFv6jTHz9U7F9cR
	/fpJlUh08C785GMWQyWuQC4A7MuwSr1PaZSs57P9Jxvc5BK3kN2bepDh8DQM/NRXykuf8DFZtAt
	qXjSkM2mKa+4bZcszdj2JESah9vgqVl1pQNHM7Buasy/ZgbGBvdtaz804J9eFs2dH3Y6kzgoxpC
	GoqrARv5wHJ545kJveFzbtoDv0jRmQ
X-Received: by 2002:a17:90b:4a09:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36140490614mr2164284a91.20.1776421073015;
        Fri, 17 Apr 2026 03:17:53 -0700 (PDT)
Received: from fedora ([157.20.226.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7976f8f370sm1280728a12.7.2026.04.17.03.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:17:52 -0700 (PDT)
From: Prasaanth <prasaanth2k@gmail.com>
To: linux-staging@lists.linux.dev
Cc: andy@kernel.org,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prasaanth <prasaanth2k@gmail.com>
Subject: [PATCH] staging: fbtft: fb_tinylcd: fix alignment in write_reg call
Date: Fri, 17 Apr 2026 15:44:57 +0530
Message-ID: <20260417101457.7599-1-prasaanth2k@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment of multiline arguments in write_reg() call to
match kernel coding style

Reported by checkpatch.pl

Signed-off-by: Prasaanth <prasaanth2k@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2..60cda57bc 100644
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
 	udelay(250);
-- 
2.53.0

