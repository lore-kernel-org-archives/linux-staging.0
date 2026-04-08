Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809582E8B8A
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775646851; cv=none; b=smfEIE7jjSawa0EeAfkf1KrtaIKmkOprvulHhoqC7nk/xZU+cJTBJpHLhUA+dM8aBnLgnSXfAOcCmQ1ZCUOQCpZIqKb7vLphDO5FEWbWxZs8ID6lKtizpnfY49Cju7keWUjbiNSdF5EvRrrmUZ7Z3s5kOCYrUcp4jvR3C31Y5Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775646851; c=relaxed/simple;
	bh=gqL8rrjQX2MZJ8p18pobOq9oxiN6UV6V5gJJZGg5tWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IIepHdHjScWzbi6IfODidVllsWNPURGizP2C631V7FXUs5VHJqFiPnb4bFqVPQXGIZ/sKl4w63Z/mL3wy32bZdSlFd7QptVjVMSgFXUIpfebmJgqX9AAqddVsFQy9Mn9+wSNeN7ztcFm/z+WUoFrNj5VijGE42ZBMnbm+/kT1ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIlr66lI; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIlr66lI"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12c1fcce8f8so1896639c88.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 04:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775646850; x=1776251650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIsVexSVozxHzKuRWPuXyHX6iHCp/uKgJC6PDZBrexU=;
        b=SIlr66lI5cQUXETi7LM5QjzvhVwMoxh16pnxqhqj/kWg9Mpo3IhuEima8PDCqRIiRu
         /kjsqSYfDSxdSQ+vpaVPLYr0GqOYClWM8/3oWIalNkkHS6IztpXmwjOUivr3Pfb7TTzX
         XaTsaC1K2l0Q9RgOpRBm7az20vNE7De4EODWOq5pME3qNI9bc8Z+wO8iJZNmyya1iiht
         iinOVzg0NNUI6DDXGymws1gXpn+N74t2MTbVjqY1GI96rYKXoSEZLNM+lkiyA0D8iKOh
         IyC3YdHssUQzVrmNmWMa6tJ7uvw27Essr8q3AUGqJJ9VhMnnrTKBfIZyktzRsgSsutFs
         kWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775646850; x=1776251650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WIsVexSVozxHzKuRWPuXyHX6iHCp/uKgJC6PDZBrexU=;
        b=KM/h7qg/GiOW/q2Pq3NnkjH9YmIs9Y57KImWEW1dkTKmHzzgYMhnHucCksmc5HlvPN
         w4s/Rqe5VoK6g5XFMhO4wpp4RREbmH4lRQrOTAeu2uTW/Yz3Zkb8QRzhHfQO87ieE/jf
         Av4qY4ikI1H0ELZPOForfjtwNug4HzyjZ0wD5L1PVRx7Vfex9ZZtRyvR2GK5G51Xa3FS
         a8d/6Azuh7FecLXg5u/RVD7Amsq0eT9BG9ODzYW1E+Us5fehyoRpy7nqmS+7g902Eop8
         6XW/U6TpqleOjc/OQe4kdgDs7XxSq7NtLE/Eub6Td8bqYGVblelrduYIzJTSKcp4uc4B
         9fXw==
X-Forwarded-Encrypted: i=1; AJvYcCX5NbJN/55KIb99Gs+lmb4NQ+TB5Lo/RcWypJhb5AHLRpJepT4vnOxQz6lR2yqTtoyMwJXuk6ZFL2ctRTeY@lists.linux.dev
X-Gm-Message-State: AOJu0YyU6UKBdCGdMzCO6NtdR6f8vf/vDsDfHNK85Hnke+vr+3UmXiWD
	e2e2LuaHDlCejhabBSOsnpTWqX//u8cJhz55XRcqCko1R7osX8zPlurZ
X-Gm-Gg: AeBDievw/O/VWby1fnindonXzwWj0NY3R4DKCU5Mi2nRKMz3SezC8K3fgyE/SgpKd+/
	MzE94TQMUz3ZvC/LJK55ODCVeGWrMEnZIzmbFfkPwtrKla/SYUyDDyoDUID6t8lS1g9qwJATq/8
	1afe3TPpHZPZkgiIy09kTGadjYLGUQ4sX4CXufO+sO/3dh4OUcmVou5L1lq2tvSJaU+MVFDyFQi
	BnkYXjvJUkZ/+gtc3k1Jbv3dJktR9qwKm6d7qL1FYk6LeU9hX0x/1MpBjhg0JqVQHNDJ9qNm5w1
	OJrglZuMxtRypOLqf3aawlr2UJJfixgvl6zQzsdaclTDWsw2415MS8HxBe/rDeXFZcAeerKXbjr
	96zVhTpzaI3JFPU+vNKylsI+nguF6eQyVETMLpHqKsqN1XdnPToGot0el1V0ezrREUg8oUDWoJJ
	2kliacD3zaanu1RPc0MCPkY5C1dp6co/X4CNRdhq/4Kn7a2tSJinxuwSE=
X-Received: by 2002:a05:7300:d108:b0:2d1:91ce:eb55 with SMTP id 5a478bee46e88-2d191ceee50mr2568936eec.12.1775646849637;
        Wed, 08 Apr 2026 04:14:09 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c0c2sm21228019eec.17.2026.04.08.04.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 04:14:08 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	ethantidmore@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v5 3/6] staging: rtl8723bs: convert rtw_alloc_hwxmits to return errno
Date: Wed,  8 Apr 2026 11:13:11 +0000
Message-Id: <20260408111314.19329-4-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260408111314.19329-1-dennylin0707@gmail.com>
References: <20260408111314.19329-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert rtw_alloc_hwxmits() to return 0 on success and
-ENOMEM on failure. Update the caller to check for
non-zero return values.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index b86c9c2f3b93..befe74a1bc4c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -45,7 +45,7 @@ static s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	pxmitpriv->hwxmits = kzalloc_objs(*hwxmits, pxmitpriv->hwxmit_entry,
 					  GFP_ATOMIC);
 	if (!pxmitpriv->hwxmits)
-		return _FAIL;
+		return -ENOMEM;
 
 	hwxmits = pxmitpriv->hwxmits;
 
@@ -70,7 +70,7 @@ static s32 rtw_alloc_hwxmits(struct adapter *padapter)
 	} else {
 	}
 
-	return _SUCCESS;
+	return 0;
 }
 
 s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
@@ -287,7 +287,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 	}
 
 	res = rtw_alloc_hwxmits(padapter);
-	if (res == _FAIL)
+	if (res)
 		return _FAIL;
 	rtw_init_hwxmits(pxmitpriv->hwxmits, pxmitpriv->hwxmit_entry);
 
-- 
2.34.1

