Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4534520F3
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 09:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6rvJarw"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9c2a0725825so444404266b.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 02:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698051675; x=1698656475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+GHphwBFjGwN9m3MPCMJRC4fLS4F2GugdfMMYNHe6o=;
        b=T6rvJarwLt7HRLpwbJCnWcmsSHCmVqcFgAqj/qwwayewR4LMBgQTQ5JeTUt4NSlS96
         aTS0jrJTgQ2vsYe6rsfSawW82M9BP1JcK3Kdcx4HTfGrlpFwVcIAsXVGxOf1TbRLhW3P
         /dOHBau21t3S4pTGA6OKbVEowXT7UnvRbACOT/NVLr6YMm7Nshh0LXF9av2rU3EAq8jn
         8ehc/n1MNDwPnaQsF72fwq2415p9Fx1DnHH7QsGnboZrf/jqR7kAXuz9B3X6qkdPYDuP
         Fa8tfhvzPe33ZFJFmD8ZzoRAjaKsmYWj9QTqPZUWjEyR9qeuQZrJOLuQ6dFJRkAHrjLx
         0WyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698051675; x=1698656475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+GHphwBFjGwN9m3MPCMJRC4fLS4F2GugdfMMYNHe6o=;
        b=JfeoV1eT1k8aYpVxmPjxLUeOVJtn3zqdCfMKsK+JWqw1u//xoEBatgqNaRRsO7A0pe
         ikR5IiurYFBRirmtgiimzzg+dHYnvVRg2bsT/T4zDIl0ax7tKI/YsnXfP/aC1sOhhrGC
         HwBwW0sL81NKvVUFnZ5Ay/+Q3WOm+ovR9VNmDrcGVTNXm9sfEOR8+CLYEYmwUaBj8lYd
         oCcN/Jot7xsOHIzEwJwV7AyD6dZ835/5U5xbXvLPIkqgbioFIroSy5UBYrMo6GQiVgPD
         PYVkXh/f3R3Mr4QbB0gq1fyFKD/P0GocEbLjJfu/MvarASPRvq7shHQF2ekK+xYD/72/
         /p6A==
X-Gm-Message-State: AOJu0YxuuyzKk0XKWIufI85Bxe8mlUOB0U0Rt2ePqKa/B9XWXmHuaISl
	/27mxVpeC/yRmO8r2TmbladQoNo8JFc=
X-Google-Smtp-Source: AGHT+IEqAz26HimNQ0FJAquMpXm+lDyH9VtZbDRI4fY6/4cfklAi6HTNaT0OTzrC6c2Xoah+c+9svw==
X-Received: by 2002:a17:907:318c:b0:9c3:97d7:2c5f with SMTP id xe12-20020a170907318c00b009c397d72c5fmr6998447ejb.44.1698051675265;
        Mon, 23 Oct 2023 02:01:15 -0700 (PDT)
Received: from localhost.localdomain ([95.90.186.21])
        by smtp.gmail.com with ESMTPSA id y22-20020a170906449600b009a1dbf55665sm6186426ejo.161.2023.10.23.02.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 02:01:14 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: vme_user: prefer strscpy over strcpy
Date: Mon, 23 Oct 2023 11:00:01 +0200
Message-ID: <20231023090001.7273-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using strcpy has potential for buffer overflows. It should be replaced
with strscpy where possible. In this case the return value of strcpy is
not used, so we can safely replace it with strscpy.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
Compile tested only.

 drivers/staging/vme_user/vme_tsi148.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_tsi148.c b/drivers/staging/vme_user/vme_tsi148.c
index d549c22da534..2ec9c2904404 100644
--- a/drivers/staging/vme_user/vme_tsi148.c
+++ b/drivers/staging/vme_user/vme_tsi148.c
@@ -2310,7 +2310,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mutex_init(&tsi148_device->vme_rmw);
 
 	tsi148_bridge->parent = &pdev->dev;
-	strcpy(tsi148_bridge->name, driver_name);
+	strscpy(tsi148_bridge->name, driver_name, VMENAMSIZ);
 
 	/* Setup IRQ */
 	retval = tsi148_irq_init(tsi148_bridge);
-- 
2.42.0

