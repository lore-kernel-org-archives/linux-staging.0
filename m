Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FEE9459
	for <linux-staging@lists.linux.dev>; Tue, 28 Feb 2023 20:29:01 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id i34so45161568eda.7
        for <linux-staging@lists.linux.dev>; Tue, 28 Feb 2023 12:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677616140;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3QtVJrWXC9rGmnnc7M284yV9DN6nBtrJT7HUgADRWDs=;
        b=C/G2C4DVX2bGqJJUEz6VqNG1FmT5cewYqbcHX8sBNLCdYALG3RHO+5ToBh9LXcgtjf
         ctTMPXYcLWDvEg8di09qPjCdXvxvxReRYrKFFwL107leynYPYoQADs2HygD3SR7crrI3
         Ch0gsNPRUL9mCZLY6Unt6vlj7/IQB/2NpIZYKxrXXaCh4x/+vJjIX6ed8qclTvPhqAmx
         lMYkKuytiTlnZfLCrOn57MNjSp7ZUPUTQl2k03kRvZEKoBS7vB2E+d9iSLN/X4gedDfa
         TtCHk5OMvxz+1/4SHiIcr7XMdZi4zRPhgAb/x+O61Gu2vV9ZABcjJK7V0D1CFcnhbYM1
         XZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677616140;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QtVJrWXC9rGmnnc7M284yV9DN6nBtrJT7HUgADRWDs=;
        b=iCwEzcddi+FJWflEANLgI/WwwY4dcoADG/kn037jiidjtD55OS7b9Vp98p2eoKwQQo
         WrOmc9eiPav75z9sVSltBIqpZRMycvvpoV43nvF4WsiLcal9VPtarOayel2eBVMjbrlT
         xRTF8YF+OrPnrhZlrRdnpWekjHhK2mexyRH3PkDnTfsDFEVNxGDLL+RLsb0eKxfZ6JZq
         qrgJriGEQ2ftGnpXOXohmVrR6rpmW6QhYzOovHV9YJwOOaTvkHXLmbiY+HT+4zVwfj6x
         LSKa3EzoCUXLHyikgBd9JKegGui7Hwlgc0nfvOpl9OhnlC52alM9kM8lhBvwf0y4WOdS
         KLyw==
X-Gm-Message-State: AO0yUKWXLBrwyX7RgzE/lSTGeCTDemNpepDIRY9LO8KtDqbo0/eC+zpM
	2RR/nfrQ8ckDB2Zl5HaNRTo=
X-Google-Smtp-Source: AK7set9zoo+TtHubqBJwmOt0qb1kPXXRmSV9dMnMd7bcIxofX2ktlVf9srCD6WTwISP3DlfCJ+kyQw==
X-Received: by 2002:a17:906:251:b0:8b1:94cc:10b1 with SMTP id 17-20020a170906025100b008b194cc10b1mr3956372ejl.7.1677616140132;
        Tue, 28 Feb 2023 12:29:00 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id t6-20020a17090616c600b008d356cafaedsm4778427ejd.40.2023.02.28.12.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 12:28:59 -0800 (PST)
Date: Tue, 28 Feb 2023 21:28:57 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Remove function ..dm_check_ac_dc_power
 calling a script
Message-ID: <20230228202857.GA16442@matrix-ESPRIMO-P710>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove function _rtl92e_dm_check_ac_dc_power calling a script
/etc/acpi/wireless-rtl-ac-dc-power.sh that is not available. This script
is not part of the kernel and it is not available on the www. The result
is that this function is just dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
I found a hint in this blog about the content of the script:
https://www.kubuntuforums.net/forum/archives/eol-releases/-9-10/network-
support-ai/41269-realtek-lan-connection-timeout

If you know more about the purpose and the need for this script please
respond.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 23 ----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index d8455b23e555..c04eb15c4044 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -185,7 +185,6 @@ static void _rtl92e_dm_init_fsync(struct net_device *dev);
 static void _rtl92e_dm_deinit_fsync(struct net_device *dev);
 
 static	void _rtl92e_dm_check_txrateandretrycount(struct net_device *dev);
-static  void _rtl92e_dm_check_ac_dc_power(struct net_device *dev);
 static void _rtl92e_dm_check_fsync(struct net_device *dev);
 static void _rtl92e_dm_check_rf_ctrl_gpio(void *data);
 static void _rtl92e_dm_fsync_timer_callback(struct timer_list *t);
@@ -236,8 +235,6 @@ void rtl92e_dm_watchdog(struct net_device *dev)
 	if (priv->being_init_adapter)
 		return;
 
-	_rtl92e_dm_check_ac_dc_power(dev);
-
 	_rtl92e_dm_check_txrateandretrycount(dev);
 	_rtl92e_dm_check_edca_turbo(dev);
 
@@ -255,26 +252,6 @@ void rtl92e_dm_watchdog(struct net_device *dev)
 	_rtl92e_dm_cts_to_self(dev);
 }
 
-static void _rtl92e_dm_check_ac_dc_power(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	static const char ac_dc_script[] = "/etc/acpi/wireless-rtl-ac-dc-power.sh";
-	char *argv[] = {(char *)ac_dc_script, DRV_NAME, NULL};
-	static char *envp[] = {"HOME=/",
-			"TERM=linux",
-			"PATH=/usr/bin:/bin",
-			 NULL};
-
-	if (priv->rst_progress == RESET_TYPE_SILENT)
-		return;
-	if (priv->rtllib->state != RTLLIB_LINKED)
-		return;
-	call_usermodehelper(ac_dc_script, argv, envp, UMH_WAIT_PROC);
-
-	return;
-};
-
-
 void rtl92e_init_adaptive_rate(struct net_device *dev)
 {
 
-- 
2.39.2

