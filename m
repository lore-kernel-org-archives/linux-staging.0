Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4286A8B0;
	Wed, 20 Mar 2024 18:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710958250; cv=none; b=ObQFC72E9G48n9uaYo5TKaTVVgPZhRFz+uzvdj5zfRHG4GdLt83grxAIGzjPaUodkZzPBtmuWHsFy71FjjUaGJC5ITM78b8MP5NMG0x1a9dNBkMS3cLB5oBsK+uhDVoeUWYzZWwJrmpZCfyn9ThRxn/A33UWJoiF8W6C6/MhN5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710958250; c=relaxed/simple;
	bh=848BvPcWVF2HeOCahhaa+N1S4L9jNZkkt4RSFKyn3JE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XlnKrfb2pyS83Qdut5QV+vKAZ9QYIquPkj/bZKkDNLevtIg1fNAk8z7vKusfW/th89HwUDTSz5NFOogA+iAi3NAdTGaZ/MFK8SZphlMoF1W2BtJLB6xWHlr9fndjGwTvKrmrxpp62CLb9BdOs5ZiX03ziWKpiL0z/YpVQd4yy7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IO50v+pv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IO50v+pv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e00b1c2684so770675ad.0;
        Wed, 20 Mar 2024 11:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710958248; x=1711563048; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wOSVnh8h74qXknR828f/YsEXGTUbMVRuCYez3A0XkI=;
        b=IO50v+pvzVKJlQE9TzisthgwQuBDaUQAvT6UNcT+wbsp3xY48FHagz4OWvKtyzKC6D
         RfvLL4au9iT2F+k+uAeycBJC0itn+3Gdlj+ZD2kkYl5xaJJ0gfPO0YqjPYh1vACHFyaQ
         HAilHUjsk3JVTasn9B0GK6yRCxw1QhPS0JYmgZc4Rtkc7JvxyuAM0i4z/h6br8Oy8uWc
         ANDq5nF+hr1yY5q7JAV8+ima5VgDk6a/KORsOG7c3PDs+XNCR5MQRzadkLIzAKkekfbE
         rBzH4xuhnDSFTCj2XwDv5WpFRkF0vdNlJycT+L3tY1U+6N+tBcbGu3hAauuRpEc/GtsJ
         ui/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710958248; x=1711563048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3wOSVnh8h74qXknR828f/YsEXGTUbMVRuCYez3A0XkI=;
        b=vIsF8DljrwM8D39WrtzUCsV6PL6RuLEQJiGjO0fnsoJqm3cNY8/JRypc5DEtPr/zG9
         zevg+ZMvQYTbgnpG0dy4uU0lE0xjRUW/95aIydvTSyk/zh7sPxTCCUN6BEm7xT/6he9N
         Ng8tIL978AAT6VMTC8KhRTfoCFH3BKpwxj4mktt5y1m+Sf++mJMvYnQdauTlnUG2kpQz
         4GbES+9AhccE/2UyqbFtP4a8k00YZT+Fz5OdiKAeEkvRin4dljMm68rhwRztaln/taZL
         JQamCyJ/+Ig/sMiTXwLb2Q4cOL3ULM0o1pFP4v9aeOJnCTQ9SkpSeNw4vjtzRzg46YKD
         EDZg==
X-Forwarded-Encrypted: i=1; AJvYcCXpdWE16K6Qoze28n1yO/z0lCnYKF3Bb4L5KRT4M34YQzJ42ugWxuEG4DEXnhLke1z9hXFySS3EXTSBeYBRMN1RlKs8bn40gUHB3KgX4iVi0e6NQIzN+T1bQNpuU78Ht6vnP7JOSeZr3w==
X-Gm-Message-State: AOJu0YyUX4ZTdnUCa7S5siDW9WWi4231f/rXij6lLmyhyK+lPZM3z6sL
	APdOLq484qG4LbVprDi0UhjmmhTizJ1BzeMazZ/YTG1YoUlgUoYh8QIoXVP3Ru4=
X-Google-Smtp-Source: AGHT+IH5KlQLZQNDTUaXrq3NSLSPo+atEeIskKFkKOrkBpYI4cNWqfz39ro+Xce65d9Nj1senb0PSg==
X-Received: by 2002:a17:902:e551:b0:1dd:c24d:4d1f with SMTP id n17-20020a170902e55100b001ddc24d4d1fmr20977195plf.67.1710958248113;
        Wed, 20 Mar 2024 11:10:48 -0700 (PDT)
Received: from Ubuntu2.. ([106.194.60.208])
        by smtp.googlemail.com with ESMTPSA id jc14-20020a17090325ce00b001dd707d5fe6sm13947043plb.158.2024.03.20.11.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 11:10:47 -0700 (PDT)
From: Chandra Pratap <chandrapratap3519@gmail.com>
To: 
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Chandra Pratap <chandrapratap3519@gmail.com>
Subject: [PATCH v2] staging: sm750fb: Replace comparisons with NULL and 0
Date: Wed, 20 Mar 2024 23:39:43 +0530
Message-Id: <20240320180943.3683-1-chandrapratap3519@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <c4a5e9e8-214a-4ac0-b8ee-01a9e7a1e5f9@moroto.mountain>
References: <c4a5e9e8-214a-4ac0-b8ee-01a9e7a1e5f9@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace '(opt != NULL)' with '(opt)' and '(*opt != 0)'
with '(*opt != '\0')' to adhere to the coding standards.

Signed-off-by: Chandra Pratap <chandrapratap3519@gmail.com>
---
Changes in v2:
  - Update the commit message to reflect the changes better
  - replace (*opt) with (*opt != '\0')

 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 04c1b32a22c5..0391235c5666 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -926,7 +926,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		goto NO_PARAM;
 	}
 
-	while ((opt = strsep(&src, ":")) != NULL && *opt != 0) {
+	while ((opt = strsep(&src, ":"))  && *opt != '\0') {
 		dev_info(&sm750_dev->pdev->dev, "opt=%s\n", opt);
 		dev_info(&sm750_dev->pdev->dev, "src=%s\n", src);
 
@@ -1147,7 +1147,7 @@ static int __init lynxfb_setup(char *options)
 	 * strsep() updates @options to pointer after the first found token
 	 * it also returns the pointer ahead the token.
 	 */
-	while ((opt = strsep(&options, ":")) != NULL) {
+	while ((opt = strsep(&options, ":"))) {
 		/* options that mean for any lynx chips are configured here */
 		if (!strncmp(opt, "noaccel", strlen("noaccel"))) {
 			g_noaccel = 1;
-- 
2.34.1

