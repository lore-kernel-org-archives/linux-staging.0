Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD0F9C7
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dh1U+ziC"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9c40c3814a8so14764966b.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299034; x=1698903834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5wSndwTs4wiNAVHEpPnvhlAlU5Xl5PBQkAHjBg9fFq4=;
        b=dh1U+ziCh6OrhbHiotuBIHuFOsPioNaEbAP8rotnkKlSbAtPPE0Et3IH/m0/sFrp7E
         p18AjHoA0U82xFiEdmDi3xArbijJZqZXdBiRweTw1KuRT5xW+Yob6s4oeuw4aZ1yau50
         3soqe7R/s7xYHkyzFKz5zCf+JHW87UZMrfemkGsZLRD0aibA5kMXyWIq4nxKt6UnGW5u
         puB23YvJF+Kxm46mscn41Ms6S4nOGXve3U6XR6EFS4X+13OG+Ohcl7sk9ZzNpRuocCaD
         XsStMPrrulVpGbRoh73MBMBsSIA5vCawVK3gDrun6IxAvB6AW9NVtRAhd1ju3Tcuq52W
         CJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299034; x=1698903834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wSndwTs4wiNAVHEpPnvhlAlU5Xl5PBQkAHjBg9fFq4=;
        b=Nmf6eiYlnn2Nq8+tt/0A/cTp3nzLzOBPa5f3D7yF8C985Xg/eQAQ6fEs6js/oAP8qj
         00kRDIbA35PaZsvrD6kXWkHkzc6s4NKsqLq0ZwYdmeFKbcS67UJp/fdZqkkREJtyIjdv
         fZkJbXPCUUydbUlmlZnRv12nW491M6/lc1Gm30x+v86mE0PCi89uGLHTk4Tuk3U0xoEZ
         Xj0I7XxtUdkrGhLFD96z2DgECmRKa1E776+p9XhoiRhh0FFqGSJ05eUypBuHCHTYTsey
         1bKEqKHQB3Q++YraYJ+bIDc5B7y1oN91d2ST1m3MGXjiBydO1qdG2Y8mUWBLsrrr2E2+
         dM6A==
X-Gm-Message-State: AOJu0YwNuGX4EVENIWjppPpZeSwL9xxV2V7jNWv6nVF8MBfyNA61WueX
	zR+VUdl8RsngxWo5asYhJ3Q=
X-Google-Smtp-Source: AGHT+IEe+xOHM3zlfZ8mNcB/5o4ogMmrnmdS0Fh0YR9k8gUEIMdrwfRwVljfLqBwQFHFCiANPCFG2w==
X-Received: by 2002:a17:906:5198:b0:9be:4cf4:d62e with SMTP id y24-20020a170906519800b009be4cf4d62emr6373890ejk.5.1698299033757;
        Wed, 25 Oct 2023 22:43:53 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id do6-20020a170906c10600b009ad7fc17b2asm11101621ejc.224.2023.10.25.22.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:43:53 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:43:52 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Remove HTIOTActIsDisableEDCATurbo()
Message-ID: <904ca224c6a0a1968012e131c0197a71e5b67f81.1698295861.git.philipp.g.hortmann@gmail.com>
References: <cover.1698295861.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698295861.git.philipp.g.hortmann@gmail.com>

Remove HTIOTActIsDisableEDCATurbo() as it always returns false which
leads to one evaluation that is always false. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 3cbadd6a0aef..e607bccc079a 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -207,12 +207,6 @@ static void HTIOTPeerDetermine(struct rtllib_device *ieee)
 	netdev_dbg(ieee->dev, "IOTPEER: %x\n", ht_info->IOTPeer);
 }
 
-static u8 HTIOTActIsDisableEDCATurbo(struct rtllib_device *ieee,
-				     u8 *PeerMacAddr)
-{
-	return false;
-}
-
 static u8 HTIOTActIsMgntUseCCK6M(struct rtllib_device *ieee,
 				 struct rtllib_network *network)
 {
@@ -681,10 +675,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		HTIOTPeerDetermine(ieee);
 
 		ht_info->iot_action = 0;
-		bIOTAction = HTIOTActIsDisableEDCATurbo(ieee, pNetwork->bssid);
-		if (bIOTAction)
-			ht_info->iot_action |= HT_IOT_ACT_DISABLE_EDCA_TURBO;
-
 		bIOTAction = HTIOTActIsMgntUseCCK6M(ieee, pNetwork);
 		if (bIOTAction)
 			ht_info->iot_action |= HT_IOT_ACT_MGNT_USE_CCK_6M;
-- 
2.42.0

