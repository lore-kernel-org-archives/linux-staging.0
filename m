Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E41A388876
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412760; cv=none; b=V8DDNxQHBA9V7Oh/miBkTxhyqirwjp/of5g+M/A8QGrV4wsXMJkpbSTub4lFhALo5zhyZCGEufeViK9mNRl7t71rnPj2X0IPyYB5NIDZsaVNfJYUZcImgCfRgf91+DLe2CNcgvJ1n0VGeDuMbec63lw4YmR21BoueJdIQZI6iY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412760; c=relaxed/simple;
	bh=fgw7dDrWS9xg2FXbO7pVBYf6+iPn4WqQ5ONzYmDhIJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdLcJ2aEYa2leK+Y+hmOYy+T8e9LsyE17u/YKRqpybfXSr1Cd5f1FaIgxkdHGaWYALJhsK1R4SldbFhkjVagDcZZfDoUD8FDzv6U8kvPkUMpedSvG1wZV7RYwX8keOe8qqhQjsU9917brncv7mDWo5c4nq4lKoH35csOkO1OkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXN9rAXd; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXN9rAXd"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97bf8f6a31eso702750241.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 22:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412758; x=1789017558; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nam/WqXZfDnfOqNPwp5yTp1tZrC4y3zmMd78/CGgK+4=;
        b=YXN9rAXdDrO/aZoDDmB3oOjsmxtHApMfgYmvvTO0RMZH+PouYKNAZG9cIp9u5WKuo+
         iNJhHGxxwiEIHvYsR5eu/H5ILDB1z51BeKEsBg+js6/vKCpa8XY7q78yVxX/ip/RF8DQ
         TXCuNoGgbmSAm3UdXE1IWwA/w86klh2Gu6hTQ9meSW2JdJz+hvIKBDQ/pWaojPF2pEsX
         M8pYzs7NvWATWbLXmZusWNLXJQUyBLym31+Wtqa38+tJBYaAwXXpAeF1K3MvM5YT0cuq
         DmkG8XdbQ539U/V9xmIEowN8rPd0y5aiKee8rICTie72jZdC8UGzd5IiJnqo5RMj7w6P
         TGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412758; x=1789017558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nam/WqXZfDnfOqNPwp5yTp1tZrC4y3zmMd78/CGgK+4=;
        b=WZxud4/9lfRwnUh2IynL/d1WNHBePB5R/CPwcIl07fNS5L7HXFjrxH4fRB3ZL9TacN
         P3et0mTzdaOtRmy+ROsCLaDB4Wjx4aEoAuLFUW5aLvJXg6n/doSsaQjiY/ERi/CrXHPS
         PYg7ZaIw6bSox3ZZghrnTkKAm6iXP3ouBVeZgWJFEuctu4N1zI88YHt5jFWYvAMK2GTk
         0f277Tj/4Ib2XPVeASEUaKrJlGsKT9adcdScPg2xQiOrxV35zG/yQNmA9jdDNBSR/Ttk
         RwRT7MRLHF696PwSbY4LJXf26Ink1XzIvLI3QL32bfQTC2N6ZbSlkpkJbgEHjE5J9NCz
         BuSw==
X-Gm-Message-State: AFuF++nAsTTfIaIBZS8ok0ZpF+tuf+DLlY27GNASzeZ5Ujnrod9cFZ2D
	wQfXS2QsCxHrdhRPaJ4mSwg7fBCeFZDeETyYhOVwfcqOZntttg6leK2k
X-Gm-Gg: AYBFou1ctDT6rVhjbcQAbX0xJBtq90ew5bLkFQoBe/iSnQ1UrYyaJQHDKYpYSbAHnDw
	uCZxxfaSPpHyK5IUKTlPQREAwNqOP3l6V/iXAJNks4+0g5S38pe0ZMGMldL50nGhuRcUzPDhnCa
	BJ7fgc7AgpInpg2GW7QhTi16PoyeI7ZcdlzzjBkQs8+5ZwYey16Lbrpgron9z01pe632FymYC1c
	7lNul1g57CCdXzO+kQ6RaWASiacSR+vsMh6MeTJnsgkLg1Nwfc7NntbreaKwejZuQvVobI7VHy7
	vGd0CnZkHjQe/7ciG6rGuilh5DYRYM59vyLGCWzFOw+c+m0FTCM5WTbq5hn9TFpP9ejk+PcSAvc
	Z/9eW79aNFIlKChZRGTr+lmzhs1LYgaaR0ktjKcX7GZWLye9FsMywBjINKiG9NpYqCc1UceAmT2
	1l8dqWDcJfhJZ++ZXj6ThegBvbiWQD0+XXZIvFM7/trGCISc0vugnaDKQfHc3aixyOM9w8sDcOM
	DPI7A==
