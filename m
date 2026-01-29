Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C6D2D77FA
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 18:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769710578; cv=none; b=u0xHYOMj3Y+BXIBwwLDMWzUVEwxlFFep+eEr8IYykB9CLDgmSosM53ADWRCKZEdMb2TzjH1XbdLuzOGU7YXtWpL+zCVOqqZUazneQ3ov1bKk9NCInLhCCjmxNBLPtg1A+3RXb1v1yXTKOrxPeDm7xYoNPjjOhfDEg4WIBy92Mgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769710578; c=relaxed/simple;
	bh=bUeyerzNTibRKm7wU0xU1y09XX+nLkg2/OqCGqcSZ+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBCYaIt2wjxJ5ANbGq/9nOxG5HLi47R1cWkTjx20cM4ses3BrGSDhPYlOWmkO8bPXu3pt1ltUs3mJD4b2K6nOKidCNgXJGWJ8Ny0/Hy+7Ye+hr3cmKWtEJiX/xnRFPf9zE2/pBdyASZR/dcwPstdCM1OibMlFM/o1WXPFNxAPpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SFRiAjvT; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SFRiAjvT"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so14654255e9.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 10:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769710573; x=1770315373; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbtbqJ7f8/zNbFuNHfOJLh3NY0SZ40/NTWDq64DfleQ=;
        b=SFRiAjvTBiEcasQbNn6YnFnc9q3qaD3dH10sEyec6iV51iAJRxrVo+gfvO9ZMf2LrR
         LNwm3LE7tYjm222D9tRDsX9kyFNO/pUmVoFopQGmYesQlfyqkp28pbJECQGZJCkwArv/
         Ri10GxH7JX6+8b6FKOR8jdaGlp1I4jBqyskjzCf199L/6h5YubQ125TzIbAipSq/awiR
         7lDI0Zf/+Q6QJRjylu8AmhSZPrxPDYW8bBcLv8BL2SGzSB50Kxo3Kr6fmb7VvQHx+BRC
         l6Mm0kHiey5zW2vXm00Cu9SxYaeMhbFBmUhb1ur/nJ0i8E0cJNkq4/sX4l47p5IeN9MP
         ZY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710573; x=1770315373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JbtbqJ7f8/zNbFuNHfOJLh3NY0SZ40/NTWDq64DfleQ=;
        b=pWKotxlpJedRYTBR3TCjxuYeTvvX0zM8qUzpFyad0iIge0RHjiU5p1jJjiX0lvQWXp
         1gcQ1VBDlCi/rZyBxJVjxqxMRALit2CX1mPBR+WYCtDSbxtb3pQuR+USVCacK6AXaKxT
         kTEzCYZ6T4AuEKw41T2/yzWvFLLdyfd+R4/mp/ZWqjSI4H1mvikvyIHDUe3KJHpRp0bX
         2SzdSNa3ofEVlK0GHIduwJ/0yoMGtYQpGmYPjbwKgS9X05dCwTqcGg9cMj6ziu45kob/
         GCciho0W1ZVpwUEERm50Q3NmQiZ29TCOTLvLHAJWgBbihPKfl/OQDVvc6uH+dOC6cHeP
         iVcA==
X-Forwarded-Encrypted: i=1; AJvYcCUdjc3ZhWHnLH0MWJhU/0Paa6Z7qhuu2yQnvbE1OkUbs8zGzsGjaB+6FbKqaNMZios6IVX+eLlMFu7oalug@lists.linux.dev
X-Gm-Message-State: AOJu0YxWQnLI4uaAdHemlbI5NvJQNhCh7e62k06NNl1TteQcae1oj9Kr
	Gh5E5QadGzQCOKjQTOzF6pd9+Qfuykh9F7pDkLq74UuCoOUhkT6rNi0=
X-Gm-Gg: AZuq6aJW8oq6BuzPkqHJpab6eNQeWWLVA+ut7lfqi9tj6nfRePoBixfru0rxQGN9sip
	It4THJnRqwLjbXzJeOExhFwSpplTLo0/1ZDKF4KgvoxOofe5MJ/zZ9Oh8b47TBnTeuSkOIBiMBV
	urtQB62R4gsAuufGmunU1TnTahJq4CL7f44te//N8mj9QaCcXHNtqAmrbMKr2j5FH4Y9v8UF4z8
	uz4qhxF0rbQP5xEfsVVc3jCez8XqvhUWT4S1mzLsKe0V/XqG4SwWAC2nu+4R4pGUxRN9Uzw3qyR
	kZH8+oJG4fWH7fIo+Dtd8ENjCz0llRdTIQ/SqZv8f4MXCAGO2gENj+xGm1gAWGQxmv7Way6lV6q
	if44eJK9W6nZuQzKoG5xCNbvkD0mg+qsJlGjT0xiLrGiwT755Y5tFOvEvQdRdZKBeVVA19Zce4l
	+j7o7liHinCMg=
X-Received: by 2002:a05:600c:1388:b0:47e:e2ec:9960 with SMTP id 5b1f17b1804b1-482db49e83bmr594265e9.35.1769710573291;
        Thu, 29 Jan 2026 10:16:13 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdebf86sm136578725e9.8.2026.01.29.10.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 10:16:12 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v4 5/5] staging: rtl8723bs: remove dead debugging code in rtw_mlme_ext.c
Date: Thu, 29 Jan 2026 19:15:41 +0100
Message-ID: <20260129181541.72066-6-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129181541.72066-1-lukagejak5@gmail.com>
References: <20260129181541.72066-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused local variable 'pattrib' and the
unreachable 'if (0)' debug block in OnAction_sa_query
to clean up the driver code.

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

