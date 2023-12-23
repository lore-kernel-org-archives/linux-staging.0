Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EA96AA0
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 07:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iq0g6nat"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bb53e20a43so1989162b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 23:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703316173; x=1703920973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNfo77EiD377cQ7ylz3OMNqhiLCn7Bf56izU6yp9keU=;
        b=iq0g6natecPE6TEHd6mDhLUHiEpMKdKU6FazjxQ5tWUK+uIYSqdm+P6jORfQHbKXRc
         Abdy/Ru6A3pq9lFoz54BefyDIXM+ElR1Iq5e1MetiN+BammGxPy7DPqNsBiOAo9MXQto
         yMZsrV55HAlj5ImFgD5miisMaxadz7vldw8cB/U2bkL8xrZ2eTDWYuYvIgO9T9Qd/eqL
         0zju17JjbaxyhDKBVQXta6k27jKm/9HXz6VLIncGy0SLoXmkHm+Q8bpxB/DoyGyCYX86
         A4LwIvYJcPw93omQ4pJ67w7kyMEWar/E+umJnNTNBaiUU1hch6vxJ84RlGe4lDV99FX6
         nOFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703316173; x=1703920973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNfo77EiD377cQ7ylz3OMNqhiLCn7Bf56izU6yp9keU=;
        b=WFnt7bEnE2dko/dY2o3w4nMJx66+xDhypzDHKTv3kzZdRJM3G1xtDpNcTVfkfudT7J
         zO0g9SvvFKn4Ixi7W51VFtyi36wMmvxNXFt+Fuz3SXxC41H7OcMyhchFDwgh0vMudGib
         LEz6SNWsC3sf9ce1/6j1iMuZueWFhH2H6wd/9mwNA0hxzycz6FPjqnzB8lkBZOdX7BVy
         reNE8ooaAxcnUHxnJBX9SNtzQjIzr7sNGP2/J/1M5F2PEwWPMLB+zc/ii2eYyu9qbWa4
         6ZYbfbdDjz1i77cNLA2cmfT08XITxbH8rF5BnkH16LpX+HTyA/PlwlqNUK39/w6Aopmz
         vMeg==
X-Gm-Message-State: AOJu0Yw+lL5s255/Hinsse+Q0ma3qDh2QPxmwKkaFlO/F/uCu9i04gL1
	QF871i18cWpA0+XzxHnaqyc=
X-Google-Smtp-Source: AGHT+IFF55fkH3MfEXKsaer9jFXCaeNRv3FjwluAYkN+PJH68bnw13o1BXJrd+HUY1f+AsGNJCeqqQ==
X-Received: by 2002:a05:6808:318b:b0:3b8:b063:6ba9 with SMTP id cd11-20020a056808318b00b003b8b0636ba9mr3481308oib.88.1703316173647;
        Fri, 22 Dec 2023 23:22:53 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id kt3-20020a056a004ba300b006d9723c0373sm4241378pfb.33.2023.12.22.23.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 23:22:53 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/runtime/rmgr/src: Fix spelling mistakes in rmgr_vbuf.c
Date: Sat, 23 Dec 2023 13:07:45 +0545
Message-Id: <20231223072245.81630-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in rmgr_vbuf.cas below:

'''
./runtime/rmgr/src/rmgr_vbuf.c:201: succes ==> success
./runtime/rmgr/src/rmgr_vbuf.c:211: succes ==> success
./runtime/rmgr/src/rmgr_vbuf.c:215: succes ==> success
'''
This patch fixes these spelling mistakes.
It is good to use variable name that gives
proper meaning and spelling error free.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 2e07dab8bf51..1f24db77fe38 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -198,7 +198,7 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
 		      struct ia_css_rmgr_vbuf_handle **handle)
 {
 	u32 i;
-	bool succes = false;
+	bool success = false;
 
 	assert(pool);
 	assert(pool->recycle);
@@ -208,11 +208,11 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
 		if (!pool->handles[i]) {
 			ia_css_rmgr_refcount_retain_vbuf(handle);
 			pool->handles[i] = *handle;
-			succes = true;
+			success = true;
 			break;
 		}
 	}
-	assert(succes);
+	assert(success);
 }
 
 /*
-- 
2.39.2 (Apple Git-143)

