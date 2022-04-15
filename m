Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20817A;
	Fri, 15 Apr 2022 05:19:28 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q12so6515221pgj.13;
        Thu, 14 Apr 2022 22:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVOmrzMbF/Nd6ktwK785B49f+x/EWjY0CPmWl8meVC4=;
        b=pc54EnVKWNfHaqAX6IHdDHZ2Hl/YDY+zX5taButPH2pjXHuqYPJQ65vnZSK8oNnFqy
         0LsU2Ab1ja+koIhbH8r58BTvGsZjomnTPJ0kVJ3NpFt0EbNxfaqdl3MTcbYGxqBswG0M
         lDxm7xNGgJvlvE7kqbsy0LOLut8hkvezkziPPPsgjlIduAESejVhWJqMr4n874Z/vCbu
         lBXfX5D/NEkoHN1E9QrIMgOJ12gbCD2MKjgAPXkwBaLVdVhL7e2FrIhxtttk1pmxggMD
         N1E/LQnjiEDAszohtljoETH002ZHfLddHrO9XFjQZrN9/GmPjgR016dKy4o8HaAdqT16
         j7+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IVOmrzMbF/Nd6ktwK785B49f+x/EWjY0CPmWl8meVC4=;
        b=nh8hG4RJzHAuC00c4cwD6dIrmUzRKcQ967P/y2Q+iz+wGP9ecz8KCeYOOkP6tT3Xgh
         34Fl5uBkkWU99+sofjxzROcdByUXoPAcDaWbOAalxx6XJ2RVv6aMy2DzCeAY8mVpQ/CI
         s1BR8UZygs0tHkNZ6zbBiBAOzogj2x3F1aZI/cHErgfiTQk9cOol9UA9T3J+As7QB27+
         4Htu2i1fe3Ec5gnRjJG6gcVfD7UQNJ1Jz/3FR/GJprTcobPJ/YBkbYLTDYuVrrUNzV/D
         rp0rdKlapHFAnZtHShlDzkqwfZK4OUVa15O0CT4yfMWyhkatR1KJgGNoayaqt20JZAdL
         B1jw==
X-Gm-Message-State: AOAM530j0ZQwNbliFYYYa7j3lDjppyfrjEpW3jeG/D7Q5rF6IEa1Y9nI
	QahliwMLtacuxuPMxsNNH4rlZ4L8h8Mz4A==
X-Google-Smtp-Source: ABdhPJzH5BvwE4XWSmRhsobGGAgV1/Oplh3QCkvZNhwI8Y5QTzck9Iz9780y6mhiDP5X1MZ93N7rVQ==
X-Received: by 2002:a63:334c:0:b0:386:291f:3435 with SMTP id z73-20020a63334c000000b00386291f3435mr4975844pgz.264.1649999967939;
        Thu, 14 Apr 2022 22:19:27 -0700 (PDT)
Received: from aliyaR-laptop.domain.name ([14.139.241.88])
        by smtp.googlemail.com with ESMTPSA id d4-20020a17090ad3c400b001c65ba76911sm7276583pjw.3.2022.04.14.22.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 22:19:27 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: forest@alittletooquiet.net
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v4] staging: vt6655f: rxtx: code style - Fix Lines should not end with a '('
Date: Fri, 15 Apr 2022 10:49:01 +0530
Message-Id: <20220415051900.5801-1-aliyarahmani786@gmail.com>
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

v2->v3->v4 changes: Rework commit description.

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

