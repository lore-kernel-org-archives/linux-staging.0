Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86341E9F6;
	Tue,  1 Nov 2022 18:18:07 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id j4so24637963lfk.0;
        Tue, 01 Nov 2022 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGATexOV6vnPuB2p8dA7jNyMLlzx3cNJwqnDQnqy0Lw=;
        b=NICToIixUPdDC32HkPXSHGZ1OMrDXhb4jM2cPeHaAvS2JEaa2zUnm66gEKccp1vn6q
         TJe9bqk7bU677eyWlRrS1UOuV8IIvBlHe92LgKfoWwoQSo80n4gBq89IHxby2/KdSPk4
         7xAwjrBbqSFqWH+wEWb/BVyMowVJ73LYiihQVyyfEUr+jjjy9JUypFrR5Z62pGFsVoM5
         GjjzCGUT6FrUHfLa15E2lh5lEk4yFd2VPqGv9A+zq/JicOzxi6Xxz0vlly4AkgsRKqs+
         +WYcSWDqz9W42R9Obd0vuaVkuChUbSD4relDbwEAnFVbBtkO8kwZKei57JNKspdUXmqe
         HfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGATexOV6vnPuB2p8dA7jNyMLlzx3cNJwqnDQnqy0Lw=;
        b=0FiVMWzMazV2e3I4bhH4WnqicI9Df2vVJYtRd11Rh4wK0Dj8JoO38/FVBtEAy5KROH
         yjkIqhdalkZB+ytQiPuVtgwW46kPYjIXe9T1T/NJ+iyGXQzHb4Injt/qNvkdSevUQVTP
         ex1f8nktJNb6VHO9Hs6I8Xs0xHSRrYegM31T49C5pFqR7pSVTHzRgP7EuU59Usc+hhCZ
         G2zYYXEZiHB9NpKkJd/xvP/0AUDjzR2zMAMB+1I3sBcRmEdeFPIK/RipZqUj/IdJxV2i
         9uf7UOERZCEcjOlVp4RhdukR7N9lrqetwtGKsIG3SIfKDnd653a8E5SDCHlQhcwqmt6S
         m9Kg==
X-Gm-Message-State: ACrzQf0iYo4h4bBMVxGO0YlotpexWJHRdjrGRotSf1KWwhvnaGOT8uJf
	nRfXvr/NyV2K6uJpymCJ0PMwlrEP3hdqtA==
X-Google-Smtp-Source: AMsMyM5vxq7beSkQn4ZNXzOnIzBhVzpDtibz5gLX1Urhz4O4JUcKpGt/nmGCQtS0K+bpPG5SFLqHEQ==
X-Received: by 2002:ac2:5193:0:b0:4ab:db5d:10f0 with SMTP id u19-20020ac25193000000b004abdb5d10f0mr7574671lfi.225.1667326686066;
        Tue, 01 Nov 2022 11:18:06 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id 190-20020a2e05c7000000b0026f9cb6d10fsm1850601ljf.45.2022.11.01.11.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 11:18:05 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v3 2/2] staging: vt6655: Join some lines of code to avoid code lines ending in (
Date: Tue,  1 Nov 2022 18:17:49 +0000
Message-Id: <4433970c86a4d1bf9e3af5d6c34eb972f7be26e9.1667326000.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667326000.git.tanjubrunostar0@gmail.com>
References: <cover.1667326000.git.tanjubrunostar0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error related to code line ends with a '(', by joining
some lines and indenting correctly. This improves visibility

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 40 ++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index c01fc1a593f3..debc5d5daede 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -85,15 +85,15 @@ static const unsigned short fb_opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static void fill_rts_head(struct vnt_private *pDevice,
-			  unsigned char byPktType,
-			  void *pvRTS,
-			  unsigned int	cbFrameLength,
-			  bool bNeedAck,
-			  bool bDisCRC,
-			  struct ieee80211_hdr *hdr,
-			  unsigned short wCurrentRate,
-			  unsigned char byFBOption);
+static void fill_rts_header(struct vnt_private *pDevice,
+			    unsigned char byPktType,
+			    void *pvRTS,
+			    unsigned int	cbFrameLength,
+			    bool bNeedAck,
+			    bool bDisCRC,
+			    struct ieee80211_hdr *hdr,
+			    unsigned short wCurrentRate,
+			    unsigned char byFBOption);
 
 static void s_vGenerateTxParameter(struct vnt_private *pDevice,
 				   unsigned char byPktType,
@@ -555,19 +555,15 @@ s_uFillDataHead(
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
+static void fill_rts_header(struct vnt_private *pDevice,
+			    unsigned char byPktType,
+			    void *pvRTS,
+			    unsigned int cbFrameLength,
+			    bool bNeedAck,
+			    bool bDisCRC,
+			    struct ieee80211_hdr *hdr,
+			    unsigned short wCurrentRate,
+			    unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
-- 
2.34.1

