Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE96200112
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504413; cv=none; b=o2ArTEGZgEzuy6XPXD3iU6VMexNF1phfkvQ1cJHUjF6OxHQajFLt4FCAQnpKfQp1YHHFJpmy1tcDfPhJmgYhEOjMHtkphZ0ndJeKbWlMx5d2uq/MdXMEiNM9sBU/JExY5NgzhuTSIs/Z1AlXPGaIF+27VMpa0i3oQIzt0T0tMHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504413; c=relaxed/simple;
	bh=tYsaqE+HPjL5E1qdQhJfbmYvOalIUtt08sYSjG5aD+U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OcMBx9RLkyB3CKzFvbAOqxzkxQ2q1kGMflhCHateS4KvjB2U8aoPSV6ieA3I6gLVRvfVmbTvGkzTqzOzk9RPocPfUsmBAshX0vS0wIVWMItOthzM2fozRX3lNLlmPn2iG0F9Hr15Ajpx121MjeCpxXSmXCkxLo59NxRKi8/75gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbEVyqZK; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbEVyqZK"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7e62a1cbf83so274933885a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504410; x=1754109210; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k2cDsMk2oCpoOkSVurQZenmcKjISWvt97q0c4W0lmM=;
        b=jbEVyqZKJPMf2WN4MJWlSCeZCpVtDaQEB57AlRlD087DiYZTcrlZealUfrR765t+Cq
         JGswNzHnpz65vwVUHbChAYG8Gz3GYbW9yyQEmYZ6LlqGShON4DRfBZjJueVbjgwv2EFR
         zz/4P29rnyVLWDp7Q0kyICF5TZ4PCv3PRidbOAgqENJgP7kvP4vDbkrRNNNGvGWTqTCh
         Nv6vVdCxGHj1eIAveAxO11mhZgN1L2DjY4GrZdYF8ln75cUqC4B2ll/VeC55IoX02/H+
         EY1KLBrgf725tp+DerwuGdJMwzH8fH6Zh+hyveVsududbpXSqdlSZRAllx2OBEFALCG2
         Vgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504410; x=1754109210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/k2cDsMk2oCpoOkSVurQZenmcKjISWvt97q0c4W0lmM=;
        b=hiDCUnY8ZBUalH6++sQpAsPniwpZG3gt7d6tN087aF4VPd08PdsIcPJJAoJuUIlEEV
         UUUySXjov1tTEsFdV1a0qaos5/IGm0wr2wgV6KJjKkJPZrkQ6HjbZ6AkXl9rSwx8O8u/
         LXujy1GjZnAJGLJn7oN5cBxlX++W49GNe2q7IPiPOGXHXvZwVzxbTB0UalYECNpsl5pg
         wQX8AAHxy5eo6/5AwSjQ6joxZU1arrnPRGrmid3NMLCbW+eGPv7cM6QI2DAa8xdvpMU1
         VfP0U1QMbE5z//z2a6AfJrPJ2fjTyR1d8B0cV7FevWpgvI8uAFwyJyzX/WL0YVIJNMQI
         WWGA==
X-Gm-Message-State: AOJu0YzodXst5Pw1EMWnAnQaRZoP1zTTBfFFS6y8/wSTuhgbFmxHT97U
	HfnApfAp79Lnos3+LCnqs31fUXuDMJwH8gnSNNzhI44CfsrG5s2P7JlS+/zz5A==
X-Gm-Gg: ASbGnctH5Q8WbhD+z4h22aDWMaFpatqJ5ijwoXzFTXdf1sEUF+9VaV2e+uqicrSHwzQ
	WMs8Mg6xrVkHAZxh1YYIt1cLDPhIH7NwCC25stbPKYu1W+mla6uaCCY9iX18cw5UNNyLb/Wya7+
	PL/88ziLFTpoXFQPE6Odq37lzmzpgPcSVbnK6Il73LtOlK2ksXOXFV+xYuAnrfRy2WqIscLO6+a
	LzPsqjWoSVQQcI3Ai3jD2Afv9RKPYJC786p1GfnBZUSTihGEugYRvRflcU229JLyMEPrdkgHc7u
	UfbkdzHKtYbZXOnHmXfttZcLJkGjM4oTI7ZO1soZqK86aZ3rF7wL0ZDy0Tbjj1dx4S9J/iQifCH
	ENqCLA5DHsy+Q/cIVj/xLjdoikVOfIIWdvVs5KZSqZproSpkaNXI=
X-Google-Smtp-Source: AGHT+IFYfEYgKakbQHiU8jBMRd6ycnt6dd42lkFWDBLnfbudTYbPCAPqxcuWnXkvHgBv69Mub6dI+g==
X-Received: by 2002:a05:620a:462b:b0:7e2:769a:c857 with SMTP id af79cd13be357-7e63be3871cmr599030385a.1.1753504410423;
        Fri, 25 Jul 2025 21:33:30 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:30 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 03/20] staging: rtl8723bs: add blank line after function declaration
Date: Sat, 26 Jul 2025 04:32:01 +0000
Message-Id: <20250726043218.386738-4-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added a blank line after the definition of rtw_roaming()
to improve code readability and conform with Linux kernel
coding style.

No functional changes made.

Identified using checkpatch.pl.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 24e505111f1f..b1a427a655ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2449,6 +2449,7 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.39.5

