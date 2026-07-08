Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9893447DF82
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519941; cv=none; b=g9cSh4MpsKZ5c3MMnkAgeav+DlDwM+tKuTtwtXFDMpaDP0kXFRt6PAlQ8no9G04G0Guo1T0NRXtZpfZgl13ILllCNAdzILrDJDINLb9szpXwnwWcQgcXtTseB54xt2qf+oGgE5g41JigqFZLPehixvH+gB4QcLjdVRz+V+ujIC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519941; c=relaxed/simple;
	bh=d95JRY2Bzb3CdveB0H2i6qSEBPpXbkACxpwxXeCvL88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0UK0hYyt5YbopKve6SutQa8uvw17791LIvvDySSqORvH6J/stzQsB1C1WKCxvc4ultoobvzrCb5HsMkKxVyINbztDKKbsqAzBg8oaTYyIJ5x+cPLC0wSTZQRjzIJB1ai/Rp5/TRRyGMwo2wtgg7wJZa91T6dg7Nil+oNRQ9OZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNTZ9YjL; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNTZ9YjL"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47de0093c42so762880f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519938; x=1784124738; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnhjE/gd2xEz0HC01rzb/l2vC8kdBZ+RBQBhsu5dJSI=;
        b=KNTZ9YjLbl2W27uFRkHzg/2tQmG2Ygg9LymA3inUEeAXDxq20TFKKibZ/lhBxJw49s
         HzZMm1w0Rw7zBnNKRDDvwuH24I10/ECzyZRqvl90WCg5inCGm/cY96A1gX68EkZU1wdk
         MCxnRoM5mAmqNWsTCRt1jlFRozyhJBMqKgRtZFrQAajjgLARef209M3Ekmf9ayrgNbfu
         ea3Yw4+FYdGRsFCOkMDLq3Nb2bMyHYpooBLPSrZQV3rwej4qtaNzl7d8KRSg8X8QVczz
         eS5kcpREJfly0ZuOYeP7/aFxfnLzD9lkzP6jA5d4sMayxSGQKUNhoC4tKdMNKqrtXAx1
         hpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519938; x=1784124738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KnhjE/gd2xEz0HC01rzb/l2vC8kdBZ+RBQBhsu5dJSI=;
        b=klSpz6LYVzmDPgV+6Y2tc+hx9HN2vwtsZN4KrtbuidDWPLWsCVAEFZdTvXS4BKkfGS
         uGfmNig0CbIWgSZjunST7vrg3YbPlPNCV/MrNX5kS7IVgkuNlYEYZ84GmNy2K1uyepsN
         kaRMqIqa6LRAxrDD8qr8FfYQBu09z+lS0IcLlIw6KRB30cu/u2ESg0hP16piridfTxlm
         kEok3O1ER7U03whYtHjUksdaTftW1bMrfR6ueReCJlk3pZ8fhfaQ4PaS/c7RSe8E/oKx
         IjUj5w+qaKNd61xCyo/M1tY40R+QlVz6dWprsVmpi8PgwGOqFKwf7gcFCKQPzo4pCOG8
         WHog==
X-Gm-Message-State: AOJu0YwFDZE8P+NiyXWoybuRxoipDOOGZE8MAhWT3Hq8+cTN2AVMDgpD
	SdiReLn/wR2RAOhSt+dmgLnyBsbCAbvC7YNcoH6Ri0JW1WB8uEplNxnwxbmMlE3/A8A=
X-Gm-Gg: AfdE7cmVAKv+LPNXN6sfz/rMfzhuJMOEUeeiYwZXqBjjddSfBL7uVa4L4ZMJyAOg7nQ
	WW8pvcNA446Sem/wOfFdDQ8qM/8kMtHXh21iF1hYfMqgSIS4UgOYagi7sj3fClgwkuaEogv9nK4
	+UxveLcifRgZyY09ZpCgxVJnQUEvG/iUUZQ1q0OAEizfvqsSrxKJH7UVf5X9Q/QkGkPmkQ0NwMI
	/HD933MCk+frPt73FEE3y2sQe8Q3UVZFVR1UK7ux/V9r9b2frmTaGtBo2u5JP1cAXVu0grC+1Y0
	Lt/i+PO6UWYFqgXI89PC0dsNozWUzkkzhH0L9c67rwr6jarFcz8PACI8928kDGNexO4GDTJsnjv
	syUb0QLw4ZaS3aVXwodpPQ84ZeRDLRx0X7MGX1Ra0L1C2N4qnUB1l8g6yrjWns98jttXJFRptlE
	p9GlnNLF7vlYJkYdpZWzejfxA=
X-Received: by 2002:a05:6000:144b:b0:475:ba80:b657 with SMTP id ffacd0b85a97d-47df073b281mr3284896f8f.3.1783519937690;
        Wed, 08 Jul 2026 07:12:17 -0700 (PDT)
Received: from pastramanslaptop ([2a02:6680:1101:656e:a52:f2e5:1ee9:a947])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm40962571f8f.34.2026.07.08.07.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:12:16 -0700 (PDT)
From: Alon Shamay <pastraman1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alon Shamay <pastraman1@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: rename bLinkInfoDump to snake_case
Date: Wed,  8 Jul 2026 17:10:24 +0300
Message-ID: <20260708141024.5814-1-pastraman1@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026070531-doozy-sash-c547@gregkh>
References: <2026070531-doozy-sash-c547@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename bLinkInfoDump to link_info_dump to follow the kernel coding
style, which discourages CamelCase and Hungarian notation. Issue
reported by checkpatch.pl.

Signed-off-by: Alon Shamay <pastraman1@gmail.com>
---
v3: use real name in From/Signed-off-by
v2: drop unintended whitespace/reformatting introduced by editor; rename only

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/include/drv_types.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..607771a0af21 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4780,7 +4780,7 @@ void _linked_info_dump(struct adapter *padapter)
 	int UndecoratedSmoothedPWDB;
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
-	if (padapter->bLinkInfoDump) {
+	if (padapter->link_info_dump) {
 		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
 			rtw_hal_get_def_var(padapter,
 					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..7b61be9dfea0 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -344,7 +344,7 @@ struct adapter {
 
 	u8 bFWReady;
 	u8 bBTFWReady;
-	u8 bLinkInfoDump;
+	u8 link_info_dump;
 	u8 bRxRSSIDisplay;
 	/* 	Added by Albert 2012/10/26 */
 	/* 	The driver will show up the desired channel number when this flag is 1. */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..10c84a887140 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -555,7 +555,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	/* misc. */
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
 	RTW_ENABLE_FUNC(padapter, DF_TX_BIT);
-	padapter->bLinkInfoDump = 0;
+	padapter->link_info_dump = 0;
 	padapter->bNotifyChannelChange = 0;
 
 	/* for debug purpose */
@@ -613,7 +613,7 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
 	RTW_ENABLE_FUNC(padapter, DF_TX_BIT);
-	padapter->bLinkInfoDump = 0;
+	padapter->link_info_dump = 0;
 
 	padapter->xmitpriv.tx_pkts = 0;
 	padapter->recvpriv.rx_pkts = 0;
-- 
2.54.0
