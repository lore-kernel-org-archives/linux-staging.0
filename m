Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419A1421895
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 20:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667546; cv=none; b=fXwuhVh/5aOUYu1uxjO/3PEIadG7JG3GrJxRHxvf3teOQTI8kbc7O7rp/GCi3cu518Vr9Zlf9T+nTc+t+XzHJhD0NBfJzalt3J+1BAfnUa0w6hgBDrlANC7iXcKCUN30IBVYTW7u/03+2alAIvx8/TCCvrxL3uyCra1YtQ8JOwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667546; c=relaxed/simple;
	bh=MtS6nAIQSSr1b5p7SrNkO8W3fz1QDju+1xTmmOaCJEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QHM9XU8mgAvCBZcknMTGTNVZ5LZQy/uIcnfBWQ6kBklM/hNEkMur/Z5pXNnDLVjmRhYfsOCBmtr0gNQpOk+Wor6sogE+QBDyfg1eJM2FGmq2ParihNcmyW0GqcVM1wjNrhHg+PiT6CyoU7kKyPEk+qhaP1cojShFRdPrxkGid+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmSruBIh; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmSruBIh"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-3614826eca4so2383200a91.1
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 13:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777667544; x=1778272344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sqGelvPZUgx4Znwd5wNv3ur/Y5RhM6vBNkGaz4GDGE=;
        b=WmSruBIhfqzFypx1rLbZLfojEiC+oEQVYOiEjxC+1vjwpFU9lWjSbQ2Pf5AA5QlAyE
         FDWfNfMvlFgo53jHbFUaPcRBHo/2tCBCAxWJ4qp+Kmr2lmuv3Dsk0RO/jcF1+DrL26L3
         NuPPxMK2W0EP+KoC/XPjEuumjmuVX3+vh2/g9U+/JMKUXGiNgVlS/V8tBaQURYZsdSsY
         VCVNGLbyFAosn3X6+r3APP/5yWVPILXlm+PDTVj7AIABksCxOAl2/9RSv204EB+7rrg6
         qzgdSUaCy9LiAehtstlPylEIctDk+qPUu6P+Swm2Q+Uu0g7eiVa335DIBPpZMaFQEwGr
         5Jiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777667544; x=1778272344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3sqGelvPZUgx4Znwd5wNv3ur/Y5RhM6vBNkGaz4GDGE=;
        b=i7TuWAiC+IPFQ0gv48LquQwPDXS/nTmpJa1Uh/13nIqe0xfwJlHzTsriOHICVfg1B4
         OlLBqQGHlG2+MbqKPUxsEtyw9jGaEhLijnDKu6c2TaiSTpSuZnP46AgpOIF/pSvAnXtH
         FpJIqGffXwuzavI7xKzIjenE11UYZLRcO68PdRqj3U2W0yFkVHugXadf/dAIHN7c0EFz
         5NGMjljAXAit5I5eCKiRmC3BO0Z96CbUV3Em/NivQMptbTYYo8xZ669CkL5HsTZ8K6aP
         vOJz17FzfX3mjduM53/1bw2SDC9Z7AM1RJFjXg4bkM40s+xlv+Twnj9kI5ROuow051Ni
         e5tQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6ldLxCxVEtZ5YYc3mqolFZakPVEKoE1Dgy8d8S21FeERNU3FHrQtM0uluoDfRobGumhQdhTgtHf5PldFG@lists.linux.dev
X-Gm-Message-State: AOJu0YyCmoGwX67+OHmwIu0LunL5gyZxhIKd33n4svuVs3lUxtMhd26H
	79V/rnSKllLfeHsNxA68wPIZN4TNib0mKwacrC2n7x6sPzpmCJlHMyV8
X-Gm-Gg: AeBDiesRNbHjHGqaMIBsWL0mxspW0rTHChWPuFv102pV6v2w3cW605DDsM7bjaT0yzU
	NwMtaNvnuIoDPQOcuTAjT9MEXbL8PtPd4iJHJ6k1Y5dFvzDsP+iOKvIwPD9btFL52l1JsQL3bIu
	gDuWXrUAKqXoJhpO8FWOaP/B6pcCiD1d9ERJMc1kwRvc/aCVwIO5K2ZotYLfhTR5pgkg4dAUs2h
	lTtB4gBCWZ9cKvXo5pYjwtpBY88Jm2qVO1ZwpR76AiJ0lnW2wKbGiTDyXmVrTYXMSlZOn2V/zdO
	2EyF3ClA05Sdoxx49LRfwMLmK/rEbV6E26ZswYIMegqwQY1lX9fvLOFzcJRbwR+jjqlZe+E9IQD
	ZHhk26mIb/XhL2jkrwCqKfyosImiu0uAipk30l/eptwv7/Boz4B0he0G1IXJr7ILJHr9QJrbWfk
	KIt4IAmVse66TqUfEXCwOMhLor+z7nSJ35nPGHa2E6blxmUKGGQw0=
X-Received: by 2002:a17:90b:4fd2:b0:361:3224:2f65 with SMTP id 98e67ed59e1d1-3650cd8beb5mr683467a91.3.1777667544530;
        Fri, 01 May 2026 13:32:24 -0700 (PDT)
Received: from horstaufmental.lan ([159.192.179.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f47f1f67sm1306071a91.4.2026.05.01.13.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 13:32:24 -0700 (PDT)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	ignacio.pena87@gmail.com,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: add braces to if/else arms in rtw_efuse.c
Date: Sat,  2 May 2026 03:31:20 +0700
Message-ID: <20260501203121.227992-2-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501203121.227992-1-horstaufmental@gmail.com>
References: <20260501203121.227992-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to if/else statements to comply with kernel
coding style and improve readability.

No functional changes.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 099320e4eb50..7600b723fda3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -76,9 +76,9 @@ u16		Address)
 				break;
 		}
 		return rtw_read8(Adapter, EFUSE_CTRL);
-	} else
+	} else {
 		return 0xFF;
-
+	}
 } /* EFUSE_Read1Byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-- 
2.53.0

