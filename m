Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9103E34D3BF
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156653; cv=none; b=QibQrgZSLJb9aXHxRzD2YbeI5HcCsCz0wt27MSmJIF1qb8GbfDfOXJYuykicCSz7/N8X4yjDg26LWG74PKZn5TtwXhqS+T8kAPnradlkhPfBh58QUzvNPNnx7q0oUpUujoIVB+B3WUJe22vy8zxj3aTARmbQLeMRfa3qhrm8Unw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156653; c=relaxed/simple;
	bh=jVSTaA91lLj+ywa4ZspLRO/8Kg/2FZkPNVEAsqgppbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E0d+wwNLYr7y3wCYWyY+5Bvmol1UOiHBl4LLw5ec4LLrTVQNnIMnZU1FGBCrzzpFKqcRg7KlPXBr/Z3V688RwEngCZjbbGdxD14Ss+So5Wh15VyztPSwXvobbOQYCgDQye9NGCOzkmNfrMXHcTxdoGeouMW0jVlNQvDOWvuT15w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iaKqkAZc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaKqkAZc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a0c09bb78cso34332925ad.0
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156652; x=1768761452; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/qoRaPpM4dzF5RloA49kaRCQLu6cSnTLbckqvDNtgw=;
        b=iaKqkAZcIzQT65zADCfwWW/Zuyz35OOYoRHQE+UE2iHtrCIVFVWb1HWWoLOKum9LG+
         btwS4OtHJ+GHEpCGqetuO5sEgKK0co7+3Zjorr5s32YOF9fLCOvyHcyNYnjBvxTMMzA9
         Ap2+Tcu4Rp6i7mPyXNdss7Q2ScQCFhBYjuEUdXfzp7UCK6zT04P7Bl8QffOwmGgAZ9oa
         VlF8R6ehI26z+/cRWRmItkup66VYr7SmRhtKDAf1+wez+8WHMc2yFLx5y4+7kkKevHjr
         3o/7htb1n4V3nfpafWTyqAh0XESiBpaiwbIpCDzcFN9f21AJQXCS7row061Iq1cOBTRb
         MKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156652; x=1768761452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N/qoRaPpM4dzF5RloA49kaRCQLu6cSnTLbckqvDNtgw=;
        b=So/QQUUdAjIlY4JiQ8j1Cc7tBZe0ZlljnMCVYggYMqJZHLVzibGNZLXw5WIUwJTRM0
         TU2hDNPFpWE7cS+EJutGMK/0YMTmqJ1ZavwxM8vNkA9M7SD0/HGKSizBxXl6caIIKPzG
         74auFL9xhJcVlZ8SLHHhulGroLPST8Ha7R4R6xYv977xpbxISiMyqxWSNnqwHJuAmY/y
         J6i1XbCtkH5J/VpETkSf4tHwPbh/JmAqe5V+pN1Xw9lB+A5gz2sgJlTJ/M6JOifLw2c4
         HNY4AeOG7l3MEgsg7FMBeG5RnKq8dWF7fnbFmXcVqYdwSJFnRNSHbCy7nwx+E8DwvIJf
         4dJw==
X-Forwarded-Encrypted: i=1; AJvYcCXRN0oP9/sRk9KF5AjxEtzmyVcGxjX2zCMvda6gs1P6JvxJNLO622gaqqofts1yfI6fnPaWbrXoBDxVMklQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzCDqD065+VWyFeXgy6Q5k7IDRly6v99cHPsA+MgI7tGmRuKZ5D
	Z2lzCMyidZYpI+FDG/UcOPoWTukb4Vh+gBdlh7yYCCyzSGSa/q0GSTG1
X-Gm-Gg: AY/fxX742hBvqpE3jRyEgWr9ciWDrdJEh00ae6i6GyiymHM0LKEvmuaG291sk/4uiX8
	o5gUK9W1zO1CAJ+F1eDmA3ze0eDA+PjyRmIunYMVtw+AkaFhyuOCWdiUXF/olyWW39Dz1Wt1Bqk
	I9l/NQi1W4pIRnhiHcBYZ4xEG4Yjy+uLOzXbCjT3IdZoR7PF+Y0m3oPOhk4d4FQmUP23by7bnji
	2KjkK7OXP5xSb9vwFaYBTvi5DVh/wUJKo0QVNbmsl2zz1dMd0a8ORCjiKv6V91DSlvFYKrtkROi
	r7ujZbJUwHTabMisSlWkMf+k8tCb8u/2ArlyMuC1GJK96XQt8jQaR6G3Kf55UxhS4ha+c9zfc0g
	I4ckbQb7sUONsgGxKhCMWygLXUQWUSgAfsJSRUVjDK5D6t8ui4R50JlkUmhBKbpa5fTbNcaksns
	rW+4kPbX4K391yvmr0z/oCowS8V5ZsQC5BfgE=
X-Google-Smtp-Source: AGHT+IESobB7HLvLZ+7PvJHzBnQZzTqj2jp/S2AdIiJYUA40wWqZRGFmDbFrTRBEXyMUlqEc2NGfmQ==
X-Received: by 2002:a17:902:e545:b0:298:639b:a64f with SMTP id d9443c01a7336-2a3edb0de06mr174216155ad.6.1768156651744;
        Sun, 11 Jan 2026 10:37:31 -0800 (PST)
Received: from snowman.bbrouter ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2953sm152220415ad.86.2026.01.11.10.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:37:31 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH 8/9] staging: rtl8723bs: replace N_BYTE_ALIGMENT with PTR_ALIGN
Date: Mon, 12 Jan 2026 00:06:29 +0530
Message-ID: <20260111183630.12816-9-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260111183630.12816-1-khushalchitturi@gmail.com>
References: <20260111183630.12816-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the custom N_BYTE_ALIGMENT macro with the standard
PTR_ALIGN macro in rtw_init_xmit_priv.

This improves unnecessary casting and improves readability
without any functional change.

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 5852209c702b..a800547f2f01 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -76,8 +76,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		res = _FAIL;
 		goto exit;
 	}
-	pxmitpriv->pxmit_frame_buf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_frame_buf), 4);
-
+	pxmitpriv->pxmit_frame_buf = PTR_ALIGN(pxmitpriv->pallocated_frame_buf, 4);
 	pxframe = (struct xmit_frame *)pxmitpriv->pxmit_frame_buf;
 
 	for (i = 0; i < NR_XMITFRAME; i++) {
@@ -114,7 +113,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		goto exit;
 	}
 
-	pxmitpriv->pxmitbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmitbuf), 4);
+	pxmitpriv->pxmitbuf = PTR_ALIGN(pxmitpriv->pallocated_xmitbuf, 4);
 
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
 
@@ -164,7 +163,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		res = _FAIL;
 		goto exit;
 	}
-	pxmitpriv->xframe_ext = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->xframe_ext_alloc_addr), 4);
+	pxmitpriv->xframe_ext = PTR_ALIGN(pxmitpriv->xframe_ext_alloc_addr, 4);
 	pxframe = (struct xmit_frame *)pxmitpriv->xframe_ext;
 
 	for (i = 0; i < NR_XMIT_EXTBUFF; i++) {
@@ -198,7 +197,7 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		goto exit;
 	}
 
-	pxmitpriv->pxmit_extbuf = (u8 *)N_BYTE_ALIGMENT((SIZE_PTR)(pxmitpriv->pallocated_xmit_extbuf), 4);
+	pxmitpriv->pxmit_extbuf = PTR_ALIGN(pxmitpriv->pallocated_xmit_extbuf, 4);
 
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmit_extbuf;
 
-- 
2.52.0