X-Received: by 2002:a05:6102:3a06:b0:781:9922:78f8 with SMTP id ada2fe7eead31-78a1f34dd1dmr3768941137.13.1788412757878;
        Wed, 02 Sep 2026 22:19:17 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:17 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 03 Sep 2026 02:18:07 -0300
Subject: [PATCH 1/4] staging: rtl8723bs: remove invariant parameters from
 issue_probereq_ex()
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-issue_probereq-v1-1-82f153d157a1@gmail.com>
References: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
In-Reply-To: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=4591;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=fgw7dDrWS9xg2FXbO7pVBYf6+iPn4WqQ5ONzYmDhIJE=;
 b=tNhCCn4n/qmfbOw8/d9EsLYndee3oQ1sqzYNIIpCV3OL72Ns/qw+BpMSe+S4A3tgOz8nlo1em
 AtbWh62sUQ2AQCIMISG9UKJ3BS+zl0GL/qlUZP/KHDSoT1CGjAPPdp8
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The parameters ch, append_wps, try_cnt and wait_ms are 0 in all usages
of issue_probereq_ex(), remove them. With try_cnt always being 0, the
condition (i < try_cnt) is always false, so the do-while statement is
redundant and the msleep() call is unreachable, (wait_ms > 0) is also
always false, and without the do-while and msleep() the conditional
break is also redundant, remove all this dead code.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 33 +++++++-----------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0c00be09fbf346aeff82be31aae801ae9265a9b0..4bdd2ae24d274cdc4b2c6496f385856c6039c55c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2499,25 +2499,11 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 	_issue_probereq(padapter, pssid, da, 0, 1, false);
 }
 
-int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
 {
 	int ret;
-	int i = 0;
-
-	do {
-		ret = _issue_probereq(padapter, pssid, da, ch, append_wps,
-				      wait_ms > 0);
 
-		i++;
-
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
-			break;
-
-		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
-			msleep(wait_ms);
-
-	} while ((i < try_cnt) && ((ret == _FAIL) || (wait_ms == 0)));
+	ret = _issue_probereq(padapter, pssid, da, 0, 0, false);
 
 	if (ret != _FAIL) {
 		ret = _SUCCESS;
@@ -3768,7 +3754,9 @@ void site_survey(struct adapter *padapter)
 					if (padapter->registrypriv.wifi_spec)
 						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
 					else
-						issue_probereq_ex(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL, 0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  &pmlmeext->sitesurvey_res.ssid[i],
+								  NULL);
 
 					issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
 				}
@@ -3778,7 +3766,7 @@ void site_survey(struct adapter *padapter)
 					if (padapter->registrypriv.wifi_spec)
 						issue_probereq(padapter, NULL, NULL);
 					else
-						issue_probereq_ex(padapter, NULL, NULL, 0, 0, 0, 0);
+						issue_probereq_ex(padapter, NULL, NULL);
 					issue_probereq(padapter, NULL, NULL);
 				}
 			}
@@ -4899,16 +4887,13 @@ void linked_status_chk(struct adapter *padapter)
 					if (pmlmeext->retry == 0) {
 						issue_probereq_ex(padapter,
 								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
+								  pmlmeinfo->network.mac_address);
 						issue_probereq_ex(padapter,
 								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
+								  pmlmeinfo->network.mac_address);
 						issue_probereq_ex(padapter,
 								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
+								  pmlmeinfo->network.mac_address);
 					}
 				}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 70fb161afd09efc197e3f59c72972d9a611cbf01..acea9cef7756e158c7ab9e357a06a7aab300943f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -542,7 +542,7 @@ void issue_assocreq(struct adapter *padapter);
 void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type);
 void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status);
 void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
-s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps, int try_cnt, int wait_ms);
+s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
 int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms);
 s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da);
 int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms);

-- 
2.47.3

