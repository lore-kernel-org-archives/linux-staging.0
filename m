Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B066FCC
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 13:06:23 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id v1so2648108wrt.11
        for <linux-staging@lists.linux.dev>; Thu, 03 Nov 2022 06:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fxui20KvNriC9XitvtEzDQZsPD1wh2iQuea1gk/77Mw=;
        b=pB//Raqfkxykfv8IuPbNdoswD4V05DPzrriADnM/RRLIyHcvyN0jjiqPuRoH/dQXIL
         Th4Y19P+XSS3Gd9UmX+ipgYtJnfClI2Y8ZFZM1xl0WD95N38b7iK9dBGzZ7oLtCWhOV8
         o4lBfF/z8NDMC7/G1UybmUMM3mTcVRShaQ0FGyOzzAP5wQ8ICoGdM5KhfAjDtVj522jS
         M4QnoXdKc2wIkOCETz1eQXWRN4p1krgK84w0Hj+t43sYhWxqjFDfq4TbmX1g/vSa1Ygz
         ec5GpNt7YfIuY9jQEm66QYVh8KVaUryAyZXNio4i24MEUKvOjrEoxJ0YFHO5bUK9ZSy8
         0ZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fxui20KvNriC9XitvtEzDQZsPD1wh2iQuea1gk/77Mw=;
        b=Ffj+hTUZXCEGVFsD9feRyGB/+YTO8BCJ1InzPojGgrfSmFKXAY6Oc7fQhD5EeJzrhF
         6S0UZJsXSfvPXUvJyR5trQuJdsGZpffNsdGW2lZ2UA4AFjZPmxrGwUpKQgpraZkwOUJi
         y4xdDhhMAHL4cqRsq1cLcw0+ZbGsxfjg749LYQUqNwCDvqyZV3jK+uTaiZPN2WDPpKXn
         647oaV3QM4Jghi7TY0Ut6SShmpHi38cKJ7Z8mKDi0tQRwWd+rV0qyS3utzOuUa8Gi+yc
         QijvY/8Ejn6sIGsRt8qOrUacvwC609+s0G4tRlvF+/zPT9gU/fhm82DJNdkAYgz0hkgs
         oIGw==
X-Gm-Message-State: ACrzQf268M7BqxK6yahBauqAOggGH46jXpffGFfN1KjlnYA36brzz4Q7
	dLJoX60RhJQ4ObebQnFBk28=
X-Google-Smtp-Source: AMsMyM55qyrSvfMGDqYrZzEgYnch4RFuC18ZSjNjhAWLi6kk7whlNNYZmbQFnW2jM5ixRoU4RgKOcw==
X-Received: by 2002:a5d:4008:0:b0:235:a4c4:97c2 with SMTP id n8-20020a5d4008000000b00235a4c497c2mr19201064wrp.295.1667480781075;
        Thu, 03 Nov 2022 06:06:21 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b4a699ce8esm5608162wmo.6.2022.11.03.06.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 06:06:20 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Aaron Lawrence <t4rmin@zohomail.com>,
	Yogesh Hegde <yogi.kernel@gmail.com>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: rtl8192e: rtl819x_HTProc: make arrays const and one static
Date: Thu,  3 Nov 2022 13:06:19 +0000
Message-Id: <20221103130619.78413-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Make two dead-only arrays const. Make array EWC11NHTCap static const
so it is not populated on the stack, makes the code smaller too.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 62aa8e893c34..84ec8df047d7 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -282,7 +282,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	memset(posHTCap, 0, *len);
 
 	if ((bAssoc) && (pHT->ePeerHTSpecVer == HT_SPEC_VER_EWC)) {
-		u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};
+		static const u8	EWC11NHTCap[] = { 0x00, 0x90, 0x4c, 0x33 };
 
 		memcpy(posHTCap, EWC11NHTCap, sizeof(EWC11NHTCap));
 		pCapELE = (struct ht_capab_ele *)&posHTCap[4];
@@ -515,8 +515,8 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	u16 nMaxAMSDUSize = 0;
 	u8 *pMcsFilter = NULL;
 
-	static u8 EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};
-	static u8 EWC11NHTInfo[] = {0x00, 0x90, 0x4c, 0x34};
+	static const u8 EWC11NHTCap[] = { 0x00, 0x90, 0x4c, 0x33 };
+	static const u8 EWC11NHTInfo[] = { 0x00, 0x90, 0x4c, 0x34 };
 
 	if (!pHTInfo->bCurrentHTSupport) {
 		netdev_warn(ieee->dev, "%s(): HT_DISABLE\n", __func__);
-- 
2.38.1

