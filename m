Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0256543DA3A
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513212; cv=none; b=DknSVeAprc5TdniUgQGM2/BChBAaSTzAuFgEf85izNSIvZOGWZAtQs//zFFeFEgG5ys4BI2x8cdiL8LcngkMM5T+WW+bNa2a2ro04i7pA4ujGac04JFABKZzV6q3ssjVW+nFBdd45MubZRTwPqNxG2WWiULU91NXlzSNRGcbv6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513212; c=relaxed/simple;
	bh=MRVJi2gMsSKWBFtUyiFAbKMFdKdwK8cvWcVCnI2RW1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ktvyXRgLyKrgbIqGX7pO6DRZQ/cxz6qFQuo6wBh/qiip8xENbnGY4rj6M/69ZAzEPqI3TW10phyaLrt0X2tbqrd0ox+EmnffYts/n+HPJR7Ka2qf3PKNLUtTfcgntWnNKlLjnWSbMGRCJWW/jZHOzCy6Jy3ZnI1TFr6sB7iUXTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6dwLwEw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6dwLwEw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493e497643fso3153485e9.0
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 05:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513209; x=1784118009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGqG0OwPeFgXu+GU5RRlO28XYpnGio+BzEGbfwJtg9k=;
        b=K6dwLwEwxO5yW7cSgx9xtPq0YpeGlyLILvP1llNhz1YAUnRiWiagNiygkk9BsIFfFO
         C1cipcOPZkaIlagqEBcx+zN1nxS10eywFvtDFh+u6L4JGY9Mzt9h0+5OIZYDvqbYczGu
         DWWkGoBaZxTljvw57EvfUqcg6cwUBDUQO4P8sSI5Or2MOadywWTK/kfUHqiVg3SaQLHI
         MiH6ZUzLW3HtDglKmtulDB6MGs0chXB7dv+VfdmJSOEAzf6KunpW58Bu42b7Sp5PvAmu
         8QqGJheBFn+OOUVg3xUmrsgm02rZQzZpJHN0VOUO0UPQiiVgBSagxIOVby7vLgWO/YZX
         w1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513209; x=1784118009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGqG0OwPeFgXu+GU5RRlO28XYpnGio+BzEGbfwJtg9k=;
        b=o8j03apghjOvg+cKzO7b4s8DYsSsi01CkbGheLj9Rk/GOeqAsmJO1tTbgyziC2RCXz
         HFPiYtQIYM4oEjxNuuJC0XHrDBCgju+00GV0liCyJEiMV3dN8LHm++vOxNcwrwDuZ77q
         Bf0y/pURAyE4jk7aKSK+DgsjNQ34R5VzFksH5zWosMhnCeZbbyI9lfDYa0dklPLs3bwE
         cCFKmCAoVuxVIT2ag/6TL0yw+siSu/73+A9kbBsZ//tp6ODkrqKHJbg1XH/+2GkIg0I/
         CtOb3Al1TWsi23yFwQJBBZjlp/ncVf7CgsjrsRx2GbS+D0GMzYP/KiW9fxa66rEI4jFk
         j0yw==
X-Forwarded-Encrypted: i=1; AHgh+RrW312CBAmyUsWU5bN7qvUKSySpL8lWAT17/4u+6Dl87sTvf7SjFBeWcleBtWJqXu7qcNGSj1jHY2F13hzC@lists.linux.dev
X-Gm-Message-State: AOJu0YyBVqfunusmDFkeiDQ4rDxtm5qOhBPHMpLp4uSXF6xjdJ3vsnxT
	6IWMlivaiv8yk6B/gQbxzsDuQ6mz95YN10nRy8e2dy6qhM8YcCrUHsfM
X-Gm-Gg: AfdE7ckWPXk4xtYXLnFL8Eb09DQ0IYUhC1L2bd3cbkET4lq4o7c8eox5zyOw68uvnWb
	iM1NnEGR5CrHjShjBIoJGR3lIDuECqMyoQJ+HC8Lc4T2m3TSrw1ODzDw7bfAa3nlV9wQgh5PL6z
	YOtEzatS8rBes80hfQb746HtScsndQChxSgxjOFowP/QfVL17yCUD+1IZ4TKvEA6YXQjUK+5SZP
	8EZjzuFHseAdSKb/pA3OCFF7Yy4LOP4Cs8vV+Zk45zN/PmPXaZ30msotkU5ESShFn4sjuALkaY5
	Wvlk3sY58EzU5RMsKuliqycDWE91igTGOem2raptST49IWEi0AzNdef8CEWx/B+ieV7oQXavz0I
	l1MIuXOb7QRGrzLiRvuUtm9LPQVmvYKCsCdmtMiml/OMpQ/gpDErvOGyQM5gezELCmYE5fZE8l3
	PSrUsorLKMe/mX4LhK7lZ217As/3HjoZ//rZ7LUEjWGHNYkIfH7lIMeieIY7EmTH5+Ev/BZVY5k
	T38NpobDyKeY1bh
X-Received: by 2002:a05:600c:6289:b0:493:b647:1acd with SMTP id 5b1f17b1804b1-493e68dbd98mr22745055e9.36.1783513209176;
        Wed, 08 Jul 2026 05:20:09 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f50418sm122571205e9.11.2026.07.08.05.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:20:08 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 6/6] staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_WAPI and dot11AuthAlgrthm_MaxNum
Date: Wed,  8 Jul 2026 12:16:03 +0000
Message-ID: <20260708121603.2393-7-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708121603.2393-1-fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260708121603.2393-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Rename enum values dot11AuthAlgrthm_WAPI and dot11AuthAlgrthm_MaxNum
to fix checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h     | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_security.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index f2b020988ca1..a18d0edc937a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -48,8 +48,8 @@ enum {
 	dot11_auth_algrthm_shared,
 	dot11_auth_algrthm_8021x,
 	dot11_auth_algrthm_auto,
-	dot11AuthAlgrthm_WAPI,
-	dot11AuthAlgrthm_MaxNum
+	dot11_auth_algrthm_wapi,
+	dot11_auth_algrthm_maxnum
 };
 
 /* Scan type including active and passive scan. */
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index ae4149b6bbb3..e9fd97d68394 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -182,7 +182,7 @@ do {\
 		else\
 			encry_algo = (u8)psta->dot118021XPrivacy;\
 		break;\
-	case dot11AuthAlgrthm_WAPI:\
+	case dot11_auth_algrthm_wapi:\
 		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
 		break;\
 	} \
-- 
2.54.0

