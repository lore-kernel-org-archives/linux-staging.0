Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498DE53E2B;
	Fri, 22 Mar 2024 15:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711120621; cv=none; b=FyeHpBtzGTO+lX+HQ4gEcJtFalQLtyHbqw7bEcK32oLCyl9BCVUJYH4lrQEta8nil4zXhXD2UQkGemUyWsc8VNv+e0+drshizIkiEbTgZie7j5RvoDHk8ZIDMvqzcxzslboiMCIO8ggeEngJuzSz5GaZ2zmqb988m3ndYMj0tUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711120621; c=relaxed/simple;
	bh=hzlDQWpaAy8XRudP0fe8Wk/SvOdLzdb9nk6RY9sJYQk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nzSteaD8CusvP1Y7bilUE4gNoXQczvgIsZ+EyEldFZRZmYvtw7m67DdQiEapVcwaBo5i6ycqx9tWBQ6hL3AUVLpcUKVfB0I5nIj65VihtZk5ytV6i/5/0fj9/eNRI/ztuWYiKjOXhDTVYayFibN6lblagAlQ47sxcAGKF5aWf4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaIHLCYl; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaIHLCYl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e0025ef1efso13421235ad.1;
        Fri, 22 Mar 2024 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711120620; x=1711725420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvNCq/vUyxBpwJ9D5tVxN8w0d8YTtddgB0nD7H1fQsk=;
        b=KaIHLCYloqN0fkIcQApQbTgEOAM0mrfeb2K8Bvkpx4dCSkBUlOgYDrNkeLlDw/C8O3
         LW5aiC9WTK4p/7KnJ9cylNbCWyZPkV0NrJdj65aSBWs2XaY6O7oDIg8cN4Asanqfqods
         /r58CFsg66PKd2qXsE2/2ATBh1jLJrG3enXy3hEu34+LQ7J29y9GlVuLW4aiFXCU4fQV
         hk8oofsIy5+/OfYqq0QXl87JTeCNvZV8T8Gd2OXDHvNJO2RWqAqyTv9d5JySJ0kbePE7
         WXAxG440z/zLJonhiDYeD9w83x+4b1hfMcTEJ7IXrkmHb/lXM0x44ea2+D5n4dJYnciB
         Dw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711120620; x=1711725420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvNCq/vUyxBpwJ9D5tVxN8w0d8YTtddgB0nD7H1fQsk=;
        b=UaGYtskBXjVIn/w/Eb0lUazT8HRlEnkRFJTQbmy/PPt9cSQ8wjVClrsodijbKW5a3G
         4pqT5WtATXv+Pvel8k9+AsZaYq9DGp7vssdHiH/H/OPqXAztQtkCWeT0UX/9W4mHyB3n
         sYQSH6MQfCbEeczrut6q/K1I6NvhEhYeDyGmaLE5GpcLyP9D5fE4gVo/Xd0V6nd/HHCe
         gXy7s8tZ7tTsSOXCdmARhf3KoUnpEPpiCWQWSjG7bLiXhn/5dGgBIUsazwgqEESIEM66
         K6iI1lx3X2E+gqusNU+02AYwyKa25rj9r5xFuIqMbGiIp4VQ//1YGd0Od5DAapTHztPR
         J3LA==
X-Forwarded-Encrypted: i=1; AJvYcCUCtw+nffED0eVaauXtgSc5MUWzgRWUlovxwO4OFxdQuzhCWH1lxl8y8b1tZQl5MuJI4MosSocwXQ8Qj6uHX5lZRk03osM5BwOFLUNsp3nyw5hGmKoockqX9oDz6Tb2JaJNQ81lvg91bA==
X-Gm-Message-State: AOJu0Ywr2OVBbPF438y7naY93bpwe81zCquwmUm9E+JIDicbjKjX5Jre
	E0sMO9k9i6fpigyJ4a0vjsFDOtnU0qGktSUM7WQcCbvajpE5pS3m
X-Google-Smtp-Source: AGHT+IHCgCDL1PxwCnR3s/HSd6meeWjhLlcVL81UDri0NQht+8M2mFw3XMHbUNeMHzSDAayeOBa9Eg==
X-Received: by 2002:a17:902:ce0d:b0:1dd:ae5b:86f1 with SMTP id k13-20020a170902ce0d00b001ddae5b86f1mr59698plg.29.1711120619504;
        Fri, 22 Mar 2024 08:16:59 -0700 (PDT)
Received: from Ubuntu2.. ([14.139.121.51])
        by smtp.googlemail.com with ESMTPSA id p5-20020a170902e34500b001e0287592c4sm2024809plc.267.2024.03.22.08.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 08:16:58 -0700 (PDT)
From: Chandra Pratap <chandrapratap3519@gmail.com>
To: 
Cc: sudipm.mukherjee@gmail.com,
	dan.carpenter@linaro.org,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Chandra Pratap <chandrapratap3519@gmail.com>
Subject: [PATCH v3] staging: sm750fb: Replace comparisons with NULL and 0
Date: Fri, 22 Mar 2024 20:46:33 +0530
Message-Id: <20240322151633.16485-1-chandrapratap3519@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2024032208-blunt-ferocity-22f4@gregkh>
References: <2024032208-blunt-ferocity-22f4@gregkh>
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

Please ignore the other v3 patch I sent, I forgot to write
the change log in that patch. Apologies for any incovenienece
caused.

Changes in v2:
  - Update the commit message to reflect the changes better
  - Replace (*opt) with (*opt != '\0')

Changes in v3:
  - Remove unncessary spacing

 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 04c1b32a22c5..c4b944f82fb9 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -926,7 +926,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		goto NO_PARAM;
 	}
 
-	while ((opt = strsep(&src, ":")) != NULL && *opt != 0) {
+	while ((opt = strsep(&src, ":")) && *opt != '\0') {
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

