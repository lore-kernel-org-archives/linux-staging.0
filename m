Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B47136D
	for <linux-staging@lists.linux.dev>; Wed,  7 Dec 2022 09:33:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so606097wmb.2
        for <linux-staging@lists.linux.dev>; Wed, 07 Dec 2022 01:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/Q6kvRFfdVCMvD/9KspZyMV4JmhJENHyXiGZYFDk44=;
        b=fGvVgz/qLTD3VEZDyt0R79HKaMueP/MoJWsyBHUwQi8OkgR6+KCU6nDmoFMopvR3T7
         L47YKFDIIbN+1PBNVuJIRY2y2sBhXYbp+WdEV03RNxbEMnrPE685neASGJWiaY1gOvhY
         +OjTKux0yGwNj+htnlJ1vUL0Vb4ZBDwxovlNX1PzDo9cBHQAQGGIw7vlm0821idOlYXf
         YYwSQDP6rPV3Uy1xXqVobWc2boYm1b4GO988NLxFWaqeE+mv4dsMuo46qAAwHODWZkAW
         +pUpbqyVKe3qFbrq2+LelY9V4zzKwA9FIhRSzY8nPZQb5E8Iomf+wo8JR7BPFRVSNcwG
         eDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/Q6kvRFfdVCMvD/9KspZyMV4JmhJENHyXiGZYFDk44=;
        b=VUIp6qaZiOGu4eo0pTBcJQrzHOu/egHh39aADPLbzE+SZeWt06Liyni9hyfAwmejXG
         3/G0pBcLZby/W9xkPEqY7/C52hzCITfCI59YmP66OtfTxIRSuWOSpYdBPY1YeDY3ddfY
         odzIx9TsciIoQ1sAl9hMxxwYxgGPasm+UYcu98cMhiKtZQL4isanMBVMVBdP+Fs0oxHt
         BvjO3INXsWQrNXBGkQYTcDk8G9S1jDKWdXb36RXf5KkXdPcxKYkX3+Hu1MwOWXZ/Sqhr
         B0bXq5ITA7+JDPNKundyNqIsLE0WhOBs2defqqvUvyjx0JRHaz19jnYUXAVzloHuwO8y
         5WPg==
X-Gm-Message-State: ANoB5pkkU7gudmZdB68ju1mrf0HTfLYyAOBdASQz8Lc726CNvkIcnB0a
	BJ+VADad3sYz0dswHOwSNJo=
X-Google-Smtp-Source: AA0mqf65Hayvxx6HW4BpL6shqMfP5P+7WL8Kx9rrVd0hJaGecXER7SpcxDy/P4CdKLK5k/ZFAtBVDA==
X-Received: by 2002:a05:600c:2d45:b0:3d0:8c4c:f681 with SMTP id a5-20020a05600c2d4500b003d08c4cf681mr14114048wmg.37.1670405612599;
        Wed, 07 Dec 2022 01:33:32 -0800 (PST)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.gmail.com with ESMTPSA id b40-20020a05600c4aa800b003cf6a55d8e8sm1078481wmp.7.2022.12.07.01.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 01:33:32 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix spelling mistake "ContryIE" -> "CountryIE"
Date: Wed,  7 Dec 2022 09:33:31 +0000
Message-Id: <20221207093331.2280355-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.38.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a netdev_info message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index f8965afab767..669e74a67190 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1776,7 +1776,7 @@ static inline void rtllib_extract_country_ie(
 				if (rtllib_act_scanning(ieee, false) &&
 				    ieee->FirstIe_InScan)
 					netdev_info(ieee->dev,
-						    "Received beacon ContryIE, SSID: <%s>\n",
+						    "Received beacon CountryIE, SSID: <%s>\n",
 						    network->ssid);
 				dot11d_update_country(ieee, addr2,
 						       info_element->len,
-- 
2.38.1

