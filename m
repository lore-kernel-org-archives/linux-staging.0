Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D907C;
	Fri,  1 Apr 2022 11:46:40 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id kl29so1808135qvb.2;
        Fri, 01 Apr 2022 04:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=tj0eNhKFTRgfzMUzArZlhD6QnaURQ8wTdtssetTRosY=;
        b=KzIzeaYzf4tIG+9XJ/8/tTFusg2jVfudxBBaoDpAzW+mgKn1Isc5QsPfXnbq/Nx09r
         3R0iEkoClUBuQFNcUwmc11x+5P59EpMjMvD7Fi3aUe1EizO5WpGG1xS2naPg93vYAhfM
         7U/WNhMOIWIKkyqGOscZIRBiH7zToF/h9D8/mg89LGQPwC4Xr5eNaqSl34+EfGTFcYnR
         mpHhDgxZ420NyYluQgv9t0u/JcoHwZ76WpPKxS2xmBWWHl8bzSZqCKGEZXpQlynI1hwi
         XBqV/GaS5foi34EvogInHcl1rdyYfazPUmw5Tj6hClhKjVtPD22ypP2+OwpNlMk63fWE
         jXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=tj0eNhKFTRgfzMUzArZlhD6QnaURQ8wTdtssetTRosY=;
        b=If0Qxt5OjGKNB3s/SV35tQEu056o824wDYxjsMbPlPxyIOBUt30aTW4qLV5VTMdYLO
         Cshmp9wrHkq8zkjfQwSUXomaUFBXHh3ohxxNIVT5ZdeYr0rgdczxJcZC2/WA4J+SuV0G
         huEg1R0le2Xja3ErG80eekpBHLIfa0R3+qEef5O747mAzo7UEh3yDAha1h69Z5F1yNwZ
         6YfpeaR289KE0kLj7C3nbEG92A0Ohfcd8lHhCiWWTKHo64InYpUWvJYb6rLsG8xBzrLx
         MavEuz4YHunYY1vVogjugdPbicMgzjoK4wZSxBWQu1Q0V9C6rUqgRFFutvQQKV5r6UsP
         UaDQ==
X-Gm-Message-State: AOAM533mWkQIvOYOHduFcKWR/sr/Xu9TFMNaxzocS9c9Qgh1N9MI8Hir
	TvWTHigqxZm1CtXJUwzQsiI=
X-Google-Smtp-Source: ABdhPJw7758JWF0PuLJ7DJ2/46WviL/79JThXVCdP5eGNfwJtsO3e6//YTHB906fnz3tmqICDZdc4A==
X-Received: by 2002:a05:6214:400f:b0:441:2cd7:9cf2 with SMTP id kd15-20020a056214400f00b004412cd79cf2mr7385441qvb.111.1648813599101;
        Fri, 01 Apr 2022 04:46:39 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id s12-20020a05622a018c00b002e1cd88645dsm1669422qtw.74.2022.04.01.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 04:46:38 -0700 (PDT)
Date: Fri, 1 Apr 2022 07:46:35 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: simplify control flow
Message-ID: <20220401114635.GA567659@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The function iterates an index from 0 to NUM_PMKID_CACHE and returns
the first index for which the condition is true. If no such index is
found, the function returns -1. Current code has a complex control
flow that obfuscates this simple task. Replace it with a loop.

Also, given the shortened function body, replace the long variable
name psecuritypriv with a short variable name p.

Reported by checkpatch:

WARNING: else is not generally useful after a break or return

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 28 ++++++-----------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index d5bb3a5bd2fb..3eacf8f9d236 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2036,28 +2036,14 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 
 static int SecIsInPMKIDList(struct adapter *Adapter, u8 *bssid)
 {
-	struct security_priv *psecuritypriv = &Adapter->securitypriv;
-	int i = 0;
-
-	do {
-		if ((psecuritypriv->PMKIDList[i].bUsed) &&
-				(!memcmp(psecuritypriv->PMKIDList[i].Bssid, bssid, ETH_ALEN))) {
-			break;
-		} else {
-			i++;
-			/* continue; */
-		}
-
-	} while (i < NUM_PMKID_CACHE);
-
-	if (i == NUM_PMKID_CACHE) {
-		i = -1;/*  Could not find. */
-	} else {
-		/*  There is one Pre-Authentication Key for the specific BSSID. */
-	}
-
-	return i;
+	struct security_priv *p = &Adapter->securitypriv;
+	int i;
 
+	for (i = 0; i < NUM_PMKID_CACHE; i++)
+		if ((p->PMKIDList[i].bUsed) &&
+				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
+			return i;
+	return -1;
 }
 
 /*  */
-- 
2.25.1

