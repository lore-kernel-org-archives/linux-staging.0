Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A945B214
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308312; cv=none; b=alLSM0xqCpYWtanuUjgmOwMx9fEl6/e4yP3eFVMbJ0p6E6TSnC4GO52MubzOzucV/l5GiYVOtkt+SbhuAnesFF83XNcWKayawcRu75JEa8G+yxCAG85JV/wcz1uSeeznkuTkWbMlBximRtYh2kC1ZJAHR5pCFLBJmf3IvDfmPrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308312; c=relaxed/simple;
	bh=vhQTx59EhDp/8Omj8PRaAAdTFVRz9iVZtUgCQ5BU+uY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BBBCsBZAHdSSpCxgy0JDnmnmNfmxZqAbbgEqxXT1sHdpKopD9fOjqyRSRUE+hDwyqIHrgjbSlLp7+lMfVaqWRXjFxytvQwsD/+4xsqys9iBBQjKTImbV5v8eh9h2ckfVAbTEpVdW5nWmAYR/EX9vpJhxbdSdRC6iFWha4GmcMgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=HbC28TWz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="HbC28TWz"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-29026523507so969664a91.0
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308310; x=1706913110; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlVBJtkw1l7si7jTprgt58L/QjOTckkPdtqQKgZ7qLA=;
        b=HbC28TWzx5hjpsTEby4+3Bovy0VvxozPBN6WpinMICxBCZ0oA38iqn8HmyqOprZGbR
         hUA7mNIhvAkapAMXN4ebsw5xtpm70lUGtHvAWZHez1VHSXW16F+hNO1q2c12tcDVY945
         HfE2sApzBIYwBV/te/W4T+9u9Sr1pWDnpXt4x+TWnuNHFxPoXGKuMwf+3SNRS5kNCI/o
         RkFYLqic69kP59tN9qAy5UJ+r8S4M1YJ/1kPui2n2Dj8AgIlRlyoDbbXIH8R4If8rxWI
         aGI1NApmXX7srPQwVK3z1FRd3PYPcOmsT4XkiIt09l9dP3g3BELjuQOccWI3nYqj+NLT
         x7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308310; x=1706913110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mlVBJtkw1l7si7jTprgt58L/QjOTckkPdtqQKgZ7qLA=;
        b=kjvLauIFlRX/C4ppMfxKNmDqFktmHzfnBeLT0z3kGF0vHb3fRNaxM7WowKFvsSQ8Ok
         pnDZW2Vfq7k58hm7j9X39k5HyuMZOpL4l3Se4tjAkV9+EcY0SERQtQN7XzR4gsy8waX0
         ho0tvW01CYiW5O+A3ORWaiQ1C7kktC/3mOMSFzrhJ0ulE2HzliilA+QbPdvARpsNvAgg
         a23enrRNrwjg/doyAHdexFlF6VwdAsdgY/SGvX4cH2WboZXY5x5qGf+yYF/Pi9/keA3a
         uauHPkCk39dg0J3C0RGaPFpbOspUCEf98hiA3Ol5Nb4L0Vtn5+6m9JNeC4Opa7bjp8RF
         plZQ==
X-Gm-Message-State: AOJu0YwIV+2NgcN0iPzqQPgvjiyb3fB88RdO44UgfDbHUuq9VMziyQq1
	Pd+Rj235mB+L2HXKP+FdJt54+HmCBbhpV62SHbdg5snAcMKap3u5o60n1+KkJxY=
X-Google-Smtp-Source: AGHT+IF4CuXSLwk3kOCA4efxj42oBrPzqCRnZnZzDG/Y1fAqMUlIt1QFsdFvcEJ63dU+tJ2KqP+XKQ==
X-Received: by 2002:a17:90b:3112:b0:28d:2a72:546f with SMTP id gc18-20020a17090b311200b0028d2a72546fmr567830pjb.70.1706308310600;
        Fri, 26 Jan 2024 14:31:50 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:50 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 16/18] Staging: rtl8192e: Rename variable LpsIdleCount
Date: Fri, 26 Jan 2024 14:31:04 -0800
Message-Id: <20240126223106.986093-17-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable LpsIdleCount to lps_idle_count to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 4 ++--
 drivers/staging/rtl8192e/rtllib.h          | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c  | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 44a9fe831849..5aac9110bff6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -208,12 +208,12 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 		return;
 
 	if (psc->bLeisurePs) {
-		if (psc->LpsIdleCount >= RT_CHECK_FOR_HANG_PERIOD) {
+		if (psc->lps_idle_count >= RT_CHECK_FOR_HANG_PERIOD) {
 
 			if (priv->rtllib->ps == RTLLIB_PS_DISABLED)
 				_rtl92e_ps_set_mode(dev, RTLLIB_PS_MBCAST | RTLLIB_PS_UNICAST);
 		} else {
-			psc->LpsIdleCount++;
+			psc->lps_idle_count++;
 		}
 	}
 }
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 8de46b61416b..0ca38ca4d3af 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1071,7 +1071,7 @@ struct rt_pwr_save_ctrl {
 	enum ips_callback_function ReturnPoint;
 
 	bool				bLeisurePs;
-	u8				LpsIdleCount;
+	u8				lps_idle_count;
 	u8				lps_awake_intvl;
 
 	u32				CurPsLevel;
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index e47292455585..a7e7a0b0214f 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1079,7 +1079,7 @@ static void rtllib_associate_complete_wq(void *data)
 		ieee->link_detect_info.NumRecvBcnInPeriod = 1;
 		ieee->link_detect_info.NumRecvDataInPeriod = 1;
 	}
-	psc->LpsIdleCount = 0;
+	psc->lps_idle_count = 0;
 	ieee->link_change(ieee->dev);
 }
 
-- 
2.39.2

