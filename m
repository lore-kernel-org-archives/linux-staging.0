Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B902FA4C
	for <linux-staging@lists.linux.dev>; Wed,  1 Mar 2023 21:54:45 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id f13so59855437edz.6
        for <linux-staging@lists.linux.dev>; Wed, 01 Mar 2023 13:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677707684;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b0zJx89rfTELdYNbGB67wBjBgKXyCkkaq+sJ4qdy1og=;
        b=jswc3DMkk0426qSQmx5Zjjzc994E/G+dahV+f75JwdlXAV98BmkOA8LQ5/AsVGU+Hy
         6fEGkqqE83vGKSiMrKxXveIe/u3vEj2xkzlPzVZjBGqmoUGBp/iDOxnZ3+el+Ii0pjmv
         HTB6ES5nU7yMYH9NFqx+aczOmdp57LNhQHjZ20uhh4l64DQh+kKcsi85kNB6JphOaana
         SZT0l3hWePyXO1+XykacVV0E4wAY9ju7+G6NnBNVIdNz2jVGJ55YvqXj0y/NL5LYWP1Q
         1XzxScP2P7gp3osHOvWp8O7FejLdmKOFodXmaGlUyQgK4zsV4Rnj3/ghl2FN1yTUBBKz
         a5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677707684;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b0zJx89rfTELdYNbGB67wBjBgKXyCkkaq+sJ4qdy1og=;
        b=pF+DkT1eDf+jyCeQPd5AozdPxQNuXD6CBtk9CUy1SapaDBQZYDdPQdqxUScorRZw1F
         Fi5wiY+ov0VUcY3LaXN9d4wVLxO2E1wnXQudzXmwj5WJ/4U4V49M9hQQLPiuDTFCJlhb
         ccfHHUaOj+WQdl0cReX9kBbrPFxk2mhNfd7XAllNrXq7i3UEYBdeoWDpBSA77AHVXFUy
         rwBFYvccHpvOrFT9vYjy2NUi/bTf0aJRAoDQ/saqTznYmDjsR5iWg1xa4P7jq/zyWs6g
         H8rcl+nxMOw3fr8L/UTdzUMK6Mb1+UCd/yz01Gu+LVOgwuj4BObExrYbaSc4m+c1pzSt
         YD7w==
X-Gm-Message-State: AO0yUKVp/ZR8OrNoUEu11Hc3m+Hfjvf8b4LOHzePYv9viao5NsGlN070
	uRlDb7hNvIdRvAo9rnp3cvE=
X-Google-Smtp-Source: AK7set/5eYdTMz7sAdBJfM/DXo+o39OJnj9v29w//m67DhEG7gaIfwDXGNpArRQFaJEcIgOtJJWw4g==
X-Received: by 2002:a17:906:3f44:b0:88f:1255:59c with SMTP id f4-20020a1709063f4400b0088f1255059cmr8232235ejj.1.1677707683785;
        Wed, 01 Mar 2023 13:54:43 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id c15-20020a170906340f00b008e7916f0bdesm6282232ejb.138.2023.03.01.13.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 13:54:43 -0800 (PST)
Date: Wed, 1 Mar 2023 22:54:41 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Remove call_usermodehelper starting
 RadioPower.sh
Message-ID: <20230301215441.GA14049@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove call_usermodehelper starting /etc/acpi/events/RadioPower.sh that
is not available. This script is not part of the kernel and it is not
officially available on the www. The result is that this lines are just
dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
I found a hint in this blog about the content of the script:
https://github.com/Dekadencee/rtl8187-Linux-Driver/blob/master/ReadMe

If you know more about the purpose and the need for this script please
respond.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index c04eb15c4044..d8408acfc763 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1637,10 +1637,6 @@ static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 	u8 tmp1byte;
 	enum rt_rf_power_state rf_power_state_to_set;
 	bool bActuallySet = false;
-	char *argv[3];
-	static const char RadioPowerPath[] = "/etc/acpi/events/RadioPower.sh";
-	static char *envp[] = {"HOME=/", "TERM=linux", "PATH=/usr/bin:/bin",
-			       NULL};
 
 	bActuallySet = false;
 
@@ -1670,14 +1666,6 @@ static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 		mdelay(1000);
 		priv->hw_rf_off_action = 1;
 		rtl92e_set_rf_state(dev, rf_power_state_to_set, RF_CHANGE_BY_HW);
-		if (priv->hw_radio_off)
-			argv[1] = "RFOFF";
-		else
-			argv[1] = "RFON";
-
-		argv[0] = (char *)RadioPowerPath;
-		argv[2] = NULL;
-		call_usermodehelper(RadioPowerPath, argv, envp, UMH_WAIT_PROC);
 	}
 }
 
-- 
2.39.2

