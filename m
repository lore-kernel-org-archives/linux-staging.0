Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C20B566E
	for <linux-staging@lists.linux.dev>; Sat, 25 Feb 2023 18:20:37 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q16so2332933wrw.2
        for <linux-staging@lists.linux.dev>; Sat, 25 Feb 2023 10:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677349235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oAsMPynv8Bt+koPnerCzdUfaVHcGsUSJc1fCVIYNQFA=;
        b=J8J2hwqCf/p3DAyZsJuEvqex0XndijwDLiQWDEA5Ryr37gLIe6VsPUoAUQNaYbX6mi
         o8c07IzX1PwxQ/zoxvTHVFwEAS4nOGcC98Y/tvvyd37SMZv110xdBWxx0g8AzGfX8hmi
         vJxXZ9QTCLOfGBAJ2klBXnIHXNIzsCPGTus8F95po/OtPGzRqLhkqBGla6hXHX5SbBZq
         /Ca6e9LNED8G19DYP9FVWzOOrIMO9NNgtl4Vy3EFOdVX9NU+I8VyiJXJ2z2iCFrw+Cvt
         MCIA9K5D7iddN6SOKZcYTteELPqTT+nwFtEtCAmiKC7IBw9lsJT0N2eB4yJ5BqA+xigA
         7h0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677349235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oAsMPynv8Bt+koPnerCzdUfaVHcGsUSJc1fCVIYNQFA=;
        b=6I8SF0F7PdImQmDDuaWBk9N0/GcmI5eUV3rG/O0OORFratIcv9O8WNnEdtYcN/PLvg
         H+mhb4jJIfYwXxZq6WFoJnFI1YeM0QAn0xPMIVJM56XiICGYOGisN6ewjzQcQ6pRwm9I
         UHa6G+xB8Dlv6tXBAFgmUezn86LdVuksg5WxgJoOljA9Bxd3FqqUU09GjhTqB5L0ycaS
         /ROMycE51KIQI7QXsz6zNtkjk4mNZGQMcnY9j21oHN6xkm5lFiaw7uhkFyW2x+HpgUC8
         zfqAfnMWAYHIIKp99aE3FsISwSvz1Gu0oU9/fQ0we01GzrejnAqEGgpwPmhdRoeb7HmD
         NUYA==
X-Gm-Message-State: AO0yUKV36SWTP1Gksps6ZISHXmsZSylAsKNpt3NUxxMl+Fny0EQX/+yv
	mfswHNTb8uMOboDwUypZwbg=
X-Google-Smtp-Source: AK7set9H3Xy+t9aY/FGfoyHgAVUnS5XYXcZuaqpV9CPJ5twJrbJ6+xs1/3h/gvTKgK/qeMt3S35eXg==
X-Received: by 2002:a5d:4e11:0:b0:2c9:993a:f4cd with SMTP id p17-20020a5d4e11000000b002c9993af4cdmr1227626wrt.1.1677349235589;
        Sat, 25 Feb 2023 10:20:35 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id p10-20020a5d458a000000b002c559def236sm2375831wrq.57.2023.02.25.10.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 10:20:35 -0800 (PST)
Date: Sat, 25 Feb 2023 19:20:33 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] staging: rtl8192e: Remove checks of pointer to
 LeisureP.. and start_se..
Message-ID: <cd828bb1c8dfbb6d2a85d770c82afbb9889e0ea2.1677345331.git.philipp.g.hortmann@gmail.com>
References: <cover.1677345331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677345331.git.philipp.g.hortmann@gmail.com>

Function pointers of LeisurePSLeave and start_send_beacons is set while
executing the probe function. Therefore a NULL pointer check is not
required. Remove checks as it is dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c         | 3 +--
 drivers/staging/rtl8192e/rtllib_softmac.c    | 3 +--
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 35b36f7c0f28..c394c21beefb 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1214,8 +1214,7 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
 			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
 			    (ieee->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
-				if (ieee->LeisurePSLeave)
-					ieee->LeisurePSLeave(ieee->dev);
+				ieee->LeisurePSLeave(ieee->dev);
 			}
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index d697089e0cad..b06baf5ff6d4 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -669,8 +669,7 @@ EXPORT_SYMBOL(rtllib_stop_send_beacons);
 
 void rtllib_start_send_beacons(struct rtllib_device *ieee)
 {
-	if (ieee->start_send_beacons)
-		ieee->start_send_beacons(ieee->dev);
+	ieee->start_send_beacons(ieee->dev);
 	if (ieee->softmac_features & IEEE_SOFTMAC_BEACONS)
 		rtllib_beacons_start(ieee);
 }
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 06f3d75dc102..f90764d1d9ab 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -340,8 +340,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 	chan = ieee->current_network.channel;
 
-	if (ieee->LeisurePSLeave)
-		ieee->LeisurePSLeave(ieee->dev);
+	ieee->LeisurePSLeave(ieee->dev);
 	/* notify AP to be in PS mode */
 	rtllib_sta_ps_send_null_frame(ieee, 1);
 	rtllib_sta_ps_send_null_frame(ieee, 1);
-- 
2.39.2

