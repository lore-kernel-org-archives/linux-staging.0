Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CECF214D6EF
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 10:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725790299; cv=none; b=aLSC+l4cJ/JB2gzrnyRWJ9wBB2/MbJWF1tKHjIN7HQeOuEAg9itw1XgbcbjdYFHdM6bPIMYLjVr9y3YfFJgA9mK89+SjO5hqo3x2Mkgtd2wLOLoFheNZb/y4+HEb1NTHOXL5xo9CSls/Oq6+IDw0Mnq5lvlFDe3cbfxc0Z6VQGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725790299; c=relaxed/simple;
	bh=483x2FSxPESFFxIfnShpBoUUsKE1beMkctUgEWytKaE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jD5sl+Pv87mguDCcd6WUTwRY3ahDiH8brFcDwfiNtIM1U+fosl7EmIxPMLunaHhsSRFehg87Bd320HYqvACukWKq5fZxvTvjqptz2vGH3WI8FC3jHQTtlP3W3L1AYXQDWo32RpF4Pcy5bdWSTr9SxtWFgn3YpTmN9WkgczCI3Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h5WI/9hd; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h5WI/9hd"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d8a54f1250so2281727a91.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 03:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725790297; x=1726395097; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jS2VzpVc7dJ/AT4s9AMcRZ31HOXjijKxq9pngMXABpU=;
        b=h5WI/9hdcNn8qWDTswvs4zzdpmN4fCk2Husd7tbm4f1dYdpjlT8+xzacfzB/MDDAEi
         wqKH/7cowTXheVbAZq6x/Y5LPpr4lfgXY6km/sBRyHskf4ioSenwEqAYt9MysBnNyCo4
         CrreKwByFnKfmvy3kIfV0IZXCNbhlPZWIEsqwBtuLBKLuXe7kgwLGv+JqipU0u3bWK+B
         xBO6oKIXyH0XpTgHLWPIltVRI6fRGXD6Q7o3I80XacFi/6rW9ANysKijxbm1h5Dpky47
         G97Cuhbso4VOibrrkFFb8+kTIgmQDHbzjycyYox6QhdT6+XXLXd6WINKXq7usDx/SbPx
         kleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725790297; x=1726395097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jS2VzpVc7dJ/AT4s9AMcRZ31HOXjijKxq9pngMXABpU=;
        b=nUmfbkBvBaLpD2UYj895DR6M5NrAx86MRZa1rOWJlgjfrqLCV+wmqcgiULmrkXh+hG
         9rPKF/mVCGWXW3Gu/lwO6+EubUv+g+akAdRgKwZz+f7eBDHQxjZkGBPSLp/qHh/dvpnX
         g24iCfCjlspjNA8A5owOhBdwvf+dezkVAw7K4rfnyCswLpPnouYpQeJpULLJTzZlcVhI
         7u6zBjjvZ8Hl9hmnpSL59jEgOUsUHfIf1KbMotqwFEzB7ycZzXv4gyJHoqcEC6BK+wEG
         GMz7k6JnXI6sUw2yxb4KJ1DwAO/zp0tHbs88BCBxLvQ6nlIKJhDa2Y8MzEYHfx2SGjrj
         N3HQ==
X-Gm-Message-State: AOJu0YzTzJ8R4LlZ3RcHvsPEdqiNyJHPaKr4q/DquFfT1hvmUfLjtfOt
	5Zm4br5KGj7QWvAdXm8MciwdXXgqc6UkKZ6Xz5WJ6jsx+fo5kmDWAKbk5o+efs8=
X-Google-Smtp-Source: AGHT+IHJ7o1p0iqupb5RIo7H5GyO4HCiTFe05FSVlpTqlLviSdgV4ymj1jv4O2HjhZDxkZzc+VnpVA==
X-Received: by 2002:a17:90b:3143:b0:2ca:7636:2217 with SMTP id 98e67ed59e1d1-2dad4de1151mr9596174a91.2.1725790296990;
        Sun, 08 Sep 2024 03:11:36 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([103.57.172.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dadc0782dfsm4589379a91.34.2024.09.08.03.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 03:11:36 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	sayyad.abid16@gmail.com
Subject: [PATCH 6/6] staging: rtl8723bs: fix no space before tab and statement start on tabstop
Date: Sun,  8 Sep 2024 15:41:10 +0530
Message-Id: <20240908101110.1028931-7-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the space before tabs and also makes the sentences
start on a tabstop instead of spaces.

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>

---
 drivers/staging/rtl8723bs/include/rtw_security.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 740c8504cba7..f005ec88d00a 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -162,7 +162,7 @@ struct security_priv {
 
 	/*  For WPA2 Pre-Authentication. */
 	struct rt_pmkid_list		PMKIDList[NUM_PMKID_CACHE];	/*  Renamed from PreAuthKey[NUM_PRE_AUTH_KEY]. Annie, 2006-10-13. */
-	u8 		PMKIDIndex;
+	u8		PMKIDIndex;
 
 	u8 bWepDefaultKeyIdxSet;
 
@@ -183,8 +183,8 @@ do {\
 			encry_algo = (u8)psta->dot118021XPrivacy;\
 		break;\
 	case dot11AuthAlgrthm_WAPI:\
-	     encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
-	     break;\
+		encry_algo = (u8)psecuritypriv->dot11PrivacyAlgrthm;\
+		break;\
 	} \
 } while (0)
 
-- 
2.39.2

