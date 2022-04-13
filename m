Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2A23DB;
	Wed, 13 Apr 2022 07:36:05 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id z6-20020a17090a398600b001cb9fca3210so1273535pjb.1;
        Wed, 13 Apr 2022 00:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCEukBNVbpsMdszz5LjguiYLJ5FzSqyeT1WafUnZvXA=;
        b=VEkrQE2BMndJA6hsxvtmf6qaS7S1Ray7fWHvcLTkesLivOmknNdxQz54FRFeyTAvw3
         4x3MQPwxnk7VAaswdnEbU4qaq6fTk4Y0D5vEWbTrimOxSE0RKSUvSQRNNB7TXUALRubu
         jqWA4R7sVu6USfe92AdBPTcz+sAImaWLcF33/FtP21HD113YQxqnYmRBZgeK1OcBMtZj
         hI1QOGf8XFkw3mLZDJUSPjLC4hg3hc7VGkh8Q0eDmp8s8fkuNouFCtpC5LAqesmUe7MM
         z91kB2ApDAVG/oMcHr0xvRfM1SKdOby4N0wr9k/zX8TwPLDRJy01Z+uVG5xTkHU/3gD+
         OkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kCEukBNVbpsMdszz5LjguiYLJ5FzSqyeT1WafUnZvXA=;
        b=yqffFFcj+kmBSv/dbWUTElWMg80u4sbxZU1YSOQM3dQU/vMPkWntRPY7YBk6DRq/nN
         1NozJS6GLwbqs+f0tMG+05JvwSDAQuvbPFYw/BHuQbNaLVKosmMtHdz/bU55TksA3/Gt
         jRj5K+6bV+8wODRhhsuaXNVz7dq+tT/WAJ5XKzUYZHLR/4uOEMcOkcQQWJ3ZZu+rt1Gu
         qKpb1IpJ3ze7bO9eeUEmX+OL/Slsb9nnvuxhvYeQzVBtW5BxVJOqilPcN0yJKAyxnGhQ
         A7+xqH46VaC6n+KyXW1+mS/3dfklK4IGtLO66cAFTmxrV6HgiWBBwY3ZQYZtF5sUbvyz
         d4Lg==
X-Gm-Message-State: AOAM530H/JwSF/tDJvkfQ/gONCMpypQBluWra0jbMTpBH3TA6Zdpsseb
	4aDc8WuRt8F+F7KxIhltbNN2iX3gORO+Kw==
X-Google-Smtp-Source: ABdhPJx3yjCEd0KvVaCI0Xkc4iFa3BS0kMZgTw4Zt7u65BD0ZDQZF2BuUJfQsAjkyPHov48jzOXHOg==
X-Received: by 2002:a17:90a:8c09:b0:1cb:97a2:3d5f with SMTP id a9-20020a17090a8c0900b001cb97a23d5fmr9225512pjo.108.1649835365102;
        Wed, 13 Apr 2022 00:36:05 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id r76-20020a632b4f000000b003820643e1c2sm5191512pgr.59.2022.04.13.00.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 00:36:04 -0700 (PDT)
From: aliya-rahmani <aliyarahmani786@gmail.com>
To: tomm.merciai@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH] staging: vt6655f: rxtx: code style - Fix Lines should not end with a '('
Date: Wed, 13 Apr 2022 13:05:45 +0530
Message-Id: <20220413073545.14666-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aliya Rahmani <aliyarahmani786@gmail.com>

Removed indentation to fix the checkpatch error that lines should not
end with a '('.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>

---
 drivers/staging/vt6655/rxtx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 53506e242a96..dce9d87d2363 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -569,8 +569,7 @@ s_uFillDataHead(
 
 static
 void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
+s_vFillRTSHead(struct vnt_private *pDevice,
 	unsigned char byPktType,
 	void *pvRTS,
 	unsigned int cbFrameLength,
-- 
2.25.1

