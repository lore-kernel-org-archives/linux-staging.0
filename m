Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A407C33D2
	for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 19:28:09 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-31f4629aaaaso904653f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 12 Sep 2023 12:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694546888; x=1695151688; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hAqNl41hKkSBMm9EVB1yezgOtRcp8ANCKow1rmKoN+M=;
        b=VK8dPwg8nBYQv4num84SjScxRFB/WPbODjIlf/HMygquTZSJnPQpK2wQrU2ZB7KSXB
         KEkncR2NcRVmee/+8iay2CEwI4uWi62jVpA2/4CRR1pQOTtFJWqtcykjEKi7k99aJTCx
         oe9jtA51i++//sVsaPtMYN5MpzUJTCD8gqy8uNOKhPPg6E/7MiDfEP5pJK5VxGPw7OfJ
         pO9mSem2kB12+x1Hx2egNE9ytmLbtYl1Zxu+WNRs7nY5W1VGm9gJEgS/M4UOHjGCr863
         uiGsueXprlDlx6BHL+1l4ne7VjlAAgsTDUR0tMaG5HNWleTAf+kOgH2Sh/1CB/od3bWU
         WTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694546888; x=1695151688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAqNl41hKkSBMm9EVB1yezgOtRcp8ANCKow1rmKoN+M=;
        b=mTlnNJy5ejuAP5NPn/y8QgsD0X30v9SIilVhEo3pj72Wzn4Xs6WEGcYt2bkdOet87F
         nE4iPQlyldC41drOzLOLx1rHsN9tCE/jwi0vFMKrHEZpO9szhIfHVJdGuez+LaQG3LSB
         TG2+x7fIdkdGhS2KzZPwQpM9OoPWaZTj7Gsgf10TFKDEB2WqaZNXyGgOmwvXM8xFPu9M
         3OaefcmyAO98AHP0ohYLIwD3ntlgLTITWHz0NGKsYPfA+g4ehediKOqeu/m6C8qSieu4
         Gp9PZcB2yjbYm1akQWAFGRJ9AU+wkvOlbJfoVzZyB7Y9/1aJk3trgmZnAxFqoQcq4OoU
         kHmg==
X-Gm-Message-State: AOJu0YyKr0P9GoQIEDPhttOiLzjJJDxc4bvnVNbi8DoZj6MTyFQ+LSX1
	y5+Tm89gvjM8yEPRO9lFPWg=
X-Google-Smtp-Source: AGHT+IE6aWFay8iwoc5rAmKKGWqsGBuYZKDYNFrhiEZwq8A9yc4cn2BiUDQDvirb6qWqzD25kSC7AA==
X-Received: by 2002:a5d:4001:0:b0:31a:e772:ddf9 with SMTP id n1-20020a5d4001000000b0031ae772ddf9mr301620wrp.4.1694546887726;
        Tue, 12 Sep 2023 12:28:07 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id o14-20020adfeace000000b003197869bcd7sm13517861wrn.13.2023.09.12.12.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:28:07 -0700 (PDT)
Date: Tue, 12 Sep 2023 21:28:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] staging: rtl8192e: Remove useless equation in debug
 output
Message-ID: <f3c8deddac66d11c41ba720e4048aba37e41e885.1694546300.git.philipp.g.hortmann@gmail.com>
References: <cover.1694546300.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694546300.git.philipp.g.hortmann@gmail.com>

When "switch (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)))" results
in "case RTLLIB_STYPE_BEACON:" there is no need to calculate this again
inside "case" and when a frame is a beacon there is no need to print the
frame identifier again as it is explicit.
Same for PROBE RESPONSE and PROBE REQUEST. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Unchanged
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
2.42.0

