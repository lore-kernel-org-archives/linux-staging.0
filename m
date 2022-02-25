Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E8F1FD0
	for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 12:09:05 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id d10so10404273eje.10
        for <linux-staging@lists.linux.dev>; Fri, 25 Feb 2022 04:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GENNLaQhNZpnjjnz6C1PcYTzISYUuvw5z52vl9WFlyg=;
        b=l+HEuc36ChZ+EJy3l9Z5lwsRxjWcJGD23wiQXMPhnlRZ6EZ6LjB2SrV6v6hPNrcj5E
         9UKOz93KGaBgkKyfg2buFRE5UuvIp3iBRzdky3Og4Hpv/np7dil/FppyB/Iw5eqaupN2
         mB3Hso+pC1ivFr+zdKrMxEYE0WM3Q2SpV/MvhilHorEqQcCrJmKpjRouSjqeyZfVKmkQ
         kYZDeXi073ryB5NvFOsvKQgphbo5mt652Ka5BPUHldBT+bpUs7AvylI4seu2VXfUCXMF
         glcI8gnrEkwwkBLLlHH1Lx+6UvF+epjfuM12Qp2thJPbR/8VoUpp1iHnO6V6StChbeCX
         GkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GENNLaQhNZpnjjnz6C1PcYTzISYUuvw5z52vl9WFlyg=;
        b=1whx1bCNRrpWj1CcElgRRqGvu+MHJYESeB9N8b1NP+1TjObwJFoDbsazotP2wClOgv
         0ym8FYQyaZj41xV7MTQna4zWchbg9984cPtL6o38BW6wSSsBoKkwwo1l3fLt2rwFdmS3
         5hw8pJT7qkXkR5Cophgwwk8D1h5MzwJuHeMqFAqkIMBWWrsDlXn6ekrhp80oyEWBv5Eo
         hEAFvPOA2RvPcBvoxlu5k5/uo6AbytM0+mrJh3TJeK0OGQvnkyL/JMaeZm3O4ZdWlb38
         MK5QzN39CCKcA5nK6C5NoWhw8G/u5/q8eFbsA+YYUxS79Y2G/hXtw2RddpOHngLyEpQn
         69XQ==
X-Gm-Message-State: AOAM5309NkZEuVQgB8ldLHGBNP4Mlvqj20rp94yWUA5gbbQW2DYRLrq3
	KfMwl29BUOzHONIlj8K9nsw=
X-Google-Smtp-Source: ABdhPJzkd3ES32Z7qBR4343VTRkejdGJHQr2pHRW66977S7YfesYu6A6Y58JDxjeg+P5wGO5D6m1og==
X-Received: by 2002:a17:906:8681:b0:6ce:d45f:1689 with SMTP id g1-20020a170906868100b006ced45f1689mr5768356ejx.183.1645790943867;
        Fri, 25 Feb 2022 04:09:03 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8d.dynamic.kabel-deutschland.de. [95.90.187.141])
        by smtp.gmail.com with ESMTPSA id y14-20020a50eb8e000000b00410a2e7798dsm1229418edr.38.2022.02.25.04.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 04:09:03 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: remove update_bcn_p2p_ie()
Date: Fri, 25 Feb 2022 13:08:42 +0100
Message-Id: <20220225120843.10674-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225120843.10674-1-straube.linux@gmail.com>
References: <20220225120843.10674-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function update_bcn_p2p_ie() is empty. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index ed66331de319..2ff78ed1faab 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -613,16 +613,10 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	kfree(pbackup_remainder_ie);
 }
 
-static void update_bcn_p2p_ie(struct adapter *padapter)
-{
-}
-
 static void update_bcn_vendor_spec_ie(struct adapter *padapter, u8 *oui)
 {
 	if (!memcmp(WPS_OUI, oui, 4))
 		update_bcn_wps_ie(padapter);
-	else if (!memcmp(P2P_OUI, oui, 4))
-		update_bcn_p2p_ie(padapter);
 }
 
 void update_beacon(struct adapter *padapter, u8 ie_id, u8 *oui, u8 tx)
-- 
2.35.1

