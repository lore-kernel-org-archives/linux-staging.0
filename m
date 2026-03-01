Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94159430B89
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772400066; cv=none; b=ubewyABODra08wbYnjShyvs/ONKzNBtaydgEAx7dZ/QCnjFENkigL6yYjNh/LVteXrzsOc9bQ4n++6gcLT3zDtYSlqlIb2C05puJNd2MbV0eAk9BOo5jKDRk8Q6kAB2hce7C1ahbnWRHFJi7j8nUafvnbQq6ttrpQxjnH/5ihcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772400066; c=relaxed/simple;
	bh=znsaELJexBKGqpY2QXeMZ84nICUuJN08Xpiiuesnxnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DGC6Ohp7D+loAYTI/fjbDoXmJqN0iPDbzE7Y7KhKo/RJCQiKCBR53Xkd4u98XkTa88PrAqcJKH4wZq/7sCOXkDq3hVur7wYs9d/iOkEyhOXbdpNx+XHht59akk8XeHCTYzHLadlqgQ3o2MpSA0vSZiHfeLt/ZRfjY8a0YgNW0Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhcEbq/2; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhcEbq/2"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-389e2950f54so55275081fa.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772400063; x=1773004863; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KJJJcH8qm6uZh9jQolPaSi8lzikW/vGJx9WrRbJtwbs=;
        b=DhcEbq/2zIAqCj6dxXBiUhSokZrkuZPwdIRZtEftowzOHsQNdko+nOFKgGFFncwq+b
         phLmUVFnKKTeJcs8RN4CLUJpyL5kpDjBZGW/QYpxcdSYdtITvcmVm1rP2EQ+Zww5+Jg9
         kAyrq+Qr4ejbEvjcRwmzI91fnxV8D4Igh5xdusAwFh0e93ZhOz5Dexo1IpCrkP8otSu3
         DQOR3dAh+eTOrgQUUSTwBUaq6fcDcRzXd18FlgeSaaCHCDSArIE/pRTuVCLWnr4UunGY
         kbTHWig8sz3xmTd+AfsNkBrEdWUHc7ohghxjO/Pk4YL05Y8SFhPVUTmy0R8f75ozT4b7
         IWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772400063; x=1773004863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJJJcH8qm6uZh9jQolPaSi8lzikW/vGJx9WrRbJtwbs=;
        b=iVphKLAqMNJeKVO2w0Bsyf9ShtrJ3o9NjEqn5DQ/hvECUtNBnoJx5doEbOwHbk2m79
         +dV3acaYWeNG1nvhcBoR+Zs8wBD1+x83BfYwwXZdcbXRp2Ofh94A+ITszQzrcooc/k92
         WWuplGX5jlb6lHwhRwUm/vuvbX/KTdzlwOE2+/lyQYUiFI4dqBUZZOc24E+7kR62ploc
         bP7lW4ezaudGI9dLbdDyypTNWu6VRG3qzQQq6IE2cfQITb6iVMTvXY13AZKXjjnTij5E
         8lMClECmcpJHxzRRU5eD0fNROdYz2sm5wHYtnX/QEO+u3GgW4M0VEFEDj9N5CpDnhDXd
         fbjg==
X-Gm-Message-State: AOJu0Yza3rNIve8JPCRmpiWks5NKJd3aV+4XfWbI6DxkfCHSvxX9+/W6
	HQgnFFrSqPY1OiKPdN5VL6w3OycVcH3CJzHc0RiNJskv1aBfKeE8bBnP
X-Gm-Gg: ATEYQzxUDksnnXYCHMZFxiY+g5dsIN0SlkZonpwQtySOoyfcxRcqeZp5Xij/+0MVVAr
	eR0CwQB+pnDFt3Cm76xkOe2P6m4mJ9taLB5l6js86pfGPVL8Okuad2fq7wMuOp3Tbk5BdbO9qQC
	lAkxUBVaX3xYkYL1u8L3ey4g/Jw65B2hbFqYem4yWE6DHHjyBrCdDMyZyXj6oT9Jcxo7B4q9Ru0
	9im4/sUv8OsJnT/D6z44yUFCfmj73xQtiNN5XQj4Qx48A/8as3rJr5dneohSRDkDNmCybjibraH
	xIno88nsL92N1Nts4oCiMBEwhe6bwXgMjkl61R9DJaDxrVL2CbEFF2hRRkEBNNnNH931hnK0wei
	mNi7cZCDwXYu4n9gtZ/5zECZLOuZkUAtAWZfE4wCU3RS834DQOHMwvb36pZ+kftbCgFu4JPNwTB
	90FOuDYiId5bhNmjlltry8+ll4cIb0TsaRW/lSBwNU9wMX6VBthKxUIYrpVqGo6XGYi+LpPuKmN
	w==
X-Received: by 2002:a2e:9646:0:b0:389:e6e4:3c7d with SMTP id 38308e7fff4ca-389f1e2a56fmr63482001fa.19.1772400062618;
        Sun, 01 Mar 2026 13:21:02 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bc9fd6sm1248587e87.35.2026.03.01.13.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:21:02 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: remove unnecessary else after return in atomisp_cmd.c
Date: Sun,  1 Mar 2026 22:20:47 +0100
Message-ID: <20260301212047.3649-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary else clause after return statement as the else
branch is not needed when the if branch alsways returns.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 9d22ec27ea76..d5c5895e06e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2035,8 +2035,7 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
 {
 	if (from_user)
 		return copy_from_user(to, (void __user *)from, n);
-	else
-		memcpy(to, from, n);
+	memcpy(to, from, n);
 	return 0;
 }
 
-- 
2.43.0

