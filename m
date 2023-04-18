Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F344AFED
	for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 20:02:06 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-94f161ee14fso50736566b.0
        for <linux-staging@lists.linux.dev>; Tue, 18 Apr 2023 13:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681848124; x=1684440124;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HsFVuXE61PbLw9YtM+jxEDcHooXCuW3K6esrr2BCHUs=;
        b=RJSd8ztUkMXfjKj2IFMPJud3LXOVWy9ZT+F1FDzl/BveJrXCo7/SuFeiZtjIEV6v1l
         JLvipWe+etghOYMPkO1N4WGyAsDjtyY8zagft20AJAomxd5uYUtpBfVExN5sCgCewMcL
         WPhPxa0i3pN/23Dmj2tqxL3Z2xZdfrpkcreZte53NtKrhNSqhfoZic2eIn0KuRsfk8mg
         ks+vQlGhdXKNOrUoF/EgWy6EOKzIlAKGqxCGeM9vn+Iu93/vVeHpW7yGx6TpxbzfBa8y
         SZTpEZ3ohNPRjz3VUjM0rRPCW79jPnsSPHhLYi5EWDmgjfsCpIz7lbWcp3uuwvkQVv3v
         UAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681848124; x=1684440124;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HsFVuXE61PbLw9YtM+jxEDcHooXCuW3K6esrr2BCHUs=;
        b=ZG6tSx0OPaTzs8tpMMkgDVzw1tO2Y6RntmeY7zYhe5JVsITak9Ubp8DNUEsm4vPg1x
         FqQxD1E1Et0SJaBviPR6Pp6sb6TwhqWFeMm3LcGN1CXKWBDswpZkA7pP4o1aHjtVov6g
         qDRbBgda+0FxWSqh13wZSFjU/ML5q8fKcpXUJoiIEg3Tb/18h7p0qR/sgRoX8BbXwX/A
         Yf5/w4/uqyl7/EXdlozxK0/jQJXObkOBVT1K8TZW35jDGSpJMK1qlfWFJ+/t9Jp+MhFx
         NlTCvNiT6R7gqCEwvD/cjjDf0u32a5XeqsB50cnEnJ5S4RIqYKxx3QGWf+ft6ihUIA6K
         9haQ==
X-Gm-Message-State: AAQBX9f43L2bN4dWI7WCRVogn+EsMVeU4ZiMKnhk0JpZRiOpzGOZHxzY
	j8Z+vP1PvyGhECuuJJ3CzIM=
X-Google-Smtp-Source: AKy350ZwNs3E8lPGplBIvyWZE2u91zV7h78+pgwfvhHLpZndxunn86Wb3edvlIvy4Il+7UWVtUYaOg==
X-Received: by 2002:a17:906:19c:b0:94f:66af:b1f7 with SMTP id 28-20020a170906019c00b0094f66afb1f7mr7316763ejb.1.1681848124259;
        Tue, 18 Apr 2023 13:02:04 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id ay18-20020a056402203200b0050504648fc4sm7394370edb.80.2023.04.18.13.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 13:02:03 -0700 (PDT)
Date: Tue, 18 Apr 2023 22:02:01 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: rtl8192e: Fix W_DISABLE# does not work after
 stop/start
Message-ID: <20230418200201.GA17398@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

When loading the driver for rtl8192e, the W_DISABLE# switch is working as
intended. But when the WLAN is turned off in software and then turned on
again the W_DISABLE# does not work anymore. Reason for this is that in
the function _rtl92e_dm_check_rf_ctrl_gpio() the bfirst_after_down is
checked and returned when true. bfirst_after_down is set true when
switching the WLAN off in software. But it is not set to false again
when WLAN is turned on again.

Add bfirst_after_down = false in _rtl92e_sta_up to reset bit and fix
above described bug.

Fixes: 94a799425eee ("From: wlanfae <wlanfae@realtek.com> [PATCH 1/8] rtl8192e: Import new version of driver from realtek")
Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v1->v2: Added Fixes Tag
v2->v3: Changed Fixes Tag from https to git commit id

Tested with rtl8192e (WLL6130-D99)
Transferred this patch over wlan connection of rtl8192e
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 4cf84b5666a7..27040d1e3230 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -645,6 +645,7 @@ static int _rtl92e_sta_up(struct net_device *dev, bool is_silent_reset)
 	else
 		netif_wake_queue(dev);
 
+	priv->bfirst_after_down = false;
 	return 0;
 }
 
-- 
2.40.0

