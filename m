Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC82D9EE4
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 20:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332851; cv=none; b=IGfJot4l/oJbGC5zTQ98cvrOxd+2KomSg6Bwh0MuK2LUsxoHnCgVN4ES94j3//ZZRpNGL71sPEX46rXKlZd/mKSyFfeVOBhc/9y4OiUTlRLJ65aAOsTpnkgd21zAAV0UOV5wlHKtD4aXSrbW8vTYTP/3TtricCR85ssuyr2YKW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332851; c=relaxed/simple;
	bh=jsbT1Wa5B/D6LMd6JxrZPMbzOBysvpxJUsa7OrS4zHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iof2zAFmAYUFeOfbyb72YiGfjcStCQxXN+fQ+nWgkBPj8EZ9phLB0eLNsOjAaGziDQGMWs7qbajQAbY/qJA0NjC4E9NFiqrgM6TsLKTR8dQiHdTuayxkguNjte+C6tlA8WAZ59RfhxlE4Cv/6epgohkyaoobs7/13vllqbxqELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRDgMhB4; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRDgMhB4"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0d37f9dso500994a34.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 13:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789332849; x=1789937649; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TWMA06VD5NQiKnqTLM1Lx2sAiU1B3Ui5izrgC1IC1AY=;
        b=eRDgMhB4ucfiBxl4P1Ld9ya3dFJ0LGoAYec6NiLO6iiLHX42rbJ/Iot92dPyCvNNIb
         RWqFR2bOQjKlvwvIMiNMGKky5254GiF4vSmGimyzPCD/jX15+tFdA+vBuOHgD0iaDgyB
         xaEh8AGtU65MJjDWVTjO1trUJ15/fvgTxXXCmK8lOeEP1wWfMFixpWo+zFilY0xy1nkg
         r9XLPtbId2BONt6vJkFbCDwhueJdfhhS7FDIHJzzSb/1q4Dp5mrwPMk8EyJqVdDcmcw4
         UHqvY1DWjipc9oqdHP34YMyONdAB1NXCm0B8doyVoKmb+lDMMlMuQtJl7BrZ2g0DXbZy
         o6eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789332849; x=1789937649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWMA06VD5NQiKnqTLM1Lx2sAiU1B3Ui5izrgC1IC1AY=;
        b=WRNWomMVKOHSH5kqR6iApJ3vCGS07maii9Oy5VUCZCjoQK6N7XL9SCF1OajOL2vcun
         ooc0FF3bAhddV2xw7/oRTla6GLzzVYpjpyVIrPANbVSUz9/3rbqH94yiM8bhMqkOgRP2
         ZfPHA86NWWVbsmM0Lt5LuTIBH2oczBVB18bzfV8JmGCKhVm5vGip4AvaowU8SJ6txyjm
         gEVxDq+WtZSNKAtCRjXddvhFwus+J7s9QoPjT4FcOKy0BieZiQJLYXEqxL+CfiDz/2Rv
         5Voi52TO6LNC50X44e8FNQdSyG+YLJj5q65pR0EGGXW/5Vfbb8Hf3hEQ4cSwUwo+rPSL
         79/Q==
X-Gm-Message-State: AFuF++nZSo/CNvi8l1RXisMKoEzwnTnma7tBWahqY+3ICrcuIJ682V6g
	u5upLNwprwDT0mAgX8XyEvsDOPvtHX5mru9FnjLjRLsTeDdUx+2h29rBSpml3C4=
X-Gm-Gg: AYBFou3qKKPOq27pa86uu7wL26cXuBoBcY0mOetJjqsyYYzNsTGvey2bYaL++Qb1x2X
	W5Ul3V1cyZW+lyM70sfjbEQoluHlkuI2d84s1gpJSMEcCPuugGtcBS/wWTI9vcnhS2Du4M5FANf
	8rrzha5cQfEGMl9gpP8xB2lpVfe6Dl3+8JVhKk6FP2Z3BC3+bpjIL0rWq0T1+OJiePQULiUhB+s
	oD/RPfSQdW7gh/w1XSJbtyAWn9eAJSKVlC0sjv2PfKA3YXBtZ6mnHff5A5tKGrRR2pep839QONN
	ekYCuU38Z922cSapJ9DcsVjWYkOFUsi3eDQETlMVx5S+8sWd+V8K5Z4+OcCtLtjmg1J4NfhvelT
	LAOkGPUy25RR3ybKTOnhD2HCgXEPj9hp6NPzsRN6Vz6r0wbFxM8hqjXzl3Mkf+vbfgxQSZBRV6R
	YFgYY32vvoFO2JbtbnXhwbxVXHgjqOs0wAT4kBkvxafUsFAfFzvheQOCN8Vd2asyfshrhaZcn4m
	cUl+Za3IpUsnebjsr3wmV0VDlOF
X-Received: by 2002:a05:6830:698c:b0:7fa:5c49:5256 with SMTP id 46e09a7af769-805a0f48859mr3526073a34.29.1789332849389;
        Sun, 13 Sep 2026 13:54:09 -0700 (PDT)
Received: from DESKTOP-CCA1RSU ([2806:108e:2b:e56a:389c:aa85:99d8:edd5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8051005d845sm7117927a34.24.2026.09.13.13.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:54:08 -0700 (PDT)
From: Moises Dominguez <dominguezsalcedom@gmail.com>
X-Google-Original-From: Moises Dominguez <dominguezsalcedo@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Moises Dominguez <dominguezsalcedom@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove redundant goto in rtw_alloc_xmitframe_once()
Date: Sun, 13 Sep 2026 14:53:49 -0600
Message-ID: <20260913205349.1822-1-dominguezsalcedo@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Moises Dominguez <dominguezsalcedom@gmail.com>

Remove the redundant goto and return NULL directly when allocation fails.

Signed-off-by: Moises Dominguez <dominguezsalcedom@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 81d9e713fc12..cd659bd2f261 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1715,7 +1715,7 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
 
 	alloc_addr = kzalloc(sizeof(*pxframe) + 4, GFP_ATOMIC);
 	if (!alloc_addr)
-		goto exit;
+		return NULL;
 
 	pxframe = (struct xmit_frame *)N_BYTE_ALIGMENT((SIZE_PTR)(alloc_addr), 4);
 	pxframe->alloc_addr = alloc_addr;
@@ -1730,7 +1730,6 @@ struct xmit_frame *rtw_alloc_xmitframe_once(struct xmit_priv *pxmitpriv)
 
 	rtw_init_xmitframe(pxframe);
 
-exit:
 	return pxframe;
 }
 
-- 
2.55.0

