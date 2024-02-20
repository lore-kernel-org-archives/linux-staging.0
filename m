Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF7960867
	for <linux-staging@lists.linux.dev>; Tue, 20 Feb 2024 12:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708432100; cv=none; b=aoTNm/Zg5e6cGuJndAJEyS0BV7SheqDY9DYChBdFyM2oTIGXg+j9exYj3p01nE3/fW08OW3CgXQhpisuZYwoqfEzvMd86EFsyh6w6NaD+7WXv8Dccikk8egaDi0IZrE7FBn/VRQ6l7v5RQ/TjWh5kTDZRCWraSxDSasSVeiC90k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708432100; c=relaxed/simple;
	bh=wPnG6nFFhE1KXRQew0WPOM+BFz12P1OHBgjn5zkIuBc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CuCerM6njBMtVNVEiAI0w8eAimZcCOBhdb4PiWw+xznwN8lEdlin7gd7ifFGtniR/QCLwMnb+Yqf5kxFYBHwjIPHuxDN9f58nRkoz+fNWQRb9oRy88qXDsgvRlJDKJBdLY2ppJm11dAnWtdNKehiiK8ISoCOs4cgtQFUINz7uZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DilpojOj; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DilpojOj"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-33d118a181fso2660012f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Feb 2024 04:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708432097; x=1709036897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9qG4b6c5lyMFAiTHXW/5OlVUvW7PY3GsXWkR2Bvbu8=;
        b=DilpojOjBa04t/YF/R+7uPzY0sdjO+H59XU34WicJlq7WKPUOlqnGe444TmwxeefKS
         S8fkfLVCHSySl8Jfz7h+AEnV1aJHmiveVKnDtmfMMceGG3iePwL9T0D1aw5GFpCnVFF2
         i4eh4NGHqKHOSHR/MePDMe8h2GHR4+/Wk2jsqzvcqGPwbBFnhrzy/ZnCkumKAkvTuXb3
         pMY0/NR7uoketudcSs1Xn+c457+nHbfqzgDWtRzP3AmrYU6NgNbZxhFwZQ5XXTNXZEtB
         wh7/j/yPtPdqR2a1Kq3l819jY65tSWEn6mhoqcP90RTIPoRAmmhcOVZG9y5Ytg5ut892
         +KQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708432097; x=1709036897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V9qG4b6c5lyMFAiTHXW/5OlVUvW7PY3GsXWkR2Bvbu8=;
        b=sM361QMEj3DZbsEiEoReynOU7h1lqwEwSvY0nfzn5zRsvbfCAQM7l2vOZYUYA1tCGU
         Zky+1AZ6LlG5OHrI9H5h7l6CsMWEFp95YPxz8+l8Tp5ZjFE0bP8NlFP+QWqoa81SZw50
         VB9Inxyv1B76AVOzSWns5jjp3OUfx9CFpEqtKdlipWT/OwjzSrPC0nu7PRPis44XARr2
         il485+aKgGRaOAPOLzzZqBeR/ZQLC5/IGQZ6JEWxSUHf5QiYMBPf9H++XHaGEzCgt3Tj
         54T8lVK2OHNuUA1V7YPohY2GARKiNvbyNnMZyD38l57hR3JV1pH9HB3i6ha7Lvqbenol
         GeeQ==
X-Gm-Message-State: AOJu0Yxx/yVBAYBI/VXVAV0jWWWtKxIM5YE/QF5NykP15YmCzV04ta+W
	VFRby3Lc01p+Bt8ATaRsN+4IhNUqOYRw2ua4GiplcJWEKriupgJN
X-Google-Smtp-Source: AGHT+IG4fgfE9ye3xhSDlApiASY7j0fNVeto1j+SruihzZ4Wnz1CKMuEevC3Y9CnNE4hym+oxXP+hA==
X-Received: by 2002:a05:6000:1143:b0:33d:2071:9b85 with SMTP id d3-20020a056000114300b0033d20719b85mr7553222wrx.19.1708432096738;
        Tue, 20 Feb 2024 04:28:16 -0800 (PST)
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.152])
        by smtp.gmail.com with ESMTPSA id co18-20020a0560000a1200b0033d4c3b0beesm7346720wrb.19.2024.02.20.04.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 04:28:16 -0800 (PST)
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Tue, 20 Feb 2024 14:28:13 +0200
From: Meir Elisha <meir6264@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@gmail.com>
Subject: [PATCH v3] Staging: rtl8723bs: Remove unnecessary braces in rtw_update_ht_cap
Date: Tue, 20 Feb 2024 14:28:02 +0200
Message-Id: <20240220122802.12561-1-meir6264@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from single statement blocks to improve coding style.

Signed-off-by: Meir Elisha <meir6264@gmail.com>
---
Changes in v3: subject and description changed
Changes in v2: none

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b221913733fb..5568215b35bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1548,9 +1548,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 				int do_join_r;
 
 				do_join_r = rtw_do_join(adapter);
-				if (do_join_r != _SUCCESS) {
+				if (do_join_r != _SUCCESS)
 					continue;
-				}
+
 				break;
 			} else {
 				rtw_indicate_disconnect(adapter);
@@ -2432,9 +2432,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		return;
 
 	/* maybe needs check if ap supports rx ampdu. */
-	if (!(phtpriv->ampdu_enable) && pregistrypriv->ampdu_enable == 1) {
+	if (!(phtpriv->ampdu_enable) && pregistrypriv->ampdu_enable == 1)
 		phtpriv->ampdu_enable = true;
-	}
 
 	/* check Max Rx A-MPDU Size */
 	len = 0;
-- 
2.34.1

