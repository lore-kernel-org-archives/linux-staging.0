Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8349F1DE2B4
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770906142; cv=none; b=BI6CY3ecwRdZXrYgjIlzgTHLWWs7s9726xJbNYWA24cIr0aFjEpBp/euNKOEe/Q4+8UTNCNuERR+p7xV62KiQihNEO0vM+ihD9iKzYrJm8UbAGIqL0YAirSutYRcF1BJRp/bommMziT9iwYFxOcDBot7uM3haPhHL16ERXW2LH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770906142; c=relaxed/simple;
	bh=7B1dKLBC4ssIMb9u6OjRe5vsnTw2YsIbmli5+ekYoOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cHn2aK3kO3RWNXuELg7gaWbN+3rc9KhR0yyDBD8lv/ySZN5eyIMeJUh3RpR6BoGKSINBXYyhGUsGy6IqRtCQCZOyzadeRUeU+l2zT7SR4AaAm48AeSe/1wp3es5ALg1vJxPoV4lopwDCCEgi9l5pxGRtmPJwa5ccSEa2eWnQxR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5h8CYOc; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5h8CYOc"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-824484dba4dso2662967b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 06:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770906141; x=1771510941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YV6OK6ql/86N7Aeb4DVq+IwqTnAgt8zgYIHnXIV/C8=;
        b=R5h8CYOclTpNkhOilMU0+iC98uIBV1binlZuKuKeAT3nwV1YnyvwDrXj790mmE7wBC
         ICsfVS87T6dW7geI5mn+nzYoR3HSOs2/GnmtjR57hGGK1BhsQZpUGRh6SHLccewsQGb5
         qxqdk9rXI+dO/MCusBWLSdiQDMxByCtbmCCx92NJyGfn7/abyPJRDFqP9rDmIQMHErhS
         CtN4HjUxeqCYBOKYKofhKmH9Jmj8OQAi94YraI1N7GO9xCju4KPpScfegAn8IN3KT7sX
         rCSl65vRSZmD+LU1474XBGtI3qVhE/hDtdSNnAKlTcIphcvu6oBg4fEziCJh9jjNafQL
         pwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770906141; x=1771510941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7YV6OK6ql/86N7Aeb4DVq+IwqTnAgt8zgYIHnXIV/C8=;
        b=Jzv3zbRoVmvOJEOafqXd+eVwD2nJWEpQ2MOluOLUpFSG5f1zFWefwyi84nDvn9Ktxm
         Uc3zmrAZAIx/3H3xMYcBEIDWD2UESQIG+1zpB7Nlg8secacuB2Caob1m/it/S+o6Zkvz
         YfWJnXUXuiyzwpmNx0smof4UXDmBUyWXZhMPbVLvpuaFVnNPP5vI6KO5Zi13gkciiECs
         D7LxjuSS0/X5MAqIGHNJ5zKA47yd14EvNVRBBrUwFtArWu/PpCV7IW1c+OVLWnIcL2I4
         6RsrWckfTkc0Yo9AcXT+CNmuCO5honceVd6+7+rkjMqF6Xsi+KryduxaghujOW4kTBFD
         uwDg==
X-Forwarded-Encrypted: i=1; AJvYcCWE3VQDQpJUPz8QjC87YmUBU644HAaeZMPJ+mwobuzSxVFPwxU9ngg4Ig/2wCZQyXCY6PGIzh5ILbhc5q4Q@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4Cde1OS6BmB7Mc6NIUw9rUFsUT8dQzhF3hzYjK2ZGBX1EpsuL
	l72tzL4pRn2w2HKxF7FbOYUfOUuNQCDFx3knCyWvt1/kwjX4mD/9SnTf
X-Gm-Gg: AZuq6aJCCTZThG1fVowLaTqDcL90JrW9an34Ent46F9aVCbejAX5dNMQQEu5WaS0vVV
	eE6Ji7xQnJi614euTI/uQq9m82Ipvai8yKBi/Qxi6SZV5XXPbI/4hjDBJs9T0ZzD0LsAFYNDaVn
	v7Hv1x0fH3G+DdSt9/2vkhyWODGT5Wt+vlqvnQ1KIXjWC5e7Pl0nNFgT9gBhwUp/y0SzVoWvdH8
	OucOr+uXsSGwEivt4J5I6hed1D/r6oCcyEsr5X+QgfjYf/aSP7cAc7xGqvOtbe9mvXd8qWfbL0r
	Snxcya0S4vtFVCyURQQMLYMJ78k9DkTWWRDHGCO+XxSXBb2G4qnWaeQKqwjJ/rl8YmyXqa+DhfA
	nFgL4Q+9JVsbdu08yz4xvPwUZ7iivNboehUk+beXhhsW0cMJrjAVJdAMuIqhXDjpyv0hatbyVSS
	U9zPwGLqSnRdfs1eO5elbX76CukfsR8g==
