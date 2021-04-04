Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B71259E
	for <linux-staging@lists.linux.dev>; Sun,  4 Apr 2021 22:24:08 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so4929052pjg.5
        for <linux-staging@lists.linux.dev>; Sun, 04 Apr 2021 15:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=xbW2w5yQVlrKo7msMrOVrutuhsz59oCxVj2wRLsK5KQ=;
        b=Ez+/ePEATnb3tBEEv8CrHYtzbFqU7i81MOMXApLzJQEszLsfHdIeCvJMlyzvWCYHTm
         aydi5oy7uZ3yqCf/ii2gJAHPeHGkb14YU9iB4UQjYQNhBecKCC+LEIEopWm0eMvDHVTH
         lzwH1NkwRxVabVpw7Rnx0hdy4D0WcVK2sT/2qVjATToXJmpGQBGoDMQY/mzzzvZ0UJoQ
         gvfjXiky3L1fIT9F/1OHV006ajlmNq+rVKJ6U1hnSD6p4dyqWhhT8NgSeOLXGDzQWEHU
         jcdGFEdHJ/+Z6IjdYuAywG/aLeS5A7DD7exwuDLIITibVGEOazHmso7AuNTPauQZfTfx
         RM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=xbW2w5yQVlrKo7msMrOVrutuhsz59oCxVj2wRLsK5KQ=;
        b=GKo87jGyhPyPaaPLYA7iJNmQCn38VsGe3RyCRPJHVfTmBCOPc7Tom/GEmafdNo4He0
         oGeN/fCRmhstIOsL5HIAqVvPfkPS0H7jQ4tZKkyo9aLpshoBg8/cWo0GFcF5ofmk++ng
         McSgxyiPpvPPUNpiN9Dd22/Gx5DDltC/gZE80mdiebbfQAk53RwhJOlVwrMsJbZPs6Ss
         oqv4xS0gL87dUA+JwW7jxOUWnVP+mmZwxG/X0nlnd/QR2t4wH4tI/lprEZ8ow0PHpMKY
         iI2FeU2jDjLRVk9XDP/96LhLvID60NyFTWUHnakM21lhY4Opnr8J4xpBSuG6BCWnlffO
         5tVA==
X-Gm-Message-State: AOAM530ZLa1/BDXW2F7lEjCleAZWfTw60KEEUVAdXX4GakYI9dP1nsXh
	yQ3oUbs0lNU1blPF1phI7wU=
X-Google-Smtp-Source: ABdhPJwwRLcBrJhosiy0w6D0YQFSHdRtnAFIPwHSatYfFl1+5fGsA/iuf/znSy76C7lyh/UTjehqpA==
X-Received: by 2002:a17:902:44a:b029:e8:eb05:d0a0 with SMTP id 68-20020a170902044ab02900e8eb05d0a0mr5698810ple.50.1617575047687;
        Sun, 04 Apr 2021 15:24:07 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id d25sm13499574pfo.218.2021.04.04.15.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Apr 2021 15:24:07 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	yashsri421@gmail.com,
	john.oldman@polehill.co.uk,
	vkor@vkten.in
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH] staging: rtl8192e: move const after static
Date: Sun,  4 Apr 2021 15:23:49 -0700
Message-Id: <20210404222349.7218-1-deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Move the const after static to conform with kernel preference for
static const <type> declaration style instead of static <type> const.
Identified by checkpatch: WARNING: Move const after static - use 'static
const char'.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index e340be3ebb97..c53aa2d305ca 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -260,7 +260,7 @@ void rtl92e_dm_watchdog(struct net_device *dev)
 static void _rtl92e_dm_check_ac_dc_power(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	static char const ac_dc_script[] = "/etc/acpi/wireless-rtl-ac-dc-power.sh";
+	static const char ac_dc_script[] = "/etc/acpi/wireless-rtl-ac-dc-power.sh";
 	char *argv[] = {(char *)ac_dc_script, DRV_NAME, NULL};
 	static char *envp[] = {"HOME=/",
 			"TERM=linux",
@@ -1801,7 +1801,7 @@ static void _rtl92e_dm_check_rf_ctrl_gpio(void *data)
 	enum rt_rf_power_state eRfPowerStateToSet;
 	bool bActuallySet = false;
 	char *argv[3];
-	static char const RadioPowerPath[] = "/etc/acpi/events/RadioPower.sh";
+	static const char RadioPowerPath[] = "/etc/acpi/events/RadioPower.sh";
 	static char *envp[] = {"HOME=/", "TERM=linux", "PATH=/usr/bin:/bin",
 			       NULL};
 
-- 
2.17.1

