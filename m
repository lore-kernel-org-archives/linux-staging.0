Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395791922E2
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342789; cv=none; b=YxuFDBKLBMyxgF0/mJm1MefREKhSy2Sj6e/uKG3mh/dq/T8FoBlbCL4Fsea7KiGOdSu2pgM1MoNnf4CW+ugJkkuVpioEfr8jP/8gZ4YANn48QKn63Ikgfp+TQsz7aOvdc/utJR2QK1hfYWGtXVHjV7VhuGXuz8vSzOady696lKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342789; c=relaxed/simple;
	bh=AheSok/set++hCKnCB869atTXJwLL5hA18wRr7jK5wM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=swe6Y2w5JjgBV1Fp3VAvKwKqtvdtw4i9vLJEF3w4xZcj5OTRkAnpVuNbaJJ3itrN6zJLhyVDhHi9a0A0vhY0b6cFULnzATNCml/ABAgXLcY7lcDD01/Mq2V6k0PXdDg5Ebf9b9/Xv80GALbcjtSBtxyq0zSgq2QaSrFQpxyyjtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOLB+an7; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOLB+an7"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fda7fa60a9so39760505ad.3
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722342787; x=1722947587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9FkvLRq3+TTTPGRtqPvtfbmioR0sEJjLCE36JfFewt8=;
        b=FOLB+an7k1RIpNBGVCSozlrvBrGA4UfQEpu+npQ1a0TmR6hS5imYKjiig3zuCZXAfv
         hcTstPhpD8VXhdMEeX5ggyVVdYyPNfy+s9Iv7wa8oDj/apQed52OOpnZAf7LkYAUJTY3
         frjTcoQNhsnoVbxpBLL1w2CHlUQfJjiFxi8aa5w7a32Yba2+tGpP2GhS+SR/ocsLIec2
         4crnAWVYL7gyLKQmj/LbWZ+X67z3g0X4fmG0UVm92SGQRJ/YeEYgZMymoXGPVuu4K2rE
         6tB3EECFR44vS9x5EHUn+eqZG8MpGTKIfMnBbUyfnCMgW4/fdT9IEV4iAojoB6d3QSkt
         NC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722342787; x=1722947587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FkvLRq3+TTTPGRtqPvtfbmioR0sEJjLCE36JfFewt8=;
        b=ABZHfLzHE2gnFXQvaIqRmc/bEnX7FEojlUvFQg/eUUbmdTZKmFEUmcOIrNPA2C5elV
         6i3SyqVsLjgT2/+9ClSNsUkAFUE93YPDYyxVI+xXkUSxIZM7R0bgrzKSbdBpQCeGLtoi
         YsLw/hylwcP+BuwR2VQKacwLA2sFhCOGXnYDB02I7pRrDJVKq4PP9IyMuihDQRk12318
         MNS0qjRGmSTGMB6u+2jSr/Hym9Lwa0f+ubbpZK+XdIPhK3lctukUBtSJfE2DVZxO+oju
         nIgUMiM5Xo/l3fKiHMlozRRVgd6v7rT3dCp08aAEFRIbqdp1MvoO/yQIj3GRjLSPe897
         Z+rw==
X-Forwarded-Encrypted: i=1; AJvYcCWtvF9gZdYDxr4gtvvrY4UxTD2jwPWbv3Likfzva6oGkk5EN1WKlZFK7Az/R9+RPxTBbb9r/NFzMmZUfeW8n070OAi+U0DOZ8wb4VczcQ==
X-Gm-Message-State: AOJu0Yy63axX/jhmYzYJFVh4ihQmt/KsaVniDoTrjMIYv9/L56W6gYMp
	Lu6H+Xs9ZWe/IHszk/+mRgFcYObf4qxb4oXAcyw2hVad3KwSmGgq
X-Google-Smtp-Source: AGHT+IGzfeb6Lejk58aaG/mwaqMMHfi37Q4Tnfjvgm4uUDOUCRrIj44meDeRI9kyyZ6lr/fLmKFwVQ==
X-Received: by 2002:a17:902:dace:b0:1fc:3daf:8a0f with SMTP id d9443c01a7336-1ff047ddf32mr154511905ad.7.1722342787405;
        Tue, 30 Jul 2024 05:33:07 -0700 (PDT)
Received: from localhost.localdomain ([211.171.34.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee1263sm100885645ad.122.2024.07.30.05.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 05:33:06 -0700 (PDT)
From: Kartik Kulkarni <kartik.koolks@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	akari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] staging: rtl8723bs: remove space after pointer
Date: Tue, 30 Jul 2024 12:33:00 +0000
Message-Id: <20240730123300.37291-1-kartik.koolks@gmail.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "foo * bar" should be "foo *bar"
in osdep_service.h:105

Signed-off-by: Kartik Kulkarni <kartik.koolks@gmail.com>
---
Newbie to contributing to kernel code
---
---
 drivers/staging/rtl8723bs/include/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index cf96b5f7a..d6d651342 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -102,7 +102,7 @@ static inline int rtw_bug_check(void *parg1, void *parg2, void *parg3, void *par
 #define MAC_ARG(x) (x)
 #endif
 
-extern void rtw_free_netdev(struct net_device * netdev);
+extern void rtw_free_netdev(struct net_device *netdev);
 
 /* Macros for handling unaligned memory accesses */
 
-- 
2.20.1

