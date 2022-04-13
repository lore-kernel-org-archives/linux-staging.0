Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665A2F32
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 19:37:49 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1neio8-0005fr-TW; Wed, 13 Apr 2022 21:37:41 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 6/8] staging: r8188eu: clean up the code to set ips_deny_time
Date: Wed, 13 Apr 2022 21:36:52 +0200
Message-Id: <20220413193654.258507-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220413193654.258507-1-martin@kaiser.cx>
References: <20220409151557.207980-1-martin@kaiser.cx>
 <20220413193654.258507-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up the code in rtw_pwr_wakeup that sets pwrpriv->ips_deny_time.

Make ips_deny_time an unsigned long, this type is used by the kernel
functions that process jiffies.

Remove the temporary variable ips_deffer_ms and use
RTW_PWR_STATE_CHK_INTERVAL directly.

There's no need to set ips_deny_time twice, it's sufficient to set it at
the end of rtw_pwr_wakeup.

Use time_before to check if ips_deny_time should be updated.

We can now remove rtw_ms_to_systime, this function is not used any more.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c      | 13 ++++---------
 drivers/staging/r8188eu/include/osdep_service.h |  1 -
 drivers/staging/r8188eu/include/rtw_pwrctrl.h   |  2 +-
 drivers/staging/r8188eu/os_dep/osdep_service.c  |  5 -----
 4 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 2ad6105e6ec4..605210d89f32 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -373,14 +373,8 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	unsigned long timeout = jiffies + msecs_to_jiffies(3000);
+	unsigned long deny_time;
 	int ret = _SUCCESS;
-	u32 ips_deffer_ms;
-
-	/* the ms will prevent from falling into IPS after wakeup */
-	ips_deffer_ms = RTW_PWR_STATE_CHK_INTERVAL;
-
-	if (pwrpriv->ips_deny_time < jiffies + rtw_ms_to_systime(ips_deffer_ms))
-		pwrpriv->ips_deny_time = jiffies + rtw_ms_to_systime(ips_deffer_ms);
 
 	while (pwrpriv->ps_processing && time_before(jiffies, timeout))
 		msleep(10);
@@ -406,8 +400,9 @@ int rtw_pwr_wakeup(struct adapter *padapter)
 	}
 
 exit:
-	if (pwrpriv->ips_deny_time < jiffies + rtw_ms_to_systime(ips_deffer_ms))
-		pwrpriv->ips_deny_time = jiffies + rtw_ms_to_systime(ips_deffer_ms);
+	deny_time = jiffies + msecs_to_jiffies(RTW_PWR_STATE_CHK_INTERVAL);
+	if (time_before(pwrpriv->ips_deny_time, deny_time))
+		pwrpriv->ips_deny_time = deny_time;
 	return ret;
 }
 
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index f1f3e3ba5377..1e55a8008acc 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -78,7 +78,6 @@ void *rtw_malloc2d(int h, int w, int size);
 	} while (0)
 
 u32  rtw_systime_to_ms(u32 systime);
-u32  rtw_ms_to_systime(u32 ms);
 s32  rtw_get_passing_time_ms(u32 start);
 
 void rtw_usleep_os(int us);
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 3084d00628bd..6e9fdd66fad1 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -56,7 +56,7 @@ struct pwrctrl_priv {
 	u8	ips_mode_req;	/*  used to accept the mode setting request,
 				 *  will update to ipsmode later */
 	uint bips_processing;
-	u32 ips_deny_time; /* will deny IPS when system time less than this */
+	unsigned long ips_deny_time; /* will deny IPS when system time less than this */
 	u8 ps_processing; /* temp used to mark whether in rtw_ps_processor */
 
 	u8	bLeisurePs;
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 6824a6ab2e36..7b177d50eee2 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -47,11 +47,6 @@ inline u32 rtw_systime_to_ms(u32 systime)
 	return systime * 1000 / HZ;
 }
 
-inline u32 rtw_ms_to_systime(u32 ms)
-{
-	return ms * HZ / 1000;
-}
-
 /*  the input parameter start use the same unit as jiffies */
 inline s32 rtw_get_passing_time_ms(u32 start)
 {
-- 
2.30.2

