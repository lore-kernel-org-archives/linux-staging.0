Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14008EBE
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 12:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14463C433D6;
	Tue, 25 Oct 2022 12:22:00 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WO1e5oJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1666700519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KZKJWuEIeuKvDUZQNV7Smz75T6WROuu6Yr001YKXCbo=;
	b=WO1e5oJROkFlQEDo4omTNY1UKBt7//EgstbWIjEpSV7b7Mvf3s5U/yAGhB84jeo0QDl699
	jQgzD0XB6RKgkOff4bTSHpB+dz//GusPzz50WqYg+JBH78qH6ePZiDfAdXliafi5uk/RKn
	q3or7vKA/mdYQBKkK1HeeWGk2Nas1NM=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id ba7e1585 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 25 Oct 2022 12:21:58 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	dan.carpenter@oracle.com,
	gregkh@linuxfoundation.org,
	kvalo@kernel.org,
	linux-wireless@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [PATCH v2] staging: rtl8192e: remove bogus ssid character sign test
Date: Tue, 25 Oct 2022 14:21:50 +0200
Message-Id: <20221025122150.583617-1-Jason@zx2c4.com>
In-Reply-To: <Y1e+SmS3O2ZaPVoe@kroah.com>
References: <Y1e+SmS3O2ZaPVoe@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This error triggers on some architectures with unsigned `char` types:

drivers/staging/rtl8192e/rtllib_softmac_wx.c:459 rtllib_wx_set_essid() warn: impossible condition '(extra[i] < 0) => (0-255 < 0)'

But actually, the entire test is bogus, as ssids don't have any sign
validity rules like that. So just remove this check look all together.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
Changes v1->v2:
- Remove ssid sign test entirely rather than casting to `s8 *`.

 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index f9589c5b62ba..1e5ad3b476ef 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -439,7 +439,7 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
 			union iwreq_data *wrqu, char *extra)
 {
 
-	int ret = 0, len, i;
+	int ret = 0, len;
 	short proto_started;
 	unsigned long flags;
 
@@ -455,13 +455,6 @@ int rtllib_wx_set_essid(struct rtllib_device *ieee,
 		goto out;
 	}
 
-	for (i = 0; i < len; i++) {
-		if (extra[i] < 0) {
-			ret = -1;
-			goto out;
-		}
-	}
-
 	if (proto_started)
 		rtllib_stop_protocol(ieee, true);
 
-- 
2.38.1

