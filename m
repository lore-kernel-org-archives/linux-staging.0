Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AF7311C3D
	for <linux-staging@lists.linux.dev>; Fri, 12 Dec 2025 09:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530590; cv=none; b=VdfVmTgv8rKZVKyvBdF5MUG2X8H2MhDet7KoJ27i1EoyUWwqaILcawUbk3TtIFRQxNYofn27XbGWg0KKCMYjm3sbks8bSYQKAoOX7Qg9FBJ7CBhweLREbHnz03bUW09evg+oB0+82BcnrRblVcTSQ1uRwd8Ba76fNIVw7NkFf4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530590; c=relaxed/simple;
	bh=D3r6i/9NO+Z8npqC3z8MwA4TdeRf+4guQ8E3+jDRfts=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4kpnFarIhR51pvH4CoxOLEn9OCmsNx2E0GS2AyYie/I12tv1ZcprlkH2Y9rJ8wfENESUFn4POQTPqAtzW9mpBOVPxEzmQVLSZEcd8q7Or+7GTQ6KXLrOzKb/rZgJp0K92Up1cL5gU7mSvfoSI9ZETtdR31jyu3NXmXRh9+9XrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b8xFrEAl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b8xFrEAl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477aa91e75dso1087885e9.3
        for <linux-staging@lists.linux.dev>; Fri, 12 Dec 2025 01:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765530584; x=1766135384; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0bywhy8b7lhxjwCitj4kHzqHoOqcr4/tmmb6FN4ugs=;
        b=b8xFrEAl82qOWAcmOMSTHTKCmwwcmqDJEV0B0CCxWUUkTwHwAyKO5qg1cP2IgRe8xs
         VuzOPrF16G946cZyzoSo+oB2exlwqzvHUrTbABJ3dSVjtNC9UTbV0LPYJvMLZhXnCe2V
         zwjqjDy0tuS3gpmS6/RODHmeEkS8CA46wRpoEkOe+atsKT2yOn0RG1l0CuyocSEgbXce
         KiX+pboQd2seN1QssmvdygZHZ7GFPECPEoFmTjgLPIZCWpYa1Hj11/ef5TPWC7Mj7uZb
         u0fZ462nM0AXDb/Nicf8Xa5tu/4JVj5q8o3ZIgKj+qdoM+J9AsgqrLK25RjyZfaTlny6
         2wIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765530584; x=1766135384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0bywhy8b7lhxjwCitj4kHzqHoOqcr4/tmmb6FN4ugs=;
        b=GtFdVmL/RuPa3B0ggr6DLymx+DS9dhan7K7cdgkhj5zt91V/0oXsI4OKZUuKujTugV
         8aHkOGArBcXKDsi+I4s4iS4GFf0T9mcbuiEeYxGHRUvz8k/4kBBKx9E6zjdAOK3dXIji
         GwEwm1FoSy+I3sBshQgjPbScgSgrHb8mnZPrpm7sKfL8xlE7iSELUTBfKKGICTn+rcLM
         1ewlbv5rWO/MfQGMq1z4D87aT9DM/OOxSeQ3K69JTO/OJGazSohEo+HmOBhfCZeICIVK
         Tpf9B8IKE0INcHeILHVPuYl1OHe+xBSVNySK3KY7XbTe3wbbhVYgfdgyN7E6cN6055hX
         9d2w==
X-Gm-Message-State: AOJu0YwVvlM8PW/qnz8OaIpQAGCidXrbCXYDa1Nqo9RVArHjJQtU4qHz
	SX1A9rPBaOoNrPWc50nCZ0LkiHkNM2NSpHPP8ZCyUpF1A66g7Fny4C49
X-Gm-Gg: AY/fxX5RF8I2fMKg8Xfhyzqgx9KaP+j/1bg40NHOjp0ZKoIswsUQqWCx1CLrZnVj9Am
	HVHpXSTQEj3r7PKWT5Y3UaosfGOadNu4C8Z9F0N98DS0S9SvsWbYzw5lpNOVWlYpc1P2R7PEWN9
	I5CECDNfBmOksgYl0SeVdWRdy20ucQQMS4ZquKKD5CSRB88Z6bJRBGGwEvHoLX/ljhGKkQDr7rX
	WtAp8I8KiYkyB24ck2xq8MZuLcKKSmBcVNVXbeZdU2YotH5vQ1eDoqZO+wwFEIzaFUuPKPe+psT
	+ViNDGHawAxb5k2LzLus9kzgFP9TNuCLHhFkCp2DYP/PtNYsyYaxlqk8gJayrzE1Aso6HMoVsR0
	A42c7PmV7tN15S9Jbm3eY1Ei6MqNHGVbHmrh9AP2rX4Sb37gI92nOv3lYID5ioRQViUBYHowpGZ
	EgBcTNJd770D8q2sJA9zU/XUT1nRrbdUk0QIoYKiiRHUAYZ7zLDuUFFM3U
