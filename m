Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E6714F131
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 10:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790290; cv=none; b=g9e5tlEVXZD4JFP07rYjWlu/Rmo3fdxdVznfv2ODLnUNb0MpLQHZPRqp9ZAKZ7XAB1mKffir0qo7Oy+mQ7d5UaPNLEQnL4DGyiQhrKasuWRvUVjmKpAfD5agxAtD/GL3Nh6VKp0UnAVX1oAGCjwRfP6Rq0/a3+d9g9J/KcBRVOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790290; c=relaxed/simple;
	bh=s1ZVJGmAf1WF0Wr/k2J6OsVbhkjRW9zrp1i/9wazWnI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ink4WUSfFTAejsEotDEjNAK5ZvsEMKrVLbPC00b/Sm+ldupIttLUxqql4vd3bm8jh/3Rh+4pXfm4PQarFK/SeOBcE3tg0CG1tiPFo63DpisKCh85q1yo4j3acffJ1JySSAhLzyUYLPej2YslPyAd+BRIdKv+cHRzeDesTIaeTrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXJr2Rz3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXJr2Rz3"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d873dc644dso2505071a91.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725790288; x=1726395088; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zsUwf0eCWNJhcn14DjOfJsivn1oeErSWNJpstq9iJpM=;
        b=hXJr2Rz3ZWIarv7sCy4Tcmn8002+tpDfWoRdEfmeNNh+PctNNozxr1RlI+k6WkDO6J
         oIjCESYLmqYaRKlZY3fZ4S7Z+2wgCeDSZSxFu9fUb3dDrjjyzJZJ1lqeB1wtEvjTHUVw
         v8pTkMqXE9hFLUUoK1rh2HDwRi6o5gq2iqS7K4r7geCtGvNWKhBAMNEwlREEfcMbb1uQ
         fo82PxfhDhUvdBvry4Z8M3kcLZZXPDmlcG8uJj6Vq44lNFBkmVCt7+2IexoIo0rXCOks
         XGE/vCHoKfiABfrFyJ7dl3GDnoMRwuo+ERUUK/MpkkRU0zUt/9dhTfLIJA341f1ddB/V
         +ICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725790288; x=1726395088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zsUwf0eCWNJhcn14DjOfJsivn1oeErSWNJpstq9iJpM=;
        b=uIudtMVyA1o/Nf3R9LjB6/nYPvlDIgHi/PxQvgJaPXqifArEEd9rDzqVt5DDufC92t
         STthpzoVfffD5W9QDBt0DBC3LHWqgtp+LkUZvfb3zTEupTs8ZKxrs9USRYERnFltANg2
         mFikx0VeprnHZIYW1xGQK9p8vTVWeiZB4aSiXifiweMibVoBovVc9tZMQDGrbTpIHor4
         AajY5QxfuKK72+Vh/kdv6SSs8APm+h+9/UJldh8ezexYD5tEGPip+cAbHymOOhi6Ay1A
         w209G2iAZNmWk3Dn7h96hPUYjAbYws/V7Lce6r9Qj6MXG0KD6xc7Dly2Zj/wxAXzrl1m
         oKWw==
X-Gm-Message-State: AOJu0YykHWPt9WJvGxQZXcXE/o7l51RYXNYN7MDys/OlhelTVl/BciBB
	/QL3JpW6pJwCQBlbKlYWUHWqnQD8bI2YYZEIuFk9ZL2P3UQfMAPsZ2n5QKghLbY=
X-Google-Smtp-Source: AGHT+IGYZ/4cGvhA3GCX5HW0cLd4Aocj+nI6+i/9i4QfISAEPr015JG3Br5rF128Gd04XmYXERHwuQ==
X-Received: by 2002:a17:90b:17cc:b0:2da:9dc7:add2 with SMTP id 98e67ed59e1d1-2dafd099b12mr4758575a91.26.1725790288310;
        Sun, 08 Sep 2024 03:11:28 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc0782dfsm4589379a91.34.2024.09.08.03.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 03:11:28 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 3/6] staging: rtl8723bs: fix space before tabs
Date: Sun,  8 Sep 2024 15:41:07 +0530
Message-Id: <20240908101110.1028931-4-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the coding style issue of removing extra space before
tabs.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>

---
 drivers/staging/rtl8723bs/include/rtw_security.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 3ccbccf92417..4efa2d258ebf 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -81,12 +81,12 @@ union Keytype {
 
 
 struct rt_pmkid_list {
-	u8 				bUsed;
-	u8 				Bssid[6];
-	u8 				PMKID[16];
-	u8 				SsidBuf[33];
+	u8				bUsed;
+	u8				Bssid[6];
+	u8				PMKID[16];
+	u8				SsidBuf[33];
 	u8 *ssid_octet;
-	u16 					ssid_length;
+	u16					ssid_length;
 };
 
 
-- 
2.39.2

