Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8723173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:20:27 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id j6so139400714edw.12
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gnLMiq8Mm2ARPQsexbrW9egBTCgyloKoB1Bo0S3MfQc=;
        b=AOY97vn0ni7cV9yW+M+6M+jY/FPaZ9J7gv58MWx8ojvRG5LiYNF3EcHoXWIdu8Y8Er
         hwaVlCvZ2R/DxxLX3oFNZOU+HavfwgHEPheCNqAuGwyaG/jHdiT0nTImc9oPHUgGAZmn
         1oeO+5q0lBVaDWuxG9yXmw9EgK6Cz3oa9M8dYQvjO15saVrTYekxOLgbGjAjYyzMF/04
         UK720mfVxItFQ4l6JlpGN6dS6HrYd7UFWr4K8mYmm+FHaH5atGAQGAnJ3jGF1IqTwDqB
         /EN1P4KqkxVYhbMlNjljJLWQfUFBCP+LGA7fSiaIgkdUOlfDbEKQW/UoJvbiHFfnIQC6
         PMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gnLMiq8Mm2ARPQsexbrW9egBTCgyloKoB1Bo0S3MfQc=;
        b=7lwmw4t19TVBhzh9lUd+LKis6xZ3rkEETmrVTY19kk/DvZyGVpJsa9161Qkj1XjxFB
         2InhnpkmhhfXIcDOa82jVNNr6I6/TCgtHHYXZs6K9QigzvgqeqRl9MP5oFvm6aitZuG5
         vPNzh6slX35Cn7Yts4MNX8NklbcuzPFGGjdrgsEeoD8jmjq3kWsHpJTgCcIacBIrp0wq
         S/8HdsLF95PPAPlNGOUBuZ8FlJT1rZ7bADVbQmRHFdnbxcbfEl3PlO5/T3TQKBbAOI76
         8fL11/BiPbci1oimf2keyVxHp4rN8kI47iWMAtE8R7CV2Cy1X6G/xf8IQWcUu4J+o1mn
         d6BA==
X-Gm-Message-State: AOAM530iN1qSwMJa7aAggf7SFpbu3/iHfyyqY8JOAq6jFDNQKBrMIqps
	AqhpGuaUo+ZHgjYfLL2S7W0=
X-Google-Smtp-Source: ABdhPJyW8VwR2Fmp7fAb1CmReVpCcLPh55im4PGVyWUpDRm/ZDT9PGtpcMkoleB6v/45hUzlJIudqQ==
X-Received: by 2002:a17:906:2f97:: with SMTP id w23mr35780885eji.739.1641237626372;
        Mon, 03 Jan 2022 11:20:26 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:20:26 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/56] staging: r8188eu: remove dead macro ClearRetry
Date: Mon,  3 Jan 2022 20:01:51 +0100
Message-Id: <20220103190326.363960-17-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dead macro ClearRetry.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 20a70cde2272..ab8ed3ce89f4 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -185,9 +185,6 @@ enum WIFI_REG_DOMAIN {
 
 #define get_retry(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_RETRY_)) != 0)
 
-#define ClearRetry(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_RETRY_))
-
 #define SetPwrMgt(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_PWRMGT_)
 
-- 
2.25.1

