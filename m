Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF97E
	for <linux-staging@lists.linux.dev>; Tue,  6 Sep 2022 07:46:44 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t3so5429751ply.2
        for <linux-staging@lists.linux.dev>; Tue, 06 Sep 2022 00:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=SCIfIiiq/yyzgkPopZpz5RfhutkNUE2O01+O5PYJujM=;
        b=C0k5vt9j9FkkewR8ci4JPOODHwrNNGa4r6DSBf28d9sHkCrIfhiOvmM/yVAu3yv7YO
         jPiuPTFIk8lD3nTokg4njPbUFRZrPFc1r9UJZb0akD/lT+xfF96UbZ5Kj0wBUCw5Hy7o
         ZN/KLYRueo/p2NuOpICD7/kuf+OVSri78c0QxJFivRMvxpFg9MzaQgtM63mvKmasEBfW
         IrNk49J0dkpexeMxLgAPIqfAHdJjnAEJxAFQR0HaNkzSQaYn4aVU3fOGeP6ETjvRiz3l
         K70uDuALDAzeZv8516FHa16MObBRvKzdnFlGz10mu4S+bCgdfrd/uDrBq5sANyYdSFkV
         II+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=SCIfIiiq/yyzgkPopZpz5RfhutkNUE2O01+O5PYJujM=;
        b=ZCDkw76VjHnKG6SZQHndLZHaRNl8FTaxB1TFCauNrOYchTH6uf897SWYPsLIUaM8SR
         RvAxS/JV+w2b94Nl+f/jPViHk5OxH6PeIh9WhoZTPVCz0FhSBDKcRDxwLJnPOxsL8det
         laMJJXGZlVITPXo7D91P5bfQ4EILmgRMKeAbuEeMlsm642nSkWRv5lbRDB1c0kLrLxEj
         CIa0CNvHkxjX/1yyGTHwBkfhuBAKoVG+JznW+uDZry5XB/vkASHyy8eX9VcL4l0o264r
         BbDrQ0uQbqHrewcwqinehP2eykWr2Ihb+y/k/D3AoCpQP0WgtGZINOUIdH9LSRT4/VZ+
         cDkQ==
X-Gm-Message-State: ACgBeo3WRQYqXiCQGjiV5iGmJJkufS7NFQgm7EUbVopmcAYZTf9ztHpf
	gyo4RAZnIKNOL5U6g/Fqjx0=
X-Google-Smtp-Source: AA6agR75MPe4BTJ7xQ0L6D61Z4NNGMSJJtZlBcoUzwa1mbQDGNXmSb63h2KGTJtZ/zjJ7FwWon+EuQ==
X-Received: by 2002:a17:90b:4c8d:b0:1f5:29ef:4a36 with SMTP id my13-20020a17090b4c8d00b001f529ef4a36mr24029428pjb.127.1662450404429;
        Tue, 06 Sep 2022 00:46:44 -0700 (PDT)
Received: from hbh25y.. ([129.227.150.140])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902759200b0016c50179b1esm8919604pll.152.2022.09.06.00.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 00:46:44 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: narmstrong@baylibre.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH] meson: vdec: fix possible refcount leak in vdec_probe()
Date: Tue,  6 Sep 2022 15:46:30 +0800
Message-Id: <20220906074630.35779-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v4l2_device_unregister need to be called to put the refount got by
v4l2_device_register when vdec_probe fails or vdec_remove is called.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 8549d95be0f2..52f224d8def1 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1102,6 +1102,7 @@ static int vdec_probe(struct platform_device *pdev)
 
 err_vdev_release:
 	video_device_release(vdev);
+	v4l2_device_unregister(&core->v4l2_dev);
 	return ret;
 }
 
@@ -1110,6 +1111,7 @@ static int vdec_remove(struct platform_device *pdev)
 	struct amvdec_core *core = platform_get_drvdata(pdev);
 
 	video_unregister_device(core->vdev_dec);
+	v4l2_device_unregister(&core->v4l2_dev);
 
 	return 0;
 }
-- 
2.34.1

