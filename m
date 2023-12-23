Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C0DDDA7
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ITd+CtQD"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d3ef33e68dso17021425ad.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296796; x=1703901596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7bqp++MAnkQTUv5/XZaUL2Oh6X/aSgAe86kIBRlzDrY=;
        b=ITd+CtQDr/Go4nJHvKUfvHO0p52zTHVKAUAulncm+DstwDfKXHkalCJ+3QodNNc3Sp
         h8BIXDGbsGKd9MmB+Axv9bZ9NC38wRzd/faCd6DKYfO7YrztOhlHn/ce94zW54XzUDWz
         ckMlFpGTRGZw/XQLaS7XoDfV2h5BILCsV+v5Y2VS7SA2pULpA1j2wYRNBzW0kFjbkqY7
         lTucvUyhSSuISi0xqr88p5mKWq8+8zAgZQUohFD4F8HOiuIKm6ejcKRjsX6+woqwtyly
         yXdcXyL2Ef2nTD21lwmV0FdPtdgDEMUMKEu6LWYkwv6mR8rGEuPrB16QslczAuK5k6eU
         zXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296796; x=1703901596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7bqp++MAnkQTUv5/XZaUL2Oh6X/aSgAe86kIBRlzDrY=;
        b=IPbXFdTB/hmP1hXKchZ6+KszJ2QdkBxEAxuVAnGYPgn0fZWSP0gzIsW96UTbeiUfEr
         ozoLYZfvzV1M28rndBWHPl8251CSrEo06iqeBItpXaLTofJtm99Y2FDNNYgrg1SY/AZR
         w/HiKONusRLCkZNRhbFJ+CSL1QtYL09FAbPvSeIfZsumg6H2Vo+kKKIMddGtHhjpYVzW
         jI8lrCDpRQl5DyM2v1KvCJBqwALdbJebzUAHg1qBqosXDv60TlE3eDcs6+gJMF7oXT10
         92kO2PQui9M9p+6JEnbGgHDDMkhFYPIuc4+Uc04wLR9PBLFJAVVj5J/3dpoVObOTswET
         75Xw==
X-Gm-Message-State: AOJu0YzFVpyHK/loA7F/Wnj8cImzUNLfC5tI6pU6fJupRdHOlpY+Usoc
	jmqyL2bwr/GkkDSVdrBkqqw9p6TebcYR8g==
X-Google-Smtp-Source: AGHT+IEmDBgl9HWu3T9deeNsee521BwknLE/M+n8V5jLouQnyzsnfKEaQRl/Cwv9Z0qqaaxJvx837A==
X-Received: by 2002:a17:902:ea94:b0:1d3:eaaa:a2fd with SMTP id x20-20020a170902ea9400b001d3eaaaa2fdmr4267576plb.48.1703296796090;
        Fri, 22 Dec 2023 17:59:56 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:55 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 12/20] Staging: rtl8192e: Rename function rtllib_MFIE_Brate()
Date: Fri, 22 Dec 2023 17:59:34 -0800
Message-Id: <20231223015942.418263-13-tdavies@darkphysics.net>
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

Rename function rtllib_MFIE_Brate to rtllib_mfie_brate to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index c268ed6451af..6a3a8e0bb036 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -44,7 +44,7 @@ static unsigned int rtllib_MFIE_rate_len(struct rtllib_device *ieee)
  * Then it updates the pointer so that
  * it points after the new MFIE tag added.
  */
-static void rtllib_MFIE_Brate(struct rtllib_device *ieee, u8 **tag_p)
+static void rtllib_mfie_brate(struct rtllib_device *ieee, u8 **tag_p)
 {
 	u8 *tag = *tag_p;
 
@@ -341,7 +341,7 @@ static inline struct sk_buff *rtllib_probe_req(struct rtllib_device *ieee)
 	memcpy(tag, ieee->current_network.ssid, len);
 	tag += len;
 
-	rtllib_MFIE_Brate(ieee, &tag);
+	rtllib_mfie_brate(ieee, &tag);
 	rtllib_MFIE_Grate(ieee, &tag);
 
 	return skb;
-- 
2.39.2

