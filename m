Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708BB411668
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 10:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783680449; cv=none; b=HwjkdiFp8F6ogmF6eZLvxEwSZt+gn03xYU208b2jq01leEn3zkb8Gnb3sxqu7tlUgD49FU1/Bm9FT5S7ngzX0R4SsjhmcravEJmNaO5sCRgetiRViHJbAFeYRaI1ZAaRZltAPBxp/n46jQVIBmsgRMY1BXLdMoiwBWOWrhhy9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783680449; c=relaxed/simple;
	bh=vD3MmvSjNQYxzTQMYu5XbFGZrgajE/guSowmuh0KJYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WthvSh+dZgGB2dtCrgnYh+W1Z8+3/9x6WcJ/pvU0E2Zh711o19ql4Xhh6oVF5EVyiir5Kx4ZkZvPaFjkhWJWQmlfcRvENHT0ftPGhjlLimm9VgWHBVKKgwVhMRJr5YNBUnNOcZE8FkAchPOEzKlHGj3Xek60NxLMAXY1Jf9RBNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxkIuTP9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxkIuTP9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f738638fso400385e9.1
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 03:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783680444; x=1784285244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KvBJIY4D1w0SUmU0qWQBkjCgWgwSoj715cixhDjj/Vc=;
        b=fxkIuTP9e4YCbt2zoL8dp+bunYfzFibZYvOkihcZpxM8+H9wZLtnzEahDU35KR99Xk
         CzU57KLOdOx3wQs5gdnNpjbw1gaDE35Dpt2tE6NTMwwtXMsfDrMBKew5oTnszVPEIubS
         kcWdNO+5ZOEkim5LJ/7CJwnEhH26Vw8R1AsL4fAyWyyyT+G9Q4O9guKXKUnZOptcWqXv
         PlmPZY0TLuugA+yL7iCT83VBRAphe+bokm9lPq7MW6CFZ8X4Y0ja8lT5yPZlA4Iuh753
         fz9lEnZmU6tXFTKrYy6+nooUpeKk5dAhC8NUPrTNV5z59ffxQml2sy55c5WtWMKxmoPP
         hstQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783680444; x=1784285244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KvBJIY4D1w0SUmU0qWQBkjCgWgwSoj715cixhDjj/Vc=;
        b=F01krIHmZJJCnMBIFiNZH5ZFJ5iIM7T7gV1iKNso4ORp7cPK9s/NZ32pZw2Cbhq7cd
         Ud23OrwyJnuwdkAVcqq1LQv7z46CsV7KNCQ+vTbeYj+kUopJmZ5CdXiDM2+mr2w+BOSi
         y4g4ZBlickPZkY/sLCPDR1TD3FJp8Jc45wFVgNwLKlz/FZO9GTREttnC3oWo74XwcEf/
         torQMeHBODQa2/nEuMPKxC8X2buNcKIFAWo/GeRVnY/UsEViDnJ+4dqeufqhm3xtJTqz
         WeeLZSyDIEGrcQzCys734HHCy5TOkxVxKuXdqKyhKXRiGKfFe9z+wGig0oEVGG6QuYQJ
         X/MQ==
X-Forwarded-Encrypted: i=1; AHgh+RrCrHZaFmu7R578iSlqsAA5qHSJ0eJqAuNkAs449WD0OUykfQ6fQ6rJnyPKWvroWUbivOnW2+PqhFYM17g3@lists.linux.dev
X-Gm-Message-State: AOJu0Yxhc/6PdHhDDadNcJ6ElHfKepxisYXRo8JkGVSfwncEHDc5LUyi
	fyJw29hJCMQBMMrzNGTcdn2iykCIyYtCOTF51JqRR++KWWbRuiynAO0p
X-Gm-Gg: AfdE7clutsqZnvoeHOB9Y0UZ8j2Z1xPCqeUCcPMxdXS4WgC2p9wzW502hfoOjIdtwvY
	io48/gZoaObThJaR9F4WJPEZHy3XbxEGkte8DCOwLoOid47g2ocQjYYgmyqQ3jky5vl8YyNM2WD
	+YQ9+Q3fAkrMxoCjfd/h0AYwgSIzDrTCQZZhglkllMtR7J/atd1NufCmnJhz8aibM/q4xH5Wt9O
	t7jcGpCmN7dGVHn0iuiHfG4CKe4OEwKibarq8MYY0f2zVrm3wddGzlK86s8jHrBCeP8VyxDe49x
	2Mm/COkRefwk6JkL0Wq7LOCnhrXMJJBRoBd/cwYkai5j1yGGfbxS2U9RwI/y8PspHGooOLMdwFi
	K9jfAWsGR51SWcjHV1cpgsoYz0BnZTRwDlHGSg9p1Rb6hHYHtvtrqDgNFN9sDTjZdaqSeCR7/sm
	f9xQzZUYvyU+B7P5jpG0RJP6qTbImFHs6p+mHYoNU3PFXg/bCvecinMxOB4ohODVEGLViiM5S/v
	DCWXg==
X-Received: by 2002:a05:600c:3e88:b0:493:efcd:b809 with SMTP id 5b1f17b1804b1-493efcdb895mr46525185e9.6.1783680443833;
        Fri, 10 Jul 2026 03:47:23 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm66551861f8f.17.2026.07.10.03.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 03:47:23 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v3 5/5] staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_WAPI and dot11AuthAlgrthm_MaxNum
Date: Fri, 10 Jul 2026 10:45:29 +0000
Message-ID: <20260710104529.5366-6-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710104529.5366-1-fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260710104529.5366-1-fliegbert2@gmail.com>
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
index 2ebfd7a0bb69..6faa13535b62 100644
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

