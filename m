Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD4463B
	for <linux-staging@lists.linux.dev>; Mon, 25 Jul 2022 11:45:23 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id l14-20020a17090a72ce00b001f20ed3c55dso10009412pjk.5
        for <linux-staging@lists.linux.dev>; Mon, 25 Jul 2022 04:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1waDT/Uu9da6MNp40DJuFsfnaQFRitkplpYUuVaMUX8=;
        b=m7RBCc7XVK3O2lCDZq14AWHEcgTmWs2nRhStjd2dmQaYdopcG/xxg70UM8WLKMRnfP
         p7F5alMmzqqFL6uIEducyKx+kVLTyGApEkWWgW801f1xUgh+H6THXoSQ6wwe3vA9++h4
         OtLpftQ4vGO6No9VV3/PqTWkDZ4mg+XAIvkhtMsnniv8VdZLJC0G0HYxnUPHcD3kpbjo
         hBT/dKmU48E9TuvcEcvp48UQTJbDkKQnWYLFjDKROB0s+RLYWkaLd9fziaP6iHAxBJsX
         jri3K/7vkYI+Ujvm6+/Vgc+gYbD04uwnSJuKD3v10MEsBxiwRwQ6B/7OD/DfxHsjawqY
         dLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1waDT/Uu9da6MNp40DJuFsfnaQFRitkplpYUuVaMUX8=;
        b=8SSfGdfvYmRftZDEQcxKq52dAa6ue56pfAe7ItMt55GjPby9rvThhSTbeph0XPyK6R
         rlYzneBxlOO3sClU0uM2cG4yAbeviir3OQrq26RJRpR1YqT6WEoBr8okbW6EkxS+sjwQ
         6bgmFZFnybAgl1QU+Mr9ANHCH6edXvsnle07p1y+hNdDnqIAqmZrhT3qA8fb72Eii53s
         Ysq/oI67w/EEJ2UIvOL/tDRC0ucCu6i6RgXxGX9rA+74prk8QR4DLuLsE5OGAzFXW4c1
         pGljwmizXbtqskvsXCA1iVBrydaN3NuFMcUxIeKKfmLJbQtqoFVyaSqLpSMzPKzriQ4M
         bPrA==
X-Gm-Message-State: AJIora+fMB82ipV+mcO71ZLJF+01hRCYqDgWxHAS7tot5B/7ZROiWXN7
	z5H0ycWSkvv/soHyfxThvU4=
X-Google-Smtp-Source: AGRyM1sRNKC474Vo7/sTrqvEIRriUyLHySpKLEsmxxNUyVQQnn1FqOModHgArQqt5HNLZ95JsS0R9w==
X-Received: by 2002:a17:902:a418:b0:16c:9ee2:8a02 with SMTP id p24-20020a170902a41800b0016c9ee28a02mr11738377plq.46.1658749522575;
        Mon, 25 Jul 2022 04:45:22 -0700 (PDT)
Received: from localhost.localdomain ([175.195.128.78])
        by smtp.gmail.com with ESMTPSA id 7-20020a620507000000b005289f594326sm9334989pff.69.2022.07.25.04.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 04:45:21 -0700 (PDT)
From: Sidong Yang <realwakka@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: Sidong Yang <realwakka@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: remove duplicated comments
Date: Mon, 25 Jul 2022 12:45:13 +0100
Message-Id: <20220725114513.85089-1-realwakka@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove duplicated words in comments for readability. The words are
duplicated from a sentence below.

Signed-off-by: Sidong Yang <realwakka@gmail.com>
---
 drivers/staging/pi433/pi433_if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/pi433/pi433_if.c b/drivers/staging/pi433/pi433_if.c
index 941aaa7eab2e..df02335fdbab 100644
--- a/drivers/staging/pi433/pi433_if.c
+++ b/drivers/staging/pi433/pi433_if.c
@@ -1406,7 +1406,7 @@ static int __init pi433_init(void)
 
 	/*
 	 * Claim device numbers.  Then register a class
-	 * that will key udev/mdev to add/remove /dev nodes.  Last, register
+	 * that will key udev/mdev to add/remove /dev nodes.
 	 * Last, register the driver which manages those device numbers.
 	 */
 	status = alloc_chrdev_region(&pi433_dev, 0, N_PI433_MINORS, "pi433");
-- 
2.30.2

