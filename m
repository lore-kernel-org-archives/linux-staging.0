Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FDA238C03
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 08:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768205280; cv=none; b=D2CV7D0ECfBMbvvXIZ4NpmRyYixp7GRmj3BPC1Y0olNsao2G8PyJUrAfd3S1RgYvpVF7euPXharvh5NRMtO1JrcJCGYwUIfT8nLc/CBBnWzs/rY67W4QNlZz0WsfD591hc5l07uHbreVKCpstYBzqBL1PWe6XKivdB5+TFT5JO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768205280; c=relaxed/simple;
	bh=23b+WkLXLu+dq3TLpCLTIavbqmZyJ3BLnE6IClkUDxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdIj9MDAasHYaWul6jIIDIcg7lnjxfbsYL0+7IpaNiXuPTqliialSYg+4JuR9rNYtmsFxQJILdQhnV2UROtOzWObPKQx5Pc6RZZTHy6aBdw5zaMhlpM27PDmxTOnZG0lbGy01D2aneMce8rNiSZlySXsw++VGMG+B38bpMLYUDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=da/TkUHq; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="da/TkUHq"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775895d69cso29709095e9.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 00:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768205277; x=1768810077; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXgXdhqE3WCWcguVY2uYENuDZbceNMpEozNEwmdd3kc=;
        b=da/TkUHqgTec/cLq8RMUXXZsqlcaVs3k4W5in7K1TZWUcWwbpCxyMzbSgauvt4RQcK
         quAoHJQvfkqrMMz3YPaqhlN6BCQl5Lu0P/Elg0f+4Uh92TExsxyGtMlpgBs5PIBPg/jP
         Gi+NhRuZWJoCDkpAwluuUSJHGqf0EjHk8LD6a+ZtPj9B9Yl3NV6d2SkKXACWJwxL72fB
         vxLbPqVPmJXy6UimN39ojpCrxJQI6VsE+4QVOBGaOnCsPLRPJxI5FVladoGr6OAWomI8
         r8dpWnRQe6RJQSj0ElRTlYOIUt+HOF+7y0xlknORuzB2Gt5Kz3zD57LDRRrOnD45FCgA
         B8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768205277; x=1768810077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wXgXdhqE3WCWcguVY2uYENuDZbceNMpEozNEwmdd3kc=;
        b=oTj2NWTppzQAMRhGTmfvVQ7mE8qqkQleHSSZuNzanQjukBi2IhYaxf7+e1lL6DUeKV
         3JENlvs1gxiW5aeNEOEdYlL4HRUp9ugpW+vECzYZxuOAGYD2xFgoEiOeSkHygFZieurN
         h20nX4zcMPn/CvpKGWIeIDu30sIgS6vgWoEG58Jcx0jEA0bLFDtaJf+g9s4uMMQLynTA
         YD8oPi5/sEH/Bzn6+lR4VObWv70EWKO9ARnUrv3m5omkrwlP0Is4IsPp1HW+d2Sjafbq
         wFaf8Gp2e4dRSfo1TdhuIdA+3rK3V6SbGipQEO0lpZm+WwD1eXrLdIQrWtrlgJdCT4W8
         fqIg==
X-Gm-Message-State: AOJu0YyaX/TrX/6s/x1WD5mYIK83yDJx8AgsgoCMzxUm8Yk9IQbk+9fr
	Xu0QEPAokX3qFPICH8iygmkLkzc9x10W43xEBkLXLec3GApiDeH44hekedVcFNN2
X-Gm-Gg: AY/fxX5Dkif8+/OX9BUEHlN4n0j5T0RmPh87fSftAjumLuJAB4n2nW9ZsXCo7XMXc08
	qCY0R91AAngtd3Kb5p//Gzl4//fIj6MxiFU94Ms7lURGqTgiSXQUjE4jZPDiiSL6gLai35pVgD9
	xTARN7AdmbliELGy112C5dG0fjCHIfsFIYSLJTDCotKW309DzF428wPCKqHUdqvmN6Xi0vHPbz6
	2bgBlH9mKCWfAcwv7zNlI/U67VpcTPQNYAlJGsKkdNrk+vdzeKUaTIdE6Cyna7PflXBdLulnnT0
	qwNBrJrMPDCycqom2/sz3DWtZOh9xDcHKL5to1cCsj4K5j9UK7ajcGsHHdLzARXrq6wL18Vr/P7
	CfhTLcuqbB/3SQaKiqjKo9z3HS6PqJS5tE2GMBkEk3Y5zJ6xpcULdyNTdWQEDXb6gxTmcMpMjjA
	VAGP8QoYsRgSgyRzoXFlxUKGNSOkYEDnnoImgKZGNeSZCUjQDjn0X9CMzHuypZSJM=
X-Google-Smtp-Source: AGHT+IFEx+xUI8DUjgOc2P6GUyu4i3e7Fgv+hJJp5TfyJ6gfm3fsQC2NAQ1VWj/ut6dqF5yUkIa4QA==
X-Received: by 2002:a05:600c:8b09:b0:458:a7fa:211d with SMTP id 5b1f17b1804b1-47d8f284036mr107520785e9.29.1768205277121;
        Mon, 12 Jan 2026 00:07:57 -0800 (PST)
Received: from fedora (host-82-54-122-237.retail.telecomitalia.it. [82.54.122.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f661a03sm356505855e9.13.2026.01.12.00.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 00:07:56 -0800 (PST)
From: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lorenzo Simonelli <lorenzosimonelli02@gmail.com>
Subject: [PATCH v2 1/1] staging: rtl8723bs: style cleanups in rtw_mlme.c
Date: Mon, 12 Jan 2026 10:05:46 +0100
Message-ID: <20260112090546.367502-2-lorenzosimonelli02@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112090546.367502-1-lorenzosimonelli02@gmail.com>
References: <20260112090546.367502-1-lorenzosimonelli02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch performs style cleanups in rtw_mlme.c, specifically
removing unnecessary boolean comparisons and trailing whitespaces.
These changes improve adherence to the kernel coding style.

Signed-off-by: Lorenzo Simonelli <lorenzosimonelli02@gmail.com>

---
v2:
- Dropped the patch for sm750fb due to build regression.
- Consolidated remaining style cleanups into this single patch.
- Verified build for rtl8723bs/core/rtw_mlme.o

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179a..d9e6778e1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -468,11 +468,11 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 		 &pmlmepriv->cur_network.network,
 		 &pmlmepriv->cur_network.network,
 		 &pmlmepriv->cur_network.network);
-
-	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
+	if ((check_fwstate(pmlmepriv, _FW_LINKED) == true) &&
+	    (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		 update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
 		 rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-				       pmlmepriv->cur_network.network.ie_length);
+				 pmlmepriv->cur_network.network.ie_length);
 	 }
 }
 
@@ -710,7 +710,7 @@ void rtw_surveydone_event_callback(struct adapter    *adapter, u8 *pbuf)
 	 rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	 if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 			 if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				 set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
@@ -1386,8 +1386,8 @@ void rtw_stassoc_event_callback(struct adapter *adapter, u8 *pbuf)
 
 	 spin_lock_bh(&pmlmepriv->lock);
 
-	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true) ||
-		(check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
+		check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
 		 if (adapter->stapriv.asoc_sta_count == 2) {
 			 spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 			 ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, cur_network->network.mac_address);
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	 return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.52.0
