Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561D1F583B;
	Wed,  2 Apr 2025 23:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636620; cv=none; b=NhlZe1vBdE4+n0sH8NCroUMEr7QabeCxFVXN7/wvydTdv9vh9FKQIbCtkX7G+q9oQE9wcePUN38s00buCbJCJrm6aqnsAtSYIP9Uw49q7vCaUZewnY3i5fGpeeGoLo8cXO+ODcS/zQw04MEp8QIP45csw2balFUJaDCy3hwNXII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636620; c=relaxed/simple;
	bh=FC+bXCg9OO5iq9t3ZXMfUjkc9O7zgg/6bFgCTEb1FHU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I9qzClc5nezQkzYNq6MYvyo5R5Hcs+RGWLWEMHBDeHcmHni6py7s7oA/lR2UVn0Gv7z9ACSy/auEDdexr7/w1rfIr0+q4+HhscvzWq4PnUTn1Spq8O7pWsj4yvqpiV0y2AR1Vc878muRLrqwbMk3J0K5Fz/A5JUduNzEF6Zml9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCg1lMwv; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCg1lMwv"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac345bd8e13so49795466b.0;
        Wed, 02 Apr 2025 16:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743636617; x=1744241417; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgSAGPNVdbA1kLYMuFDlu0LEzgebSSjzEPSiFTvtLho=;
        b=TCg1lMwvqja+zHNL0JhYbIK3R9trNdgi90qdxgASBtatnVOZVKjwxRTe2sEA55jyIv
         aQRnCeEbLoLARLAC5Lt19tNb270Pu/udkwrwxDjnJC8mBg0S3qLf7zk3TzZK0vMun7Rd
         hvfDcxwoMXOKmRFf7S9wtOZP6iuoH1ChYv/XAN2YgyZ4u2tO1AH1YskNi4hynsLnnOJR
         lJhohYAFQGiqMOtfy7dc/wKLoA7i3z5M564eBPWNxgZUqQpSeD99P+zO932UCqq7DuYQ
         8b2TT/7UnUyt88X3T80Ay51XUtiRbdRsVTrgTmkx2C6nWNo8VPlg0+/8+QWHNoAftnG6
         DlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743636617; x=1744241417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgSAGPNVdbA1kLYMuFDlu0LEzgebSSjzEPSiFTvtLho=;
        b=XnZwWWFh5A+xVIMZ+UDI/wv7+J9t2drwzNF6ILnY0qi7fXIxHABSlJsU5RBwobAWlG
         vBSYDvsfGngBhFZMbuVCK1IK7rCPMNPtKpP9LezpVHTD14HUCsyp802UzKjsUdNMwPTQ
         umSoWFadUUQXkpgct/ne3G0i22g7co9AIWA7HjqPPEmpj/V6k+mMPixLxwBF9d6VX9mf
         bEmaOeCk8eqO8G3pR5sP0ZtBKhvZfDSu0/NXClxhyERVQz851fUrdicdGJXVh4k+dOo7
         GtlR7sPnm3FiEcp0RhubWD6wgc4d6eNYx4PLEb0TToEV4Z+wRREaAjpMu5m1zd7iVYbP
         KYJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT3820VC8hcatEusYr60NQLalT6i2fr+4oOdNPBdQ6YrHat48FsCTcwykYaFJeSK6KK++JIzzBt2+uAslH@lists.linux.dev
X-Gm-Message-State: AOJu0YzDz/VSZYmGH0AJwnaphE5JXIGGGbEWxMpsALhBFWQm7MlKm9BL
	1hVQzEEXPwinxq1F6TSoVTB4STnc+MX/hqhMMNl5e9cUnJ56afzX
X-Gm-Gg: ASbGnctafz3g9zxP+jMPSjXX3clGoKNyDjodLpz41xfQwbtLbb4UFOafvsP4UD916DV
	e4JSWxiBZbCuHHDsGcwGToc9ynoYdAncK/MmFuxjI9NIb4uJ6cwej281xJwU4+r/qvHtqzK5T6U
	G/j12EIZifQu4+/5KQs8dw2Z+sozR7bgRm+VgTjDJjA94Ml8v6vMF7i3uFQ04jYhuOtvSo652wG
	raQvDfZXeqUAMdV+5FV0HO8fliJB7hm73yvw3WX3i7sBhb6pAZq4jameS7b3cLaA6N9fUUoAih2
	9DDvSZk7iCissnye/ha8hSiPs8BWdkotIqy6l6AlYu6+pJ7WIg==
X-Google-Smtp-Source: AGHT+IEq+GxVf2hMdfSdfKBaOs+XYnhK5g0kYcToDxnihsf9c0xrQWGI6o9j4Go0+ESAfyepzOaA+g==
X-Received: by 2002:a17:906:7955:b0:ac2:55f2:f939 with SMTP id a640c23a62f3a-ac7a166e465mr353956966b.6.1743636616755;
        Wed, 02 Apr 2025 16:30:16 -0700 (PDT)
Received: from HP-650 ([105.112.231.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c2c13sm1458466b.182.2025.04.02.16.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 16:30:16 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: Prevent duplicate NULL tests on a value
Date: Thu,  3 Apr 2025 00:29:01 +0100
Message-Id: <f04b31c428beb6195ad5df5116d1421fc036af16.1743635480.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743635480.git.abrahamadekunle50@gmail.com>
References: <cover.1743635480.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 90966b7034ab..675226535cd1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1323,7 +1323,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	spin_unlock_bh(&pstapriv->asoc_list_lock);
 
 	/*  now the station is qualified to join our BSS... */
-	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
+	if ((pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
 		/* 1 bss_cap_update & sta_info_update */
 		bss_cap_update_on_sta_join(padapter, pstat);
 		sta_info_update(padapter, pstat);
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 026061b464f7..5d5278eefabe 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -941,7 +941,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			if (!(psta->state & _FW_LINKED))
 				return _FAIL;
 
-			if (psta) {
+			{
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
-- 
2.34.1

