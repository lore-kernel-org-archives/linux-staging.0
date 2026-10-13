Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3B5550DB4
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 20:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922553; cv=none; b=MzmCuC5AHRVEPSN1AKsLUr4fu8kyZJNJyd+wuLy0BCusQdm+zCqsem10eJhhLAWhACFVCE4jGKJn3108NV3FHVSzWggXRyLqiQm6QO3x+Q3Jg3+2/HF9ylAxpA+7COpx8autdBlapbT0F2a653KLZmCPVnJmP70aTImC//SxmU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922553; c=relaxed/simple;
	bh=XEdgWnlnp+WrdXDPIgVg/CPIC6pGiI8j0SR5FY7OKm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2w0Sc/m0omcfoET9p+A7h5Qyp2hxR6i5fgMdKbonc1T3sBl5kzreg8nAg0haq3eEHG4eP7TEsMnuky2jFa3Ri/LvS1qhJ02LgJUDgD9sk9Qzo1oJZ+S3V5eA+IxU8QtQYnKahu5VabwmTwuzuBFn8r93lrUCtfrhQ45T+bNvC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQpJX6Ve; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQpJX6Ve"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d68de53053so1416206eaf.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 13:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922549; x=1792527349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqAeJF9RdF1+vlcqpXvRCOXwyjxYtKo+iVbyXPC3Jlw=;
        b=sQpJX6VeA/bIxZOuA54yBvei+t9Yu+ju95X2GcARD29imGrTKvaK+vG8Y6NVAwOfkl
         SP/wZS28ZzqxgCHAaNSkCSAl/lbsbSrq18u6ye/04wxUNHQFo6Jgibcp0RCijvMqHQ0v
         vi+DFM4qeLojXIwKUeO+P3vP46n/oYCX3kAr3iUKzEUZHAZh6eiQ0s8bRUDf8I0hRxG4
         i06XXJ1jIxZfkLxBgvH7Rn6E0lTmaNRIOjPPSb1F8hJmFF8Uuc5tjwPpAMBQhlKGzANW
         Xqanw3wZ3SD0RGAHWuWxfQFN2yZOIsGR5u8mq45Z/tDBO0/zr5wiZQP/lVsNVhSQk3if
         kqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922549; x=1792527349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kqAeJF9RdF1+vlcqpXvRCOXwyjxYtKo+iVbyXPC3Jlw=;
        b=CaTJeye20W56h1w6P2IRVf89jF9m9t9n9OPuFnXu768FQ9gHLng1kglSP040ciSkO6
         wG/wmZwPYllcixqmuVZzy15OZ6bMgXghqsgZeWPA+6s6oeL7sZRksOJzN37BkNcrz9Gg
         z0cW9imrQpk/a7hNCS+Xl/gWiTV+96Z8zDbCgFKceefrlspEOUVF213RwHK33FMyhoTP
         C40bLDnOC6EqH15IIuEK5ZfLS03LV5cPWvUh+gSNcLewz1dDzWIwQrliJx1LSQv2V7mm
         I8FAK9cZORnH3h3XWzguwdMRXkTVejHr+8ewtn9K1wLr6/Xc/hNs2PSbAhmWJ8m+zUpm
         KzpA==
X-Gm-Message-State: AFq9FYLxKsFxY8D6U5OUJswlmKaQJKnfRRQsEL3AUE3064GpbLxACUDZ
	0PSlDhkfxgT4t0X8FaVBMhcMPmS0NIKnI5fNPyJbRX3cN38yIKtkuWHQ
X-Gm-Gg: AYBFou3zQABKJ/TDZdK6zgJ/EPmz8osYqOY66ZNRpKhGvQ+gyTHU+hgbZNEmLL+Crfs
	waNHmoeW5Yv5x4rswgB8ygJJGEfD/hTOd+Jc4qKM2C5zeqz6h95nfg0KYv4rthKEGj2H8HnCOps
	gfp9Z7TvvQeC578+9oWhlzyRp+z8iUjiFr0jTgkP8kXQ7OQkMDKiHTl9Y6HdLWaENSPMic/B2kq
	6zkyMSQjHRfhPrNoLPLNG9wkrlMkoXrEg/5ZBjP2xz/F7GkqZvbyz1O5dggW417qrZk1MnAH7rH
	9cNrYS5h7coEcc+tWjZlsFO+nSGE7U/SUNEeckbHI6jKi7i00oteJbBQ6eSkQ8gd185YS0vSBxR
	XY6IwBlPKusm9fzOtlTM3xHV8QaLuFnqzcx0xMEQWJcYHjO3m4V43cSgxOWmcdgn5B7WIXSbwKY
	sSvOmG32fLZ+Ju7Yam/SVGeCZUrXmCGUSbgiLE5zEzGRPnCJb4t0OGvu/IlLcf8xBEOSvjhBcmz
	Y4vs7SPHkB2mg==
