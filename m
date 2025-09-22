Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D471E89C
	for <linux-staging@lists.linux.dev>; Mon, 22 Sep 2025 04:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758516828; cv=none; b=l0GpZt3D7LrbtnFxsiE+AXMH59YLQ/RzSHPbxQ10gFvfD2H7MzYwYDe9El3rvX3+YpEI8I6/9EO4Kay8MJKN+N1lyLzycUkYUPjjBKMNrYzcUQSczjx2HDBOJacQcbk7kBp1B1ZIifZHdvy91UIet0YfjU35sxgNlViy2A8fj2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758516828; c=relaxed/simple;
	bh=R4BpydptfYN3o2mCLvyEh4whce1vNzMChCA1I6SaaVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmV2xfoFbTj0Y2LxZy6f5270ZsZtOrmRkt21Mdy5xe13h0RYoEYOj6uCI9lbrIJDmLp2nqMfp21hdXFlgUO1GQ/mO7NLudCMYc8OGlvZpjahaXrDXNy56CHjzAGXi/HGAzjLeIomvfmru2Se9Ev5gzHyFLKHOJpBrws8bHiTFmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WogaTaoX; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WogaTaoX"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6352c8b683eso1370826d50.2
        for <linux-staging@lists.linux.dev>; Sun, 21 Sep 2025 21:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758516825; x=1759121625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cajskub3yInyko2vwCPecgvg5vw2BSZfivHDY0rM55c=;
        b=WogaTaoXckjnuYsbUa46aE+rx5cjCAh415+EzMUUWnhvh4sgRnLO5Yb4NSRmZyRWjP
         bVCGkWmKQStv/z5gDDJp5O/ueVBCzjUTF4bmLGgrxYMrophohWPaaOdD8zSBp9gb8M7s
         1sAZNIuJ692hEK5AAbppGx8Cao4EVZHwtSag7asfNu3ljbjLBQzFluyTsB9agQHSp8Qs
         /Fn46yOWe3IJ3KB/LLZiNaNDGxiE8StOH6XRdXAjFP7kwZdR2j/Nfuc6hmifAMykfBaB
         KyUFMK+gH9xc2kEx9IOCckF5q+zpN4GBg2Um/MFN/j3K4DtnYe2yMI6chs02CtadiXTf
         mS3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758516825; x=1759121625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cajskub3yInyko2vwCPecgvg5vw2BSZfivHDY0rM55c=;
        b=vQm22AYpsXsyyYbUdzL1I4tN7Gt4WGsjyS93zL+NebcwfmSY7iXBKXjGPzeLVIgDpL
         dzWp5xJ41TA8tVMVvM5xve6m9qERvOKK6uZnbru4APLkZKZsEKis2T/z6J+OynmZTpur
         CBGJJWos3RzNmbFt0s268d2VK6nlQz6byoSw/2viZnSADQyor027bJvorclteoc0Z2Rl
         DHXkLwH8iVsbxYF0uAUNQ8Erx0Ryidj0TAjcOT2dvOiuiAzbe7shVTjAebHZr7sZoyeq
         Ca3z1DwObxt6GWPbV3Ot844k+7Hs/Ap1UU+59kMFWv592OvH2SMsDU5wieFmaoDqjzHo
         RRNg==
X-Gm-Message-State: AOJu0Yxnb/zj4cqtIjYa2LDBQaRHtUpkT+W7Uq7W8uT5Rmu8aMyu0r7A
	s+1HINNObWRHWelOMMtnc++jnZLkSHMS0n+jTK8hMDNXcapHYdesbRXx
X-Gm-Gg: ASbGncvZ9NNSr5JHau/0rDtdJRujpsp4/OZAZ5D3ZiTs3TQRQAmOrbBzfoBdpNPQgfx
	ZWEkmfjN8F79MuAKnGbjDC7byf/0eGJkKpuIR5zCL3fICgOKRyDaY0miqspxcXhGeJdFFJOKP0v
	/OfreoCrIqPFIaytwyR6ht6DWaAiMi//f3Bs16c4rjyF1mvhg5RysuVgkfX5OdDE75OtoA4h7rW
	UBRrazzYbPsmS5kNq7OUcyDE9cf1PB41U7gyptfwE+yzo+siWFszyqDfWRFy9K/BNArAQqqM9a2
	bflDOMoNUr2hTGghnzuVoDDJiKMtmsYcAlQprQwe4KZiwmBT174ZghxxvSYOF4ppnsCLKduJd3r
	tHCdqCdG6OLKwlPUrCuBPP0rCmUwopoCO4BdFld5lJ4/K7fbViO+ku2Djk7yxHfsNTPnVGFzqdH
	FvmmYfekNbG0CQlSFZE9/W2jCYe3q0Yg==
X-Google-Smtp-Source: AGHT+IF8vlQDlWIOABf6wW3SdvlnGI16JI8T1UNVZOSc+psQY1uUjhsIYqq8AHdZRMc/72dvevUKiQ==
X-Received: by 2002:a53:cb52:0:b0:62f:c634:4b3f with SMTP id 956f58d0204a3-634779ae1e2mr6763489d50.7.1758516825010;
        Sun, 21 Sep 2025 21:53:45 -0700 (PDT)
Received: from ubuntu (host-101-28.flgauca.gainesville.fl.us.clients.pavlovmedia.net. [153.33.101.28])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-739717173ccsm30912107b3.30.2025.09.21.21.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 21:53:44 -0700 (PDT)
From: Jaiden Magnan <jaiden.linux@gmail.com>
To: hansg@kernel.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Jaiden Magnan <jaiden.linux@gmail.com>
Subject: [PATCH] staging: media: atomisp: binary: fixed a brace coding style issue v2
Date: Mon, 22 Sep 2025 04:53:42 +0000
Message-ID: <20250922045342.21307-1-jaiden.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Jaiden Magnan <jaiden.linux@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
index af93ca96747c..2264db62c818 100644
--- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
+++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
@@ -498,7 +498,8 @@ ia_css_binary_init_infos(void) {
 }
 
 int
-ia_css_binary_uninit(void) {
+ia_css_binary_uninit(void)
+{
 	unsigned int i;
 	struct ia_css_binary_xinfo *b;
 
-- 
2.43.0

