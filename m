Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9325E4B8DC0
	for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 16:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781194966; cv=none; b=okXFHPmU+7W8xRx7y60IvmNPJbFRB8pGnoS+SC9fkgRc4AzIdbZzxxe4pNI9JF1S00ZtsvV1BDOs2znMYlzjs7IlXkg4Q1MSSCP35RoZCtxujsOoG7jkdB8lxqqth26aIPC+A+r39kaz2ufftIaFqDoFaTkQyhrwe/9ibGdy0ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781194966; c=relaxed/simple;
	bh=4IvbjU2deD5sMdr0fliZ9USA7R3ML1CLXeZTOLVGgq0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBmOMd9vBOVRBgQb95fem7RzGNX0RmZ+5ReutZ5BG4qoTCUSsKVvmFs9/I11TZ67o9UGqR/8/7j/2vtXssuXCgvJ9RBHCsc39sFGQOlKpP6s1NdMZiRzXHL/kORrKDQ9/t51S+n7lF7zDysYhFyhsIR2MQ3ehcaj8g2rPuEPdy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eoJUuAXJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eoJUuAXJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490a76757e5so55037285e9.2
        for <linux-staging@lists.linux.dev>; Thu, 11 Jun 2026 09:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781194964; x=1781799764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=khO/rqQW4LRHcQjkEoaFynbxIqCeifC6TGBEsN1E6nM=;
        b=eoJUuAXJr3cp2YXB+eOlLd0iMnprGq+PyjTQQXdKOhjjrpGDfUdyY1mkj4KIYHgoEv
         auOonVEFevVxoI67v3elPmMz/VvQv33y+n86ucuZCAMkzMN8RLSWKDnttgSUqBclu56F
         7IDysORDgN7waANeLf8G87dV3zITEEkfFiFTrcfvkSlQPyJmFy4OwkLR0KOGHNZRXC9v
         iNVuVc3aqKgAXhcNCxCGCbdnz5GSjAnszcYLEDrc7qy+mCb5qeyOPSLtzqjLV5D+ftls
         yw4hpPVwYGV3l2IlNWV8z80ycpaplAsCvlAr6lLflYjErohOzkSKxeKPsgP1CpCxSVAV
         rbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781194964; x=1781799764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=khO/rqQW4LRHcQjkEoaFynbxIqCeifC6TGBEsN1E6nM=;
        b=Skrj2nbtdVzrfbSEKdqj/vnLE6NtcNQVCDKcBxYCmVQ2gkzOO+djGVwaGY+HXxUyE5
         NvhMZYs4IGXnwKROt6h8rT/EVJt6FmOz/fIw50bcH7D7Dms8lZ/wbddlbuUL6XjpP5jR
         s93Y95Zl6eunMMpEHmQR9R2R8GLFYU/LRXFMNWDyPl183DPi0c8j5qdOPnRSGXEw4wwv
         rsOp+12EnqxoPYqtlxaVGqa4DEPG826YO8D5JVb8TUe2OOc5hdU+tUzxtau/ogOtfTuy
         4hz39tuO0pLQzmvwAMGnGbAdmx4BGBio2IFzQINmUTrBhx+WfoQ8CKvYxGD1NL0l9ATj
         xImg==
X-Gm-Message-State: AOJu0YzrgNkEkWfWtoMwG3aRCUxWDwvPZ2nxWNe9+NqbH8VzO4yTMv1L
	6mbdzTgTrgRzQyDFJx9nXTLnjcIpk+yqDe4va6QaNv++2vdJFMzyiU9B
X-Gm-Gg: Acq92OFQQtg3O9jhV2x0hxSSZyQY6Px4G743pPwumEvnqNNyQm1M7MlniWAWEGkvLyB
	ZFF71S8nS9on8AJXrlX6CaKQNuXeT8mLphV4+ItGglYGJk6ov69bfnf0PaoCRYVx66M6vw2qO0O
	XzAfA+BQ+PefMK+0YFU1SHin4E3RyheoXNArwcuESds9yrqctgblb5sFGcutUN2WgLWMoFnOaPB
	t9UBVRNoEBYjmdnBSYYfzRS4RUianl/G/3t2DCUVKXAj08pOyVaUPXX6LY5wIUAHfs5zMPrvWH4
	iu5mxaxN+ga+T/KkUo+wp14TkZVcIAnWwJB2NEOO8u23Oe80SuspWsuVO4Cob8ii3KJSNZylSF+
	a97mogEod+ajGILdmmWR/huELhhz3BUu6SpeDcV6rSfex563V5t7a2LLUY7bisHDYz9HXI4Vdii
	u/6FVjxDSSScWcTXjCbpAp4h0yTA==
X-Received: by 2002:a05:600c:c054:b0:490:4b89:5362 with SMTP id 5b1f17b1804b1-490e56146admr34017085e9.24.1781194963856;
        Thu, 11 Jun 2026 09:22:43 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:ac27:e02b:2f26:8695])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e46a75c8sm70344585e9.2.2026.06.11.09.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:22:43 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH 9/9] staging: rtl8723bs: hal: fix whitespace in rtl8723bs_recv.c
Date: Thu, 11 Jun 2026 17:21:28 +0100
Message-ID: <20260611162128.57870-9-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260611162128.57870-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index cab4707091e2..69f09bcfeeb5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -268,9 +268,9 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 				rtw_free_recvframe(precvframe,
 						   &precvpriv->free_recv_queue);
 			} else {
-				/* 	Modified by Albert 20101213 */
-				/* 	For 8 bytes IP header alignment. */
-				if (pattrib->qos)	/* 	Qos data, wireless lan header length is 26 */
+				/*	Modified by Albert 20101213 */
+				/*	For 8 bytes IP header alignment. */
+				if (pattrib->qos)	/*	Qos data, wireless lan header length is 26 */
 					shift_sz = 6;
 				else
 					shift_sz = 0;
@@ -286,8 +286,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
 						alloc_sz = skb_len + 14;
 				} else {
 					alloc_sz = skb_len;
-					/* 	6 is for IP header 8 bytes alignment in QoS packet case. */
-					/* 	8 is for skb->data 4 bytes alignment. */
+					/*	6 is for IP header 8 bytes alignment in QoS packet case. */
+					/*	8 is for skb->data 4 bytes alignment. */
 					alloc_sz += 14;
 				}
 
-- 
2.43.0

