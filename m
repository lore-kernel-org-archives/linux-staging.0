Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CC73D0C6
	for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 23:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710114963; cv=none; b=FTTGL4MkOo9pLQuil8bP9XAoTgiW615EYfQn9p/t68GtuPDq8VW0hGO4YNIas5/h4gaCn5CN0+CbJEIVmY+sJumDIker/T5jwgPMFaCcbGjxVyiCikNvJw9qqD3vtGGuUvcp6S8sUanYIhNCxJTQrW3rQmYLVKkV6kcF7+Jb5BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710114963; c=relaxed/simple;
	bh=2z5au05SIFx2OjI10T3LxZdsNMivY8wiNBtTg1TTQfg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p9ZGpsZkHiY/c+EJ/KglJkTrcp9XTtzACwkSAj564+UIM8dv+6acYvaPB2HSNdQylDRxtsJPVBXx0VRUUpfB69xD7zmZQtJQl4jOG/OwoZk5N3RLluJXloMasauAckzTL3jONW8fTqstXX3O/UKVvJANgexsQ7NtCTCOVGNEqLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=h1uD563A; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="h1uD563A"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-29bad5f4ae8so1740361a91.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Mar 2024 16:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1710114961; x=1710719761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aLp3TbZt7Nin0dNx9AujLhlrUoyJ4oXXhWmCb5RlNM=;
        b=h1uD563AdaXz/PgTQ0zI9/khwyfeTH7D1PYEZqA25/ZLMI2uSCM1ktVkE1XrCO4q5g
         Ata5nHYEbn5KjbpjsCOysopODURdz3CvXSsXPR12ivzezawAyvbG2XT0xVYfB/oJPmnb
         UkbhUjuyh1TqBOxuMwjCh9p1FIlJA91MDneFykNhAnHSC6wuyQMQs9CXQ5bREytTQJXw
         mu+LLlyLjv0jkQ5o+vRs0KEegtxn6Oyh3TId3+LugXZpOvbAKwki0+azManeEWdgMuE9
         fWyNsj7Zk0E+vvb1ctVCAX2PPN7BZ7gigaMmL9RP7fvqGZiNaPtoUCACHhpTtvatzV0I
         tUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710114961; x=1710719761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+aLp3TbZt7Nin0dNx9AujLhlrUoyJ4oXXhWmCb5RlNM=;
        b=c5d3RBlRaYDUb1gdJ7VfiCrOaWBIci5+LcofeN9ut20DPrPe2OLoIgJbaLs5Q42zvc
         DCYVX/RVKza1iChLLRcjies3TVJiPxFbn4P4/Wer7+SXCXcMifowQnRJ2Xl0UOjJaVWv
         8l4LYO+Jrt9R2doLv19JcAwtT7gNtlWmlPVB3M0rG7aMg8qbfwyvjopCJnYNopWBNSCB
         3B8EfcWuSxarfx6+HBSQO1RofHTtpG38OQ2ihKzYTgxsPdrvHtbt2KlOuINr1M6I/iTk
         ZqNmEQQRVWPonay699hjnSQUv/p+ZPPHouyoh09gDUhOcTGlC54P5VXPwL5PP43glk6l
         KrAg==
X-Gm-Message-State: AOJu0YzrRSiyKulbAGI3dmXqQBxgMgyzRU+66PwZMnqEqc42haJSBN0f
	LjQf9WCemL7832zb43f6IxCI0sBlTJUhQZ5jFz5DYtv1veao+42C+Tx7ueh5/wk=
X-Google-Smtp-Source: AGHT+IEQUXU4Mse6356LFmqZAOo6r/3WjPG3NJ6sjRGTpTcR4Wb8U0xFVc7PTDhsih6auD7Wz+96ag==
X-Received: by 2002:a17:90a:43a2:b0:29b:90d7:36dc with SMTP id r31-20020a17090a43a200b0029b90d736dcmr3537987pjg.19.1710114960871;
        Sun, 10 Mar 2024 16:56:00 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o7-20020a17090ac08700b0029bb29ef41bsm2903439pjs.50.2024.03.10.16.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 16:56:00 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/11] Staging: rtl8192e: Rename variable posHTCap
Date: Sun, 10 Mar 2024 16:55:47 -0700
Message-Id: <20240310235552.4217-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240310235552.4217-1-tdavies@darkphysics.net>
References: <20240310235552.4217-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable posHTCap to pos_ht_cap to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index dd0e2931b9ca..1c3ef1b7ebd8 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -235,7 +235,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 
 	if (!pos_ht_cap || !ht) {
 		netdev_warn(ieee->dev,
-			    "%s(): posHTCap and ht_info are null\n", __func__);
+			    "%s(): pos_ht_cap and ht_info are null\n", __func__);
 		return;
 	}
 	memset(pos_ht_cap, 0, *len);
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 640fb8abcfa3..525242b0313f 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1736,7 +1736,7 @@ void ht_set_connect_bw_mode(struct rtllib_device *ieee,
 			enum ht_extchnl_offset Offset);
 void ht_update_default_setting(struct rtllib_device *ieee);
 void ht_construct_capability_element(struct rtllib_device *ieee,
-				  u8 *posHTCap, u8 *len,
+				  u8 *pos_ht_cap, u8 *len,
 				  u8 isEncrypt, bool bAssoc);
 void ht_construct_rt2rt_agg_element(struct rtllib_device *ieee,
 				u8 *posRT2RTAgg, u8 *len);
-- 
2.30.2

