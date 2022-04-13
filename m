Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B06128E0;
	Wed, 13 Apr 2022 10:11:42 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id n18so1550144plg.5;
        Wed, 13 Apr 2022 03:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fSL7W+kPVWcAC5coG2q55bMyoIj5RFlWkYvUdvK+vKI=;
        b=AiUXj8QQiLN60RzzUdqaRGhh3OIT/jiiygYvJkBVqVn43nIHu7uEFXRkTkvM3qj3rF
         AFmKAjajtLAntGVwauh6n5+yj5LvzyMexehYSRGLIhs1tmCTZsh4UWQwGXTaXMdwNOud
         VMNoh9TSoqPKyL64kgN25EKShqC4zUTmZRi1073WwDPzdrK5+xDwtx190/9iGPl3BftQ
         NHvC8CULB82UIRUmcE+Jw7VhkcUzoOg1j263wdJPUkgfi68InVxLIwCAdcTwG1rmQg33
         aryLFjqMllAEUKih9wtNAss2qkXr1Q8eenhgFoFYHa6Cp9Y2CvPSonxMH7mUb2oQAb0d
         /Z6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fSL7W+kPVWcAC5coG2q55bMyoIj5RFlWkYvUdvK+vKI=;
        b=LoXAwO2VsJIPfTcnSF3r8b0qVrwvO7vxZXiQY29dVFvf8XdxPQGHsPHWiGvCAjNpYW
         UbujAzUsXLNFw6WR93ys2x22GWkepi0+AYYKT1U1sSp1zBFPqZN+D5nSlL47Y+VR5ezH
         V9aIZRb6R6Su2vMs/duxmKnZlaWEpaIB0EaD3wiekzUNAXGl/2ZUeyWBAPcpAAMihZlo
         SDUEKzF2IVaVl21cNjhIvPLOl5wBL/MnqOHXMnb1gAtqAz81kBkgYug7qjOF+dMaoviX
         APj7zTYIhCju0YWdnRzOrzcNNdPNE6eum+RTjTEixhfC+yszkRR01wXOrhzWKh3xW74W
         ru1Q==
X-Gm-Message-State: AOAM532JfHKK11n67mKpHMZqXoUIMW6zbFlcSQ+HIZVlTVaW0zZPQUWD
	jbIlVdXhHZ0JlNX19WEitXHgV1oM7BZqLQ==
X-Google-Smtp-Source: ABdhPJzZi69YhqYPN7txiMiDRu2GXrtE30MqKsVaaf0jfhSDH7A499YfUsPfEmScj00aYfztB0HWBw==
X-Received: by 2002:a17:90a:f01:b0:1c7:ea40:93e7 with SMTP id 1-20020a17090a0f0100b001c7ea4093e7mr9981813pjy.30.1649844701957;
        Wed, 13 Apr 2022 03:11:41 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id u3-20020a17090add4300b001ca56ea162bsm2364906pjv.33.2022.04.13.03.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 03:11:41 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: tomm.merciai@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v2] staging: vt6655f: rxtx: code style - Fix Lines should not end with a '('
Date: Wed, 13 Apr 2022 15:41:14 +0530
Message-Id: <20220413101114.23992-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove indentation to fix the checkpatch error that lines should not
end with a '('.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---

v1->v2: Add Indentation and remove the gap between static and void.

---
 drivers/staging/vt6655/rxtx.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 53506e242a96..01dc83b2f4bc 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -567,19 +567,16 @@ s_uFillDataHead(
 	return buf->duration;
 }
 
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
-	unsigned char byPktType,
-	void *pvRTS,
-	unsigned int cbFrameLength,
-	bool bNeedAck,
-	bool bDisCRC,
-	struct ieee80211_hdr *hdr,
-	unsigned short wCurrentRate,
-	unsigned char byFBOption
-)
+static void
+s_vFillRTSHead(struct vnt_private *pDevice,
+		unsigned char byPktType,
+		void *pvRTS,
+		unsigned int cbFrameLength,
+		bool bNeedAck,
+		bool bDisCRC,
+		struct ieee80211_hdr *hdr,
+		unsigned short wCurrentRate,
+		unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
-- 
2.25.1

