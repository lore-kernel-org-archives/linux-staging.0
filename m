Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D10F51C
	for <linux-staging@lists.linux.dev>; Sat,  6 Jan 2024 05:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="c4VvpN33"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dbb7d80df8so217954a34.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Jan 2024 21:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1704520580; x=1705125380; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKJQFXd3zRjGrXlevR2KqTB8Zpv5dll5vctsB1WQiTE=;
        b=c4VvpN33hs1iuSKufW7/sIf/+8Qr/riVdsFWUANljtTTt2fNGV/oGvSopA6lLAHOAm
         wlSAGILCltxnjAwXmWxSCtwBzgyCCG3bC9RM5WuEqu4Mv7C5GubrWYcriRQYiE/eqMNK
         L18BaLRc3MbK0BFGoHTC7GkO5YRpMds1UDdRBU8SS4BPMWXLcC+CpYFq3htLCkXeGsgA
         ovHELuSBpINIWvJcmoZqkudmwsW9pnphpGkDvBXwRCZYxy8vp7exjgRInA5LGqjuYbv/
         L7wgbOTFz9DjJLhtE18wGfqbrIrc30P3rq6A83QhaLVzhhOvAqHvnRsJMUxqfQXV8Ksx
         eM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704520580; x=1705125380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uKJQFXd3zRjGrXlevR2KqTB8Zpv5dll5vctsB1WQiTE=;
        b=ckjh4tfN+c2FOezGXewiUpjTVQZfmt7F3lSwCxpnHgPEDE5BK0+up6URB2gh+KoOaB
         71oyV0sk51BSDSq8+vGvRt7x8QYqniNSoe48BeZygN7LrowWRLRZ9QdqXzyKQcWhiXzj
         J+giK/NIEn9+YCdCcqOda8b3dVk1jOsVb6KckDSyDdGS7098X0gmUI+2D5MEm/RvYBiW
         5vAS1P5o3WBRA77au/Hx5knqwbJVoneeCX6vNb7NwqRshSe3JnqFzCHwhiLzvrsQ2m34
         qY8WQP87DLJevBe4dKWt4uv9F83FLPWdb0n2TfAevs2OHMGhQDGOO683QAKyqz73NzIi
         tvpg==
X-Gm-Message-State: AOJu0YwzaL1wcpWRsVTJ0E8mUe50CMrMGpe3WUufKCRmKXHLHvM/9ytC
	0uFSu7NxloMkN2yGdiJ2LApj2enF3GbCPw==
X-Google-Smtp-Source: AGHT+IGG3k4pihsX+GgVGhkDXFcsF0YQU6PLWBkcS8Powtc1Yp3V5H5QTRquYYVlG/szEy/UutV67w==
X-Received: by 2002:a05:6830:1e0e:b0:6dc:aff:196a with SMTP id s14-20020a0568301e0e00b006dc0aff196amr517791otr.60.1704520580422;
        Fri, 05 Jan 2024 21:56:20 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y29-20020a056a00181d00b006d99d986624sm2280873pfa.151.2024.01.05.21.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 21:56:19 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/21] Staging: rtl8192e: Rename variable RemoveAllTS
Date: Fri,  5 Jan 2024 21:55:49 -0800
Message-Id: <20240106055556.430948-15-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240106055556.430948-1-tdavies@darkphysics.net>
References: <20240106055556.430948-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable RemoveAllTS to remove_all_ts to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 7e73d31dcccf..48374cae816d 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -402,7 +402,7 @@ void RemovePeerTS(struct rtllib_device *ieee, u8 *addr)
 }
 EXPORT_SYMBOL(RemovePeerTS);
 
-void RemoveAllTS(struct rtllib_device *ieee)
+void remove_all_ts(struct rtllib_device *ieee)
 {
 	struct ts_common_info *ts, *pTmpTS;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 26ceb579afeb..ed9ca77fbcb9 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1789,7 +1789,7 @@ void rtllib_ts_init(struct rtllib_device *ieee);
 void TsStartAddBaProcess(struct rtllib_device *ieee,
 			 struct tx_ts_record *pTxTS);
 void RemovePeerTS(struct rtllib_device *ieee, u8 *addr);
-void RemoveAllTS(struct rtllib_device *ieee);
+void remove_all_ts(struct rtllib_device *ieee);
 
 static inline const char *escape_essid(const char *essid, u8 essid_len)
 {
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d7edfa1dca65..b9750c9b3952 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2002,7 +2002,7 @@ void rtllib_stop_protocol(struct rtllib_device *ieee)
 		rtllib_disassociate(ieee);
 	}
 
-	RemoveAllTS(ieee);
+	remove_all_ts(ieee);
 	ieee->proto_stoppping = 0;
 
 	kfree(ieee->assocreq_ies);
-- 
2.39.2

