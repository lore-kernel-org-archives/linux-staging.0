Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7335100C
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308306; cv=none; b=H4anNvvhxOvb5GVT7BNudag2yRQYAGH48pSWReNJF+saDH2k3WTVaXp7n2pGMiUrQqYASeuBTPYGWtE5CdCEa5RXBOyo6R3eJDtNigp3WND4j0kJKB9aRfUNDlwLpgh3Hkrz466x1e9nej+JQB9WYtH452H2vqtsdkmyX1Kbjik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308306; c=relaxed/simple;
	bh=KxRSwXJ9jCK0ShEK9HzdulULhVMtNJ4z9PL6t6ESeVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pOM5rhPu8QD8CKrZUogBry2lrR32vmgEdbdXEl8aDFIdxmctpwALcF4hqAIlTX9ibwafisOmpMH2psOpSa0f/HDbVezSuxlxAJRQdtbAEnpbY6PxkkT4ZZwa4ofVvO7PyXSAEIHlIA6VMheCcKQis0SBJHg7O0FTCF4c8I7uU1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=gYVDXWSB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="gYVDXWSB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6db0fdd2b8fso537326b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308304; x=1706913104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HejJUwRGy/yaN7bOykHpPvwZVhm5UuAHdB14cEQD7Do=;
        b=gYVDXWSBcR7p4JNDGJ3tEzoRoZcXChytwuc7hbbygA3xKvwbpHwVQYvGXtjJvtiQIo
         n1BbIlhBER2ibr/IeCk4uOMP+aE6iAEVlKjvyTWkNojXcrt1gcNd7QVDxqZ6BBPun4z3
         wAI8YnNaG/ezyVmXFxJUePwu8Yba2CtOYKBWFiiLxC/ACk1dMhUAwm3PF/mo8V0yLQ2R
         fRmHPjRA74EuwwTHM1Gzsml8N9J+LbFZM4lLEJNVvNKNwkswzxvzCkPKVsII+x56ddMP
         40h0TZXXHPf1Vg11Rl+iOdm7OW6TDihChITm23AUh/lnzUKzlnp9wkW/vDRlWcgdG/fZ
         6NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308304; x=1706913104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HejJUwRGy/yaN7bOykHpPvwZVhm5UuAHdB14cEQD7Do=;
        b=RIgm3z7HmZbWOgujAf0JVnAf2HKMMxTNlK33nzWmtpx5ugrI9eGJd8GhjQoAsj4HCy
         8QxweL41G78fgcXeVf4FUAELSAvXixFVk9YhpYZMJm7FqDQeFRiilPIEG7//1OShWzGO
         wLctQd2txsikz5dRGAPbKhkHDv5m2lgts8NRBdYpgp02JBQ0zOXUauRpSv9m5VIm1EgV
         R8tNp671Q8ujLoT0NpPxu+GxVfH3qGNRfJB2r+TytUMi84AadV6Cel0Mua7aeyl4cZhY
         LMFqpCE53R5agg23L8NIDgAfskESx7IE1QqU2mRL/tHsOFsyWf8YMfuUgN0dJYJ3xbJ7
         iJuA==
X-Gm-Message-State: AOJu0Yyr3Hj3yh2z6v5+AcdYsrV+CoLw1zB5lkBnruHLeUwPpxM+Y0Cb
	hTz9x8emw3CaBfUiovXxycQo95w+4YJi+uNYJja6/GU8lv8pnEvCS/2pXtswflQ=
X-Google-Smtp-Source: AGHT+IEyfpbPnx/FF1+3hbs/6ok7gcrd8xshqjG8z7W4mV1TjYc8x6hkSe6gNzsa8KmGB4CmFgKw3g==
X-Received: by 2002:a17:903:32d1:b0:1d7:8b3b:c46 with SMTP id i17-20020a17090332d100b001d78b3b0c46mr863984plr.28.1706308303935;
        Fri, 26 Jan 2024 14:31:43 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:43 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 08/18] Staging: rtl8192e: Rename variable PeerHTInfoBuf
