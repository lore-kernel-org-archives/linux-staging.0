Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EA53C5536
	for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 18:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781461408; cv=none; b=EE77qZ9AG+LH98xoiyfooP2o+pg/GEIxPL5m1HisM6bhpQ0ZQZ3lhLhZ35nBE4sT0Wiv7eGb2bSWplJjj0DnkmjP7O4tHYpb2yz+p0mDq0xytC+7NlvHD9dm/aXKOGJz50Ttk0C9OM+KciYVgOavRq/2hrVbJyMmICiY6OXc2gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781461408; c=relaxed/simple;
	bh=UCLz7dINh1lgMYFDoeDTmd+Nq3hyT974aet2XBucKj8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BFToi84qQnw7p4+RSZ2lzqpWG47Exql8wYwsCkHwQUQcCMuqAeGUpT0SsTW4SfFEzMt82tsdizO1MvE/i4OOQiMRB9etmoNG/ttqdH4o5iQxVbQoZEFRXIC8yOtU+FmGe5EStJTfb913X+jmyiHXLRb9TzI4EHgw9rBZorxHAQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuYQl9A9; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuYQl9A9"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-137eb0d76beso2418978c88.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Jun 2026 11:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781461406; x=1782066206; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufi8jS0Gv9HR4sYoAY6vKqLESkvd7ZmAPRv56V3pxB8=;
        b=QuYQl9A9TECh6ZlMSL30rnZcF4X2OddPJ+CrbnOlWfeIR6vs0QfTPWira5FKMJWc/c
         dWCQ+vOIg8LDbhwCRGx93Tn0XxGLX8JUlVEagnzCu/Y1HcXbOM9qC6bxrR/ynq3vtzhH
         rMjkUCb8ZTiyCddDjvRwCRg7aiPRB2LDjaRF0Zy/8N/M/3U24G655n0zpvzzry1L+98E
         St/0Twl5RU6ivGKpKXNsdLZnqjUS8J4PT6BBblkpoilSmyBg958/RXzfGaaxRQRboiQm
         I18j3G6vKrni1fnBympLkhD4uL2ufqhSjqX5/HQHPdzUfMQpPnel+/eDzwYkvdPEthqG
         d/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781461406; x=1782066206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ufi8jS0Gv9HR4sYoAY6vKqLESkvd7ZmAPRv56V3pxB8=;
        b=UZWe0Q3tdxTGfBbCOa0o/7O+5y/vgY0OkWxElKEGp8stFPAHIJpTMOoB1eOZg3fJin
         3DkbNEjCG79q1gHGlLjsVK6vY7qu9wdgnS/uNkKCE4gWG5Tff+EuXbXF+YEr/j7InvPP
         QCIuGCX6KKVTk56IRwG6kAXhP1pzQGJzPHPdttVkd+hbJLVD1Hzs7qle6MCcVWR7k526
         8S30DGyh1yIUoYzPt9ePC47AiBAHGvctkLv3NfzEOIvt2o5d87Vd7hS2CrMwRZGPavN+
         sNPdPJmbc7K6UUVMDkAFUzUGsJ7Juvyuvn8rXI8utC+0lr4gQoNM4QuvYRpiWZSWnUPf
         ZZ3g==
X-Forwarded-Encrypted: i=1; AFNElJ/b6gGvDvIgNGLSixkNNjeDc3fZkOFdBzdyMyaSS+KEn/Fctx7xQFaysxlDLWuaeuBiQLLhar9XK0edYLUX@lists.linux.dev
X-Gm-Message-State: AOJu0YzgqZvbnbmv1GXxoG3fObS99cwtijEa9qtwrLDe2iQ/DYygYCQD
	3OuCtmCrhuU3SKMA4xkL+tt+a4B/Oz7b0F7L15AsL2wsjcqgC4EQVHozL3IrUPZ8g50=
X-Gm-Gg: Acq92OGPqI/Dpl6BiEfUb6LdeHA4OkRIL0Zw2JNUzagJd1qG+yMG5w7VXMLkgWG7F1T
	OzARTobTTQG6DJrzdscUAKwZBna/oFci/ODgBxwBpLcjZgO1A8S7sCD3kAu0y8aR1qBfneVHP9F
	NkN02SpHSPg3I2mbFI0w5xkLrvHeUTSngMYx1FtjlFBX/rDAq2CXyktJ8wwmHgPpw2WRakQwy1V
	WZegR/eVRqC4JAnd8hZPVngoNW63DIdkfbRfc0vbynYE4/LB7iM4gDpXtA0K3xm5wy/zfJqCVKD
	6YWxHJTTMKzYgx3Z71FttzOYjJUZW0OiMxGL6RXFNGxTUTWbxE1ZgS0R/N3udMMs2xUzebihAs8
	3QoXTi09PadTPJmdhK7XXaeDCZkW12kDrP42N+FxvbNE/7hRmZh4WSaWQtgWlxhIlaY7rFq/SGd
	2fI8RKP4hwMR3iukqHVGibBACjhkBSvqNwiyjQbWiTgaYRV4LlScIOIVGYMuHOvY0+EA==
X-Received: by 2002:a05:7022:f309:b0:133:39b9:9720 with SMTP id a92af1059eb24-1384c14cd8dmr2097495c88.16.1781461405456;
        Sun, 14 Jun 2026 11:23:25 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b975e55sm8435022c88.13.2026.06.14.11.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 11:23:24 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: convert update_attrib to return errno
Date: Sun, 14 Jun 2026 18:23:09 +0000
Message-Id: <20260614182309.96110-5-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260614182309.96110-1-dennylin0707@gmail.com>
References: <20260614182309.96110-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert update_attrib() to return 0 on success and a
negative errno on failure. Update rtw_xmit() to handle
the returned error code.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b6d9332958f5..fb2fd3f5de77 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -741,17 +741,17 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	} else {
 		psta = rtw_get_stainfo(pstapriv, pattrib->ra);
 		if (!psta)	/*  if we cannot get psta => drop the pkt */
-			return _FAIL;
+			return -EINVAL;
 		else if (check_fwstate(pmlmepriv, WIFI_AP_STATE) && !(psta->state & _FW_LINKED))
-			return _FAIL;
+			return -EINVAL;
 	}
 
 	if (!psta)
 		/*  if we cannot get psta => drop the pkt */
-		return _FAIL;
+		return -EINVAL;
 
 	if (!(psta->state & _FW_LINKED))
-		return _FAIL;
+		return -EINVAL;
 
 	spin_lock_bh(&psta->lock);
 	ret = update_attrib_sec_info(padapter, pattrib, psta);
@@ -793,7 +793,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	}
 
 	/* pattrib->priority = 5; force to used VI queue, for testing */
-	return _SUCCESS;
+	return 0;
 }
 
 static s32 xmitframe_addmic(struct adapter *padapter, struct xmit_frame *pxmitframe)
@@ -1954,7 +1954,7 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	struct xmit_priv *pxmitpriv = &padapter->xmitpriv;
 	struct xmit_frame *pxmitframe = NULL;
 
-	s32 res;
+	int ret;
 
 	if (start == 0)
 		start = jiffies;
@@ -1967,9 +1967,8 @@ s32 rtw_xmit(struct adapter *padapter, struct sk_buff **ppkt)
 	if (!pxmitframe)
 		return -1;
 
-	res = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
-
-	if (res != _SUCCESS) {
+	ret = update_attrib(padapter, *ppkt, &pxmitframe->attrib);
+	if (ret) {
 		rtw_free_xmitframe(pxmitpriv, pxmitframe);
 		return -1;
 	}
-- 
2.34.1

