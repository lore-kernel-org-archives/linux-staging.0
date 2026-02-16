Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729F2E54DE
	for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 20:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771273165; cv=none; b=NYO5eblclR/rb/DwvGuRL79M7jZ9gahilg/+8J0r8MsunxKWmb/1AIxGcihRiySHCTztZrxDM2g8MwSeVuHmnrKCx4otLscZ1oxmXHFlEm6vPyuL64aaNECeqWg1GnoeOjyE4zqepjCqYACnq8gmyoHejbKvTLvQFL30H3YzMfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771273165; c=relaxed/simple;
	bh=j6WdTuMbnAS6EZ4UGShL/yYnQY30QjPumdOaH2gmcrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwMV1OFKSG0UMxstABXSQqyhLu5vdZUuWlCU7Kfh5eEgk0rSyaehce5uxEndRNgdIMPIOwGiORg65Cz/Ff5ThWHim/FB85pI9AIMUIZhx3aqYnWzC4uf9sd6EdZDZBdb9gudEHEmURxZgZNbg8tzU++cyrMwVmqAgGQQhjDsmrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpKzdjmF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpKzdjmF"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a43a512b0so3887366a12.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Feb 2026 12:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771273163; x=1771877963; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVXohdqNVWPFTDXwbCd6oi5O4NV76l+yiiTi2RIk6l4=;
        b=NpKzdjmFPyQohggCvo00tk10QyKl4euI5NgXaFz71eOYMtxz7mQsvpejulBSBVpx1n
         h5/SCGcH+cSyschtt2B6itjV3UtsuUH1TIyBQLxQjAft4FAUJgtRp7O9M/mz7ZEKSUPL
         vu72eReyTOnn+Wo0Tn6f5W1fALQcf/wMqqwtvrQILwUAeb4rs3QdRgUHY5Bu1vMYUuH2
         srhsQVCp+Zo4yK+m8lxkXIZn/hzQGKaX7PwBUUZQS+yozIGaDDMrBl4EfmdPe5Wg3nyj
         cWqX2gYYtjgxactTzDk7UeIjTBpnXAIkgqpKxnkO5lOHwm7aiF+4V2Vr7rHjoRL+MwO2
         Xk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771273163; x=1771877963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PVXohdqNVWPFTDXwbCd6oi5O4NV76l+yiiTi2RIk6l4=;
        b=od1WcImtRJQ7sIVYdgL+xzpwSzEwMcfxG24lx7RJs4l83QkMU3mXotk6/qjSEGqz+/
         O43smrJyTAdXEnmGmjJQ+xuBIMt/vxyBhW0TfYXdq38keODL43P8AjIyeVwMhy7hMAgX
         dwkKBeqx/UZy2LhrtTiayY1YfVMXS74t9iCPoGdeUIeq/B4BsBRTjHVeOj/NNO8jimEl
         b8e3wxRtua6YKhKytt10nxDMFxzt6CY4b8gzYO9cWoVJz5P+8Jg7B7j3S/xJJkKrrLSh
         C2jK/FykkJP9k7Rz7xz+0y4NHuV0lVrdpUbPqGwY5oLcmSefJomN2scKg5Wk3JTW10B8
         zG2w==
X-Gm-Message-State: AOJu0YyyJQL76EqHzWKGZb3PkqYCubO75Fy1CZ2Os6qCgDDHNwm8a1LO
	JKvhLhNRygc8PtoEJfL3oI0hk8OKynkLUlTIBpKiJsS0KCVlEDv8Q4le
