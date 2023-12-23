Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2349CA6A
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="DTyW0UhE"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-35fc16720f9so9843155ab.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296794; x=1703901594; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NjGy0qcS0bsjIhVMCVvxHQecehCic/YbYj9/FdJmdRY=;
        b=DTyW0UhEGPwLmCZThWMAqUbyImQYlANz5WBnjDoVUgPuVfDFK4xtTGvNAc11jLAhUC
         9NaSqLhreh/LkQIgZr4buGOMLATe8gGr6tnKviDvCx2pUsN9wDHKpSem010vtn93FkgG
         m6zXy6wpCmYk2I3I10RN3y8t+hdnGI8sk9IOYNI9DWkcLei0n7+EgfQRfbqfIb5MEdq9
         eMCufe9gRn5tqe9T4XUIuVdoExyZqIAa+R34gxk/Y4KVpVAwdz0EEB2X2EQKhMlYrz8N
         PY74x4ux4UX+CHCXQXGKhg2p5/rESAfnwcg9xgNmYGomw+wl5VI3pn2tpHmfpQ8NYAuM
         J60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296794; x=1703901594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NjGy0qcS0bsjIhVMCVvxHQecehCic/YbYj9/FdJmdRY=;
        b=eqQc3U+4T3jYSjWfwkcGRsy5nLxWAzgo5JWTsigwj84v3fRwTv2JQ3aLhkRP1+4bRv
         A9P4wact9+WZwpY9UuDrEaq0Z2jB7Vs+x0RUC3ahKaDV2w+GFbD/Jp1HN9ynAIaCSL7u
         fe3xmkbJEEBFbIfcB1EOxlIwF69Of4m8j/FnMc6vK76R3P/V8yHjNt2R5iaHDBjG6ajp
         NhI1PPQa8f8dvUTvWltnZ1kktY0Ij2R+9yeFV5JhZM8Uw4CGet6ediQcOriLZAIIoa3S
         Sq3q4h9HjjvKI5oO5Jfjf3cnLmgZFitWFuA1aCVA8dROh7XkUDQ7366zIBu+2PnSx4zj
         RIcg==
X-Gm-Message-State: AOJu0Yyz2IOat8O1hWF5EEPpxdr5bgYgNc8JDwt2QF95uaB02UNlu76D
	phdzR3euEe7n7qqLDYYxoBBCMg0XQ0NOPQ==
X-Google-Smtp-Source: AGHT+IFb+EqECbvZXq6Y+Z2dVfuuaR8f5NH3+choZ3UkB0RM2XWddK8HAlyjltbFCIBQv4uJ1LDXOQ==
X-Received: by 2002:a05:6e02:1888:b0:35e:6b97:b8a4 with SMTP id o8-20020a056e02188800b0035e6b97b8a4mr3249746ilu.4.1703296793927;
        Fri, 22 Dec 2023 17:59:53 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:53 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/20] Staging: rtl8192e: Fix function definition broken across multiple lines
Date: Fri, 22 Dec 2023 17:59:31 -0800
Message-Id: <20231223015942.418263-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Join 4 lines, so that function definition resides on a single line, to fix
Warning: Lines should not end with a '('

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 3788e9fb0ac0..49ac73320fdb 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2267,11 +2267,7 @@ static void rtllib_MlmeDisassociateRequest(struct rtllib_device *rtllib,
 	}
 }
 
-static void
-rtllib_MgntDisconnectAP(
-	struct rtllib_device *rtllib,
-	u8 asRsn
-)
+static void rtllib_MgntDisconnectAP(struct rtllib_device *rtllib, u8 asRsn)
 {
 	bool bFilterOutNonAssociatedBSSID = false;
 
-- 
2.39.2

