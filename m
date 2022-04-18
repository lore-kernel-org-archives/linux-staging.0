Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A843801;
	Mon, 18 Apr 2022 12:04:23 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id s17so1337275plg.9;
        Mon, 18 Apr 2022 05:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l539e+cloHDtMJA9q+CEgCemouxdeXvEIx3a6xENmiw=;
        b=EME2rXuHZN/iDCQ2+/fD2SnBtcWDY/WxEDU7zV371DULgDSxAkHyqIHk2HsT9pzYwq
         X0jHxUfQBFj9UbfsPHqd5q6wAhE84cWLfeeR84Dp7k0+QIVeRMQY+B+Aiusixji2MZG2
         ifwV6vhzgL5s5XDlv14p3JgMD+dfhdrtGG2ExdeaqSrKkXm5Ivd/5dMRW7F+tu/ZFwWL
         /WwRqSCNYjFeDgdsPPIuvc0L1BcoHGgxV/4uQAyt138812M31T3nP2qmLeor7vPaz7uH
         KnG4Stv+RmjZ8soo1W61p7OiNnozgmmTtN6ORA2jETC6mtk/2TsMF7NefT1qCxwcdhkp
         6CYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l539e+cloHDtMJA9q+CEgCemouxdeXvEIx3a6xENmiw=;
        b=mtUg5y3jhv15V6+8/uIGy/UW2UnYDNOEMJsI53M97ZF8vw/ZLK+tfjKOvnobfN76DU
         4k2fo9PUvVpcBt6vOjVLB6ZwXc8TQH8VyJC3VQcIp37dCsiVNNQBpcsb7gPeJrSKYGiH
         Z5A859dls1OHPcz+AGVnvhrPWNNbJbXPT1+xBBq92Vnc2w3E56pHhnL5OqtSRoamGwKO
         dhRYiTORCFvQUZaBX0goov2I0ogvScbv/9EujSM7H0CrRSHhrZXBzZb8tOEtrQTSXa9V
         umBETFr+sfM5++97SOew+BASKYYjk5eaYlXAC6Ge6jWExsWMVSg16RLbTFnIYVZgHMCa
         h+gw==
X-Gm-Message-State: AOAM530z9WFYTnO5I/7WYmczWzmgK90p3/1EXGertSt9rbtYp+l3dJ7G
	mxQAs3KqrLaUgvO8jDC5MMY=
X-Google-Smtp-Source: ABdhPJz5tpVjRVY7oW3rrsbG8qVY4KsncSBVc/mgVKR/4pTyMQpqlw0yWDuainxpF/jrj6yIKwpaMg==
X-Received: by 2002:a17:90a:4403:b0:1ca:a4a3:6824 with SMTP id s3-20020a17090a440300b001caa4a36824mr12603150pjg.20.1650283462701;
        Mon, 18 Apr 2022 05:04:22 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a680100b001d28905b214sm3840628pjj.39.2022.04.18.05.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 05:04:22 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH 3/3] staging: media: zoran: avoid macro argument precedence issues
Date: Mon, 18 Apr 2022 17:29:52 +0530
Message-Id: <20220418115948.5456-4-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418115948.5456-1-aliyarahmani786@gmail.com>
References: <20220418115948.5456-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes checkpatch warnings of precedence issues. Added parentheses
around macro argument 'num'.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/media/zoran/videocodec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 19732a47c8bd..925f90fd5885 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -22,7 +22,7 @@ MODULE_PARM_DESC(videocodec_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (videocodec_debug >= num) \
+		if (videocodec_debug >= (num)) \
 			printk(format, ##args); \
 	} while (0)
 
-- 
2.25.1