X-Received: by 2002:a05:6a00:438b:b0:81f:3c34:fa78 with SMTP id d2e1a72fcca58-824b2e0a407mr2334691b3a.25.1770906140741;
        Thu, 12 Feb 2026 06:22:20 -0800 (PST)
Received: from snowman ([2401:4900:647d:9ae6:881d:5895:580d:d8e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e366b82sm5336631b3a.1.2026.02.12.06.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 06:22:20 -0800 (PST)
From: Khushal Chitturi <khushalchitturi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	hansg@kernel.org,
	ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khushal Chitturi <khushalchitturi@gmail.com>
Subject: [PATCH v7 4/7] staging: rtl8723bs: remove stale commented code
Date: Thu, 12 Feb 2026 19:51:28 +0530
Message-ID: <20260212142131.28131-5-khushalchitturi@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260212142131.28131-1-khushalchitturi@gmail.com>
References: <20260212142131.28131-1-khushalchitturi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unused commented code left from older versions

Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
---
Changelog:
v6 -> v7: new patch.

 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 1 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 1 -
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 1 -
 6 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index d6b486fb57ab..5cc11e6c7af6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1178,7 +1178,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 
 				pmlmepriv->link_detect_info.traffic_transition_count++;
 
-				if (pmlmepriv->link_detect_info.traffic_transition_count > 30/*TrafficTransitionLevel*/)
+				if (pmlmepriv->link_detect_info.traffic_transition_count > 30)
 					pmlmepriv->link_detect_info.traffic_transition_count = 30;
 			}
 		} else {
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 45943f832e23..3c6278f9ae13 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2504,7 +2504,6 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
 	s32 bmcst = is_multicast_ether_addr(pattrib->ra);
 
-	/* if (bmcst || (padapter->mlmepriv.link_detect_info.tx_busy_traffic == false)) */
 	if (bmcst || (padapter->mlmepriv.link_detect_info.num_tx_ok_in_period < 100))
 		return;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 6a85cf9cecfc..8fad375c6a5a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4756,7 +4756,6 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 
 	timer_delete_sync(&pmlmeext->link_timer);
 
-	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
 	pmlmepriv->link_detect_info.traffic_transition_count = 0;
 	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 15657de5475e..666e241704d9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -206,7 +206,7 @@ void traffic_check_for_leave_lps(struct adapter *padapter, u8 tx, u32 tx_packets
 		}
 
 	} else { /*  from rx path */
-		if (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 4/*2*/) {
+		if (pmlmepriv->link_detect_info.num_rx_unicast_ok_in_period > 4) {
 			if (adapter_to_pwrctl(padapter)->bLeisurePs
 			    && (adapter_to_pwrctl(padapter)->pwr_mode != PS_MODE_ACTIVE)
 			    && !(hal_btcoex_IsBtControlLps(padapter)))
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 66d522006dfb..65a9e4e9df55 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -102,7 +102,6 @@ struct rt_link_detect_t {
 	bool			higher_busy_traffic; /*  For interrupt migration purpose. */
 	bool			higher_busy_rx_traffic; /*  We may disable Tx interrupt according as Rx traffic. */
 	bool			higher_busy_tx_traffic; /*  We may disable Tx interrupt according as Tx traffic. */
-	/* u8 TrafficBusyState; */
 	u8 traffic_transition_count;
 	u32 low_power_transition_count;
 };
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 953e29ad2c44..8b2e0330082b 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -620,7 +620,6 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 
 	pmlmepriv->link_detect_info.busy_traffic = false;
 
-	/* pmlmepriv->link_detect_info.TrafficBusyState = false; */
 	pmlmepriv->link_detect_info.traffic_transition_count = 0;
 	pmlmepriv->link_detect_info.low_power_transition_count = 0;
 
-- 
2.52.0

