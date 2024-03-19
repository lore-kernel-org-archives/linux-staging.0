Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23692C19F;
	Tue, 19 Mar 2024 18:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710872297; cv=none; b=LC1rJt24KpV/ehCPaPcMdkRW7H2g0bRitQ73RJGe3724pX0robryiehBXAiXMcfFO7q3x/VINVDxejG+W3h3FvutZ/KgnBI/P4tTVl2NrGKOye5f04H4/ZSK7o8RU5b350f78VZ00fhWYxhNnFvSh+U00mxrP0RprXcCfms/Xb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710872297; c=relaxed/simple;
	bh=QXOhZ8fhXE7YnPA0G5NXIgrRxRxesAzI8MRpaajT7O0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MXd5gRpzF+WDQh6n09cElX9cWKgM8HITqKMZe/WeXXSjrl/8eqxlozPgbhof+apSFzyBYFx6Y1JQJcd8BVQY+LULu3alH6YatjeLitMl+R+E3Fl4UcZEcfZlVJLMlQv1l2hNKhOJamuIg2GBk/H5hkxx4CqcE/qGu9mo376RJeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4jQqoP4; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4jQqoP4"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5a0932aa9ecso2267820eaf.3;
        Tue, 19 Mar 2024 11:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710872295; x=1711477095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=szEDIHxruW7I+bn4nLl0COJDZkTjlh/OkXkS2Z0jyIg=;
        b=K4jQqoP4nISrf5osomAKXtOQDUmUgKm2CwIiHQAYvnpKn8ahLD2Kki9SptAdQUjSZu
         XWfei3xTnPABtoQVTNVmJQ9x9hdOOCUyGojYajoLc2dXQjiJ18x8BLF5s9DXQLjmM3Hx
         k/aAlRJX17FzGkqcyfH26lX1djcxEdUevQMKJgLih++9nHuVCnR3J3Qps2EbuJRgeRd4
         Ww5OxmVukiizulfHbTxm+NKlhIobVvvm6uDRGAxnDFj+ncDqUSLLwi1RnZ68HbCNw1IB
         uzdP7rq7kM1At73Oc+UM8Hx2tf5+GwV5eVDnjyvgWXF7QRdexxAgOZ5F3a6V34IOzSFD
         ZcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710872295; x=1711477095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szEDIHxruW7I+bn4nLl0COJDZkTjlh/OkXkS2Z0jyIg=;
        b=LyuY68Dv6alZW5CnY+QqzjfwPJ1QI1kqT6nyvy3U+PXl1DBWcOTZGi/NgFRm6hTPHk
         A5l5+duT7+1jQ5v8KTEn/Kgk271+iEEtB7RiCUjECzxBSfgu/z7AwCOAz57AyQp3ZayM
         yR55h9d4VYYhtYbs4KRslTGkmsOgM2xflR3UwkFpCMZHZQdFr+b8zPmQD8zPlzh2JvVl
         p5gb7A6HDki02A3iXMhqL80YDFBEJBEsgQgGjW0F2T68xEF1PGGkOyIM1AEAjRQVpksM
         wNUf0pRp8fFA78FaqdR3ARZKIk+1Tnn+sKogBB8CNhSbNbcsWC7Mk9gDFBTkVIM2oAR7
         IogQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0tTJAIXT5oo4Wz7e+fhVMtp/r0gUceEzG9x52A4TGQMptoU41MxXZ2yqyWT8ULYObobeAxG9eGga1gsKGrgf+oAfTUln93Acq2W717798c0TdbGVKUjB8rMcnAYlG5VGh9dNZM7dqig==
X-Gm-Message-State: AOJu0YxldR9gl7DY9F/zbgEyGOJjyyZWpKVsZQpepaunrfIv2rbtpKi8
	NzXhQnvF0efR2br/ihJoCXU70goLh7Pew5E372UnjGpK+aCwPS6s
X-Google-Smtp-Source: AGHT+IGxxtutI/2GkkVuAhNVSZPhi80oTxv/DyzjTcVfeJcKiNA+pSwqWAtuLjgZtrOVMTMsW0Uc4A==
X-Received: by 2002:a05:6358:7f96:b0:17e:8f64:1e92 with SMTP id c22-20020a0563587f9600b0017e8f641e92mr14702410rwo.13.1710872294995;
        Tue, 19 Mar 2024 11:18:14 -0700 (PDT)
Received: from Ubuntu2.. ([14.139.121.51])
        by smtp.googlemail.com with ESMTPSA id k188-20020a636fc5000000b005e438fe702dsm9216950pgc.65.2024.03.19.11.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 11:18:14 -0700 (PDT)
From: Chandra Pratap <chandrapratap3519@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Chandra Pratap <chandrapratap3519@gmail.com>
Subject: [PATCH] staging: sm750fb: Replace comparisons with NULL and 0
Date: Tue, 19 Mar 2024 23:47:35 +0530
Message-Id: <20240319181735.366565-1-chandrapratap3519@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace '(foo != NULL)' with '(foo)' and 'x != 0'
with 'x' to adhere to the coding standards.

Signed-off-by: Chandra Pratap <chandrapratap3519@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 04c1b32a22c5..4537f007a810 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -926,7 +926,7 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		goto NO_PARAM;
 	}
 
-	while ((opt = strsep(&src, ":")) != NULL && *opt != 0) {
+	while ((opt = strsep(&src, ":")) && *opt) {
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

