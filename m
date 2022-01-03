Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72022C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:48:39 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id n30so27648743eda.13
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xJrc6JPPLLoAv5ayNdMrXg0ETocomX7tZsuSWyXHNy4=;
        b=Tdu7hMZRPWOS63ywzBk+qj1MtQLch/RYYtMI4+hUygsAO01g/edWOmXYD0fI9GhbGp
         VIpQJY9UFX6ovvfVpxWN/xRvDZusQb9fkE8qwWox6e6ZIZgM0vWxIq7F8wPF4Bye2ZQz
         yMk6DognAQtYRAktPnwML51ERG5lkyED+ZS4fkFfjw5nhva8PvBVbWF55gZxb2TzCy5B
         0yHGPWlzORFvtk2MSxA6N4LkeLDis0u3wgV+1gQs7NDBlp73ZjBtgZckTD7nvtL4kIgN
         zzY6hoFh5NYmxiGY5PVvyt8WxxRP2AcBtPFMOhkgqGFxhlaQMRt8BBX2ZB+vNWx90K/0
         fuZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xJrc6JPPLLoAv5ayNdMrXg0ETocomX7tZsuSWyXHNy4=;
        b=BRgDpEOD0ED80Mnn9bqDtHy6QVLNSdjDU6/7mzTV33tqsHTCTdymYLoyXWCBW1Y7B8
         jo9G1+EcskpcE+bqZs/opOugaZF1Qaa5o3TuITmlsgY8xVcifmdrk7wOguxQQXM71QWm
         98V98MT5k5nfl/fNiTzP+mDVBPoLHmT+ljy+sSd5ySCfcyytEC+P1BF21JoKVpY24gwy
         Xf5uvI9TqW1kP5Fc/j9zS+K+JQDsROU/xSRJu7o8VvHaKdR2nE+Eyit1VT6/RcRsEI2X
         b/abpEJdlZgu09DYsQFPfjW037v3jS7AnDFlC5QkhZ4OKR1XMT9wGGJZerc+HR+m1zf6
         dqwA==
X-Gm-Message-State: AOAM533syAzsyxS3xZkd7648CsbLHOQD5sQOVVVfKejkX1P9z231qTB5
	tC31bxPdI1ZHqWEmlN6SFtA=
X-Google-Smtp-Source: ABdhPJw1cZT9VhXDODjLU2l/kuUEtENA1ktE4AN8sFm0tEZoZkEhVb6uhPoE4o/SP+DsSHLDZe3gIQ==
X-Received: by 2002:a17:907:1b0d:: with SMTP id mp13mr36877291ejc.29.1641239318233;
        Mon, 03 Jan 2022 11:48:38 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:48:37 -0800 (PST)
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
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 46/56] staging: r8188eu: remove dead macro GetTid
Date: Mon,  3 Jan 2022 20:02:21 +0100
Message-Id: <20220103190326.363960-47-alb3rt0.m3rciai@gmail.com>
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

Remove dead macro GetTid

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 8364b16dfd36..16acf7df0144 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -253,10 +253,6 @@ enum WIFI_REG_DOMAIN {
 
 #define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
-#define GetTid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) +	\
-			(((get_to_ds(pbuf)<<1) | get_fr_ds(pbuf)) == 3 ?	\
-			30 : 24))) & 0x000f)
-
 #define GetAddr1Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
 
 #define GetAddr2Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 10))
-- 
2.25.1

