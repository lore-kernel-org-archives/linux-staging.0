Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5977312E1DC
	for <linux-staging@lists.linux.dev>; Mon,  3 Aug 2026 01:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785721829; cv=none; b=J8W2U9+0V4FWyR5pu0gt6CLQYpylpWxmGH/bJTqGrI/mFdSrmuec8fO9ZEkmBsQGaI5bwy+O0WRju1cKlh9ct94vuzwp2Ef9cieAt1HmQ+qj8SsCVaK85yZxChpmsRDvzO6GkEZXPOlWAw10FgWCbQFwnCBNXNokJsDpIitMHaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785721829; c=relaxed/simple;
	bh=9GYA66M5izNQ+lmYTwCS6CpBRaxyGuD+HrQE4+e9T3A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uCr+maX+KUXh16d8KYTvC4JzNu/zqS+pf8tXKvadWltq8JV60aUbHPlIW83Zw2LHv3cEdq8V2aXB/1yH9U4jUm1oMeFP0KCilGWh001lMgM0eDd766zTRqSOlBK1zAFtl0ZarftR10AaqeBtcap6ptjdbz22wh42u3bHdzpiCJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUIsZSUH; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUIsZSUH"
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-967327a0c7dso606678241.1
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 18:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785721827; x=1786326627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hBM1xh983Jt0oN19DesskoSQPz+kcOsiTl8GHz05Qus=;
        b=QUIsZSUHWmEeoaOXt5rndiG0mBELkJ+FlkhJBMHdV0P5whZgx9L4ED+PcSGJPmJYbE
         cno/tZiaQnmd9+nj/Y7qsrs45xNdbr+SzvRIBJT3qEbG7ZorDjs1EY5sh2CRs+Q/Er5Q
         mNsRR4MQciu8GGaY1nPpFAdqKR2mKwFxWxFwkGChCL/VTeR++0NMp2/61nhbzliqtFaL
         4OcfA/BgThOyskpYN7QXZda8mhVxRiAnD2aMpALI2YznwIg+ujYnT0k6M4GCcwYOb1I0
         duzsEVnul9IYlRqQtMaaJerZml1ggWTnme6loUXcWHsfK0J9Wo/E8huwQyIVW8YrhUhr
         qgkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785721827; x=1786326627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBM1xh983Jt0oN19DesskoSQPz+kcOsiTl8GHz05Qus=;
        b=I+Kc93jrTdiyjs0ClGMHFHVAjmdLX2XsgZ4entoLrc/4X5+DGXnTqBowgS/3Kj5wmG
         u4BTMoDf3b/RHUdhYl/2xIhguSUzz+anRWYBppk1l16lt9znT1JoOXdPpuvzgS3AP25m
         C1BlpDUaJgHNKMHl4wXoCDeowa+WhBPikrm11ydBeuH+OPiGLvxsosYLvyZ0zyla6d8M
         WsfPLetBvwUUgPc6Dilmus+xJ5UTnuRxMMijv6lNy/b+8ZXpsCOfOW1FiRtf6w45ygpT
         YkYyLFqwCaPQxs2vTap9R4bjK6zGIaiOAWM3PzgYBZSPVBXZNNjq3UT+cv5HWFB6C+Am
         hARg==
X-Forwarded-Encrypted: i=1; AHgh+RoKo32gBN2nSgXCe8L9Kb70k9lim7glNKRUpKSQCnlVLqY+je2sbQyUQHayjRm67/pb7zf9clkfW2OBFE34@lists.linux.dev
X-Gm-Message-State: AOJu0YzjYgrBEjXDvcs4BRJsBirKW6ufancGuJck5sDniwvcShkM7mno
	fUiI9LGZ57NiTLKmD2thICLdCMu7qxt6Q3VPYXEF5XjiM5i+HuCd66Wo
X-Gm-Gg: AR+sD13csC0kbuQhf93WplCiwB6XSUYL4/X9+/cDcgvuCTuVVlthAXFu6UBmrJxbq4Q
	otYKTi8XZYd5xDixwCxxOwHgslxIeK3AxbJLSmDhk0OHEjsMkkXR2wuMr4pnW91YLhea/Ms3BOt
	4pIJJSND0+f6jRjVXXyFYznpYYmHQ6UsvhOO3V1N40a84HAxj81fS7y/RKNhx6cUEB/H2hHFPtt
	kwTgCioJEdQ7o3ujji3hDwilCdizojANKsPpX0rfap9SMHuuR1Wd+h3Zb6F11umRVfmCecEt3dA
	ekalvmoeu771OvEsBmhp4xz/uy0IIqYL/wTwV6rNCjLp+O8gK+VIhGAMjZj5arLPSGS5u1S6zls
	Y1w6mJX9GxRkNULdE9rC2stC1ElD9QxW0rgmhi1iHlTN2jZIFCcdrT+ka8rcpCfe7wzcIzhI3py
	l47Kq0Q1cHRSmwM3rlgfoh2mgkXA8Fc6/aUqop+3ruxUkU0OhAhzNg7R4cJFvuhqYAqxByhUKQa
	oSchTHprH8pYCGRQ3UDsYDeBkfldFEMRWzQvTz45Bx2jA7YRw==
X-Received: by 2002:a05:6102:3f55:b0:747:4d96:dbb5 with SMTP id ada2fe7eead31-75b23a6198emr6114264137.12.1785721827194;
        Sun, 02 Aug 2026 18:50:27 -0700 (PDT)
Received: from NoahDesktop.tailef97f4.ts.net ([66.231.155.87])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-977e6aa5d2csm5473711241.12.2026.08.02.18.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 18:50:26 -0700 (PDT)
From: Noah Techoueyres <noahtechoueyres@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	Noah Techoueyres <noahtechoueyres@gmail.com>
Subject: [PATCH] staging: greybus: loopback: Fix argument alignment
Date: Sun,  2 Aug 2026 21:50:22 -0400
Message-ID: <20260803015022.534-1-noahtechoueyres@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align function arguments to match the open parenthesis
per the kernel coding style guidelines.

Signed-off-by: Noah Techoueyres <noahtechoueyres@gmail.com>
---
 drivers/staging/greybus/loopback.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index ea57b1f5d156..c33b8aa5871c 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -679,7 +679,7 @@ static int gb_loopback_request_handler(struct gb_operation *operation)
 		}
 
 		if (!gb_operation_response_alloc(operation,
-				len + sizeof(*response), GFP_KERNEL)) {
+						 len + sizeof(*response), GFP_KERNEL)) {
 			dev_err(dev, "error allocating response\n");
 			return -ENOMEM;
 		}
-- 
2.43.0

