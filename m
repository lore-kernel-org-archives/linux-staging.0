Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209763B9619
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200140; cv=none; b=EghJfI+YpptlzzA+oh+mY1gxqXxJq1lvioiaGlnkY6pEmNIq08RLmmE9x0I8Q66lbIaTb5iDk1juk/s+UN/El8SKOY5vh/sby8k/C/Vb0LKomoAxVnnrmfdZDcFGKMx+o7O/2nFRK8bt+T936+nMdLUUm476p4jl/7GmgrjnwqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200140; c=relaxed/simple;
	bh=NJMipCWPPkbj4WJnOqnxKMKjoUwaGTR3HXIqrY4PdKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8Kex4eWnFZzavSFCaJxtaboAflVER0JgfxruwSYNQsnUSXlHlXSrsVh5+l/jQ6zlZ+2CZT7X7Exxo/Hd/G6WQii7vrtGlZit2Qpklsiwl9IufpMAGkvPXKXCk50DS+RRQ12FNRChoVrROEjp3Nasjf2I+JVJekPkNm4CnQjbeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQoOdMKK; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQoOdMKK"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so9048041a12.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 02:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770200139; x=1770804939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kqepZHcW5XTj/gQ8gyyG9cWC23UM/f9Mcrtff0UNsoU=;
        b=FQoOdMKKGXI5YHbchzdcW69AtSlvf7l7YovCqJFp0llfj0k52fpW/qLjQ4iim9OTxB
         aIBvwolDSjijf9i34Q1NeZDxAJTnaTTumQLBLD2I33at4GClxR74f7asHECG+WSckFFi
         VW7vNOiYfaJsGMugC6sTgaialLb6N0oMxsZZ/3DhuNjZpEY85uEQHi9ZlGfCh+aIrqXI
         CmQXRibkUaBYDX4kA4bpXLS2elqLTLfBNNElwqRf/QwtLxaDN+OEaOJFBdpjeobw+8RW
         GnWkYrE679mleMMst0DYQTPdsxknx3qJLx3U8YBwneXEnmVHUt1NKKt2FynudIKGKMS4
         me8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770200139; x=1770804939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kqepZHcW5XTj/gQ8gyyG9cWC23UM/f9Mcrtff0UNsoU=;
        b=PHy2XZa9rgRi+utEn2TfkVU1Jv0wRDKZNmBjS0vRGUj1iSHpznG5Ftt6qcgi6o+zml
         citdZWvtMDkxmbDhUDYZ5xg4tfLTquEYrh3eHSDGggr7mTFQLF/09V7ukvIszNyhkyKB
         IKNjr+gPPrJsADAaWuSr2fZHGEJrg0+bDIPMCJquATQG0lf3bO3nE62Mq3cX4eD0O8mq
         +h0v0HXFDsfg2WCFQBVh0t3kzfmeTlA8kJQISAIn/tiSuT27awLpL6so32lAUgKb6jj5
         J7aMAXxF0ii/HCtG1+o/ylyYfy1cFcTPXd4MYwC+LbcUxN4PqweIxwMYoBhwZna2vt1n
         zvvA==
X-Forwarded-Encrypted: i=1; AJvYcCUNu59kYB7OUqS+TUL2Mgc3kCbosDJ1Qls0Furdw4bhLnz41HnLT/PIHUHMHiVEHes2k92asG22eBbplvXT@lists.linux.dev
X-Gm-Message-State: AOJu0YyJSnhyklfG00cWK8DjA8yVKBW/kXqwUwhj5zo9G86EEiCxeg4c
	s8il+bNbfRlGiXwx7pUU+xHTeBXxFqaocZz88ofm1dEv93NVAsfIgkCS
