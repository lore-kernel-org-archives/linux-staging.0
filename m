Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D9B4A990
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919968; cv=none; b=QN7BjJM3sPyMM8e+o9FHsEZ8GmmaMVTRd0+iE9fjmzMM5M+TO3/iIouZC6i+gfP+E0WciPMk3GpJ8uzTp9NCikzpbJMxkfGS6jGXSS+vr6zkmUMrkacuPhgURYJ47Uz51b0xb63gaehNX5e5WmHgb0GtG8ulKNq7jbgu/KcfdAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919968; c=relaxed/simple;
	bh=YCeunnsu5ZMYeBtB47AcnaouRPKXI3Zjqo2gxMsyYT0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cmCVVMyuubjt1hKno4yRUIcu6BBPyXR1vYUluomNNCOyEhJ0Eg1oHRUwz62nYJP/mHiwl47vRbCi2bGhoOkk7zmLjTo28uDa64tRmDJBGzCSZYmjU0gS2VVRnW48DXuKeNqv2NcyzZfC0rSIFTU/4LHnxcYl8IEsrk3G3XtyYPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=d8Wnu3vq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="d8Wnu3vq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so10208465ad.3
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919966; x=1709524766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWpbo37RpiaoOqXUf66a114Vy7k4lyCvrRXvqAK4Zg4=;
        b=d8Wnu3vqVF39MfGzRE3bAMquTKKamk+0kiLp7pIM77Lh/NQpi4F0giAmRajuBcUqmQ
         KlGTlkp2tHnhsrw0GhnJ7u8kdi6I+ZT+VUJWQqFcbsQ/dJ0E2lHchyw0RLcMttQR7wQA
         Q/gRQTEUXC3MCL5yPCQG0SPNGlxQtQRTHkYJkTjQ9O3TVh8i/ytDXjfwN8Zm8I74xsDf
         rKuyGpGRrPwfUgEyHYFJFjT8V3Wq1n7rBcLzwHuFjV1ol8PmXasaiP1ELRrmP2atSgZm
         ChbMk0QTnvHPeNRRR0LQq81x6Nhprw5eUtMVFFohFG9sNkMmrcE7EzWWyUxwGIAJkdkI
         4hfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919966; x=1709524766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWpbo37RpiaoOqXUf66a114Vy7k4lyCvrRXvqAK4Zg4=;
        b=Oeh52a3PEOKAKpN58fMu6dPyeT+1OgOSWHWAK7dGI2zAwo0pmjdgPmw49FZNWk63lc
         uaTzcufQlNMsBJ+omz977TrH8j65YGoeEY8eYu+aqh+GZyx3TJNSYusuZ+1MGCdkqT97
         SDPTpqvuqT68j8SslsU0ghdC/BRaMA3kp8hN7VZVbSpzXe063gj0s0scAo7Oj7OZdlnJ
         /8iRMKz4ouZJ+F/g6XFp0beh9jm8ismkIiQQmB5JSYhhab6iSsAuGBgj6DQLAeBXbAR+
         rJr7pcsmFK4tbaqhZUUZq/G6weIN5BO8fjtidsijiwUrK40niozzJw2NHtAUXANHM9mp
         ykaw==
X-Gm-Message-State: AOJu0YwbVAyRI91wL3o+78cIrkSlOnFg/uGt9uMaHfCnaA29FoVWVoIR
	y9f5on1dKTYw52fOd49vu60xDaXko+T1JZSxr5KB2Eum2Hi1L7vfPD0YIieFirA=
X-Google-Smtp-Source: AGHT+IEZAv3+kYJiLUplU4IGAkwZIxGgUDOEJJsitJKA5Btui7bzAy2jdmP9SKECRcXVmeOi4i6//w==
X-Received: by 2002:a17:902:f545:b0:1dc:696d:6bb0 with SMTP id h5-20020a170902f54500b001dc696d6bb0mr7048782plf.6.1708919966520;
        Sun, 25 Feb 2024 19:59:26 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:25 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 7/8] Staging: rtl8192e: Rename function rtllib_FlushRxTsPendingPkts()
Date: Sun, 25 Feb 2024 19:59:14 -0800
Message-Id: <20240226035915.370478-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035915.370478-1-tdavies@darkphysics.net>
References: <20240226035915.370478-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_FlushRxTsPendingPkts -> rtllib_flush_rx_ts_pending_pkts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 0581ed1e9ed1..04f3fb54d1b7 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -268,7 +268,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		goto on_add_ba_req_fail;
 	}
 
-	rtllib_FlushRxTsPendingPkts(ieee, ts);
+	rtllib_flush_rx_ts_pending_pkts(ieee, ts);
 
 	deactivate_ba_entry(ieee, ba);
 	ba->dialog_token = *dialog_token;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 05abc001507c..fe850dbeaa02 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1810,7 +1810,7 @@ bool rtllib_mgnt_disconnect(struct rtllib_device *rtllib, u8 rsn);
 /* For the function is more related to hardware setting, it's better to use the
  * ieee handler to refer to it.
  */
-void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
+void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 				 struct rx_ts_record *ts);
 int rtllib_parse_info_param(struct rtllib_device *ieee,
 			    struct rtllib_info_element *info_element,
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 051371e0138c..be0f92e97d12 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -487,7 +487,7 @@ void rtllib_indicate_packets(struct rtllib_device *ieee,
 	}
 }
 
-void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
+void rtllib_flush_rx_ts_pending_pkts(struct rtllib_device *ieee,
 				 struct rx_ts_record *ts)
 {
 	struct rx_reorder_entry *pRxReorderEntry;
-- 
2.39.2

