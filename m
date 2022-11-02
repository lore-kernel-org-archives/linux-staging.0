Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CA492582;
	Wed,  2 Nov 2022 14:09:18 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id o12so28410500lfq.9;
        Wed, 02 Nov 2022 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xGATexOV6vnPuB2p8dA7jNyMLlzx3cNJwqnDQnqy0Lw=;
        b=QWREUQ+MIJRrxRHUnzmPUZtlJTHGq5/FaclL+DWpDyQxxqT/i5uu7XBDF76Uu6ajEe
         mf70HZLIapmkvb4+0bHS/y5X4Kt5QNaT90iNT8cn28CK+wWYVDGLODeERdzPjDn6nH8B
         xUYbtJoJPPwm6imgVr85phnsbZZk3C8HA9iC4Nj7zscE/OmRpEpJanP2ikBDWsnw9hZs
         YEQt4G3pLPP444oE9TZgGXFi9iTY9WDNZryx2RPXh52I3SsiCVBOpRoLHitQyCK2DOon
         OtjJeEIAEk7eCAw3CVyFjTKe9Rm2NWBIbH0HI5ovY68pGGKOF9QZPBgikz9KAmh1lOum
         iDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xGATexOV6vnPuB2p8dA7jNyMLlzx3cNJwqnDQnqy0Lw=;
        b=y3AwBfzsu+7ap1i7E2EUl/MEv/+islQ/pDJQa08MgPeQbt6oBArpHw5DrJ2LfqIJLs
         FfrhwuegtF0lLmzTgaN5R4cH27tyb/6Nn+mJhrfNAQYXB+4xMRg+N9o3b2ftukjW+iMQ
         oo5S4uQy/F5/X3tK+7HucAyUn/oBHJOY8H/RD9Rb63FJyd0GDi5JCVdGl6CPC/oNalKW
         +auOA45yPZPtNZha/JTJQIaZ1K+k4bZJySTJMgvnIakkX698WM7m6/+Q0phheu4I1/BF
         m/e5rfMhGgtFEJa9aUhC4xfISa0Ky5g4ORMiwU9NRfMWdjgNGerc3ckPDsl5W3XvQqKY
         J/lg==
X-Gm-Message-State: ACrzQf1gsKkoxLfzEnH3ZwrTNT/5Yx+5+TC2QuKFpCqZCacgjah4DdrV
	9yAByGfzGbPxHGVqh/I+DWM=
X-Google-Smtp-Source: AMsMyM7xppK3b50AM2XFDO4L4Ca+NPGXo1QFwfnB5fOVrd6kV2dssjPBwKExCJZN7sIZMIelaoy6bQ==
X-Received: by 2002:ac2:446b:0:b0:4a2:7e14:933d with SMTP id y11-20020ac2446b000000b004a27e14933dmr9134935lfl.338.1667398156338;
        Wed, 02 Nov 2022 07:09:16 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id bj12-20020a2eaa8c000000b0026e0434eb1esm119503ljb.67.2022.11.02.07.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 07:09:16 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH V4 2/2] staging: vt6655: Join some lines of code to avoid code lines ending in (
Date: Wed,  2 Nov 2022 14:08:48 +0000
Message-Id: <1026afe9c4c358b7b8a9fac62833ee62d2f4f9b5.1667397591.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667397591.git.tanjubrunostar0@gmail.com>
References: <cover.1667397591.git.tanjubrunostar0@gmail.com>
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

