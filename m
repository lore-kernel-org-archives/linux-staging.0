Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C8726B2DA
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 15:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278519; cv=none; b=Usm+IqWfrIX3DStil94tkxCkP8mtvnMJZlPx8Rgs2Xhs23Es5qBgU9M1qnZBAXYonz3R3v9R1SuYqoyUI/H3B/xl+wQCgX0bvLfiKVoZfXxZ6F+aPfqyNZSN8L0dH2k9gE4RMXfQRkQR2pFc9XnfyP84rN5zWClh6iDe2Wf6Lzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278519; c=relaxed/simple;
	bh=xgahMvj4mD3uOrSyJFXILfr6pjqArecyVF7g9biHjZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g9vrk65BqVt4/ha6OazAlkXNVKAP/LmsR2XzY+I8XxTVf3J08ti//zx2raniLLScAZQ6hSdtafn9VExq+0jzlfZH1mLxi6u9q6RLVggV2+PMDvZ+yZJu/nOPxpHCV4JVo1n4V8R+kHAGQ+IrzYIlLncUM+GG6sAogZBpTvOvi5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kh5BUYWd; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kh5BUYWd"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79a2ee65171so27681537b3.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278518; x=1774883318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3EbNYClxM+RieidtwsLKXbu7kNtJRQzbe848zkG0wk=;
        b=Kh5BUYWdt0dMgt2tfamQf5TwBdmyRmMfRCAASQO8NuLxZC76tAh1a6JW1ZGKz3FMtl
         KGJvqaANPF1J+dKeHBZRS+OW7bgbdHGeZUZWZz9+bLDiaQVV+HYpmSFh7f8UjYvnfDyL
         5/M1cNc2VTgjrLOJDmD96kYaJcJSFV8ZKYdzMpue5Upk6wf/OFZzVC4ilwMmdkZKU57D
         cmvvGaqEtlF7hou2Q5EJBz+byYADqaHf2AIYy0iWCF2BIP1Zjib2qm3nL5qMnDCIY6Pb
         wH4DfTPlc6qoecEoUThDyz43h0EhF3wZVIG/SQLDG56iGDzCiv+dzVMAP8Ep5MBV7RDt
         sqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278518; x=1774883318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f3EbNYClxM+RieidtwsLKXbu7kNtJRQzbe848zkG0wk=;
        b=FP0Xesbyf0MBB5LeCcHB1XSeo6GyuAE+SMZWABK3YU4N7SDxBw9SdFDk9ZRrZuhnqN
         ri/lbfTVmKp2jbO1wf+ORUcumxgdEPDrnQ6m+3tBJvhj7ht3vqzuWvbdnav35EAxB3iq
         bpt/kqXRAWQ5K1erTJp76KT7hTIZ3zb/O4xpl5s93HTHeCaheSKoOpfM3LGOfX1MTBPY
         dL0kpvRmRFelxH8CypTGNODztlsSm1bdOMnTmJDFmbkDIdjrNXYjQKtwt1dyXehiybD0
         IFXCEs82yeWhJDqsn3GElYPvYqR3kHxH6fw78bg9xXmhUijFjhksj6HOA4B4PhuvdmbC
         2Gfg==
X-Gm-Message-State: AOJu0YzCjenqs12en+MUQ3UqZbHkeW0lsWEbR5PKOM3go7RqRwGCh8zS
	iFnHnygeYhMV5SPr99bfSaG3R/gnSCKWABB1XwLcs8KjELZwBnjTCuou
X-Gm-Gg: ATEYQzwW368PlpVy8fqa/A19D/bgp5gdcv9X4A21lVlXWphpmeHeKwdDTY7UlsdjCnt
	qoUDK8OEb3i6W6oUWU7D+z86uMKAqeAFeoJ/ZJf9+E2pkDgfU7fAvr+B7V1bXlIANo7+g6OjVcR
	TBnd7dO4io1qOkheWfWbGCjKv/6XiYUiBiRxCj5Ew0/DzSkaog3i+MDWafOZDKDCML8YZCHfE/j
	CyEN2cZ3pzJ2RG4m7zyYV6HmFgoONwAV7BXhO6pxmHWSD8/4/XPJYek1ntPiBnLi6vwuIzcGuQk
	AjWrtI8f5NW9Tx6YXFiP7MSsiMISSqU3HKsC3uT28avgWcPtG6WlQeAonUUlmB9kSaLpJVP1SA/
	ncMBGlP9YEQvbuWY+jHGmmR4lKJRmalh/QJuQpgKwTCC3Y9KQgO53ZTsxsBiYasMZxuVdK4dJ88
	zSesq0FhSx281d+1CX/eHcew==
X-Received: by 2002:a05:690c:6605:b0:79a:b75e:14fa with SMTP id 00721157ae682-79ab75e195emr30267657b3.45.1774278517528;
        Mon, 23 Mar 2026 08:08:37 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90425d76sm58662227b3.22.2026.03.23.08.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:08:37 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 2/6] staging: rtl8723bs: remove dead code in validate_recv_mgnt_frame()
Date: Mon, 23 Mar 2026 18:06:04 +0300
Message-ID: <20260323150650.7168-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323150650.7168-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
 <20260323150650.7168-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused code from the validate_recv_mgnt_frame() function. This
code was previously commented out and is no longer needed.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 78746cc0d078..c5182438fd05 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1249,7 +1249,6 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 
 static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_frame *precv_frame)
 {
-	/* struct mlme_priv *pmlmepriv = &adapter->mlmepriv; */
 	struct sta_info *psta;
 
 	precv_frame = recvframe_chk_defrag(padapter, precv_frame);
-- 
2.53.0

