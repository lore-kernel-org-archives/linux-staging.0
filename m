Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F3C3D7E
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 16:42:56 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id z1so4674233plg.6
        for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 08:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TzKgtfEc0ohQa7f3DsZuEWAMUYB0HyYaM3dGsqVSfL8=;
        b=HfF7TWdIKute70ON2In56NdnVrAwUW1HhHyRXuzUXEUsNLFR1PNEFcvXZEAZ8M6/ry
         7WF4DUUYOWUuz3XwDWE3BRmiih+xzZlZNO6azT0o6jdn/dFA4uzV25ipKNUfnHd4hNG5
         7mY4ti4lRtb88MCHPP3y72nalaImLL86noQm7PQZ+0PoJ1hHdMuxUzay8vOAaFpiVCPV
         YePImVqfXqBXc7Ey3BVW3BEUZeAdGjlBFY7gDqQ5W5hnzaswX4y2F1HHl4vHUysHk8nG
         G61KlO9NugINKYbZIxnEM0JkCVNmDXuvHk+xcaEt3fLlxOEdIu376TU4JiOgxR7G4fjp
         rLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzKgtfEc0ohQa7f3DsZuEWAMUYB0HyYaM3dGsqVSfL8=;
        b=7gI2VylsZ3jCi2r4gxN2YwbEnVbjTJ2EgG8gi1ysAGurWxDViHwq3amHrOk+XuKei8
         npN0kR4xvxe39xXZVw93DRDk+M5DVl+UQUzRekLBvwfj5E4MwS9xN/njrVXox+numqm5
         FFZZ2/mVrR3y2oKXo6xUayIHbD9SGlyx4mcsIkzlQ3a0inEUHaHsrpnEvgl2uGzQdWIT
         eSFb18s1vBqHhfbTYPYeW13J8oMegEukQh3rDMCuryYvIhNSJeQ4aS7q57/w4a2Fo/Jk
         vm1lDeieJPhi6aoGOQ0co0hVP7OhAPr7M7eMFMOLL6IbAzrc89ai4a0lf2O3pPK6p2HY
         1ZLw==
X-Gm-Message-State: AFqh2kry9Fk8h/Dpj/GhiDpIq3bZnK3EXza4rruOqa2pmqehBdjdSz6e
	4qTJlSvYyWxOV3alr+3tc7s=
X-Google-Smtp-Source: AMrXdXt0JMfIqIJ4CDg+8B2A/00c1B/OlOxBFtRrYz4PzFur1p+kF2G1V1RwdOObxHz3So+FXz56oA==
X-Received: by 2002:a05:6a20:c183:b0:9d:efd3:66df with SMTP id bg3-20020a056a20c18300b0009defd366dfmr55786541pzb.38.1675096976148;
        Mon, 30 Jan 2023 08:42:56 -0800 (PST)
Received: from localhost.localdomain ([112.212.226.173])
        by smtp.gmail.com with ESMTPSA id v25-20020a63b959000000b004b1b9e23790sm6991864pgo.92.2023.01.30.08.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 08:42:55 -0800 (PST)
From: Jongwoo Han <jongwooo.han@gmail.com>
To: f.fainelli@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org,
	jongwooo.han@gmail.com
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] vc04_services: mmal-vchiq: fix typo in comment
Date: Tue, 31 Jan 2023 01:42:50 +0900
Message-Id: <20230130164250.51877-1-jongwooo.han@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct typo from 'witin' to 'within' in comment.

Signed-off-by: Jongwoo Han <jongwooo.han@gmail.com>
---
PATCH -> PATCH: Add changelog text to commit
PATCH -> V2: Add description of changes from previous version
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