X-Received: by 2002:a05:6820:2d0c:b0:6d9:779e:4f88 with SMTP id 006d021491bc7-6ef08e7d448mr9812220eaf.8.1791922549289;
        Tue, 13 Oct 2026 13:15:49 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:47 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 06/10] staging: rtl8723bs: remove unused num member from struct mlme_handler
Date: Tue, 13 Oct 2026 15:15:34 -0500
Message-ID: <20261013201538.43156-7-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The num member of struct mlme_handler is initialised in mlme_sta_tbl[]
with the WIFI_* subtype constants but is never read. The table is
indexed directly by the frame subtype in mgt_dispatcher(), and only the
func member of each entry is used.

Remove the member and its initialisers. This drops the last references
to several WIFI_* constants that have no equivalent in
<linux/ieee80211.h>, such as WIFI_ACTION_NOACK, so that the private
frame type definitions can be removed in a later change.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 30 +++++++++----------
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |  1 -
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e315d693f..3096d4c61 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -12,23 +12,23 @@
 #include <linux/unaligned.h>
 
 static struct mlme_handler mlme_sta_tbl[] = {
-	{WIFI_ASSOCREQ,		"OnAssocReq",	&OnAssocReq},
-	{WIFI_ASSOCRSP,		"OnAssocRsp",	&OnAssocRsp},
-	{WIFI_REASSOCREQ,	"OnReAssocReq",	&OnAssocReq},
-	{WIFI_REASSOCRSP,	"OnReAssocRsp",	&OnAssocRsp},
-	{WIFI_PROBEREQ,		"OnProbeReq",	&OnProbeReq},
-	{WIFI_PROBERSP,		"OnProbeRsp",		&OnProbeRsp},
+	{"OnAssocReq",	&OnAssocReq},
+	{"OnAssocRsp",	&OnAssocRsp},
+	{"OnReAssocReq",	&OnAssocReq},
+	{"OnReAssocRsp",	&OnAssocRsp},
+	{"OnProbeReq",	&OnProbeReq},
+	{"OnProbeRsp",		&OnProbeRsp},
 
 	/* below 2 are reserved */
-	{0,					"DoReserved",		&DoReserved},
-	{0,					"DoReserved",		&DoReserved},
-	{WIFI_BEACON,		"OnBeacon",		&OnBeacon},
-	{WIFI_ATIM,			"OnATIM",		&OnAtim},
-	{WIFI_DISASSOC,		"OnDisassoc",		&OnDisassoc},
-	{WIFI_AUTH,			"OnAuth",		&OnAuthClient},
-	{WIFI_DEAUTH,		"OnDeAuth",		&OnDeAuth},
-	{WIFI_ACTION,		"OnAction",		&OnAction},
-	{WIFI_ACTION_NOACK, "OnActionNoAck",	&OnAction},
+	{"DoReserved",		&DoReserved},
+	{"DoReserved",		&DoReserved},
+	{"OnBeacon",		&OnBeacon},
+	{"OnATIM",		&OnAtim},
+	{"OnDisassoc",		&OnDisassoc},
+	{"OnAuth",		&OnAuthClient},
+	{"OnDeAuth",		&OnDeAuth},
+	{"OnAction",		&OnAction},
+	{"OnActionNoAck",	&OnAction},
 };
 
 static struct action_handler OnAction_tbl[] = {
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 847a1d75f..5ef81c347 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -205,7 +205,6 @@ enum {
 };
 
 struct mlme_handler {
-	unsigned int num;
 	char *str;
 	unsigned int (*func)(struct adapter *padapter, union recv_frame *precv_frame);
 };
-- 
2.43.0

