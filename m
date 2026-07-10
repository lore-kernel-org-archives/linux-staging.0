Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF2A32694F
	for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783700529; cv=none; b=cOCubQqDn6YQFSLRN4Do4mU1zsl9MtXRumzyLJ6J9o8PGfqn6bucbzBuxO4R4dC/9dMqT20MV2cJUzaiLCzfwUfbL74Z84oaxlkIPWc0WR6ZbwxqFq+dAgP0dqyZMYhuEPo4EZc+EZ0sCc3W0cedtJnGfdnKJUad4h6uIRg5Oeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783700529; c=relaxed/simple;
	bh=sIJedAl8lfv5RO/T8kb2P0jUMPr3C2bdKJC3Kti0vxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3DBtIexz1k72bjuW2isr19SJdRnvtYd08Mk5h8UgwL0rwuZQQO8j87bPFSfPqBC24AXIV+SNRvANX51Q147AUXHfBejlcZcjUZXts9ujFCnmAaspdKafrpiAkdXIFquDPtkPc80caSL8V/Rsejpok4cyrXzeVzStLQXisUufQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=os9V3sm2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="os9V3sm2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47362928f65so1130913f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783700523; x=1784305323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iU1T2RPjTJZkMuO6xxasmUCtappPPRRnUAG4EzG9HAI=;
        b=os9V3sm2pwdtOFM1zxvcZJbwsOLoNeK3i/WbU8dtlEab+mkqMmATnudBH868q9NJAy
         0sAtBwxdnqVfIqHhCguiJtbjGgkozjIlNwrjMAZ1kE+K91MoR27EBf6SqheFQigFobMo
         IHhv9bXIcXhQDH3+ksfBlrI7fnvAfsO4BlP/fhYx3O9xI+zzhwLQAkZ5mSq2K3TYf8gB
         L6y6H7rBvgIRXla1JdasZaN9WhMLtNjGrrqKe4N0wINEuAN906Ai7DRWFgvEXMFfFnNP
         TT7N9VhMNYQRYSh1PyvuY3c4/KTWt88eKwivQjf6203wfpxauwer1KR5NQSdLRGDZo8r
         +HKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783700523; x=1784305323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iU1T2RPjTJZkMuO6xxasmUCtappPPRRnUAG4EzG9HAI=;
        b=H6W82rD5fCfBsrPMIKcQMcMWTSS1XFxNPpz/S/0V80txznq9bL2PwflbYvS9FfYLof
         YO8gMo6YYwUaxo4TucedcSJ5uXgl+V4VhiV3D6HznzXajaP3zMVA8PzOacLxl95mdy8g
         GeITll6nxCNmY6yX6go6d6RrrvjUJ2Llo7GEa0WflHTABacj98jDE0AQIJR3aBMInSxh
         pksLb7LIYZzZM7wbtpzpqFGov78e/YoubQGd+3YzvhzK7q72h2tkLKdjJ/A11np92G6d
         wrVS9hcdvR7bsg8SwXhndF4aJD3tn/diTm3pMWXgZR9MP6uCRb4Fv+SYvi71YAOS5Xkb
         A1hg==
X-Forwarded-Encrypted: i=1; AHgh+RqoEhMEqcRtOdDPTuSfhHaCB0sioPNE2jwuwNSFGkE3myWF39/YvICbPZlxaVco/BM9ySiV4lD34hbeAGrv@lists.linux.dev
X-Gm-Message-State: AOJu0YyIcPe/8pG56dQntGi6t4YXPO3zoNXUlXtYNJqH+VsB0b5DFaX9
	qr4kz+61UKXcVxXGGOqQsGg4Wv5BBbrGJDpYfszKBkia9PTBEpJ0KrbCVylp5DAK
X-Gm-Gg: AfdE7ckj3buaHkXioJFGDHWksbd2trl6jpvPg2zVGAnlcLXl8dCE708CLibfEJ2lcbT
	FQYyW+SIYqb8VzGM8uZaRE/WIW+5HHrwFWpqML0WVDjmWFJXT15ex1Z6gDjdVx1/u5zla7sVVcI
	jZ7gljvcNUWIkQwBR3/Wn4llf8OO+kMDlNbsqsIPchW1jLvMX0Xq+QgUYBlYaIKh8ee/6raRQ7c
	0iuFGSH1snFmW4Y5AR7FjZU42Gof89siR1rp3/eWyfv5wbMmBzLPCDeQ0cNK6ALGPO7GmzRF5uQ
	ZtRk/+54s+M9xbw5MLAOaLWNuR82sktibqUb6Pqob5kP/SdD68VpM96R+yxjcFpefhG3s0Ph1LP
	GCqKUbBuDFu0Z5vASt1QQNYP/YJ0PMfdo4FTPe3R+nYhbBsk/8/VVWMU3WgjKrZETf4DfU4m5MD
	zbXpIbnoxjUffXLp+Nt+TdHNZsg/GAIJUD0o0cEoTx6ymlkqEeSnUfJpLyFGvLDoDc0C5EYHuWQ
	ppnEw==
X-Received: by 2002:a05:6000:1a86:b0:47d:ec60:6581 with SMTP id ffacd0b85a97d-47df06e5b76mr13663460f8f.0.1783700523479;
        Fri, 10 Jul 2026 09:22:03 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm69436063f8f.17.2026.07.10.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:22:03 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v4 5/5] staging: rtl8723bs: Rename camelcase enum values dot11AuthAlgrthm_WAPI and dot11AuthAlgrthm_MaxNum
Date: Fri, 10 Jul 2026 16:20:17 +0000
Message-ID: <20260710162017.5660-6-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710162017.5660-1-fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260710162017.5660-1-fliegbert2@gmail.com>
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
index e244910a75cc..a3bbc605e2ba 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -182,7 +182,7 @@ do {\
 		else\
 			encry_algo = (u8)psta->dot118021XPrivacy;\
 		break;\
-	case dot11AuthAlgrthm_WAPI:\
+	case dot11_auth_algrthm_wapi:\
 		encry_algo = (u8)psecuritypriv->dot11_privacy_algrthm;\
 		break;\
 	} \
-- 
2.54.0

