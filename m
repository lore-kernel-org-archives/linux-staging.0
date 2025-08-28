Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DE0262FED
	for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 09:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756374407; cv=none; b=leelI/5p8urKB5JFp6/5veA8MCNxYCpSOA9J4lBRWTIGoQpl4zAcn7nOuiarfmds2NAZStNrn4uQRnd6csakyZ2uAM9jeDlWu9CGvg0b3zoPrpWO6hYzB9RppnIbG6wxlA4oROYGgfUPNL5fDNg1uihuZpKOR+YtYJqeWuN63n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756374407; c=relaxed/simple;
	bh=Yuh2ilkl49qigY14vDa5g90O/ZTEywXMWlWBmVgjN6E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EvcxxhweL/oMtA8+2UFa1Z1mgE+6j9JL3cmjS4BgS6yGfs5PEiY+UxqIJhFeJgIvPqMiEXD9gyG64gnulD3elfB2SvvMgvqve0p8ilZLtR/d2nfepEsjoiHu2WofmJNnOtpO5Thk+aSxYZQpQ9MRj/Mof05WsImq8pcWIpv3wuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X++k+X1Y; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X++k+X1Y"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-77201f3d389so837871b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756374405; x=1756979205; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WV9EP3WiHIkOcIDq8xrAUCSMCtBiY+6XMNrlVI5mv1E=;
        b=X++k+X1YFf3LuJL/h8REjw9/+cPDvxQWldDPY9PeDMmNqDqeZRrOD/HyFulJnY/fq+
         ew5kXH/CwE6RLifVrWPY0kjsSuUirNBicSdzy2NXvwqGOgpUQWIX0C5lXgHPP6Eg/hwo
         2iY5tokDOKhT3YhkOcvBCuBOFCiC/jsS15zo+6YmhWwyc0dx/H8ocpT8UN6M2qLL1YKM
         wCBeJpD90l9+/s98uk2wDN5hLn3yPrpMCE54xjijA8y2KDI3WdgUxj7g5yXdS+E9mbCr
         UQPP75/YBSBtLA9u8yYE5VwdyAzNp2n5Mp9k8wJVLbB2MzfHxYxJH39ofAyhB0m6fPHZ
         jYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756374405; x=1756979205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WV9EP3WiHIkOcIDq8xrAUCSMCtBiY+6XMNrlVI5mv1E=;
        b=aUNTkWhaSlqYzurfkz43dYFOpVlliQ7lTHOPDAG82lpUE3E2obA0skT7k+GQlRtBEC
         WtgoRzwHc7LsFqomprnLlaLT3vG/BIFtG46n22amZ9CnJrGRHIMu587qXrVQXCirZlkX
         o7NKEGq5QcH7S1U4dPgmI13bNmkn8yWMlDUoVtfdRIT7/3jSzCPMB7I8Rj8maCM4xIIl
         6YkCabu0WerQgjCswx9xdnmZlFMIFJNVGAPi3515xKXCUyeDTRQCLKcrIaI3vb4hegaJ
         Oic3ZlqusxU5ixr5eJIL7K2hf2pRX0o8lXUCWNUPJ8XozzrgXYDbRAlhssdH5p+GK2jX
         w5+A==
X-Gm-Message-State: AOJu0YxK66S4CHCw32+PXJd0SJB+/KehgiLVV6d7TkpGn0Bd0OL1oCVc
	t0xlhp5jerwS/EGa6f0ViKleCaWHNe+twhykz7xanS/nO5bcvQ/RyWyv
X-Gm-Gg: ASbGncvN+GDJ1RTxcW4HniErjJoyVdXpln3xnyV7WTZYZEDgfQ/6auNf8ZHuDLpc7nv
	jCI0c605gOS0WHWNjcRw4bZAZoLUbGOa3MyfXh3TGqrwcluHYRhvNTl/SGDOdz2NG0N3OHdFTpr
	PvM7hVc4A36t0SOjV2J3L0vUiDgs0ctZtS7ajSZtcP8eKRQj7UJERFA4gD3d19HzFmeE5J57+Ht
	Rn9R3aX2VeRTDwfQRexKviChfU1AkuAbDBL0YmMxwQSQ2LPNQKeNHstUIwqIVK0s20UV2agVjXp
	taEAzyvN63zKNAzbiQ0Bv4u2F+PTqSI845D7GEGNyYGqNbc+sCTdBqRFBa9OCy7PKmC2Go0R2vU
	bZAbChbWVxEUUQd2h+2hVTUYhDJKAr+c+CaRZY/1fcNyn4ZtTXHD23o2hhgICZEzgN8/agSEdWE
	BOVg==
X-Google-Smtp-Source: AGHT+IFzCwjXA12UFQ+soxjLMPsT7ynuD1wJEEhRU0FFfN/HRedhPq2h53Pq5F2zABdrX0M2lgpglw==
X-Received: by 2002:a05:6a20:1592:b0:23d:dd9b:b563 with SMTP id adf61e73a8af0-24340d15dcemr34925546637.39.1756374405378;
        Thu, 28 Aug 2025 02:46:45 -0700 (PDT)
Received: from yingche.. (111-255-102-121.dynamic-ip.hinet.net. [111.255.102.121])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8b4b98sm13591617a12.19.2025.08.28.02.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 02:46:44 -0700 (PDT)
From: yingche <zxcv2569763104@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	yingche <zxcv2569763104@gmail.com>
Subject: [RFC PATCH] staging: rtl8723bs: fix fortify warnings by using struct_group
Date: Thu, 28 Aug 2025 17:45:37 +0800
Message-ID: <20250828094537.884046-1-zxcv2569763104@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix fortify_memcpy_chk warnings in rtw_BIP_verify() and
rtw_mgmt_xmitframe_coalesce() functions by using struct_group
to access consecutive address fields.

Changed memcpy calls to use &hdr->addrs instead of hdr->addr1
when copying 18 bytes (addr1 + addr2 + addr3).

This resolves 'detected read beyond size of field' warnings
by using the proper struct_group mechanism as suggested by
the compiler.

Signed-off-by: yingche <zxcv2569763104@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 8367fd15c6b1..314ec5894d47 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1363,7 +1363,7 @@ u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
 		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, 18);
 
 		if (omac1_aes_128(padapter->securitypriv.dot11wBIPKey[padapter->securitypriv.dot11wBIPKeyid].skey
 			, BIP_AAD, ori_len, mic))
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 8c6841f078b4..424da9030f60 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1209,7 +1209,7 @@ s32 rtw_mgmt_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, s
 		ClearPwrMgt(BIP_AAD);
 		ClearMData(BIP_AAD);
 		/* conscruct AAD, copy address 1 to address 3 */
-		memcpy(BIP_AAD+2, pwlanhdr->addr1, 18);
+		memcpy(BIP_AAD + 2, &pwlanhdr->addrs, 18);
 		/* copy management fram body */
 		memcpy(BIP_AAD+BIP_AAD_SIZE, MGMT_body, frame_body_len);
 		/* calculate mic */
-- 
2.43.0

