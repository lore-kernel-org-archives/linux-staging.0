Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430557C;
	Tue,  1 Nov 2022 12:38:38 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id j14so20659897ljh.12;
        Tue, 01 Nov 2022 05:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlF0TxgQdB9El9HMgVNkTNkSGlJ7JQkiUcra0SV3NJs=;
        b=RiuNuV6nMsbcTgUz7pjtL2BQMXHduzlKBqVSBRHcEKIXtt6nlr7VSsLb7k4YT5/yQZ
         WGx2IqMXqzn3eWQpRJuYMPrzBy3wP/fr76BFRBTTEOTwC+7ARRauDtTnwtwL+oJvAmtc
         unDPCbIsyxnmymgUzTRv4XD9KR6YGp8FrrRlFOVHTBN0H1JdkN+vJ55C4zk1YcUtAHbo
         977nnMtd8y5A431ynshkAfwOKwVlvsKjicaeHGzD1Afv47SUYtNxjLc97eZ3grwQfHQ/
         xAxabuXGh1Cuaydtgd8vkweYX14ssjGPbBwOvVbfGpuDckDsitmarZXfxvSIDC0Z+1Nc
         CDiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlF0TxgQdB9El9HMgVNkTNkSGlJ7JQkiUcra0SV3NJs=;
        b=HaXFC0KsA39erfzm+rXnv0Lrgy0oCtAeOF3wKxiVv1rYLvdS3GZgkNY0H/+rE5SQOh
         gPm2+TWDNMwfzkrz+sZyAuoztI6bMdnMuJ9HvXK6yk8aiZndAP86WU8x6Muib/sxuY7V
         TYF6VE1m6WUtsey2SotBu9D+pOHuWSIBmArKVLyBNKJJR+KHZ4k/JdokDZAeZbVpIAH/
         C1FfZYfP63rae9P8wQMQFyroVy8u8vMWXbExi0mFZVNdl13wWxIgY/1FXIjkoaghVWP0
         6obBPsIGKUFnyvtetJWmocWWOfbhgaQtuczrx+Dais0806cGd6Mi4PVzsFa6GdOwQulK
         lqLw==
X-Gm-Message-State: ACrzQf3y5IdVWzELA3ZdSg6OarL6OiRrT2XvuqdE9dCVSllVRvclkA9G
	QXE8MJ2XY3U4ohKgMkWVbnw=
X-Google-Smtp-Source: AMsMyM7nNIiARjaLTsBqKh2XT1ggp+KS7+iocKtcVW5UZrOI+mCtoJ//DXkSrajuYUgAQEspsj0ziw==
X-Received: by 2002:a2e:9018:0:b0:277:a4e:98f2 with SMTP id h24-20020a2e9018000000b002770a4e98f2mr829467ljg.358.1667306316170;
        Tue, 01 Nov 2022 05:38:36 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id p21-20020a2eb7d5000000b0026e897e3236sm1771625ljo.6.2022.11.01.05.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 05:38:35 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH v2 2/2] Join some lines of code to avoid code lines ending in (
Date: Tue,  1 Nov 2022 12:38:00 +0000
Message-Id: <04122308bf02e5c99329f120fe076bcffc16b08f.1667305446.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667305446.git.tanjubrunostar0@gmail.com>
References: <cover.1667305446.git.tanjubrunostar0@gmail.com>
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
 drivers/staging/vt6655/rxtx.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index d7e439cd8675..df7473155704 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
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
+static void fill_rts_head(struct vnt_private *pDevice,
+			  unsigned char byPktType,
+			  void *pvRTS,
+			  unsigned int cbFrameLength,
+			  bool bNeedAck,
+			  bool bDisCRC,
+			  struct ieee80211_hdr *hdr,
+			  unsigned short wCurrentRate,
+			  unsigned char byFBOption)
 {
 	unsigned int uRTSFrameLen = 20;
 
-- 
2.34.1

