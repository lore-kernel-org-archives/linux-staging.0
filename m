Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17DB5A0ABB
	for <linux-staging@lists.linux.dev>; Tue,  8 Sep 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892491; cv=none; b=gTp+QM79YAwgf3y/FuC6PS3c0HunrRoSrrcPrBKdLHXOeqBVc+K9yAsFAzR5L6qTs4CjHDZ8p/1MTRyEy56WfRCjPb/hNy7RtBLlVKcIZeFc5FGOFWu4y3+Yegnlyh/do6KEbGAq8w8WGiX1WOHjhpV5QSJ+nXJTZwkMNsc9F3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892491; c=relaxed/simple;
	bh=wsFGt27t0nLlo86eLGfzZenv3hwvBtq4VBr5Xshw1OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FG8N4RE+P0c13gbcNcPy3djytfXCQKstH4EINo5hbg3WDMdg4MmCMHoJnqQ/+cx9efcR6UHgfAFQ4iQA1PJCOB8ETNjSHqjgPC786JkYHtWJV2bhHmhFNqMymjaJIv1OV4uzWdHmqVuYycgLL+vaLg9kCX5NAJWeoC37g9BwLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYTiPijz; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYTiPijz"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so60022175e9.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Sep 2026 11:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892485; x=1789497285; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlZmMSgpcIUohFqmw3B856SSb33iz8H9DWQianW24Z4=;
        b=AYTiPijzVgrDJTKx5M3QM2YKyV4Hcrz/IGrpfjKEQ6/bjF39ZE2WDb2UGUgo8+43EI
         z1IYnZWC5hcgeWqptptDgg4g0NDRIGKaT91D2u2kBnOYZFf6j4gKulylb5g9M3FU+8cB
         fP/Ryb8l6o/7iSO/rArGVznh/wzLWB+p0LlvzTirJlA7NNUJKclfIlmaUNv/sGUwXibT
         41HT9/CwkloGyhLJUomty+9/lVZjCr53KMWfOYb0X82iZiEEwDCNPWkCcN6JUiuQ04jE
         AzpK3Y5I7jukmR9EzbeLF2snBA6gqAF1PXhFHvp3GIOmUZX2gFv8uvD0AweE9EJ9Fm42
         yxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892485; x=1789497285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlZmMSgpcIUohFqmw3B856SSb33iz8H9DWQianW24Z4=;
        b=OYoIl4RY55Hdsx3ZghE6brQRlWKdRW/UqLg2+k0WMdSEhCQNOzDXp2s9v4QnBYD9Br
         y9gdzlSow0Oik/zPXv4FD0XglfM8wiVwZQnPpH3Tci/c5cua8rktODFX4z3D1gzTF+wG
         W2xtHHRKjl4cyYMwzB6iD0dTJazToEopXsvPVGRMs0rBVbDe/Ztt1gEF2xyaDgffCEIU
         EqlvLgoJ5iTX/0TGO0OCfwLF5U/78fHcPKM+wlAGcwtvPsQQE8ZQhj4eACOGdIpG9ims
         VM98SimhOr6X2n7/FBpSk8zHbO+yjUSpoiCth+Q+gdLi9lxQl70P2BCIWcHhDIcz0KL3
         Q+eg==
X-Gm-Message-State: AFuF++nnFcIIRbfRPyj2zveNDDDTjIyz6PI+WYeeAvhpompmno5Urn7Z
	iPM//IB/WKbYIqnYJc/4ZtuE4DD95s8edyfzbPnqmSvcm8ulsIhtGfE3AFKHU1ej
X-Gm-Gg: AYBFou2oY2V81PSPINZ8/cWNvwVOFB6CaeIiHC74sd6d46dDbt9/A/BuhIqRbWSK08e
	w0CJNytKjuSRM4bEtX3xjTAyyCfmNuft4fBfTjjTMJuRueO+uL8uWZzJPeei4JTTkRrYYXxRkNd
	Cy1sp1w3xsdclHjRchaEMf3v3A1XruCtH2qC3KmaU82No2MqFsbxvQ6+pCe4bF8GtNvuqmvQx/B
	K9nPrwffu+M6y4BqcHUTSaT5FXc05CBjUP85kQHjSHviQdmmc0AhXM5hLXUR6KfUoOAT6HpmDVr
	2Ra+WqK/sGA1pwfKxKCVCrbU3p8RhWg6Lp6n6vM+it0y6/gu4ZJy33nWfcr/9kgQst9DgTDSduz
	/LuxS/o5iz61kOcsPW5XqvNR+pwVJZpLeiMR7InMAmwzWuf/8rhndrMb/gtV5Qm22jUPC5VJ/0B
	FnXcP1DS73wrGcrS+lPXC+Y2+cj+N8dXkhPEmrNY/sImfcaTO0wxz722eVkK2BmyCl9Xg=
X-Received: by 2002:a05:600c:1c29:b0:49d:15f8:2bdb with SMTP id 5b1f17b1804b1-49d15f82becmr92678295e9.7.1788892484587;
        Tue, 08 Sep 2026 11:34:44 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm510511745e9.4.2026.09.08.11.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:43 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: core: clean up rtw_cmd.c coding style
Date: Tue,  8 Sep 2026 21:34:28 +0300
Message-ID: <20260908183430.3256-2-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183430.3256-1-predescuciprian99@gmail.com>
References: <20260908183430.3256-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fe..e3404bd55 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -391,7 +391,8 @@ int rtw_cmd_thread(void *context)
 	while (1) {
 		if (wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp)) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
+				   FUNC_ADPT_FMT " wait_for_completion_interruptible"
+				   "(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
 				   FUNC_ADPT_ARG(padapter));
 			break;
 		}
@@ -482,7 +483,8 @@ int rtw_cmd_thread(void *context)
 				rtw_free_cmd_obj(pcmd);
 			} else {
 				/* todo: !!! fill rsp_buf to pcmd->rsp if (pcmd->rsp!= NULL) */
-				pcmd_callback(pcmd->padapter, pcmd);/* need consider that free cmd_obj in rtw_cmd_callback */
+				/* need consider that free cmd_obj in rtw_cmd_callback */
+				pcmd_callback(pcmd->padapter, pcmd);
 			}
 		} else {
 			rtw_free_cmd_obj(pcmd);
@@ -555,7 +557,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (ssid[i].ssid_length) {
-				memcpy(&survey_para->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
+				memcpy(&survey_para->ssid[i], &ssid[i],
+				       sizeof(struct ndis_802_11_ssid));
 				survey_para->ssid_num++;
 			}
 		}
@@ -567,7 +570,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
 			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
-				memcpy(&survey_para->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
+				memcpy(&survey_para->ch[i], &ch[i],
+				       sizeof(struct rtw_ieee80211_channel));
 				survey_para->ch_num++;
 			}
 		}
-- 
2.55.0

