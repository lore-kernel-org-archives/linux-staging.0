Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D595612CD96
	for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896215; cv=none; b=IKaURzcdjAuGRWHaesB8KFk7oHttz926yjSi7Cjb8OT3fpN3z4kcwTw70nyVRYQ8wBDZ/ICSHrMlWpmN0So2BVt6nFuzN/0lrhH0MssYxSoxTCKqNOLnkkTXQCyZnIikec3hHrAODxeI8i2vdQnUtO3K0gB1Hmu7qjeskHgdp50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896215; c=relaxed/simple;
	bh=xGtdnRt3Vj5TJFE+xPUs3ODpILN2e8JGFrFZ5HwFyn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H08VK8b39Os0Ayuyb9lt7BdMHXOdwUF6HTH5xKQ/tTFQblyhNbl+b+PBb7zUZbe11ThyMjk/eqv0yssozPasTx+4SwMCQwB84/qrt63cnXlW4F/BsWpz/zHBCDbjbjoyWNefPayMCkUriR74bLPCEkeDHUKR710bOmm8peRtpug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fis20nIm; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fis20nIm"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5c9552d02e6so2943320a12.2
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728896212; x=1729501012; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y/JEhqoZl4E0cyUUh/uV9OIb6kXsx02RuLl2MX4iZIs=;
        b=Fis20nImoQM5oz2Hqwhhx2dbJsPXc0QUel9vGckS9KjEwmgMvWOwoUXvT2h43BGsxN
         1aBx8oXSQnQnb8FLQbpW2wltZMJ73IWLg1obSvDaDcDFeJdp9ccKRZMEF+yBYLvRU0ox
         YvAKm6ezNFhfIUPUIzblWCPZwHJ5hW6oYJQxM8EsGakPo+wztNK+6qXOLk4MTB7p+Yy6
         fq6TxDHLoW5XDwd/iW6VY2lCSlu688v671+FGe7eSknVV5Gw+0q1ywXaBZ/kF5Oz9y/a
         cabYO8XjjAafT4Qz/KKxCzYAmFBBdcsBwmbc9d9z1CO6msx6ERR+VlMqm65HagbKPqiV
         q9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896212; x=1729501012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/JEhqoZl4E0cyUUh/uV9OIb6kXsx02RuLl2MX4iZIs=;
        b=NXaeU+LlfluawfUi4aCGr36lwx3km3YEpNc4c7JSt2hE+FSBaQA8y2kCwHSYLOdnBy
         j7esd2hkhm737KTR80vDRBgzQjTTpFDw+nMzGtoyEAOUTooi2KOGkIKROcZx2ebhUOaK
         lxm0sMcKRZ+7fHej5yTEIby55kmQ/sVZ7rgmc9IX9aR9uN/n2ro5pZeRo48riE2mWuAk
         eVvaw+9GEpDK7eIvs0MgYXHfzidnvSSYXkN7xNnKLSyFFGVejbMXRltqmVbVBm9Lgaua
         Ps+GHXU8MWbkaQSCIpdvLm/sLN/78Db6oZW7stksXbnRde1rcy6F3Hp9xAli0iBC68Nr
         /ZcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNyQdMlOhkbbbtoGAUkEIejtdLO5J1xuxdF9o0/O/GfahLhorKtH8jzXT8wwe7G3yil6C7a80ZTF8+mKHF@lists.linux.dev
X-Gm-Message-State: AOJu0YwpDpkeMn9z+YL6rOUt4RxYTC6HL2j9bJGrsVkuZGOUc7teOC7P
	U+l1BytypSN0re3TyT923N2XPGwSXuCMGQZTS9fLDZp5w6HrCtIv
X-Google-Smtp-Source: AGHT+IEFn6QtuxV2uIFTjjx/8oPht9aHKpTC7u9qcL44bqP67ILGm5a+ZBNPq+GHrpBB1J5epP0+nA==
X-Received: by 2002:a05:6402:34ca:b0:5c9:68f9:8af3 with SMTP id 4fb4d7f45d1cf-5c968f9a259mr4404776a12.17.1728896212102;
        Mon, 14 Oct 2024 01:56:52 -0700 (PDT)
Received: from [127.0.1.1] (91-118-163-37.static.upcbusiness.at. [91.118.163.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9370d2296sm4635091a12.15.2024.10.14.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 01:56:51 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 14 Oct 2024 10:56:36 +0200
Subject: [PATCH v2 1/2] staging: vchiq_arm: refactor goto instructions in
 vchiq_probe()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241014-vchiq_arm-of_node_put-v2-1-cafe0a4c2666@gmail.com>
References: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>
In-Reply-To: <20241014-vchiq_arm-of_node_put-v2-0-cafe0a4c2666@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Stefan Wahren <wahrenst@gmx.net>, Umang Jain <umang.jain@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728896207; l=1704;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=xGtdnRt3Vj5TJFE+xPUs3ODpILN2e8JGFrFZ5HwFyn8=;
 b=qS4TvGWBJCdTNKcjEj/E2YkKBXpwxQCEeub3CsxnCOFRi2PGAsVjTmZNKf7cV1VqYhMDxnDHi
 aZvTdlM8d5+DTAOddmqFmYTCjnf7qZtGg7jjKKm1cJ57YkZ8DO55+/t
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

The 'failed_platform_init' and 'error_exit' labels do not simplify the
code, there is a single jump to them in the code, and the actions taken
from then on can be easily carried out where the goto occurs.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 27ceaac8f6cc..81b2887d1ae0 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -1361,8 +1361,10 @@ static int vchiq_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, mgmt);
 
 	ret = vchiq_platform_init(pdev, &mgmt->state);
-	if (ret)
-		goto failed_platform_init;
+	if (ret) {
+		dev_err(&pdev->dev, "arm: Could not initialize vchiq platform\n");
+		return ret;
+	}
 
 	vchiq_debugfs_init(&mgmt->state);
 
@@ -1376,18 +1378,13 @@ static int vchiq_probe(struct platform_device *pdev)
 	ret = vchiq_register_chrdev(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "arm: Failed to initialize vchiq cdev\n");
-		goto error_exit;
+		return ret;
 	}
 
 	bcm2835_audio = vchiq_device_register(&pdev->dev, "bcm2835-audio");
 	bcm2835_camera = vchiq_device_register(&pdev->dev, "bcm2835-camera");
 
 	return 0;
-
-failed_platform_init:
-	dev_err(&pdev->dev, "arm: Could not initialize vchiq platform\n");
-error_exit:
-	return ret;
 }
 
 static void vchiq_remove(struct platform_device *pdev)

-- 
2.43.0

