Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553E73E559E
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311561; cv=none; b=Mua0OOKhtsHxnDG8hXJNYOoCLoOiTjCC44q5EBrx5Kitb4m2QnTR4M9XQ32Fnii5y7Z/+LxUIH1MQIeOV5GLAPSOgmNee+KwS71fPJ9F3wG+Zr6kL0VrpK/zWTIFG9jleJHcIIlIjpoVTeoJIeqiPJKN2z8e7E+B/znzmk7ho+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311561; c=relaxed/simple;
	bh=c8fCfLJ3Qzhuh6ChEQ9H+bjBqxdWqKXW61LQtT+Yook=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5gLFfZRobKQPqdW53wljuC7aaNm0PxtloWwCRKn3SiA96IyT9QC/js0mm2eBKBbV1mhbozdAn9bO3n8VHnZegj5DEGe4F+zgj5fqpIEFZkaah3sTZB4ldBNIqQRG798hzewmm0FLSCUy9wUG35YZ3sJxO4TLza82146Gjhc7bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gj9BMFUK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gj9BMFUK"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a4113ab355so11290863e87.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311549; x=1777916349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjfrxqtMYgZKJRMa8tGd1dwkgPL1jHabao/+AZ1AzRQ=;
        b=Gj9BMFUKh1iT7UYAHvbRub8M+F6EKYF4NaZQeRhUHV4EvScGpeiYaF7KIMzPYkJe8B
         vsRHzxLo+1mWUbjD+FlD9pU4ngFiHSPE80VKDOIZ+OsD/eAc5QanRMk2RFObCVHXO6lI
         BQxH94+XzxzwlgiKaahpmkNDzpOIwZt/Joi/v6KOfm0sNYnfgdh56+yTbzxpWPFVpGSC
         bIJhuAwxYHqA6PdoIgONIR+aYiDVeK4EZmHAL16WSAxER4aj6AQM7odx/KLVXUEnaSRQ
         IGMkKpR8FspI85wSTkNwXoajgA7GpoUZDNjir6Z3qedo8Wmg0tvEFjJ8dYsC0j0F5KiZ
         T3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311549; x=1777916349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DjfrxqtMYgZKJRMa8tGd1dwkgPL1jHabao/+AZ1AzRQ=;
        b=BV0gs6Hyjf0I2i04a4h+nMBSLa1Y3mnBqFEiYRqczA7xbv9wF6eOn+8kVRDL1PYPha
         K23NX7i8yi8c1m16sXSfP/Jb7eiMKObLScwnR5SDaarFxtzfRrfIvteoa2aUdks4po1N
         VxibTDkj/Y5zgtvepICvpHZGjclMEDoM49ABzOqOWdgGfUgy13uNw1CQJcppOaMHFv4q
         Cez9RuVojOKr+63bj5do7LNLG10UaXhnO7DT3pUulUgAgMzMzbm0ski/hTAl5SH4KQFX
         vAbkVAYGmVvr+MBcFr5e4wmgDpgznz9xNTlmOvX40x5ouY7Xc0/oKC9iLSdgxvEnyo7A
         1t2A==
X-Gm-Message-State: AOJu0Yw7RC4fgMyFQTmnaO7+RE42pFcvPLhmRbfCx25+GeYlmDg+Zr00
	/nawqJvcaxCA92zeERwvZdBrI+iOy8JyAGfFHl+04jiJKwPchHNliHyN
