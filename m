Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08FA32E6B8
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162327; cv=none; b=GYP+VOkAsxdMnS965SV1op0NKKfYjXvY9zLGl3UEARreh+dPydYn7a7lAqPOWg6L5zlA7QVSOeQqw4z++ykdasRhBrHb8Jbt77m6wBzk7JNJpl9xp8J7CCDV9pbxiYDR2zraOletkbaMyr0buzIXyJqmKz9dyRNhfwvmff8UZ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162327; c=relaxed/simple;
	bh=k8b8RwHBo6LCivzzDalekVW5IkT5jo6kSPCtqKq5hMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dZ4rFriovDXirZxXWouICAvCuvsJ7pVZx4TrdnZkQTCwIdThzjurv5PsL1knYhYTrW7enCcgsR7TfMPTGikGvSB1ljpa2KxJZHSEzuKFTmsUOoOh+qV64MSj5OtV+RDZMk57pOaVvHJhgUZ5FGeisPYmuCW2mxlfSdl0rSi8a04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlPcQbJa; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlPcQbJa"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso1152523b3a.3
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 01:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769162317; x=1769767117; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2HxA1tDhrh5mSYiEx6V7TTPuPfsmZY8cWMhWVS1Yiz0=;
        b=nlPcQbJax594/cSf47nEhFGB5N19xGVPgovcv7EgP6zkmtQeW7BonUsvLIzd7u/6G7
         Ek5V31ExvyGk3eMFojJnG6h0pm8C5icqGhenh5gjM5JcRgoTdnjlHSttVQ2aFgKQkOkb
         GwNo1gJfWlM4gqi7TxKOfTZupg7MfFdQBqjLgcuYNExNjaL5rNO16tbT380xYZ4Xkgp7
         OT913CfaveggAbQVn4kUmzuNmhwlzP/TDu6RHpYWtpmxtKrHjDIDwx3oa5IpDHWQBSXc
         MLSLb/IlPsPEH2kkGGkcLKH5m5nZUeFMvgIfHyrPB83ggz2yEXAN9S8NgT1QnIlrYA4E
         zKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769162317; x=1769767117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2HxA1tDhrh5mSYiEx6V7TTPuPfsmZY8cWMhWVS1Yiz0=;
        b=gcd+q1ohmvg+ornerjQ7XxFH82i8z0Cg112+/nmdmzK3QGwoj/yHh1XCXP/JlAITQz
         0puFwJuutOqJIpFbPqHX82miiFgCOXmPApsm/pq5OGwFIFgbMY9HADheit0MhfGByMjt
         UEtx3dB2DcBC5JQFwyUIOEHyswul1O3p4LVXuXOCCfVkxUlbgrkJ5SoQ/N92BMlUgXuP
         L8ELYJmI4qHarjI8PU0jH7Wwy34wzc8eylqMOEFr8dMEvEQsYCy2e1Df4WqOFGYAv8uM
         LIGS47wLuAUs+yUd+Q5HAvIGUAsQQG3rU6DF+SZRlXvN9Ixd3Y75HUymcx1Xd6y3hpXK
         gu7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfXpzF1ltnjGUf5BuqXZ99NhIRB5dr7easlMx3ZpoMbO+hmeuQzOUdY+XvrQkK+iyrZBIyKxTiN8Q35u0k@lists.linux.dev
X-Gm-Message-State: AOJu0YykVXE3eOYcNN8J6MTtuBFYCZjeq3CPnfYH4g3yfpyyAr0BXzw6
	ZKyNJkZ0blvhZ7WCjIGN+vlFi4UlOKag/KH9JlGnd0fTAq+WGhfdMXzg
X-Gm-Gg: AZuq6aJhYchXiWcUQ6HZjenrNw3erW1W2b9k/5NxN3nWNFS7fV0ZG5UTzcgL4qyAUPy
	LJBTngKquYSqstLKRDp8ErWSgNuIzPWeSXBPaMp7+wUeg1fDTNVZL7HJffkc7979iZse2Q2GqSz
	4qzBTaIVoigJIy+l7OlDjFvGNOYvizvnYD6guW+mEwbrbkfGxBN51r5PyA2a+/0MTE5pD2czEhP
	DvoN0SGSaBu9EOgicGWRW/eVEdHuPpNzrlYjLetvjlUzzhv0MnWLxk+5bDoK3kQWebZr7oz+GZh
	f3X2MsxlpUfp5nYkt3ezO5ppQGxSiJWCfxh5jXOrVY4bBVEYJkWA3b2GJOwHY4zBM1DcF8C4sWN
	5nnUZ14NZxu5zwmWrKZ9M6i8I0I8Vweotw5DtfbtoxzziQPhJGUVA2QLj0k7de39bQ3V2wllTzc
	GTEXmp78BaU3PBvB+DpmTw2C1JSNtF/8u7AFKV8pOA/2s=
X-Received: by 2002:a05:6a20:c90d:b0:35f:4e9d:d28b with SMTP id adf61e73a8af0-38e6f6def5bmr2436345637.18.1769162316930;
        Fri, 23 Jan 2026 01:58:36 -0800 (PST)
Received: from tehuang-Alienware-m16-R2.. ([50.47.240.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a412944sm1564838a12.24.2026.01.23.01.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:58:36 -0800 (PST)
From: Michael Huang <tehsiu.huang@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Huang <tehsiu.huang@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove unnecessary boolean comparisons and whitespaces
Date: Fri, 23 Jan 2026 01:57:32 -0800
Message-ID: <20260123095733.49301-2-tehsiu.huang@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123095733.49301-1-tehsiu.huang@gmail.com>
References: <aXM34ZGQ4Q2dsRxk@stanley.mountain>
 <20260123095733.49301-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the kernel coding style, explicit comparisons with true
or false are redundant and should be avoided. This patch removes these
comparisons in rtw_mlme.c to improve code clarity. Additionally,
trailing whitespaces are removed to satisfy checkpatch.pl requirements.

Signed-off-by: Michael Huang <tehsiu.huang@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..ed754fdbfe7a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -710,8 +710,8 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
-			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) {
+			if (!check_fwstate(pmlmepriv, _FW_LINKED)) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
 				if (rtw_select_and_join_from_scanned_queue(pmlmepriv) == _SUCCESS) {
@@ -1206,10 +1206,9 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 						rtw_free_stainfo(adapter,  pcur_sta);
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
-					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-						if (ptarget_wlan)
-							ptarget_wlan->fixed = true;
-					}
+					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+					    ptarget_wlan)
+						ptarget_wlan->fixed = true;
 				}
 
 			} else {
@@ -2018,7 +2017,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.43.0

