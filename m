Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88B6116
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="acR20lzi"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bb8f3d9f98so791629b6e.3
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296791; x=1703901591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAUr78/tHy+bnLYpp389Iep9Z0hW/GgVuQDVmoXVOqk=;
        b=acR20lziGNZic8l0Cqfi12iZNA+m/MiwLdZQQERoRChzH7cbESsEJT3d5ERo5MkyDj
         ZeBjTOHhCEcYSh+grsO+BzSzxvXSV+CfkKmVxRsmNgSGityLvqvQ7r3Cz2fGg1If5CI1
         Ukqntwsbeos2Y/oqknpZQmawnheFIk7WpbSrimTCcIUK+xYTaUPGTfvJMA18BDzmt82P
         F4jqVLj7rc5/q2cKBtPFRI5iwM4T0R95jszDOSad84Czpc06hgyVexLBDzRULfCpxcFe
         r3CLPcr2q6djt6UiIQWMXsbcPVhQCBwEYtFHD7QNVWr8LJiMhwLn6ol+Uz3b/drDJwbY
         aRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296791; x=1703901591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAUr78/tHy+bnLYpp389Iep9Z0hW/GgVuQDVmoXVOqk=;
        b=RIzSf7X402dk4y4R0BSBk9G+HtWlDUhZDPIJWOeq7MDJGmYMENXLDnUiPvR/ymeHP3
         tEXWAbtVBneOLgqI4NsftU08D5XAOmqRsuzpQgh/AE8T69aZy/z90m8D7DJMaS56yuv7
         bkLbVZzo1O9mzK1/niTHvHqH8XOhBmRZWYqVpH0BxO2aZDu7eMyzTe7R9Xreu/wLBv6r
         TN27PL4eLsJficgh6szPo7kWrQvu4tmqrFY/I7Te+RVnzL6TzqH3H33g1jjXPqzqcC1N
         v1vypf1xVRtcDpR25Aj9MKp5NG1K/kg2wqbSKWtCS8d8emOVFK9XvUnmh0tnUVWRrdCl
         T7kA==
X-Gm-Message-State: AOJu0YxJyPnF6pXSE2NLF3csmH5otCvuCIHTY/r0R9hmzT9e9ITt+9Ph
	K42Cf03EiVf6X7dROuzFACyTJ/IwG/Ox+zWZUAZBJaLUycY=
X-Google-Smtp-Source: AGHT+IGLgYEc/sdGm9KEfofUlSMPvLguXgtBDpjCgJkYSRvHPeMrALWjrzWpaNHsXhOIbfZapN2zUw==
X-Received: by 2002:a05:6808:3309:b0:3bb:72f9:86d6 with SMTP id ca9-20020a056808330900b003bb72f986d6mr3311716oib.106.1703296791021;
        Fri, 22 Dec 2023 17:59:51 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:50 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/20] Staging: rtl8192e: Remove unnecessary parenthesis in rtllib_association_req()
Date: Fri, 22 Dec 2023 17:59:28 -0800
Message-Id: <20231223015942.418263-7-tdavies@darkphysics.net>
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

Remove parnthesis to fix checkpatch Warning:
Unnecessary parentheses around ieee->ht_info->SelfHTCap

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 32760dc65961..ba6da717dc7e 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -727,7 +727,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (ieee->ht_info->current_ht_support && ieee->ht_info->enable_ht) {
-		ht_cap_buf = (u8 *)&(ieee->ht_info->SelfHTCap);
+		ht_cap_buf = (u8 *)&ieee->ht_info->SelfHTCap;
 		ht_cap_len = sizeof(ieee->ht_info->SelfHTCap);
 		ht_construct_capability_element(ieee, ht_cap_buf, &ht_cap_len,
 					     encrypt, true);
-- 
2.39.2

