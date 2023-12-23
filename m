Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A3D8BE0
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GSFGchTQ"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-35d3846fac9so9794735ab.2
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296792; x=1703901592; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jCy9bDHWWDrYNxTyZC3ql2IYfO4Cm2hVECTFukepCU=;
        b=GSFGchTQick+nVWneqm33EYyE4xgLeJcO3j4/K8FTayWWQcFi08rd6NYqIQO32lIp9
         Lfh2Kjj1s41wznkRu/52IyCZWB+DUF063fxf38wKLqILSo7rEhDXKpyNAp5a1uwkM876
         02bJOpx+QMTm1RxdWcuDcZ0fjpNnsDyzlWe+UxZ/IgE8RBG4hVUv3GuatjU+StDXbnIM
         DAfK8JTRsTiwZ0gVbek2cHdH4DtIE9ow9zH6FkVCcV0zkR5HTWlI8cX/VeTsyvRulCi4
         GQFo3lngCAEM9hgpjyb4XF8Bq9lLhP5EV92GTXz02kz8KdJ5iMX8fBnRcLDbocooQru8
         szVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296792; x=1703901592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jCy9bDHWWDrYNxTyZC3ql2IYfO4Cm2hVECTFukepCU=;
        b=EXi6BUNQye36acTETPEkpQhdOTnj6+pMwxrrP9pu6Lgl4rzWYXtgJibhY8wOqn/z7U
         CQGxUMo00qBQTsbAQgjByh1C0TeBpHpzE6FfkqXjAVTf+h/AkkiC8nuN3VgYC5uuwd58
         nI9bI3AxSVhuvYWGaQ8Q6ScKci+rcRw+xTAsdSlz3XOO20fnlWMX9jq++KLDmrsAh5LB
         YySTRlk84QVLSZP4pXvaAmNiqEIHt201LJTKA2mAMUnpr4x1aTZRLRgDbrlLDSbnlmaL
         CHDDYi8Jh5SIigTu2ZgNI+h8nMemMSDyy3kA7TbjlCLGSBQBuNW+4l6pQUmKOoYXi3oD
         9G/w==
X-Gm-Message-State: AOJu0Yzux3Hax2a4rXaa8IoS1CkeGo2w7T4Y9SkTc7nwDwMwUCTW48JH
	Tcl1VTjO3mj46msWRIwJ+nJ3HO7HMx583Q==
X-Google-Smtp-Source: AGHT+IH+XGo4K77I+YRObnabMqaxekoDx5/KWLJjeqrVLRshinHN3xlyzzR+eA/PzfrGiUFYk7SyRw==
X-Received: by 2002:a05:6e02:2220:b0:35f:e26e:979a with SMTP id j32-20020a056e02222000b0035fe26e979amr2359392ilf.38.1703296792026;
        Fri, 22 Dec 2023 17:59:52 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:51 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/20] Staging: rtl8192e: Fixup multiple assinment in init_mgmt_queue()
Date: Fri, 22 Dec 2023 17:59:29 -0800
Message-Id: <20231223015942.418263-8-tdavies@darkphysics.net>
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

Break multiple assignment into 2 assignment statements to fix checkpatch
Warning: multiple assignments should be avoided.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ba6da717dc7e..b55e5759ebef 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -134,7 +134,8 @@ static void enqueue_mgmt(struct rtllib_device *ieee, struct sk_buff *skb)
 
 static void init_mgmt_queue(struct rtllib_device *ieee)
 {
-	ieee->mgmt_queue_tail = ieee->mgmt_queue_head = 0;
+	ieee->mgmt_queue_tail = 0;
+	ieee->mgmt_queue_head = 0;
 }
 
 u8 MgntQuery_TxRateExcludeCCKRates(struct rtllib_device *ieee)
@@ -1911,6 +1912,7 @@ static void rtllib_link_change_wq(void *data)
 				     struct rtllib_device, link_change_wq);
 	ieee->link_change(ieee->dev);
 }
+
 /* called only in userspace context */
 void rtllib_disassociate(struct rtllib_device *ieee)
 {
-- 
2.39.2

