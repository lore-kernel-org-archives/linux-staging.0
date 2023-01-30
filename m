Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059BA28E3
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 14:54:22 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id z1-20020a17090a66c100b00226f05b9595so11365965pjl.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 06:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+BBqBT0HGvJ5fM5NjJNYKAjnUfe83s3wOG0YkaJDBKo=;
        b=MfO4g0soFD+s9UBY8DGPLOrEAp89kHff56SdYEuwxPkhGljtk60aHGvfmjb8/J0ZFA
         oC7GsyQv+I4CyJSU736PnDEGkBgg+yj5ZkFhxm8g47PxmDJl4RerKDukaXJmz/j05euM
         9pWBT4uD5MonP8YuG1NezefrSbrju11G3o5mGmrV+iiVYELMdpE4l4CQVVILNsACgXiO
         I1T+MrPvGgU+WgaqYOQ7NnqfumUYSRPI7StBY6OXIfTAIO0WAkoKyFb31kEiTGimB+Wb
         SxkVeXVoF3IHl+o9wGyQ4hetA9Sjd4PIDemw7euBaPcM5nZdEVqyh78e4TZdsGFvCqF/
         8ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+BBqBT0HGvJ5fM5NjJNYKAjnUfe83s3wOG0YkaJDBKo=;
        b=j0lQHqmokwjcRlZKFV9yl3YMVIaZ4DKNZXQrQ+502ELbYRP6JR0VU3iZCpeasGeX8I
         9mkhb1rLFpWG50HoscTKqd9H0Basb07NgE2/ivht9mCQYEVgZyUotpWOYxHZUf36BaUh
         RbVSQAe0t5k/l/U4KsOKhZpFySdb7KvGlj64eUJuz91SDIzMjWs3rOYimIv2sIc2TUhX
         aFL0xNY4oC4rPorw1r1n6LZDAp93yZMIiwxhZqUvZXb8LLFZ1uHP6KrPx4xiZoV6Dan5
         G7UddgmQssJvaZ7xcJA9pK5+zyYqxr382L3SMsBD8q/eMTRkP5ioyeQ34u5VIf0o0U4i
         MXig==
X-Gm-Message-State: AFqh2kpVSw4Eulrf/I1RZi2IUGsR15tOPrYkL5takiAuNHoiXwECW02/
	xS7e/BCYOlMA/gTG5cf3fFI=
X-Google-Smtp-Source: AMrXdXuDJriVvew8ATjDcfZodcYxnnQsgqzfsHxQxfi1D4k8QTSW533li6h9+jlEJzKIcdBwp6l1Gw==
X-Received: by 2002:a05:6a21:1643:b0:a3:8eb5:6869 with SMTP id no3-20020a056a21164300b000a38eb56869mr43932998pzb.14.1675090462432;
        Mon, 30 Jan 2023 06:54:22 -0800 (PST)
Received: from localhost.localdomain ([112.212.226.173])
        by smtp.gmail.com with ESMTPSA id l13-20020a170902d34d00b00194caf3e975sm7923861plk.208.2023.01.30.06.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 06:54:22 -0800 (PST)
From: Jongwoo Han <jongwooo.han@gmail.com>
To: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	jongwooo.han@gmail.com
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vc04_services: mmal-vchiq: fix typo in comment
Date: Mon, 30 Jan 2023 23:54:00 +0900
Message-Id: <20230130145400.40890-1-jongwooo.han@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jongwoo Han <jongwooo.han@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 294b184d4..e318f3609 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -245,7 +245,7 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
 /* workqueue scheduled callback
  *
  * we do this because it is important we do not call any other vchiq
- * sync calls from witin the message delivery thread
+ * sync calls from within the message delivery thread
  */
 static void buffer_work_cb(struct work_struct *work)
 {
-- 
2.34.1

