Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4A92CA9
	for <linux-staging@lists.linux.dev>; Fri, 14 Apr 2023 18:34:56 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-94ea38c90ccso14098966b.1
        for <linux-staging@lists.linux.dev>; Fri, 14 Apr 2023 11:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681497295; x=1684089295;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/J+vjdb6cOyet1NlcJdx7Gney2QIkG13+uv7x6+rlKE=;
        b=G05SBNFy+5LmoPB7N11GwA1JML3OifQBNYPoauP/kLqe28fX59OGvQikVdsU4O2tDh
         zOVj501kf2xTO+zvTMDq+Kp3aZf+eYqSK5ua93Kja/71tEvabIKH1sKsPC43lAsaDyxa
         2tEn0/DMof+CP2PLedntGb1xlx8uKxCHbsofChiYZtDQXfp+80LxC7owTaumdLcudxSk
         9DNIyE9PdqzsdES5sUSsGT2tGVek6S186vBvQTOs4T63Y2DZpHmZQzFOVppbxnt0IKZw
         5pjqR1HRtfrwumCZwBC+wyXKi2zgAqi04XXYr4NdQDbBD0wZkL5pSDSiK72I/3J/RVIY
         SqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681497295; x=1684089295;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/J+vjdb6cOyet1NlcJdx7Gney2QIkG13+uv7x6+rlKE=;
        b=jhgbrVaTKpYUAlQ57g+VwMuV4kGgIQS2i4JXkVMrFMQnM7kvYKePnZN/th+gbdlw9V
         U+gOiMO81h46HaedGrRwImjgV9WbMw1vfyo0IP2lfKkJytDclF5399mSQkmB/rayIfSf
         BPWnecbZdn2FoIlZDgNEEWka+lLuubzQjX6eYPylF0MpAaPm+gsfrrM6E7/Ba/OJw2rm
         7GRsuZgfue9e6PKWtkewCSixDROW0+evjGX7aDa/JzNFZ4Q9ZjFz7V7x/1TbiVFIS4AM
         6e4pl/dz5YQjWg+RaHe0us44TvZyhcmtR3zi6bpG2Xs3zP5p2t1JZ63xr9Nwb6YEoW83
         vu0w==
X-Gm-Message-State: AAQBX9eNmM4C1ibQYrToo3ZdQXPjlx8/vpth36QB67w5KlWsDnMMmfAB
	1CW4glooLgxjObdAG7hYRc0=
X-Google-Smtp-Source: AKy350Yfsz8pokbm+WLlXGCqYoauSB33GAtn2ZEuFtPM657L3N+8DOR1vE+fbxwQQ7ZaL7nCXRMN1w==
X-Received: by 2002:a17:906:d4:b0:947:bff2:1c2b with SMTP id 20-20020a17090600d400b00947bff21c2bmr2971926eji.1.1681497294723;
        Fri, 14 Apr 2023 11:34:54 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id m9-20020a1709062b8900b0094a9b9c4979sm2781449ejg.88.2023.04.14.11.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 11:34:54 -0700 (PDT)
Date: Fri, 14 Apr 2023 20:34:52 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Fix W_DISABLE# does not work after
 stop/start
Message-ID: <20230414183452.GA12295@matrix-ESPRIMO-P710>
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

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Tested with rtl8192e (WLL6130-D99)
Transferred this patch over wlan connection of rtl8192e
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 45989a77a27c..a644543015ee 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -648,6 +648,7 @@ static int _rtl92e_sta_up(struct net_device *dev, bool is_silent_reset)
 	else
 		netif_wake_queue(dev);
 
+	priv->bfirst_after_down = false;
 	return 0;
 }
 
-- 
2.40.0

