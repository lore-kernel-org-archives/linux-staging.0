Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55579C8EC
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 16:13:53 +0000 (UTC)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-48d0eb04c8cso1110132e0c.0
        for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692807232; x=1693412032;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qYDRjZGGnr/gd/Y4NfdXBAYEsXLOeNO0yDjSsAIxxnQ=;
        b=QXVB0hx7nZbR9a/xJxl3SPteIS/xfEPueK2yGQazaEiqkdeUlNElcO6ihxLJx7jCft
         rbnSRC5o7Q9mG1W88nBYn/SMMhxKoN9ADjOKyhLrmA2KvkFACJlpNeJQ/lZyD3d9Pk5R
         CyOEpCVtt+J68VRQ1Rv2Egohr4T9ofueOyvTCO0gzh48C2ji+7gF4ak1j9TdXIPY4j8R
         N9Y51nBsTcr8GlkawNoMz6kMu2sdRo0szqBcFA0hxR1U4SMVM5OuNqeIv9TF3l9tPYfA
         /xpqywWAR9FJKxxGe2jY0o0y+dBLKhE6uMc3XdTnqlTcn9W0z/ki1oT1CjnyUUhLXE1C
         nnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692807232; x=1693412032;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYDRjZGGnr/gd/Y4NfdXBAYEsXLOeNO0yDjSsAIxxnQ=;
        b=Dl87a79rUOA4uirCCosqzfzwv/gjRv/WS0LwjuCqU3yodJDi0ymlPLVN457i8EAmLN
         VArOxplXk52HeGldPkA73XIa9ywpWKJhdMRqiaUSgSz0xVCPQvMZ9yfUoad7WHwOZjSf
         RLVPVQ3V1nM/S8smH/9+YkfYavZf2UWn+mRM/7WJAj1A7vvZrmu2VqdtxF7kucCGFxdu
         QcBkwnVRjAdezNd3mqKAB8zVocuFxnm0luw8sBfJ0kej2B2esGif5vrru5nVAPWVLVEq
         N7QYHi2QtohUHlGablIvBSrPX1Y4+Kh5J8HPKRIRTNQ/0X/tU1geDKm9x5EtGUUBZ2d7
         Fd3w==
X-Gm-Message-State: AOJu0YxXthlFsLMY36DC+pWlh42CUqnHjlPH1QAuI7miMZ9UT22J77jb
	QObqt+dgJitgcMjK2SiB94Q=
X-Google-Smtp-Source: AGHT+IHxaYIwgFIbiRSAvQlMoHt8IPyb70oVumD80k6VwpFWQHz9Xk+5kWOSX5un9zocVRmc49k6GQ==
X-Received: by 2002:a1f:e643:0:b0:48d:1cf0:f3c3 with SMTP id d64-20020a1fe643000000b0048d1cf0f3c3mr7131329vkh.14.1692807231772;
        Wed, 23 Aug 2023 09:13:51 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id u18-20020a0cdd12000000b0061a68b5a8c4sm2255840qvk.134.2023.08.23.09.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:13:51 -0700 (PDT)
Date: Wed, 23 Aug 2023 13:13:47 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check unbalaced braces
Message-ID: <ZOYwO2UivRSo4F4P@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Unbalanced braces around else statement
and CHECK: braces {} should be used on all arms of this statement,
because both are related, as reported by checkpatch to adhere
to the Linux kernel coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index d0366dd3f2b1..ac98b3da6bed 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1866,8 +1866,9 @@ static int __vme_register_driver_bus(struct vme_driver *drv,
 		if (vdev->dev.platform_data) {
 			list_add_tail(&vdev->drv_list, &drv->devices);
 			list_add_tail(&vdev->bridge_list, &bridge->devices);
-		} else
+		} else {
 			device_unregister(&vdev->dev);
+		}
 	}
 	return 0;
 
-- 
2.41.0

