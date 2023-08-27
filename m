Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95FE111D
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 19:33:41 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bcb5df95c5so1987605a34.1
        for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 12:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164820; x=1693769620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/20+iwj0/ojxdHziUbJdhTIbwFYLS/pRXm/vh5r0p/M=;
        b=n7gDIZcHScRkiLo3acl/wrvq5YfwwrGwTqxZoKkB2Uy3HMqT5EdyV9+tkFDXiyL7Jd
         Xb3dARxo8dEgLMuZhXh0C9KhIGwwreQm0s6dfnx71yZChDFd6gUekr9sa4DnQ7cR+tdF
         YmKBsN+pCwG8stSsUJkJQY4g3Aidp3FyuLFZUqix1dE81emRFVynlyadP2P/85BM/dlS
         aJULY4Yyd6/61cScYiVsNoMlQLjnxWmlmpjhbJw+NuSSl4DzweaoJka8xlgVNSrhr2mh
         Epy0koj4mBuU3nU5NPq2j721jMpk6G29lxvoV5E0DDtr1oQOFGLBk2QiUmaWJ7x3Sqkm
         PbIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164820; x=1693769620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/20+iwj0/ojxdHziUbJdhTIbwFYLS/pRXm/vh5r0p/M=;
        b=LvzatGtT0eBtOBSwuW4dFyli4whvr0wm75ldMhb8lvuoayNOVA247q/+mdAQ52H7sF
         ebNZX4W7o1gFoTmu57kPv+Fii8w9z/v8S8hank7TXvopeoyr9LrdrBQiHOfBRnlw4hk0
         f2bF8CSAMGKfzGWA78spudNxXwRpmnOHGjiLthICBbrP2QoKYizC5WfOYqPGFcpUjF88
         GDpVJVTSbDWMS9F32sFLdq1/AQukjA3cZeAmkdJRYNRUgENSoG7NRSdcUduN6bRDM99f
         PPacXKLEKgJBk5r4Wd0s/CDNc+t04qZKSHZlfRTWtMcbhp99d7vHvKjn2yOxn62asSqx
         Svxg==
X-Gm-Message-State: AOJu0YzpNicPUo3yigu2vm91kSTFzCs1MWPYAyJHkCvduR8rwTdh4e11
	IrDAOhiTZi7V4gTaFQPodv74r/3Ye2s=
X-Google-Smtp-Source: AGHT+IEiVP+3qqTfR+XZhNVQz1/UXBZ50Tq6C9y/m451idHcVF1aaktlVYg5CAQZ8FkiodDkCjMARA==
X-Received: by 2002:a05:6830:114e:b0:6b9:182b:cccc with SMTP id x14-20020a056830114e00b006b9182bccccmr11305146otq.33.1693164820405;
        Sun, 27 Aug 2023 12:33:40 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id l8-20020a9d7348000000b006b96384ba1csm1640272otk.77.2023.08.27.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:33:40 -0700 (PDT)
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexon Oliveira <alexondunkan@gmail.com>
Subject: [PATCH v4 2/4] staging: vme_user: fix check lines not ending with '(' in vme_fake.c
Date: Sun, 27 Aug 2023 16:32:52 -0300
Message-ID: <9f3e2facdc4d5e612dc00830c2da0fb19c20f2c5.1693164540.git.alexondunkan@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693164540.git.alexondunkan@gmail.com>
References: <cover.1693164540.git.alexondunkan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all CHECK: Lines should not end with a '('
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---

Changes in v2:
- Fixed summary phrase with tags to indicate commit order
in the patch series, noted by Greg KH

Changes in v3:
- Sent patch series in a single email thread, noted by Nam Cao

Changes in v4:
- Versioning the patch series with the forgotten information
about the changes in the previous versions, noted by Greg KH

 drivers/staging/vme_user/vme_fake.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index a88d2c8a785b..dbaf050f88e5 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -403,8 +403,7 @@ static void fake_lm_check(struct fake_driver *bridge, unsigned long long addr,
 				if (((lm_base + (8 * i)) <= addr) &&
 				    ((lm_base + (8 * i) + 8) > addr)) {
 					if (bridge->lm_callback[i])
-						bridge->lm_callback[i](
-							bridge->lm_data[i]);
+						bridge->lm_callback[i](bridge->lm_data[i]);
 				}
 			}
 		}
-- 
2.41.0

