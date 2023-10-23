Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7AA6FAA
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT1jbiG9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53f383c3896so867672a12.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043238; x=1698648038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F8Js+K75dwM2UqnvWvlit1BEMnTsZVyd0yFufnZLxQg=;
        b=dT1jbiG9JPXXpps/FZEi019a2iQ6hq+EKJUxpINAMnb8Uv7HObBmdDmM3zkTlx/Gb0
         Ani7qZBl7quWEKV35D1r9HJy7qcBShd5b3vqllV1FNJc32+ZL4riQmcRKd1k3vKiQ4hz
         DX4EmGtM8Fia0TBp4AXlBX3bWjZXgxzXWKDM165kvNI3UJitisBMnquA82e6cprXZPV3
         tWsjiRy9YpdKPvuevK4V606lUgnXaOx6YGS7TAwUdw7U0Aj6lH69DL/O+ps/6bY/NEq1
         hLxtOwGstWmVtU15I1f1zgD7EbG0jybGMXMwiNG7wLV+n1sgL1I9wUX8XqraXlNmSwIu
         JOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043238; x=1698648038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8Js+K75dwM2UqnvWvlit1BEMnTsZVyd0yFufnZLxQg=;
        b=Rmg2g3MEA376xGPQeg4vN84+m2XgK60EfwtHNnDV6iFUv0iR1AfKFjmTwT9hxTK9c2
         LGdL6OJtgilyMyLHgxlGW+kn+cQ008+fl7w5kzePVrmjjRLQouvbkPpKvXqHsAgLN3uI
         Zhs8xjCz6Le7Dvt2bvz40+ie3yZKH+jh0wz8L+QrFKXkEp0UnBC/OlcX7KSbft/P+h4m
         HVZ1rLaL8wZ2DXftUFZ6nXHf4nF8OhaScBwZYOAsD5ADGtJn4KPbwLIBBSE89yx0bgpX
         bUDI6vgLUoaFEBigiftgpZYIL1WmOKOlWepnKtNygnVsMFVEJsNltRRkhC0Owd0F/hg+
         iFTA==
X-Gm-Message-State: AOJu0YxWQtR3KuAOP7OIbfCnJ2BTgtAeusYh9L+hx82CtqJ/Pv3mtYnY
	QdP4X9OwnLjkGzdXPhIfI4NNo8QFmVA=
X-Google-Smtp-Source: AGHT+IGeNxy5iZyPzydLlwqRkupI3US48jdW+Lm2LCjHSfw5WfIbtXsOBr6EO1UyXcxVp6+kZLtaVQ==
X-Received: by 2002:aa7:c592:0:b0:53f:ca25:c580 with SMTP id g18-20020aa7c592000000b0053fca25c580mr6075622edq.1.1698043238550;
        Sun, 22 Oct 2023 23:40:38 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id s2-20020a50d482000000b0053ddbfa71ddsm5874405edi.47.2023.10.22.23.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:40:38 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:40:36 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] staging: rtl8192e: Remove unused union qos_tclas
Message-ID: <7e4d32fe7a1219a9131ce49308f68790e07fb83e.1698042685.git.philipp.g.hortmann@gmail.com>
References: <cover.1698042685.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698042685.git.philipp.g.hortmann@gmail.com>

Remove union qos_tclas as it is just set to 0 and never used.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_Qos.h    | 50 -----------------------
 drivers/staging/rtl8192e/rtl819x_TS.h     |  1 -
 drivers/staging/rtl8192e/rtl819x_TSProc.c |  1 -
 3 files changed, 52 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_Qos.h b/drivers/staging/rtl8192e/rtl819x_Qos.h
index 9a9ef5fef6e0..f547de4c1da3 100644
--- a/drivers/staging/rtl8192e/rtl819x_Qos.h
+++ b/drivers/staging/rtl8192e/rtl819x_Qos.h
@@ -30,56 +30,6 @@ enum direction_value {
 	DIR_BI_DIR		= 3,
 };
 
-union qos_tclas {
-	struct _TYPE_GENERAL {
-		u8		Priority;
-		u8		ClassifierType;
-		u8		Mask;
-	} TYPE_GENERAL;
-
-	struct _TYPE0_ETH {
-		u8		Priority;
-		u8		ClassifierType;
-		u8		Mask;
-		u8		SrcAddr[ETH_ALEN];
-		u8		DstAddr[ETH_ALEN];
-		u16		Type;
-	} TYPE0_ETH;
-
-	struct _TYPE1_IPV4 {
-		u8		Priority;
-		u8		ClassifierType;
-		u8		Mask;
-		u8		Version;
-		u8		SrcIP[4];
-		u8		DstIP[4];
-		u16		SrcPort;
-		u16		DstPort;
-		u8		DSCP;
-		u8		Protocol;
-		u8		Reserved;
-	} TYPE1_IPV4;
-
-	struct _TYPE1_IPV6 {
-		u8		Priority;
-		u8		ClassifierType;
-		u8		Mask;
-		u8		Version;
-		u8		SrcIP[16];
-		u8		DstIP[16];
-		u16		SrcPort;
-		u16		DstPort;
-		u8		FlowLabel[3];
-	} TYPE1_IPV6;
-
-	struct _TYPE2_8021Q {
-		u8		Priority;
-		u8		ClassifierType;
-		u8		Mask;
-		u16		TagType;
-	} TYPE2_8021Q;
-};
-
 union aci_aifsn {
 	u8	charData;
 
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index b63edb815902..240e808fc4b2 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -21,7 +21,6 @@ struct ts_common_info {
 	struct list_head		List;
 	u8				addr[ETH_ALEN];
 	struct qos_tsinfo TSpec;
-	union qos_tclas TClass[TCLAS_NUM];
 	u8				TClasProc;
 	u8				TClasNum;
 };
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 96022c5ed60f..7151827408b9 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -95,7 +95,6 @@ static void ResetTsCommonInfo(struct ts_common_info *pTsCommonInfo)
 {
 	eth_zero_addr(pTsCommonInfo->addr);
 	memset(&pTsCommonInfo->TSpec, 0, sizeof(struct qos_tsinfo));
-	memset(&pTsCommonInfo->TClass, 0, sizeof(union qos_tclas) * TCLAS_NUM);
 	pTsCommonInfo->TClasProc = 0;
 	pTsCommonInfo->TClasNum = 0;
 }
-- 
2.42.0