X-Gm-Gg: AZuq6aKph5SCyvjLA5SIEukFharb4xFL6BvoJppDurQ1Szn2fR1YknXyJrkkFUOD7H4
	eOj7QUoc5IjYlvQ8HwrSl/1wD1ioQ8BtkNpVQgwLY+xSbZ/gWgdz2eMlB8rcywyDj0enP3QhemG
	CAPCpIrFNIvWlfHAjltjXpHRsVye18iGhS8f/oeeVWRUNmkd2Z5oOgL9sbjIcAnWVtc+8G+SIIY
	HcE4/9XOZdiSrOeWX3lEAAyWIxNHE8YUJP8+To+BC2xOTG0kFhrdN56iF5sOgCLceN0Bed4gotb
	taEs64Vjj1bWehpqmd6VxK40UTHPawVOshQ2YafdSHPrKxtUjk66Q4f+FHdrnXVMsocIlO/g61v
	XdvJ3Uu8Epjs2KpJiEtybHwe84UlciouPMboNcKqZEqKY6/7vICdaew5Kgl+frDeT4rcLp4bMwW
	t3Gyx4dGtRKAeojHyr7FTzSAgCCkEyKigMxp70Js0emQRgLTXecoy8pRxy9XNgbNq5BXx3WIjYw
	uySo5t7oEdueFgwyA9xhWUzj3NVb1OmA+J9Uc0khyudsOIDYs8CSFemlMBgU4A5cYJSQxNLHjUe
	gw==
X-Received: by 2002:a17:907:3e04:b0:b87:daee:a6c4 with SMTP id a640c23a62f3a-b8fb44a68famr552185966b.36.1771273162828;
        Mon, 16 Feb 2026 12:19:22 -0800 (PST)
Received: from cs-874966990260-default.europe-west4-a.c.i2f7e30109524dc12-tp.internal (170.212.12.34.bc.googleusercontent.com. [34.12.212.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735e4cbsm293498466b.13.2026.02.16.12.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 12:19:22 -0800 (PST)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Artem Lytkin <iprintercanon@gmail.com>
Subject: [PATCH 2/2] staging: most: dim2: fix error handling in fsl_mx6_enable
Date: Mon, 16 Feb 2026 20:19:21 +0000
Message-ID: <20260216201921.1788-3-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260216201921.1788-1-iprintercanon@gmail.com>
References: <20260216201921.1788-1-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Address several error handling issues in fsl_mx6_enable():

- Replace IS_ERR_OR_NULL() with IS_ERR() for devm_clk_get() return
  value checks, since devm_clk_get() never returns NULL on error.

- Replace hardcoded -EFAULT returns with dev_err_probe() which both
  propagates the actual error code from devm_clk_get() and suppresses
  log messages during probe deferral.

- Remove an unnecessary string indirection in the clk_prepare_enable
  error message.

Signed-off-by: Artem Lytkin <iprintercanon@gmail.com>
---
 drivers/staging/most/dim2/dim2.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
index 1f07c37df..15eaf4ff8 100644
--- a/drivers/staging/most/dim2/dim2.c
+++ b/drivers/staging/most/dim2/dim2.c
@@ -923,24 +923,23 @@ static int fsl_mx6_enable(struct platform_device *pdev)
 	int ret;
 
 	dev->clk = devm_clk_get(&pdev->dev, "mlb");
-	if (IS_ERR_OR_NULL(dev->clk)) {
-		dev_err(&pdev->dev, "unable to get mlb clock\n");
-		return -EFAULT;
-	}
+	if (IS_ERR(dev->clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk),
+				     "unable to get mlb clock\n");
 
 	ret = clk_prepare_enable(dev->clk);
 	if (ret) {
-		dev_err(&pdev->dev, "%s\n", "clk_prepare_enable failed");
+		dev_err(&pdev->dev, "clk_prepare_enable failed\n");
 		return ret;
 	}
 
 	if (dev->clk_speed >= CLK_2048FS) {
 		/* enable pll */
 		dev->clk_pll = devm_clk_get(&pdev->dev, "pll8_mlb");
-		if (IS_ERR_OR_NULL(dev->clk_pll)) {
-			dev_err(&pdev->dev, "unable to get mlb pll clock\n");
+		if (IS_ERR(dev->clk_pll)) {
 			clk_disable_unprepare(dev->clk);
-			return -EFAULT;
+			return dev_err_probe(&pdev->dev, PTR_ERR(dev->clk_pll),
+					     "unable to get mlb pll clock\n");
 		}
 
 		writel(0x888, dev->io_base + 0x38);
-- 
2.43.0

