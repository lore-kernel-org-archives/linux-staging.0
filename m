Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5922C80
	for <linux-staging@lists.linux.dev>; Wed,  5 Jan 2022 20:36:57 +0000 (UTC)
Received: by mail-vk1-f178.google.com with SMTP id b77so372289vka.11
        for <linux-staging@lists.linux.dev>; Wed, 05 Jan 2022 12:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PFpxL8eNjWfN9L9+3lNFj3nd+2+vNaUo9b7OlF5oUWU=;
        b=MOzaZyxBX3Mcp7NycsdG6RBaO+0oKmPOdqDAe0sh0Ods0J5BVgNQd6WTsHq2z1dTNR
         0Hcz5XTpa1HDn+ljXWi3Ene9RxrMrhMORzMtuo07KYswBrsYQoLvVp+VEhJ9G+8W3uTY
         9Xog4dUYCz+RzTl5ZFiABiDCkHGiIo273jK8g73H+BXwGqg7uzbTyHbGBngCabCI8W1l
         v08A9+HNolepnYcvf1WKrgMKMDiCBNCWbVXeDBS7/axpTkNuep8e9tVZkSw5oM9qYCkP
         XTwlaov9v8uFIu1QBUYUc1Cyy5L5gV7G3tGqBci2Ms/IPXOeGkeiISEh7OzAVhDU3Dj5
         Tg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PFpxL8eNjWfN9L9+3lNFj3nd+2+vNaUo9b7OlF5oUWU=;
        b=bTpTpdsHA3EvkizucZRGLiCnE/VqQ3eCrhTVXqIo5RYseZDaqqbP/Bs2QTiuyOBv4A
         nEU+qKHIKQ5xsydU6FbjOYZOyxpAJO9UKxKexERFPlBNQg3zs8WBGWUOkXSCUdeuycLF
         FxEYxrFBGI9Jh5iaJkVYPdLoZikqfFYR15vb6ZGB0fapt7MTDCpFeX7wqdS/l4LIAtnU
         Kybcj+VXJIMmlgzaakNbgjl9wg8Y2vi10Ncu+jlKgfmQeezEBRKZj7NogwJkyW7GyrRV
         EA+f8P+/+a3jlSCSLTmdfuQRiHrTvx5M9WmhOmx+a8XmNnvn1B7Un5CZ71LjWumYyOQ6
         RctQ==
X-Gm-Message-State: AOAM533FZEBcjG3F5cgouVsxeLMLg84/lXcoIRursGaAgjGUF+Lc4ofN
	tOvd8LICzZsMvVl+fKJU+DqqEVKIRbXZiQ==
X-Google-Smtp-Source: ABdhPJwDAuwT6naxOjUL5AyLq0SJlsEUSbEgq7WuMoQW8aEYk8+Vovkwf4Cg53hxRuabgFrryic7GA==
X-Received: by 2002:a05:6122:d0f:: with SMTP id az15mr20333761vkb.28.1641415016836;
        Wed, 05 Jan 2022 12:36:56 -0800 (PST)
Received: from localhost.localdomain ([181.22.170.52])
        by smtp.gmail.com with ESMTPSA id t130sm7860vkc.32.2022.01.05.12.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 12:36:56 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	f.fainelli@gmail.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	juerg.haefliger@canonical.com,
	rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com,
	stefan.wahren@i2se.com,
	unixbhaskar@gmail.com,
	mitaliborkar810@gmail.com,
	phil@raspberrypi.com,
	len.baker@gmx.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 4/6] staging: vc04_services: rename string literal containing bm2835_* to bcm2835*_
Date: Wed,  5 Jan 2022 17:35:46 -0300
Message-Id: <91caae07fce0e4511f283388304e935526ba29ed.1641414449.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1641414449.git.gascoar@gmail.com>
References: <cover.1641414449.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the kernel, all names related to the chip BCM2835 are always named
bcm2835_*. To avoid confusion, and to make things more consistent,
rename the string term bm2835_* to bcm2835_*.

While at it, some realignments were made to improve readability.

Suggested-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 .../staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index cbc881e19f65..aaf529f2186c 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -884,12 +884,10 @@ static int vidioc_querycap(struct file *file, void *priv,
 
 	vchiq_mmal_version(dev->instance, &major, &minor);
 
-	strscpy(cap->driver, "bm2835 mmal", sizeof(cap->driver));
-	snprintf((char *)cap->card, sizeof(cap->card), "mmal service %d.%d",
-		 major, minor);
+	strscpy(cap->driver, "bcm2835 mmal", sizeof(cap->driver));
+	snprintf((char *)cap->card, sizeof(cap->card), "mmal service %d.%d", major, minor);
 
-	snprintf((char *)cap->bus_info, sizeof(cap->bus_info),
-		 "platform:%s", dev->v4l2_dev.name);
+	snprintf((char *)cap->bus_info, sizeof(cap->bus_info), "platform:%s", dev->v4l2_dev.name);
 	return 0;
 }
 
-- 
2.34.1