Date: Fri, 26 Jan 2024 14:30:56 -0800
Message-Id: <20240126223106.986093-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable PeerHTInfoBuf to peer_ht_info_buf to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtl819x_HT.h     |  2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 14 +++++++-------
 drivers/staging/rtl8192e/rtllib_softmac.c |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 29e1206078fe..18dab893270f 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -100,7 +100,7 @@ struct rt_hi_throughput {
 	enum ht_spec_ver peer_ht_spec_ver;
 	struct ht_capab_ele SelfHTCap;
 	u8 peer_ht_cap_buf[32];
-	u8 PeerHTInfoBuf[32];
+	u8 peer_ht_info_buf[32];
 	u8 ampdu_enable;
 	u8 current_ampdu_enable;
 	u8 ampdu_factor;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index cea3284dd787..98f0ac80f1fd 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -442,11 +442,11 @@ void ht_on_assoc_rsp(struct rtllib_device *ieee)
 	else
 		pPeerHTCap = (struct ht_capab_ele *)(ht_info->peer_ht_cap_buf);
 
-	if (!memcmp(ht_info->PeerHTInfoBuf, EWC11NHTInfo, sizeof(EWC11NHTInfo)))
+	if (!memcmp(ht_info->peer_ht_info_buf, EWC11NHTInfo, sizeof(EWC11NHTInfo)))
 		pPeerHTInfo = (struct ht_info_ele *)
-			     (&ht_info->PeerHTInfoBuf[4]);
+			     (&ht_info->peer_ht_info_buf[4]);
 	else
-		pPeerHTInfo = (struct ht_info_ele *)(ht_info->PeerHTInfoBuf);
+		pPeerHTInfo = (struct ht_info_ele *)(ht_info->peer_ht_info_buf);
 
 #ifdef VERBOSE_DEBUG
 	print_hex_dump_bytes("%s: ", __func__, DUMP_PREFIX_NONE,
@@ -520,8 +520,8 @@ void ht_initialize_ht_info(struct rtllib_device *ieee)
 	       sizeof(ht_info->SelfHTCap));
 	memset((void *)(&ht_info->peer_ht_cap_buf), 0,
 	       sizeof(ht_info->peer_ht_cap_buf));
-	memset((void *)(&ht_info->PeerHTInfoBuf), 0,
-	       sizeof(ht_info->PeerHTInfoBuf));
+	memset((void *)(&ht_info->peer_ht_info_buf), 0,
+	       sizeof(ht_info->peer_ht_info_buf));
 
 	ht_info->sw_bw_in_progress = false;
 
@@ -579,8 +579,8 @@ void ht_reset_self_and_save_peer_setting(struct rtllib_device *ieee,
 
 		if (pNetwork->bssht.bd_ht_info_len > 0 &&
 		    pNetwork->bssht.bd_ht_info_len <=
-		    sizeof(ht_info->PeerHTInfoBuf))
-			memcpy(ht_info->PeerHTInfoBuf,
+		    sizeof(ht_info->peer_ht_info_buf))
+			memcpy(ht_info->peer_ht_info_buf,
 			       pNetwork->bssht.bd_ht_info_buf,
 			       pNetwork->bssht.bd_ht_info_len);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index aa98d22db90a..9ee6364f7b00 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1609,7 +1609,7 @@ rtllib_rx_assoc_resp(struct rtllib_device *ieee, struct sk_buff *skb,
 				memcpy(ieee->ht_info->peer_ht_cap_buf,
 				       network->bssht.bd_ht_cap_buf,
 				       network->bssht.bd_ht_cap_len);
-				memcpy(ieee->ht_info->PeerHTInfoBuf,
+				memcpy(ieee->ht_info->peer_ht_info_buf,
 				       network->bssht.bd_ht_info_buf,
 				       network->bssht.bd_ht_info_len);
 				ieee->handle_assoc_response(ieee->dev,
-- 
2.39.2

