Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C84379
	for <linux-staging@lists.linux.dev>; Thu, 17 Aug 2023 01:56:38 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6bca6c06e56so6172941a34.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Aug 2023 18:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692237398; x=1692842198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8hfGgviSd6nI1b/pDHpUVOT9K8aiYOPruWp9HpRf7ho=;
        b=KfOfRyw3TWSN/rDPR+3GfdmmS7zMSFzG2rFHPqh52zVieyP6FFLBxTdQvfovBr6U+4
         PQVmj1EThxW/4ha7bozSDBG4YQqjj3SiHhN9SCTn5vZB5W0eu9eCOqOLGMwPmsxZHi9s
         CKI3tpS9PYQpNuRjrlko4P6fujeGqauGeKqDvY3ApRxH2E8f680LZjVmP6dgQ+gyw2P9
         bagBAqiGEnXKyYESMV8aoAX1IwPDr/pV3pSPsQaDAvtyOnJMTnq20qnggC9Atk7iVyWf
         tCfrRQ/2QzFn0OPBtcJS8s8W18MrYuRJeZMz4KWAdbmnh4TGk8LzxtrhFNe0QS88o4h0
         1sog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692237398; x=1692842198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hfGgviSd6nI1b/pDHpUVOT9K8aiYOPruWp9HpRf7ho=;
        b=Ss/Zv0cJtkDi8Uzp4DftCSG9qpESO3vS4zRBaoSiFCzdYutVp/h1xzP/suoVxQvAY6
         snmnTfm8KbEVxCNoia77XeePiiExRCV33ZJ5NoLGKxMeZQvj/JoICbCdOf22tkEaET1E
         Tnk2sW/D9QftWcrKg33enL0bnWXNlFeO+mYwJoGy5JyAPKqi2QRc+69/SOP55XLUh4b7
         6DcJaSjIbr86NfFKmBdO5PYkwUuxbyuj+UQOFlcMeDV7kQBlqPglalLHqZDBHLWrw6gN
         YsOxM7Ji6J5lG6RCG69ru5ZbUmZPh/o0jZcxDeeDnOub+jUGLO0xeUIul+QZzyrcrsn8
         wmTQ==
X-Gm-Message-State: AOJu0YxL0Alg8S0BQeiY+IekrxG3oOacOIBt48C2Jn5MRJEEBe3Q5CAH
	e+NfAhH7r8uqs+utZ/fwDus=
X-Google-Smtp-Source: AGHT+IGe/Zm6llH9ORhHy0C40Q22+9RifZjmwUnSlRneXimEkaJeTLszj07EQi4Md8oJYMHC+kwDng==
X-Received: by 2002:a05:6830:12c9:b0:6bc:9dfb:43fc with SMTP id a9-20020a05683012c900b006bc9dfb43fcmr3279691otq.36.1692237397875;
        Wed, 16 Aug 2023 18:56:37 -0700 (PDT)
Received: from nocturne.svl.corp.google.com ([2a00:79e1:abc:100:10f9:91ea:43b9:8bba])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902bc4300b001b8c6662094sm13726338plz.188.2023.08.16.18.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 18:56:37 -0700 (PDT)
From: Nicklaus Choo <nicklauscyc@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nicklaus Choo <nicklauscyc@gmail.com>
Subject: [PATCH] Fix print formatting warning for some functions in drivers/staging/vme_user/vme.c
Date: Wed, 16 Aug 2023 18:56:34 -0700
Message-ID: <20230817015634.18428-1-nicklauscyc@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Nicklaus Choo <nicklauscyc@gmail.com>
---
 drivers/staging/vme_user/vme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5555683a069..d583c4abbf50 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1742,12 +1742,12 @@ int vme_slot_num(struct vme_dev *vdev)
 
 	bridge = vdev->bridge;
 	if (!bridge) {
-		printk(KERN_ERR "Can't find VME bus\n");
+		pr_err("Can't find VME bus\n");
 		return -EINVAL;
 	}
 
 	if (!bridge->slot_get) {
-		printk(KERN_WARNING "vme_slot_num not supported\n");
+		pr_warn("%s not supported\n", __func__);
 		return -EINVAL;
 	}
 
-- 
2.41.0

