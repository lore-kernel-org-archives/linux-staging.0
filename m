Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7192C80;
	Wed, 13 Apr 2022 19:00:55 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id e8-20020a17090a118800b001cb13402ea2so3297267pja.0;
        Wed, 13 Apr 2022 12:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9PYpzIL3p2449/WVbQKnJaxW1CTmER7UkoMVqxMqhpI=;
        b=ZksnlI/OBly+J6h3MaSwqJAQA4wX/UX98FYkBK/PYvSRTYXQP2JBLXjgpG0MzE+53J
         UKZjBYv4sZUcdA/+Jm1iF5luowu4waFYo4kNbQQ4MmUjrilJcv/OaNLK24vyvUQSxCAK
         fxzwNKuOl7n0Mu9BcOMFHHeZ8ad+/A4Nj3SkG0roQ/jwHzksgrbTKywt00ujrSsYJK4O
         jdY/Rn/pIgA2yIOml9N5UFcfmTgo891JMLnuTdZcLbyc539xcXTINUP33uVzPhH+uLgK
         5t4/oBDOEATB5vVbYThNWCPZf121Gi6HhMV2X+lPcY7KTc1fTX1Eq6msnRdCfdxEVjeg
         7m+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9PYpzIL3p2449/WVbQKnJaxW1CTmER7UkoMVqxMqhpI=;
        b=VOomZTp3HIPOyQmeFwjxvM6q19atRlL349Fq9rdNpleVTr5Qw/JGZsj58jcMub6WKf
         ZEI66+oMJ5iZMX4hhdQJZc9gVYZmZ0uCfcQW75OI1ZCnvU/V3EbZV8xrutAxniscG0D7
         HsJ4gyZYsfl0HNRIvxbfFR2Jidyi1UHOHImt7VsxbwUikVPVokXWvRMbbgROPuW7kz3i
         nKTuggaH4TCbX8bXw9nJGVtOpJHIQ/zXH2ngiD4Q+ehZQicCbb4e/AUZs9ebsIAvl4Qb
         /4+rb2toYRq0G8kZkzhQW1oXIpEXRujQBh/TBpem90PS0787Yf/1Awrmq3BCteqTY0cp
         OoRg==
X-Gm-Message-State: AOAM533pWOwkejN1oXAqXIQ6eu9KeODCFIKUDMHsd2rm8kOSWCsWr4Jh
	Wy/nPH2iN60OkvIz9KAwFdA=
X-Google-Smtp-Source: ABdhPJyyCayqColjPHYmG1lc9SBpMAkz3pUCFG3zz3BLzYiP2tPv/ex7YCbMOjK+WiefyIhzrZtIRA==
X-Received: by 2002:a17:90b:1e47:b0:1c6:d5a9:b147 with SMTP id pi7-20020a17090b1e4700b001c6d5a9b147mr143445pjb.223.1649876454461;
        Wed, 13 Apr 2022 12:00:54 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id y12-20020a17090a784c00b001c6bdafc995sm4233274pjl.3.2022.04.13.12.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 12:00:54 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: forest@alittletooquiet.net
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v3] staging: vt6655f: rxtx: code style - Fix Lines should not end with a '('
Date: Thu, 14 Apr 2022 00:30:22 +0530
Message-Id: <20220413190021.36742-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code style warnings reported by checkpatch.
Improve the layout of a function header:
*Put the first parameter immediately after the '(' and align the other
parameters underneath it.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
v1->v2 changes: Put static and void on a single line.

v2->v3 changes: Rework commit description.
---
 drivers/staging/vt6655/rxtx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 01dc83b2f4bc..2853cb9efd30 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -568,7 +568,7 @@ s_uFillDataHead(
 }
 
 static void
-s_vFillRTSHead(struct vnt_private *pDevice,
+s_vFillRTSHead( struct vnt_private *pDevice,
 		unsigned char byPktType,
 		void *pvRTS,
 		unsigned int cbFrameLength,
-- 
2.25.1