X-Gm-Gg: AZuq6aIg5i9pb1E//f13tfDzls1X5ZWxrXchhYi7nHVE/cHYamPrS43IMRXqeXJEhzx
	eR6pocSGrDlVkM62d2KFeOqCPVSnJRNmJ9asG+/7tfq/B8HV3e+hPme43mPKXj183JJF6QaYqC3
	P0SeAEvtLtnu7Cft6ciXc9k1NJb2Lo0gAuZZAa3SPFM963dw5B8ejjAOrOr/Os7pE8CxSJf8dds
	3qTjm5O5BL40gG2OwlSkAleJ20x7urAj2t7aHkxdQVuxHHEoCvEhPHKOH9d5Wo8LCWN1OWe15YF
	vwaYoD9ngZKQMDfwWN72fJGaA1Lssfds2QruaZWriSDZpCUtw6RZ34r9OJuNVAbRgTZL64ym/fm
	1V+Q09gpovTKJvXc5DzydFs8Kxv1L1XO/Pvx/ryNd9hj12YSFu4B0MPd9eU8plMK/mL4iLvHOOz
	bX66uiz56JsoPeegvGy/LWHwBfV1xyxgxgapR6uQ5LFStqdQhQZrIsBw2ctSVZnCn0XeO72MpV5
	zFbziiEy/HrkSL41qxHDF/xzIf5yfPiBOA2nmD8Fmb900gxQwo/G/+8BPH5Tw==
X-Received: by 2002:a17:906:f582:b0:b8a:f91e:283b with SMTP id a640c23a62f3a-b8e9f32c168mr163757766b.60.1770200138359;
        Wed, 04 Feb 2026 02:15:38 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-b.c.od237066db22328bb-tp.internal (181.183.90.34.bc.googleusercontent.com. [34.90.183.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fef0e17sm106440366b.33.2026.02.04.02.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 02:15:37 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH v2 2/4] staging: sm750fb: use strcmp() for exact option matching
Date: Wed,  4 Feb 2026 10:15:34 +0000
Message-ID: <20260204101536.3311-2-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204101536.3311-1-iprintercanon@gmail.com>
References: <20260204101536.3311-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncmp(opt, "...", strlen("...")) with strcmp() in option
parsing functions. Options from strsep() are complete null-terminated
tokens, so prefix matching via strncmp() could cause false positives
for options like "noaccelXYZ" matching "noaccel".

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 0eacb522d..73d78f893 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -937,21 +937,21 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		dev_info(&sm750_dev->pdev->dev, "opt=%s\n", opt);
 		dev_info(&sm750_dev->pdev->dev, "src=%s\n", src);
 
-		if (!strncmp(opt, "swap", strlen("swap"))) {
+		if (!strcmp(opt, "swap")) {
 			swap = 1;
-		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
+		} else if (!strcmp(opt, "nocrt")) {
 			sm750_dev->nocrt = 1;
-		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
+		} else if (!strcmp(opt, "36bit")) {
 			sm750_dev->pnltype = sm750_doubleTFT;
-		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
+		} else if (!strcmp(opt, "18bit")) {
 			sm750_dev->pnltype = sm750_dualTFT;
-		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
+		} else if (!strcmp(opt, "24bit")) {
 			sm750_dev->pnltype = sm750_24TFT;
-		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
+		} else if (!strcmp(opt, "nohwc0")) {
 			g_hwcursor &= ~0x1;
-		} else if (!strncmp(opt, "nohwc1", strlen("nohwc1"))) {
+		} else if (!strcmp(opt, "nohwc1")) {
 			g_hwcursor &= ~0x2;
-		} else if (!strncmp(opt, "nohwc", strlen("nohwc"))) {
+		} else if (!strcmp(opt, "nohwc")) {
 			g_hwcursor = 0;
 		} else {
 			if (!g_fbmode[0]) {
@@ -1156,11 +1156,11 @@ static int __init lynxfb_setup(char *options)
 	 */
 	while ((opt = strsep(&options, ":")) != NULL) {
 		/* options that mean for any lynx chips are configured here */
-		if (!strncmp(opt, "noaccel", strlen("noaccel"))) {
+		if (!strcmp(opt, "noaccel")) {
 			g_noaccel = 1;
-		} else if (!strncmp(opt, "nomtrr", strlen("nomtrr"))) {
+		} else if (!strcmp(opt, "nomtrr")) {
 			g_nomtrr = 1;
-		} else if (!strncmp(opt, "dual", strlen("dual"))) {
+		} else if (!strcmp(opt, "dual")) {
 			g_dualview = 1;
 		} else {
 			size_t opt_len = strlen(opt);
-- 
2.43.0

