Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F7033C7
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 17:22:40 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id d7so3442733edn.11
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B+W0ovMUi1rIKA0H93ONQhbPqTAcvMIJLIIKO5SgqwQ=;
        b=IzSY30tgeyKhJuKVSko7726mC81nlvAkiLdzsHO/ZwKLkKoHDRbmlJjHKuYL1Epend
         rs/Aqq7xdrjRZLwegY34CwXuxl2+zVh61xNV32DA/KHraAHU9EAzvpcnemAEyZFKOzWA
         Ofi4K2bGrWCXUsD4ztxL/uwDCjD/DrVAxhzbkXA4JHVsnDmjdR+5jbxUBD2y+6qOlH1T
         Ak+gDSxY//HWNaSnUOcVu/DYS2XZu5ZzwqJtdDXYTZ43H/kYjRFFjb4Duhx51/zG6i5c
         48IZillBqMKk3h4fth3Szwm86RUPZjYhsT3ITtKe7NaleefGYdmauqxXrUrPBBswSsDN
         jLbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B+W0ovMUi1rIKA0H93ONQhbPqTAcvMIJLIIKO5SgqwQ=;
        b=vxEa1S+46Vhd989v2YBj+TDbgcKXdRAQ1NUjbvA1FDJI7e3Z5C9zBpQvMXHPW4Ny98
         26ctQ+IhfNd1WqIJdB4yPkSwUt1X7Ht+vtZtqZGgqSdZN6TFBVJ7uMq6XVXdD1+Spp1a
         ++17Jqh738NRWOFe+2ZwcOsp4ibKiW1zJzwGncnO8EOVR+yKBZIPw+VPcpGCICm9JpA2
         DcZSQSTHMoAoz7/YOEo5N85aZkGzrzIyvbbeHwMLzoBKAgVre91NtdJviqOO7JlcbAqL
         oELIw8BmaUuJ85M+wn7BR4CQdBsRC4V5rwmJYq/Oe3tOQLE1iRTd6x52QHJ9dykhSiwU
         DNBQ==
X-Gm-Message-State: AOAM5323eA2BLrCOkyaBk299OD0WIuWCoBF6F5pwmad3v/k9Purl8h5b
	4dS3dzPIVop0HK+urbuEg3DUV6CjC0Y=
X-Google-Smtp-Source: ABdhPJyV9ip0vEfW8t15CaHBNwMXTEUy7+OTeQqIbWiHb4nBZQ9DWREueTCro87PMdTdruq9R4xykg==
X-Received: by 2002:a05:6402:10d5:b0:408:f881:f0f3 with SMTP id p21-20020a05640210d500b00408f881f0f3mr9857798edu.112.1649265759220;
        Wed, 06 Apr 2022 10:22:39 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id da19-20020a056402177300b00413583e0996sm7912730edb.14.2022.04.06.10.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 10:22:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 5/5] staging: r8188eu: remove unused _RND* from osdep_service.h
Date: Wed,  6 Apr 2022 19:22:19 +0200
Message-Id: <20220406172219.15565-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406172219.15565-1-straube.linux@gmail.com>
References: <20220406172219.15565-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused macro _RND() and the unused functions _RND256(),
_RND512() from osdep_service.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 .../staging/r8188eu/include/osdep_service.h    | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index f6c55f6c9e1a..f1f3e3ba5377 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -94,24 +94,6 @@ static inline void flush_signals_thread(void)
 		flush_signals(current);
 }
 
-#define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
-
-static inline u32 _RND256(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 8) + ((sz & 255) ? 1: 0)) << 8;
-	return val;
-}
-
-static inline u32 _RND512(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 9) + ((sz & 511) ? 1: 0)) << 9;
-	return val;
-}
-
 struct rtw_netdev_priv_indicator {
 	void *priv;
 	u32 sizeof_priv;
-- 
2.35.1

