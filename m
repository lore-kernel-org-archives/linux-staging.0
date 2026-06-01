Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472733F65E1
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346567; cv=none; b=sMs2DU66Z3MRDoI8BEhRZdsGDUqTByECq7f26LzdUrjQ1A9K21gFRxh3kaAZeawQ6RpyX6pkrNt1OUXIE1C7JOdZ19BmNkgRlF8cweR+x0q0i/ish6pq6fQQvp8KKS7CMWae8XnY67HHuxDqBTeiLThmFuCpI4Rb102DSlipUsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346567; c=relaxed/simple;
	bh=6m7sar8yBHp8NSG/Bu2UoM/418XUDw04rWwEueH0tkE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePSqvYxc/uYoprFcCGfBD5KmJ/Ehyt7dsuilfEyidx3osJ5WtzOc31Fq6dEl2DTypisz+oXqNYuXbSx56La7KVAHISejqX3XpeB636hOi11Vy0Zs8sTxZDaknt4emmb7vy49ERadkbnZvuoZXDghPqHFxteOOcWsdRBrueEJ2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rnsfJeqj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rnsfJeqj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490b09e4cccso2652185e9.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780346565; x=1780951365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+AJxvIibbb4Uk3J4CDw/nio7Zfw7PgQsi+4i3+yh48=;
        b=rnsfJeqjPVSCwhq/fPCWqyvO4TYG4crZuOTl6+7xWnqVRjvTL4THgLHl7PH5uBCDsy
         /TSZtny2op2EfSPpbXTc0VewByKOoLwAm+VY7NL7AHhzJDA14g1VV5AoSTtXQAYdeCZ3
         C+UhMbXkV1VnOdQMWPRx3p7j7Kr4rWiV48U3pqIn9/J7Q2cAoEpwAt7jlB0mAWBvXIZH
         2lKNh0XrZxaH1lmGPLLBWZMCZAQYOlktdnm1qjND6za6GGmofjeNJnOAdwifJ63rk1HZ
         F8QIZfcc44Cxos+manIJeNcBjLlJMUqFG+l38tQbZ+N4ZZp38/JInod+fdauk0r48J3x
         ks0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780346565; x=1780951365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c+AJxvIibbb4Uk3J4CDw/nio7Zfw7PgQsi+4i3+yh48=;
        b=cEx9IH0YpLs3lROIIS9UVIiX46oit1XC7Rl0MLtT8l4SsklaoDOaSBtlqKzxPomiKj
         uwGylqaOBbKjNK+EYspNowx1X3RLKxCG3XG7ZgxIJ+JqXzxZUA8vXCDH9lhggmO2q+Wl
         dDQdLoqVz888hH2sk44JO62eLYlBaFA5BNOuMljN0Uv26sSsWpbzhrZFawKs2eBqeG/0
         XGJteikQLP1Nd4rhZclFm3FyQoUNuD0zAfybggl0kNbsy8SWjoYr2Lm8VeOymsKlfn4U
         ESNuRJolYvJF+QtHaaWgEdIfdC4wayRAGDTZ/9Dj0HrJnr3bvSIvatKLuMhhSICg9YS2
         hWTw==
X-Gm-Message-State: AOJu0Yxgo4sc2KML9hZooUv6gElCm3EZcOt0jseLqbo9Ph3cSpORA3Ct
	7oArDV5s/bcF8YM1EBGeUYmfwbgorJFAYiFPhEgFVCtll/Hw9F4/dYxnsW/9BqQa
X-Gm-Gg: Acq92OGhlqLQ7hbuKBz/atMKKn5PDhzADftLFiD575H72IH1o3/Fz9GEtC0DlexkzrZ
	wLc8qvNDtz2E9MJBAriM6CcMF7Y1Q+DZvWeCA22xQm2uwalHLEYMKdcvtTI3UJWEHGt3H09RXfx
	WBAq6Up+AVl/6PFx0Ns6ht5x8gmUbmKgvixtHU9hbJMhOF+ii88RgIYYkGtzFrZugKjGnCILwd6
	DkzzdllYPJTtgkuZMBXFEKcEUrtuAAJAlnkBRX9UUAg2u/bFTg2BXncp8Jlo4zlfZKL/HF+oSSo
	mBx7+RzJayU0tXrptNdu7muzCkQQoqc/jtCpusZf/UVqAnbtPgvUsZLPvpFz7XUKtUeL0RtTV65
	hMEe5gZD8GM7uxtXsoUWAxWOHlK4RnlMDg4Z0J5BloafZj0UfBRG0ZdE0FXGJjsDABRYWY1WSxj
	59M/4oPLg8iE2Gz3rfijNCnZtvP2Yp8ZBIqkSGGgXsuOr2ovJWKNNB6fJG3sd0hcPagckMLO+WL
	vl1SksTm31YnKyrrku+0WwVw0E=
X-Received: by 2002:a05:600c:5306:b0:490:aeae:1eea with SMTP id 5b1f17b1804b1-490aeae1f1cmr51588815e9.7.1780346564692;
        Mon, 01 Jun 2026 13:42:44 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e19a06sm16988405e9.5.2026.06.01.13.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 13:42:44 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH 6/6] staging: rtl8723bs: Rename camelcase variable dot11AuthAlgrthm_WAPI and dot11AuthAlgrthm_MaxNum
Date: Mon,  1 Jun 2026 20:39:58 +0000
Message-ID: <8c252f8ca983ecffada6b3b4b4ac1de546aa31f1.1780343502.git.fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780343502.git.fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Rename variable dot11AuthAlgrthm_WAPI and dot11AuthAlgrthm_MaxNum
to resolve checkpatch.pl CamelCase finding.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h     | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_security.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 3d2639996371..e2d831ffbcd2 100644
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
 
 /*  Scan type including active and passive scan. */
diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 46c1bdfc63c2..a99af6afa8a2 100644
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

