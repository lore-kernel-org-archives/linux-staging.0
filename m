Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBD70
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 16:45:49 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id x4so7337834edd.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 09:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/em5EuQEHT+Z/PGnvdzE9LeXg+II9Wp6x7IJLoWZ9w=;
        b=sftEeqGMQ73HmmfgNBNQ6lTc0oTCxDPRrt7cQWCEyZr+TLVCj9fj3HJ/qdoyx/Z3F/
         7DG1LAvqNivMSX6nGZVjNkwfNvh9dAJE78jI4NlIpexLR/s8dn/5gjHekcIQS4evE+dV
         MNTjt2EWSqUrKIs3O1EH+D/pj8whcIbgcnY8tf2jQke7jRpQRQZSkhxe//eGnwpvzo7L
         yhbuEiKDGWGxm9vjaU0i88rvuZmr7X+HO4dnJTuuM3uV1E7WzeTKGnZHLr+zc8xcfXpS
         Q8hJBpADbLarpYn/ubFkvHEAs4zIA/5MS5QrVeTwhSQwNtlm3A5rKN4fcd6tqPkjwG/6
         VAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/em5EuQEHT+Z/PGnvdzE9LeXg+II9Wp6x7IJLoWZ9w=;
        b=evCxoD11ya98uwEaTraGvdBoKmczPfCVKDtG4JZf88XWNlaE6QdR6A9XDydi1xbNqd
         3ObxFbMbviMhypEBYNpGDpYzJygriIW5Q3y1yhCnu0FZ7PU4YAcx+HniWBPEUlFeMY5a
         HQQ6X+whmRpGmILcCPWBpVTZ7eLQ4D4yWtc6U6u8NeTISmnumaYkMiK1h3o1UCuJ1SYl
         Tav1J7qCrUzpz8NzSQtDcC7ZkZAS77DEHSOfk0xM/wKWYPRcukL/AlETYjlh6siv7XM8
         kXNFeHNpM6HzPjUariWEdV9bgAJCvw9MELxrgX+gY0Ktz+J/4dsYqyWuLxU9i0Z6m7D2
         C0LQ==
X-Gm-Message-State: AOAM533UN1vVi6lp6Mqn+j1fb3xZzVSYSvOoRNN93xSB4PJm3v7c2FP6
	3klOeVJQjEzGE/djcACklQI=
X-Google-Smtp-Source: ABdhPJwCYxiF0e5NsFjn6l+ySNyQHGBzCq2GEXx8piWA2Bw1y9SuYAbslkTc9gprovP5lc9CviQBgg==
X-Received: by 2002:a05:6402:1857:: with SMTP id v23mr18127004edy.362.1617986747682;
        Fri, 09 Apr 2021 09:45:47 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id dh27sm1706143edb.28.2021.04.09.09.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:45:47 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 2/3] staging: rtl8723bs: Change the type and use of a variable
Date: Fri,  9 Apr 2021 18:45:43 +0200
Message-Id: <20210409164543.30878-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the type of fw_current_in_ps_mode from u8 to bool, because
it is used everywhere as a bool and, accordingly, it should be
declared as a bool. Shorten the controlling
expression of an 'if' statement.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c        | 2 +-
 drivers/staging/rtl8723bs/include/rtw_pwrctrl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 96fe172ced8d..8dc4dd8c6d4c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -348,7 +348,7 @@ void rtw_hal_dm_watchdog(struct adapter *padapter)
 
 void rtw_hal_dm_watchdog_in_lps(struct adapter *padapter)
 {
-	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode == true) {
+	if (adapter_to_pwrctl(padapter)->fw_current_in_ps_mode) {
 		if (padapter->HalFunc.hal_dm_watchdog_in_lps)
 			padapter->HalFunc.hal_dm_watchdog_in_lps(padapter); /* this function caller is in interrupt context */
 	}
diff --git a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
index 5450d20b44a6..c03ae33b0aa6 100644
--- a/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8723bs/include/rtw_pwrctrl.h
@@ -203,7 +203,7 @@ struct pwrctrl_priv {
 	u8 LpsIdleCount;
 	u8 power_mgnt;
 	u8 org_power_mgnt;
-	u8 fw_current_in_ps_mode;
+	bool fw_current_in_ps_mode;
 	unsigned long	DelayLPSLastTimeStamp;
 	s32		pnp_current_pwr_state;
 	u8 pnp_bstop_trx;
-- 
2.31.1

