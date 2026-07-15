Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAE2480335
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119833; cv=none; b=NdZa8LSz4Y9+SYGCWgADtTWKH6svBg+SkVAAosFbNOXvxGt5Mf4JILTpsHIfoMChGKl9uttdz4nsUfIMUs23nTU6pte+G8WRgzprjS17eawa/o4WXArx8wHn+PSIXAEcrffknRDZmjXQ19Dv9K0fC60+RfitHF2nfyc5eRkvdYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119833; c=relaxed/simple;
	bh=W8WQ5/ZV4NvYHsst5ICR+qjIXFWVTLMeMb7DFpklPi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fjcA5qPI1JWIWYrshiLBipMM1vN/GC3DQ/7VgofOoCpFbWAPYDqBxSogkMrmSYzKFgrvZXy4HiY8nf57eKk03eXtYhvq3UXcP3p5ABliaddc46rgPPmgYBQFt/JeLC21YuHRmlBtzMraUs+tu9ipHcF0gyWY4ZcXnOFRzNqICT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mL6++pSb; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mL6++pSb"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so7804143e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119829; x=1784724629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5+EGYyE5WopOPt564ReimP2aWQt+GDgRIHdPMKppUc=;
        b=mL6++pSb9dKbAZeRuQn8IYGJyz9iI1I5aesQnoMWvwnk7C4Gqy5tZw9a8C5qMwrXDQ
         +OB94AjlvmXmsPHYK1GEpSTazIY6tghODl1Ko60BA9p3h51Cjsoqa1JtHhjgfyf7qgeZ
         YpooFtZX5kMfUtdJJTsJq9k/NOEYbVe9zctMRqI66k2MZB5rpBus1NDWD4rzylPsDjTr
         uYr1K2s9072iAJEFa9+7eg7nFHGPzR9157DPFrUuWIxj+NxYZmgJKv7e6VVw/FCKi9Ib
         SSrdU8Odu0bOTrKpA/pTqqd3WDtT2taH7byg38P4yIG7H75Ruzg0ZfNKFM4uZ/iOxmxT
         aYxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119829; x=1784724629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H5+EGYyE5WopOPt564ReimP2aWQt+GDgRIHdPMKppUc=;
        b=pbHVP++dbNhrRgrbkkwFsKkA1PDsl8OAlFYQgILYTcoG8cYhj5JTS9M3hb7MCVWCLg
         zD9UqMGNEIrkU0rJXXiiLSjFLIyqP3et4OhiH0nyEpuaKoO/AmDjqYhO9UBI8M6Bmrjd
         mIAnn6DiuawoSM5/1j37jcnDwAwDTHrgI10Tt7SWKoEGtCVI8px/0X7svZlpITuFydLU
         TcLCcuWkqMoFAfibFcbzl7JuJE+HFipHQtXOUBhFNJlQ/B2Qn6cT/+RFZw7wFcqhuGqt
         fgEM4jEF6eCayfWOCEpSr9gb+cj+rPtCH6pt9iiE9gs4t8NwPP4sgLCgP4SV8A4aSs14
         jS8A==
X-Gm-Message-State: AOJu0YxZ9rjIS+z2hrBtxQd7DsHZuBowLDsk33YEnPMKj8/oqrmW/ntr
	Ikazp1lEi5XTSR8KjP8yw+td/ZJPxWRDKD7olPkAByyZwzUhJ7GUsWCE
X-Gm-Gg: AfdE7cleqnc3egkVywxhOGd94VdO3GFMSlekXB8M0ZO5QDELwZmGyOat4lpNpc+FZHx
	QEdvgOdj3V+pXnr6pA5fsxblbCu5gBuMBV8mqXWCKkgol/bC8D15XjRQzRKObH6YUrj2QJKtK+n
	7RM6sZDiH/FC0Xn6fuFDPj2EcmiiBYHk9wz9+R7l31Vvr74Cfb6HcW5ietlcaDymtCNJTUqfGE6
	XBlL1l50eAPJOe4xITFMz9n4UJXLdZNbtjoG2d3DXHYjRQTk3FXM6BNqdXH7aZik1DL+eC5UJ0j
	NYOuiL3g19n3T/TJY5x9O7dq8e/Rsr9F4C5wxp/emkYO9YoINFAggC4VtyeBA3nQ9iCq4DwjcgZ
	IwQ4HlqpLtf2BZ7eFmrOHGAWwcgGxEAUo/Yc2PZNPyWN93so+iv2NSkP08b0GK89qMw9Yb0hoDA
	ZNbF5+ZJ0+NHkpZqAMn/HTIyk63D2cFxT84vkc6uV28OlUcjnKweb2nml51DwoMXXpf4WW11d4B
	XayFpU5jBZC5A==
X-Received: by 2002:a05:6512:65c9:10b0:5b1:5afc:1727 with SMTP id 2adb3069b0e04-5b15afc1880mr842414e87.57.1784119828624;
        Wed, 15 Jul 2026 05:50:28 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:28 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 17/61] staging: rtl8723bs: remove rtw_free_cmd_priv wrapper and rename helper
Date: Wed, 15 Jul 2026 19:47:45 +0700
Message-ID: <20260715124829.90290-18-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant rtw_free_cmd_priv() wrapper function from
rtw_cmd.c, which did nothing but call _rtw_free_cmd_priv().

Simplify the code by renaming the internal _rtw_free_cmd_priv()
helper to rtw_free_cmd_priv() and using it everywhere directly. This
eliminates the useless leading underscore naming and reduces call
overhead.

Clean up the old wrapper definition, update the function prototype in
the header file, and adjust all call sites across the driver.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 6 +-----
 drivers/staging/rtl8723bs/include/cmd_osdep.h | 1 -
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b91182549..02b7d24c3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -227,7 +227,7 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 	kfree(pevtpriv->c2h_queue);
 }
 
-void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
+void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
 	if (pcmdpriv) {
 		kfree(pcmdpriv->cmd_allocated_buf);
@@ -287,10 +287,6 @@ struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue)
 }
 
 
-void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
-{
-	_rtw_free_cmd_priv(pcmdpriv);
-}
 
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
diff --git a/drivers/staging/rtl8723bs/include/cmd_osdep.h b/drivers/staging/rtl8723bs/include/cmd_osdep.h
index 2259fe57a..2afd60a7d 100644
--- a/drivers/staging/rtl8723bs/include/cmd_osdep.h
+++ b/drivers/staging/rtl8723bs/include/cmd_osdep.h
@@ -9,7 +9,6 @@
 
 int rtw_init_cmd_priv(struct	cmd_priv *pcmdpriv);
 int rtw_init_evt_priv(struct evt_priv *pevtpriv);
-extern void _rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv);
 extern struct	cmd_obj	*_rtw_dequeue_cmd(struct __queue *queue);
 
 #endif
-- 
2.55.0

