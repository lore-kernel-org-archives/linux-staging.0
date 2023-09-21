Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4814411
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:38 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6c0c675cb03so358887a34.1
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266497; x=1695871297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J13TYH53baJjDyxjNG/I7LEG1MMKBZPbFBacTopiq18=;
        b=EZTvfFmfITr1EO+L9gxNm8CvDDe4pzsmXPJEE1tuYqisP6kgq4mMfOvgcOlOeADghf
         LGP96Iw2I500TT60P6QfDndA8BOrV7WIA4S4pGXssGqcqs5SBp9iKtSuwkCW49rVmH9J
         22m75lO6ChzA5v5rqK0GDqQ/AzO9yOf02b9m7by5iX3t0Y1JpbvRVTzLEsB27oyvLby+
         uJLyCaHYeoFvmdVhI5jqlkb+C4csuEszRcYfwa5sPnj7G5WxNaZTWZJmw3e4YusoRawA
         R3R45qDwhnKYZXpsyrndiyqCrEA8To4OXFiBiUqqtRoudO40bCaKhwb6EL+shcVl9sG4
         esNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266497; x=1695871297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J13TYH53baJjDyxjNG/I7LEG1MMKBZPbFBacTopiq18=;
        b=GUv5Zn///V0n5RoTq7tgEtRGjQ8d9q9KY6Aa/8cf412a4MFUXcAGDKksEYEOuPmdgH
         uvY0CYnP3hqWFVF7rM+U8eihGjnUPJJyo6CEKWotCUF8vUSeMxyx/O1Qgz/o/ilGfD6N
         xBmB7MNNbx+lWIF2r7cE0Pq+HkbwJLaRjfLttus/tEY0bzKDIRn6z9jo8iC4a4nzoWG+
         ASvJOHCc0rIMtPMaAUloYztYlSa61XtxdY/1EvsUbO/RHcEpHmvOcNwE0I2tDdisiOYV
         vC2YmSU/8ngjVhB7bK7ZssP+gmYBmgYkF5yoPbK6tC6tBV+9qE4+UmOeU8ZTF4knVOM4
         nX/g==
X-Gm-Message-State: AOJu0Yw87EUhwHyVpGYxLWT+On0xtdK4mqZJN9x1dBytjGWtMwJIFVOv
	FVcDda0FN+P0+tKY6ZsKBDS93g==
X-Google-Smtp-Source: AGHT+IE3VuH1+V0xhuaLDWp508K9FGyJ9OfrDdJCBCM4LXhXsSnassgBfeQ3SlC3wqUr+BWa+AefzQ==
X-Received: by 2002:a05:6830:ed5:b0:6b9:1ad8:18d8 with SMTP id dq21-20020a0568300ed500b006b91ad818d8mr4322857otb.27.1695266497397;
        Wed, 20 Sep 2023 20:21:37 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:37 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/11] Staging: rtl8192e: Rename variable StatusCode
Date: Wed, 20 Sep 2023 20:25:15 -0700
Message-ID: <20230921032515.96152-12-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921032515.96152-1-tdavies@darkphysics.net>
References: <20230921032515.96152-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable StatusCode to status_code to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index b3a8a6959622..820b5ee2ded1 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -65,7 +65,7 @@ void rtllib_reset_ba_entry(struct ba_record *pBA)
 
 static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 				    struct ba_record *pBA,
-				    u16 StatusCode, u8 type)
+				    u16 status_code, u8 type)
 {
 	struct sk_buff *skb = NULL;
 	struct ieee80211_hdr_3addr *BAReq = NULL;
@@ -101,7 +101,7 @@ static struct sk_buff *rtllib_ADDBA(struct rtllib_device *ieee, u8 *dst,
 	*tag++ = pBA->dialog_token;
 
 	if (type == ACT_ADDBARSP) {
-		put_unaligned_le16(StatusCode, tag);
+		put_unaligned_le16(status_code, tag);
 		tag += 2;
 	}
 
@@ -187,11 +187,11 @@ static void rtllib_send_ADDBAReq(struct rtllib_device *ieee, u8 *dst,
 }
 
 static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
-				 struct ba_record *pBA, u16 StatusCode)
+				 struct ba_record *pBA, u16 status_code)
 {
 	struct sk_buff *skb;
 
-	skb = rtllib_ADDBA(ieee, dst, pBA, StatusCode, ACT_ADDBARSP);
+	skb = rtllib_ADDBA(ieee, dst, pBA, status_code, ACT_ADDBARSP);
 	if (skb)
 		softmac_mgmt_xmit(skb, ieee);
 	else
-- 
2.39.2

