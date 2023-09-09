Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A21851
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:19:33 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-401ef656465so9072695e9.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283572; x=1694888372; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ssVWE9PyVo0MJDIoiWo0h0qTjLlpWHSLjGBywkF+JnM=;
        b=l0sV8gghdplb7iww2NigaXXUgb4CdLbvrFfh3mqNuLZEA+G/AOFIIwgOLj6iac+ivY
         UprGJUimbwAmFSgE0scHQuTCdBYm8W4sQac3flPxVQhsRl0bT2Ivjg4gfptgO36v8Phv
         iXKkV0jD8C0gIh4fVhqZdPqnxdDOR3sHl5yJhx/eliZBlm9XWhdX+qMUqlu4k/iAisf7
         9+Xj5DTgB9cGUa1B0CGswp+kh0OMiHdEdOP9Xgd3HYfAE6bJSlHPtBGjNa5PNVB3zpqu
         8ORszpP6HjsQy1qGG46ZLo8JLueSFHgUQdTiP1UimkQuONTU7igl2IPX9U38hUmiL1t1
         QdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283572; x=1694888372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ssVWE9PyVo0MJDIoiWo0h0qTjLlpWHSLjGBywkF+JnM=;
        b=c6eiIk0hjhHyrHWt2fk4kqONlF1su5QpCTsfmZYiSK84T8OmT336nw6qDdxjt9JDv4
         +Nnv89LlOPnp5pBA7FgV9QYhgoaDkoEKlp0rWk0+0AFdjzntTQPQ9dWtL/84tFcsdxMp
         LXE9mB5lzGsm46ZHaWEbbz0N/qdOJ0UW6xQPA08K+TCOjjM1UkNa254YwQaMXoxg4W9s
         Nd2scO/YMeyKRGYjh7vEp3Y6EHJ5oTmg7YObWQNnorcv9sVDdNyK1vR1bdJFVa9V+sfX
         qeDsp6XQKTZfZbrTmzlEIFxkG6uvU5L3R2xiYxYxxj7cqw+KFU3dO44zNxjr1yDItQtS
         QXRQ==
X-Gm-Message-State: AOJu0YwqgcZHzgZcRa9sXiACqweb4/AgbFCqrl+wgSvNT++p5jCVTBo9
	zBu7shPaZ6KghOIdPFdOmB8=
X-Google-Smtp-Source: AGHT+IEhuPEY0HZVsNBEFRYiSMZ0IGtHD9bjAZpJ1rbS5hq35Mso0ccW4ZxJ0leRhLTYra4AhoiHIg==
X-Received: by 2002:a05:600c:3114:b0:3fe:d46a:ef4b with SMTP id g20-20020a05600c311400b003fed46aef4bmr5151459wmo.1.1694283571697;
        Sat, 09 Sep 2023 11:19:31 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id a2-20020a05600c224200b003fed8e12d62sm5242873wmm.27.2023.09.09.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:19:31 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:19:29 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] staging: rtl8192e: Remove useless equation in debug
 output
Message-ID: <34330df02f386b9e3b69baf582cb2933635867c4.1694282907.git.philipp.g.hortmann@gmail.com>
References: <cover.1694282907.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694282907.git.philipp.g.hortmann@gmail.com>

When "switch (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)))" results
in "case RTLLIB_STYPE_BEACON:" there is no need to calculate this again
inside "case" and when a frame is a beacon there is no need to print the
frame identifier again as it is explicit.
Same for PROBE RESPONSE and PROBE REQUEST. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 0e695b144b36..9f944eefa41e 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -2652,8 +2652,7 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 
 	switch (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl))) {
 	case RTLLIB_STYPE_BEACON:
-		netdev_dbg(ieee->dev, "received BEACON (%d)\n",
-			   WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)));
+		netdev_dbg(ieee->dev, "received BEACON\n");
 		rtllib_process_probe_response(
 				ieee, (struct rtllib_probe_response *)header,
 				stats);
@@ -2666,14 +2665,12 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 		break;
 
 	case RTLLIB_STYPE_PROBE_RESP:
-		netdev_dbg(ieee->dev, "received PROBE RESPONSE (%d)\n",
-			   WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)));
+		netdev_dbg(ieee->dev, "received PROBE RESPONSE\n");
 		rtllib_process_probe_response(ieee,
 			      (struct rtllib_probe_response *)header, stats);
 		break;
 	case RTLLIB_STYPE_PROBE_REQ:
-		netdev_dbg(ieee->dev, "received PROBE REQUEST (%d)\n",
-			   WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)));
+		netdev_dbg(ieee->dev, "received PROBE REQUEST\n");
 		if ((ieee->softmac_features & IEEE_SOFTMAC_PROBERS) &&
 		    (ieee->iw_mode == IW_MODE_ADHOC &&
 		    ieee->link_state == MAC80211_LINKED))
-- 
2.41.0

