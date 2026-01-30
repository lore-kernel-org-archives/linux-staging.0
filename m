Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B39437F8B0
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769797012; cv=none; b=WvPe4AIQDo/oHARtQCwimVeDjVDR/grWrOmwD45b2upBcoerK1fWXki5U+lwWu0P5imlDP1MlyBPP/a2K43UUkm1xE7d70epcHNp+T7JLZJY5RROen9fIkPaijLZfkSEeTkUDEqAAmZcYkjJq2lsGmsycP/h4jmL9rUGRHJmtvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769797012; c=relaxed/simple;
	bh=FZZvYnP51QX0dNB1MW147bXp1WMORAQQSIU33mEW2yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AdawvTGqzZ3Pr2CajS09ZUQOAXh+f3KE2z6tSqjJG4MOcRN585X7xoKO8cL3egPE3GB9igAjC8sz1deGQ4jc4+I8JutJ46bVc/dV2sAhbpnqSBf4CNz7ZXajy+/AxKECb7I5o0x6JY15GifAY1HzTt7O4hiZarS5Hkz9ipk1G88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g69/EUm7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g69/EUm7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so31873805e9.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769797009; x=1770401809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q66IcrlcJI8pRbK+Fca3eWQA2yovR85OACWrbeMFzM=;
        b=g69/EUm7XMJc2u9bgYwI6pzDiPfxNruucS8QD9KMBNOdUicxWhXcv4XtVyPr0nwjpN
         TPgXPMwRnlLAFSG5azYjOQ4GJW989fu//Qzm8X12wBDjDZ2xJcmJAxA/jz9ldFOLcFS6
         zkGc7ops8tfyBNigt6Ko1RnAmaF5KOnOqIDqHa2k4wf/7/KXJCxZE1WHl5fzpGSgu6q7
         13J/hWxuyWcWCIy/n84JJ1Rtu2QEMrH23qORAQMeOdbfNU7a6fuC2IHtIeUZAHfCkoyT
         hckKeFckQ+UhJr1ZUbiWWM1avq2pMlk8xlgEXsqwkKrtdLIvBApQGdUAyrlYPp5wcPLq
         qJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769797009; x=1770401809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7q66IcrlcJI8pRbK+Fca3eWQA2yovR85OACWrbeMFzM=;
        b=GSmCqE1FjIVco+JwOipi0wzUfUA6RF5Ew982f1mLr54K4fiTNaSY6ZL55/S1QXKDRz
         zpn+GB7jVekKzRZgdoZeKgwzY8UbcOEjFTF6rWCokZb/7L2g9B4L1Qe1N0615dKLtEQP
         2LFyMOGEXTPQziNgtTJyL8PQ1ObI3OrcTL43d+VjTjpqG8PigpGOecw8WiKs0V6N4FDJ
         DspWvfocmc4gJ7/CNH/fvXaGYMIJWo9SPMeUhDV3WIjPq1wnHmRPEOh79eFap+QVBeAD
         AMUUjeD3LSKd4/MWqPtqZt1mc3tCJcln0+lUzCiwe65fBFEt0flY9p0FOjBpsHmqIzl5
         XW1w==
X-Forwarded-Encrypted: i=1; AJvYcCXIfMg8Xplqse++s7FsSM8oLSS6xM46N1FYmsezWFdNKkB+byTnxg0GnpfY1jVJ2G2f4kUTpT/FbZWyd/+B@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc8d/pqwuYfKMbTQ1Ac9u4Z4Lj5Y/S279O1UAiWAvQ6M/SoBIp
	Yjmdy8ejL67ZeCfxkRG8NKnIVOYXNb5h5YpSK2cYMD9d8IwLeqWEqdppoydnRi8=
X-Gm-Gg: AZuq6aKX5OWayCv8o+JcmtrdE4ecW6eM+jwoQ4IX2jxjP+dJ12itQ+p/zcI3PkhJxHs
	Fvvdsr2cXgKWXACnDDur+8heOOEcNt+zgZm1101XxzxFfZIzJpQLW/pfskoqWyRcoQ72lvCOPBZ
	44L/0E2FACiO/u9PKfJiiXhQnZz7kKhbW+s+6FtC61HuwJFfEwfGlHIxhJ6n57vh+9e07Q1qLvO
	dOX8wJpbgBJKM+Q5i4jrEBgUpHVrmxuDZx6l3BYfFAMYMvrxhPsN8PbhHN9TL/Tlmn9Srql0rsm
	UUl6PEbLdXnIS9mbRuzcYiL9AqXystFPRZ11E5ii4P++CNxrgwX5/+eL5ZPTiGuXSXxixJaVNl2
	WCRAXDIqG7hg7a2CQmg4CE79aIXPClae3vfcV4FCz2iR5YsY6glaf87l37DPLdtxS/utWX4VSnT
	MmY9CS8n5RJiTDyT5QhVWIMHyNekt47PvFX8wxHI+unTSI0UrUczxa6ao+d0O+5Q==
X-Received: by 2002:a05:600c:4443:b0:477:7c7d:d9b2 with SMTP id 5b1f17b1804b1-482db4a1030mr46133745e9.32.1769797009036;
        Fri, 30 Jan 2026 10:16:49 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c40e04sm280571025e9.13.2026.01.30.10.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:16:47 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v5 5/5] staging: rtl8723bs: remove dead debugging code 
Date: Fri, 30 Jan 2026 19:16:20 +0100
Message-ID: <20260130181620.199152-6-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130181620.199152-1-lukagejak5@gmail.com>
References: <20260130181620.199152-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused local variable 'pattrib' and the unreachable 'if (0)'
debug block in OnAction_sa_query to clean up the driver code.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ac49bfbaa5bb..b61841bf16a5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1849,7 +1849,6 @@ unsigned int OnAction_ht(struct adapter *padapter, union recv_frame *precv_frame
 unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->u.hdr.rx_data;
-	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	unsigned short tid;
 
@@ -1865,14 +1864,6 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	default:
 		break;
 	}
-	if (0) {
-		int pp;
-
-		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
-		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			pr_cont(" %02x ", pframe[pp]);
-		pr_cont("\n");
-	}
 
 	return _SUCCESS;
 }
-- 
2.52.0

