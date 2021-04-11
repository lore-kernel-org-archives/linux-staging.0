Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD272
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 10:56:23 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id g17so10827706edm.6
        for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 03:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q1npjWd8vdjVzI836QvD79nNpNz24IQNsqdLifo9GH0=;
        b=f6xP84EIdrHfCpLbq2zehKVLF0fdPl/MmFhD3LPidsCDsrKXRqKIf/XUvdY6D7ZfqS
         4WaNFTuqcO5IqI2pWyISAYeoRe5IHVptcbp9RvkbU8mGfvMlkwGx8Lx2m2w16j4MMUxZ
         00gYkTcZ9YpTHk21ms9NUgm06UQt30BQYx39wisUHCOhw4uWJYIitpNy03Y/mps5ChIZ
         PFpKTuMcKpAmDDU90O1rh2tL+3JnM101kmSNjzGR3sXPC2YTONnjvMHI1boQ+ruk/dYq
         r8u2ZMLJvTEc4FTwlMJrR+kXcB5aSxE5cNxVvSMb5DtbvZE93omU1jhU6k57CdSfszDd
         YtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q1npjWd8vdjVzI836QvD79nNpNz24IQNsqdLifo9GH0=;
        b=n841PeQCAaPAq5gAeFLYlhrKOl5+egb8dmMMoW9/7Xv+Jfz1lbselm6GqirEMhh8n/
         XinwYaW+euClj2ASweSBZjILz7Iz7v9TpAjsrPsTA+qBMur6wlFXrIId/eFMaMH1Xmtw
         V5CP5E4oL/rh7ZOa9ge5mBrv4YNkyx+Pcn4zrK7Hp7j4W9jzA1Z50NS+BJmqXniJUN2Q
         X9BwkU3AtvhRs47ZpjMC/kYmT5ABTlMIz0uR+5MSeRv/V40YODtKCDUpMvHwK5omBqez
         gG1L5hN0j18UyHlVJn4niKX8B5qLDHANJc8xVtgTzO2JnL9w8bXy+iddj3zJXH/pROjp
         aswA==
X-Gm-Message-State: AOAM531opcoOU0ycmIgkj4PT3fKl44amS0rKQO6gar+yaNOr9FyC61ps
	lBRQ05IDX5qcOVyDJuRGUBB5ZMAVJbGjrOF7
X-Google-Smtp-Source: ABdhPJyt/f/XCCQ4jVqHM0MGNQwcU2nzXTp+mm1Ss+nSPSgWyBd8fPSTELDDYAczjdB429D4bl9kkQ==
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr24567953edd.278.1618138582343;
        Sun, 11 Apr 2021 03:56:22 -0700 (PDT)
Received: from localhost.localdomain (host-95-237-55-30.retail.telecomitalia.it. [95.237.55.30])
        by smtp.gmail.com with ESMTPSA id f10sm4369100edd.29.2021.04.11.03.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Apr 2021 03:56:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	outreachy-kernel@googlegroups.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v4 4/4] staging: rtl8723bs: Change controlling expressions
Date: Sun, 11 Apr 2021 12:56:08 +0200
Message-Id: <20210411105608.12900-5-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210411105608.12900-1-fmdefrancesco@gmail.com>
References: <20210411105608.12900-1-fmdefrancesco@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change controlling expressions within 'if' statements: don't compare
with 'true'.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v3: Move changes of controlling expressions in patch 4/4.
Changes from v2: Rewrite subject in patch 0/4; remove a patch from the
series because it had alreay been applied (rtl8723bs: core: Remove an unused variable).
Changes from v1: Fix a typo in subject of patch 1/5, add patch 5/5.

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 drivers/staging/rtl8723bs/hal/hal_intf.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 32079e0f71d5..0297fbad7bce 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1507,7 +1507,7 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 	if (pwrpriv->dtim != dtim)
 		pwrpriv->dtim = dtim;
 
-	if ((pwrpriv->fw_current_in_ps_mode == true) && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
+	if (pwrpriv->fw_current_in_ps_mode && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
 		u8 ps_mode = pwrpriv->pwr_mode;
 
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
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
-- 
2.31.1

