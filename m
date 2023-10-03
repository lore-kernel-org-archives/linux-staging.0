Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC68817
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 03:14:28 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2774aa96947so320008a91.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 20:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1696302868; x=1696907668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdDtuGytLFT9IW88tdQfedwXf3aK1VXTnCUS+xcMTlk=;
        b=dKrP9lXkKXmw5m7ULqcJ4hX85KUmvTP/2PJHOrSFPqYm5/aBIQz8LchyADRe7F71fW
         6ClN4Pc1tJpe1+SYKj359KP99S+F9nTN8jUAvPJRk679rf2b2gznjSFxI2I9qCfK++vl
         xuLPDSKTJWfit//ulcp5I8uFZI3lZYReXk9eSNHoJNfOca6MbG8Gp0XmBA5lwVjvh1+P
         XMOF5CdYxkzL1iPxKdd5BEmP3yc6fXpdSe7T2HTiI3gBtUn3cqigt7R3M+uE3/9yxVAV
         VS0K3ZpYEqUD9nwVPHADqiaEWhX3CI2GzIOnGZbjfMNs1SQwBXjFzwjAL9vafXE0wiAX
         xynA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696302868; x=1696907668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JdDtuGytLFT9IW88tdQfedwXf3aK1VXTnCUS+xcMTlk=;
        b=HLfyPXM3dCJnjPKjebrIOTG2zNGvtONw83k3Ph+0CIZ9JELa9ZVK/sOsvjJpCw3w8z
         qScGaKXwuj8lbFNgLSuBHAwNNEeWKgsI9qbngJ2rxfbM92+8QZUe0V+RAAXagj1ZEY5E
         0yW6dv+no0U5Asu9PuOnn4UtE77BypxstFDBRoGxGS1scmQMqPfBtVaOkcFQijNvmjBz
         fu9k1aWdkC8E7BvP2Nxusuz6AlOWd4JKjwg64KNI0xmgjH4i2giy3iYuSu+BfgmZfL2J
         KhjMNGmJy2ZIxfqMOG0G0HiRYHlxesD2JSiEiBXNHpJmfXsrJItKvfyjsjdkMb2zO+Vn
         IG2g==
X-Gm-Message-State: AOJu0Yzp9wGFtIA7SgtLbygOx/pX0F1N8uBOpd9O2XTSXw344Gm3e0oo
	2jvG0Ix4Kp/hhmL0W6ba4ZQNXA==
X-Google-Smtp-Source: AGHT+IHnuJffE5JV7HDcEWJy7lQJD1MY0djTIwoKMU+AZYkERpg6pj/LwXUvVnnwfJgkusBAqxJCeg==
X-Received: by 2002:a17:90b:2342:b0:277:33b1:94dd with SMTP id ms2-20020a17090b234200b0027733b194ddmr12998152pjb.38.1696302867698;
        Mon, 02 Oct 2023 20:14:27 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id 11-20020a17090a004b00b00273fc850342sm7692550pjb.20.2023.10.02.20.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 20:14:27 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/3] Staging: rtl8192e: Rename variable pTSInfo
Date: Mon,  2 Oct 2023 20:18:47 -0700
Message-ID: <20231003031849.176743-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231003031849.176743-1-tdavies@darkphysics.net>
References: <20231003031849.176743-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pTSInfo to ts_info to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index a482acd5ee06..eaa2a82558f1 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -242,7 +242,7 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 {
 	u8	UP = 0;
 	union tspec_body TSpec;
-	union qos_tsinfo *pTSInfo = &TSpec.f.TSInfo;
+	union qos_tsinfo *ts_info = &TSpec.f.TSInfo;
 	struct list_head *pUnusedList;
 	struct list_head *pAddmitList;
 	enum direction_value Dir;
@@ -318,15 +318,15 @@ bool rtllib_get_ts(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 		netdev_dbg(ieee->dev,
 			   "to init current TS, UP:%d, Dir:%d, addr: %pM ppTs=%p\n",
 			   UP, Dir, addr, *ppTS);
-		pTSInfo->field.ucTrafficType = 0;
-		pTSInfo->field.ucTSID = UP;
-		pTSInfo->field.ucDirection = Dir;
-		pTSInfo->field.ucAccessPolicy = 1;
-		pTSInfo->field.ucAggregation = 0;
-		pTSInfo->field.ucPSB = 0;
-		pTSInfo->field.ucUP = UP;
-		pTSInfo->field.ucTSInfoAckPolicy = 0;
-		pTSInfo->field.ucSchedule = 0;
+		ts_info->field.ucTrafficType = 0;
+		ts_info->field.ucTSID = UP;
+		ts_info->field.ucDirection = Dir;
+		ts_info->field.ucAccessPolicy = 1;
+		ts_info->field.ucAggregation = 0;
+		ts_info->field.ucPSB = 0;
+		ts_info->field.ucUP = UP;
+		ts_info->field.ucTSInfoAckPolicy = 0;
+		ts_info->field.ucSchedule = 0;
 
 		MakeTSEntry(*ppTS, addr, &TSpec, NULL, 0, 0);
 		list_add_tail(&((*ppTS)->List), pAddmitList);
-- 
2.39.2

