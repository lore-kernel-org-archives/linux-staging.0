Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C911C8F
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 14:18:41 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-543ae674f37so1785836a12.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 07:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687184321; x=1689776321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BmCAzAWDqWS9Ad0kyeEiBkiBoZ6up2YMzFBEN+N0Ip8=;
        b=B6WVAJqDiJLAXG9b4ZGy2XIQ6HiOn9GqBMho/mof+muGY9bmLwcprdE2HEkGOuOPyN
         XixtGDPtJuERtpjsx61nxjcEd4lhmTYbGIj6PVeSy+66t/wVTxelZZZLGBqo1lGC9nof
         zmMi+YxGcvXTFfJKU9M70asligvSN8duXvlEHhsn47UHI5sVmHiSyo3XvEK3yaSzxNO8
         qkp5U0k4sUHQE9NaJbm4Wu8e5CVMHX638sn1Ud+n58qr/any+eAskGGjSR0pD44b3xQz
         n+NmyXPFcQzRmO7Aby1NhzACk6Come91GOKeppfkHG8G+mh8j0HQ8Ge47zcAO51JVg/A
         DeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687184321; x=1689776321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmCAzAWDqWS9Ad0kyeEiBkiBoZ6up2YMzFBEN+N0Ip8=;
        b=bdJzjymOqTksAqGb5pka1WDnIw9CR6CA3fqPYveZ3eMykdyalDpqh8r1Dvem7bC32H
         nVPEf7oISUekthzNm7sZRIXIZig3+WAZhtyDXZPqxEYEPxcZtXmyeaEDlHJh323pNb0C
         U0PZhN0PcJ2JkOAtEhBz/loX3CTUqlW/coE1yNqko6KA+4O1xFuybydpMdiPrhhAnK/B
         9DPZyjx6OmsvfPNy7BrvlrYvsaOAJHXXpIbPAEXc5USof74WjB3zq/nOV5boWTodw2Jn
         0vsfiuQy+tJHdTWopDHIq+d5+80m/MnHWYOLf9blTuJRGqTD3/LaBDhiAKK0y9arxlve
         ttIw==
X-Gm-Message-State: AC+VfDwCHxyfAJKm3MPzGGjSt/Hjlaj0Qo6cZI3tSi8P3pM2BY5S/KFn
	Q3/sqDHg9Nt6D/QUFBBgJJU=
X-Google-Smtp-Source: ACHHUZ7xcDBg/eJwQDcCky0Y+QeQEEzc/J98U66tVAhRlEpnXikDQCsDUqHM+TSU/Vf+gTWZvfIr6Q==
X-Received: by 2002:a17:902:ab17:b0:1b4:65c3:ca68 with SMTP id ik23-20020a170902ab1700b001b465c3ca68mr6448951plb.66.1687184320743;
        Mon, 19 Jun 2023 07:18:40 -0700 (PDT)
Received: from zephyrusG14 ([103.251.210.211])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b001a67759f9f8sm18819812plh.106.2023.06.19.07.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:18:40 -0700 (PDT)
Date: Mon, 19 Jun 2023 19:48:36 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, philipp.g.hortmann@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
Subject: [PATCH v4 3/4] staging: rtl8192e: Rename variable LeisurePSLeave
Message-ID: <3c63f4d750b7365f233c35c676325c5e4ca54a4c.1687183827.git.yogi.kernel@gmail.com>
References: <cover.1687183827.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687183827.git.yogi.kernel@gmail.com>

Rename variable LeisurePSLeave to leisure_ps_leave to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---

v4: Rebase to latest staging-testing branch as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.

v3: Revert back to v1 of the patch as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.

v2: Removed the variable and called the function directly instead of
    just renaming the variable as suggested by Greg Kroah-Hartman
    <gregkh@linuxfoundation.org>.
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index a06d1c4e778a..631cbe016ea9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -717,7 +717,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
 	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
 	priv->rtllib->set_wireless_mode		= rtl92e_set_wireless_mode;
-	priv->rtllib->LeisurePSLeave		= rtl92e_leisure_ps_leave;
+	priv->rtllib->leisure_ps_leave		= rtl92e_leisure_ps_leave;
 	priv->rtllib->set_bw_mode_handler	= rtl92e_set_bw_mode;
 	priv->rf_set_chan			= rtl92e_set_channel;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b3d6699b31ed..37e6fcd4b1ec 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1703,7 +1703,7 @@ struct rtllib_device {
 
 	void (*rtllib_ips_leave_wq)(struct net_device *dev);
 	void (*rtllib_ips_leave)(struct net_device *dev);
-	void (*LeisurePSLeave)(struct net_device *dev);
+	void (*leisure_ps_leave)(struct net_device *dev);
 
 	/* This must be the last item so that it points to the data
 	 * allocated beyond this structure by alloc_rtllib
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 78d13ff1f14e..91dd3c373aef 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1200,7 +1200,7 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
 			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
 			    (ieee->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
-				ieee->LeisurePSLeave(ieee->dev);
+				ieee->leisure_ps_leave(ieee->dev);
 			}
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index d8c7b7377132..de3db873f305 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -316,7 +316,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 	chan = ieee->current_network.channel;
 
-	ieee->LeisurePSLeave(ieee->dev);
+	ieee->leisure_ps_leave(ieee->dev);
 	/* notify AP to be in PS mode */
 	rtllib_sta_ps_send_null_frame(ieee, 1);
 	rtllib_sta_ps_send_null_frame(ieee, 1);
-- 
2.34.1

