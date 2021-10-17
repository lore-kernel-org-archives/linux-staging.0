Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A572
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:29:54 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id g14so12373822pfm.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 02:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sAZwpsvpNd8mq9nsqgEh8qKdU0GjNG67jmNpaREej14=;
        b=OwJUXdJuxPyFxact+I7KRrvsh/grOzI6pnzmnzmE7s4eHCVFtty5Yye66fPHObgSF2
         OVxindJ4JDioKriRZA/oXot57wIoXjqs5pPRuM6vrudUUwfjdI46z9m/ymK/Oor4nmJw
         wWVSt2WgVzyc0DnDX6enAFsrM2SYnoZJRqqSOCa2sfRWMCA81Ne1kDorZOlzKXgHm7jy
         RV9psQgZuUMsOapgGOkzUGJl+Zi/oBViEKw4zh3kbPSqBUmqustqZKe7wejlbjB0FP3R
         Jv9kcsCxga5LXyH52qn0a5Vzs8iJYspD/p5YFjKZIN8z73coj3r9lWDyHW6xt5MPcM9A
         REiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sAZwpsvpNd8mq9nsqgEh8qKdU0GjNG67jmNpaREej14=;
        b=PPPrCLaHgxdOGZQMoQ8zSIr8baLVXig935QA2scP8upNOftA2/IqXalEkeKNnJyGM1
         vdpHDwIALkHYBEUD8YNnfNV5WyMqhSJh39wLH6MWQeh2OLq8lkqyS97eaU7+d2Osngth
         M0XnamcvBUQjcGJss/m7RDmpAErobmLaI/F7QDrMkKtU64+dsSWFVr0nf9eJAzHHwD+m
         MMPra8HgivHYIanLxvMp6cW8Z3rgrKbxQ+zbDXBRkqubALp2w0EKrpi2JcBTHVc6bmgL
         CQMFZj9VnRqiRAnqBMGcRr0faYp0h6kkoxUEbJuhcfs5fxpOxZLdmB8urQnVlb8+ydld
         5Rqw==
X-Gm-Message-State: AOAM53173FAKRmNNJwMgc25TiJ7tfFzWupSItU0UpPMRdo6Is2/1GKpo
	DmpnyxiuUtyG0dMtwx0cijs=
X-Google-Smtp-Source: ABdhPJy4FkbbnlD6pGL3V3lXGcE+XLHf/lv52VjjdMRwg8gXjtFldVfZsJbxijCll16KOtnjmAhOEA==
X-Received: by 2002:a05:6a00:8d0:b0:44c:26e6:1c13 with SMTP id s16-20020a056a0008d000b0044c26e61c13mr22359382pfu.28.1634462994046;
        Sun, 17 Oct 2021 02:29:54 -0700 (PDT)
Received: from localhost.localdomain ([115.96.219.100])
        by smtp.googlemail.com with ESMTPSA id gf23sm10198222pjb.26.2021.10.17.02.29.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 02:29:53 -0700 (PDT)
From: Kushal-kothari <kushalkothari285@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	mike.rapoport@gmail.com,
	kushalkothari2850@gmail.com,
	kushalkothari285@gmail.com,
	outreachy-kernel@googlegroups.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	nsaenz@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH v2] staging: vc04_services: replace msleep() by usleep_range()
Date: Sun, 17 Oct 2021 14:59:00 +0530
Message-Id: <20211017092900.134752-1-kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed the warning:-msleep < 20ms can sleep for up to 20ms by replacing
msleep(unsigned long msecs) by usleep_range(unsigned long min, unsigned long max)
in usecs as msleep(1ms~20ms) can sleep for upto 20 ms.

Signed-off-by: Kushal-kothari <kushalkothari285@gmail.com>
---

Changes from v1: Reword both the subject and the log message.

 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6fbafdfe340f..80a7898c5331 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -857,7 +857,7 @@ vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
 		if (status != VCHIQ_RETRY)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return status;
@@ -894,7 +894,7 @@ enum vchiq_status vchiq_bulk_receive(unsigned int handle, void *data,
 		if (status != VCHIQ_RETRY)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return status;
-- 
2.25.1

