Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF926D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:45 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id x12so12033515ejc.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oiFxgSEqTgqvpN/6rEF5LuPK8ZpGPJBCmsVOLf+H4TI=;
        b=dWDlUzIaEecZuXyzX2auQ7K2GDDh6Fuy4mfpI/+fmEywR7xsWgFplnLRahSpMkXFIC
         /GZIBTNiqETVKnkPR1ipOI9ftaaBAaFt0kUw/6B1LESNStGZeEcKjiMAvviZXZbInx5B
         tIoo6l9ISJMoscS0ZYxMMN/4n5TXGGQXVeD0dhFadipOhJo0L2kiDAOZrSekBCFT8lpO
         0FwVhorVOcu4SZ/moJ92tahviJaOUTA+wFTHMDkJA7v1GdAgNDVVGlo85EXfkIb7Amon
         VFqj5I2gcJfLBzmNeBgQXp/2eZBQX5vFw0VvlKeP/h1Zg8nUPaB68HKbixCX8vg6MMOv
         Ygeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oiFxgSEqTgqvpN/6rEF5LuPK8ZpGPJBCmsVOLf+H4TI=;
        b=PwnQHaAlbdGSI19IsongGOTHNkqJoTIifQLcNe6sFHc+kbQs/Zh8CmmGGR2eeVI/Y7
         WSAmZxzCG1TQC8fcZVF9ye3pUDUCdwk5pLhiwcs06ApArds+z6ba7Nm0gbx0LORRVQV5
         rfCKrUacqzoru1opttLgKmTqNDv14NdPVvziydyhkUzV/JkETBZzxtcZvkLYa4c8Bhcy
         g22if8CSnLjPjIS2fV1qXxeMCL1rZ/CbCXzPzaRwM5Vlcftw1xkNBTtzMQKAE/Mpi8ae
         6PElshhAdmRaMfa0T/s+Pqf13SDRco25rFxu7sJ8eToWuFoR2NtbGnarnbiEFe0dwqXq
         nQGw==
X-Gm-Message-State: AOAM533owK57/bpMqy/BB8bSRP22d5RJZfRlPqBjTXpixylpqcaU81RT
	8+QTPSbM0g+tPVNKE2B94Q/CAQ==
X-Google-Smtp-Source: ABdhPJyf3jKmIugKWrWCcbYYue+Pr0N4ia5nQTJR0QeXlas7BfMBSdE/CzzYZQx0vpGwr+En59Apwg==
X-Received: by 2002:a17:907:20e9:: with SMTP id rh9mr118018ejb.523.1618423904123;
        Wed, 14 Apr 2021 11:11:44 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 09/57] staging: rtl8188eu: core: rtw_ieee80211: Fix incorrectly documented function
Date: Wed, 14 Apr 2021 19:10:41 +0100
Message-Id: <20210414181129.1628598-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 from drivers/staging/rtl8188eu/core/rtw_ieee80211.c:11:
 drivers/staging/rtl8188eu/core/rtw_ieee80211.c:778: warning: expecting prototype for ieee802_11_parse_elems(). Prototype was for rtw_ieee802_11_parse_elems() instead

Cc: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8188eu/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_ieee80211.c b/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
index 7a706fe11750c..e88ebe8891fc6 100644
--- a/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8188eu/core/rtw_ieee80211.c
@@ -765,7 +765,7 @@ static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
 }
 
 /**
- * ieee802_11_parse_elems - Parse information elements in management frames
+ * rtw_ieee802_11_parse_elems - Parse information elements in management frames
  * @start: Pointer to the start of ies
  * @len: Length of IE buffer in octets
  * @elems: Data structure for parsed elements
-- 
2.27.0