X-Gm-Gg: AeBDieu6b2zN1bjucJEzdDd7akNF97omko58pJYpFB6M6UUfEqQbGIz1VcRzXWNXbyL
	H58uANiKahnGIoIezSK5y0APY3Vl8zkYfurCZuz6b3oKIgAxOjtDS67yuKEY9FZH9kP18YHHGyn
	mnFnQcYvz7+SKuZPTBy4l6ZhOU/qVdDYFYWZoHKWUlo5u2yU3bO+sYB/sTkWWbDkSXXIcoONvg9
	4zL6wqnmj/6nDDqs6n0q2PZUKP0s6whx2n7mJpX3kLWK/urR6K4gHc2BfUywFWOecW8CQrE/rNV
	HiNcjXj4hk72n1aIIqP5TrwInqx8ryFlxNkZt+KwYp0MB/7ffymVkPpcwoZ0+Mfe5/hSQ/7hwbd
	rreaD6Ov+EYehrbPd8nluUJvlIq2TGK2AAelF+2IlV1VphbHu2nzd1UXXDFKhPVeKnYqxpzKDRX
	QmezQaOciAo8Uh3dZpAkAoJVR5+SI8iaspU8QKEjG6jDcTDqHKohHHIivAbPl3B2fPstVaijkg
X-Received: by 2002:a05:6512:3ba2:b0:5a4:1389:98c with SMTP id 2adb3069b0e04-5a746053202mr67865e87.30.1777311549318;
        Mon, 27 Apr 2026 10:39:09 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7be0sm8205894e87.67.2026.04.27.10.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:08 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 6/8] staging: rtl8723bs: rename rtw_btcoex_RejectApAggregatedPacket()
Date: Mon, 27 Apr 2026 19:38:55 +0200
Message-ID: <20260427173857.585742-7-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427173857.585742-1-linus.probert@gmail.com>
References: <20260427173857.585742-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames rtw_btcoex_RejectApAggregatedPacket to
rtw_btcoex_reject_ap_aggregated_packet in order to conform to kernel
code style.

Found using checkpatch.pl.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c    | 2 +-
 drivers/staging/rtl8723bs/hal/hal_btcoex.c     | 6 +++---
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 24184c8d34de..2528520262a6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -32,7 +32,7 @@ void rtw_btcoex_halt_notify(struct adapter *padapter)
 /*  ================================================== */
 /*  Below Functions are called by BT-Coex */
 /*  ================================================== */
-void rtw_btcoex_RejectApAggregatedPacket(struct adapter *padapter, u8 enable)
+void rtw_btcoex_reject_ap_aggregated_packet(struct adapter *padapter, u8 enable)
 {
 	struct mlme_ext_info *pmlmeinfo;
 	struct sta_info *psta;
diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index 2a2dd60be8bb..77c474919ffc 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -134,7 +134,7 @@ static void halbtcoutsrc_AggregationCheck(struct btc_coexist *pBtCoexist)
 	bNeedToAct = false;
 
 	if (pBtCoexist->btInfo.bRejectAggPkt) {
-		rtw_btcoex_RejectApAggregatedPacket(padapter, true);
+		rtw_btcoex_reject_ap_aggregated_packet(padapter, true);
 	} else {
 		if (pBtCoexist->btInfo.bPreBtCtrlAggBufSize !=
 			pBtCoexist->btInfo.bBtCtrlAggBufSize) {
@@ -151,8 +151,8 @@ static void halbtcoutsrc_AggregationCheck(struct btc_coexist *pBtCoexist)
 		}
 
 		if (bNeedToAct) {
-			rtw_btcoex_RejectApAggregatedPacket(padapter, true);
-			rtw_btcoex_RejectApAggregatedPacket(padapter, false);
+			rtw_btcoex_reject_ap_aggregated_packet(padapter, true);
+			rtw_btcoex_reject_ap_aggregated_packet(padapter, false);
 		}
 	}
 }
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index d9ed8f2d8d14..61a67360af00 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -20,7 +20,7 @@ void rtw_btcoex_halt_notify(struct adapter *padapter);
 /*  ================================================== */
 /*  Below Functions are called by BT-Coex */
 /*  ================================================== */
-void rtw_btcoex_RejectApAggregatedPacket(struct adapter *padapter, u8 enable);
+void rtw_btcoex_reject_ap_aggregated_packet(struct adapter *padapter, u8 enable);
 void rtw_btcoex_LPS_Enter(struct adapter *padapter);
 void rtw_btcoex_LPS_Leave(struct adapter *padapter);
 
-- 
2.54.0