X-Google-Smtp-Source: AGHT+IGBXNFRXnl7TTmyc+Mpbg2I69mKInzMUHolOjpY480LxHY8Q9SSmMQGsanH5vxG1DT9j2vV7w==
X-Received: by 2002:a05:600c:8b62:b0:471:1387:377e with SMTP id 5b1f17b1804b1-47a8f90f781mr8789955e9.6.1765530583578;
        Fri, 12 Dec 2025 01:09:43 -0800 (PST)
Received: from DESKTOP-5CG7AFG.localdomain ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8f8d9c6fsm21403645e9.11.2025.12.12.01.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 01:09:43 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix memory leaks on rtw_enqueue_cmd() failure
Date: Fri, 12 Dec 2025 13:09:21 +0400
Message-ID: <20251212090920.84238-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add error handling for rtw_enqueue_cmd() failures in multiple event
reporting functions.

When rtw_enqueue_cmd() fails to enqueue a command, the allocated memory
for the command object and its parameter buffer is not freed, causing
memory leaks. Add proper error checks and free the allocated memory on
failure in report_survey_event(), report_surveydone_event(),
report_join_res(), report_wmm_edca_update(), report_del_sta_event(),
report_add_sta_event(), and survey_timer_hdl().

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f0e3f5568..f0831d582 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4431,10 +4431,10 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 	process_80211d(padapter, &psurvey_evt->bss);
 
 	if (rtw_enqueue_cmd(pcmdpriv, pcmd_obj) == _FAIL) {
-	kfree(pcmd_obj);
-	kfree(pevtcmd);
+		kfree(pcmd_obj);
+		kfree(pevtcmd);
 	return;
-	}
+			}
 
 	pmlmeext->sitesurvey_res.bss_cnt++;
 
@@ -4481,8 +4481,8 @@ void report_surveydone_event(struct adapter *padapter)
 	psurveydone_evt->bss_cnt = pmlmeext->sitesurvey_res.bss_cnt;
 
 	if (rtw_enqueue_cmd(pcmdpriv, pcmd_obj) == _FAIL) {
-	kfree(pcmd_obj);
-	kfree(pevtcmd);
+		kfree(pcmd_obj);
+		kfree(pevtcmd);
 	}
 
 	return;
@@ -4534,8 +4534,8 @@ void report_join_res(struct adapter *padapter, int res)
 
 
 	if (rtw_enqueue_cmd(pcmdpriv, pcmd_obj) == _FAIL) {
-	kfree(pcmd_obj);
-	kfree(pevtcmd);
+		kfree(pcmd_obj);
+		kfree(pevtcmd);
 	}
 
 	return;
@@ -4581,8 +4581,8 @@ void report_wmm_edca_update(struct adapter *padapter)
 	pwmm_event->wmm = 0;
 
 	if (rtw_enqueue_cmd(pcmdpriv, pcmd_obj) == _FAIL) {
-	kfree(pcmd_obj);
-	kfree(pevtcmd);
+		kfree(pcmd_obj);
+		kfree(pevtcmd);
 	}
 
 	return;
@@ -4640,9 +4640,9 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	pdel_sta_evt->mac_id = mac_id;
 
 	if (rtw_enqueue_cmd(pcmdpriv, pcmd_obj) == _FAIL) {
-	kfree(pcmd_obj);
-	kfree(pevtcmd);
- }
+		kfree(pcmd_obj);
+		kfree(pevtcmd);
+	}
 }
 
 void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int cam_idx)
@@ -4685,9 +4685,9 @@ void report_add_sta_event(struct adapter *padapter, unsigned char *MacAddr, int
 	padd_sta_evt->cam_id = cam_idx;
 
 	if (rtw_enqueue_cmd(pcmdpriv, pcmd_obj) == _FAIL) {
-	kfree(pcmd_obj);
-	kfree(pevtcmd);
- }
+		kfree(pcmd_obj);
+		kfree(pevtcmd);
+	}
 }
 
 /* Following are the event callback functions */
@@ -5116,8 +5116,8 @@ void survey_timer_hdl(struct timer_list *t)
 
 		init_h2fwcmd_w_parm_no_rsp(ph2c, psurveyPara, GEN_CMD_CODE(_SiteSurvey));
 		if (rtw_enqueue_cmd(pcmdpriv, ph2c) == _FAIL) {
-	kfree(ph2c);
-	kfree(psurveyPara);
+			kfree(ph2c);
+			kfree(psurveyPara);
 	}
 	}
 }
-- 
2.47.3

