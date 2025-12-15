Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166C22874E0
	for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 21:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765832976; cv=none; b=bJYEKgdww+NELc4T3H2QAl2KDhB/nVtEVQwxJGkwPbhgomc53Q/EsaRQF7J+lQaNJcUHwcB+zX5gg9entH7atFog49wl5199SxCBAzEdvOUZyPq+uREcH/WbUY3/cEGiyrziFymoRJ+pykjkjDZVOHqjosv3FvroTj7L8JmP+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765832976; c=relaxed/simple;
	bh=skA2/zZNPzDvF1LzBVnJLwacyOELQ0vDWlh2IlbuZ4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pOdq/iBgDnH7MfupcGE7FR2dOjFfW36+AzUVdokTSeSLvQbXX6g826ZeQ2RsLjIgDASW6E7w2rQp5R5Wut4yhUKcD3+iIrvHSySPjRV9zXNRMq3IpoElsWaI+7fwC38bvY8ci1IolSVUGufuO1jBG28VtZGRxHpa2IDroocajDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfaNGUSM; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfaNGUSM"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bfb84c2fe5eso1479981a12.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Dec 2025 13:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765832974; x=1766437774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y71M22j0JT/SISp1p9FCopuZ2GaI8Hlw+iBAcNFC1Dw=;
        b=FfaNGUSMUzpjbFxcYSWj3X7OyCreWf6z8sUHDyrfHgA6yAwZvzy8R7WAZDXNtBRZKj
         uG3e5f7QBeE7BeGAUOFkN07IDA+gNSjx+HsfUfJ6jkMnzcTnx6es++z0MwTjZZKzeM6d
         N9ejDVdOfheUlJY6XrDiEHawYnEy22Uozpj5lh8R/31hLLMWpQK7ndMR6tP5Sd7V/VY4
         /wO+2FjbKMYRH+0lJmJ4k+olPgNKWKUYd+FsJXbEUwbiAwu7bPm2f7Ph8lgcZTdBbVfi
         9h4XvRjuvn92TC4GyPs0crrnIjxs+VChkePrYk29zaKmpeLFhf8TF/3pOw2KDbP37NP8
         WYzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765832974; x=1766437774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y71M22j0JT/SISp1p9FCopuZ2GaI8Hlw+iBAcNFC1Dw=;
        b=vb5zPo+MGyviNDVz3UPlTxgkLsy6+CWO+7LaN+vEoWZcsLPlpcaewr57hiWCKUR0Es
         lvFlqTYHqqZXekEIK9FAU6xHA9jOUefwLCwh0hMvm1gmmblmrddwRHb69EDj5htt1XU7
         wf7nw2nDxHMA5jBOWiAikypehWD0p79VYTtLCztQ2WyabZ6Qx+nvGjO+7M4bH7SPRYQb
         Cmwn3IdPSAU9qo39C5XUTaZ+pMlTEB2WA7R3dudtCNDdnqKzxDcUpKgdkcr59bpnPj5Y
         qkRLbJ1D09fALz+4JkxkYJuy+VuaT5s9+Jg6pFYtzuNfICNP7koltudyuT3qEdjH0Jma
         qumw==
X-Gm-Message-State: AOJu0Yw4E84mFhvUb5v7pkHAcyurmET+i7mHoqTrrNSwL0cdT89l1erf
	6MTaiahOkRLQ0HjDbKjR7U73UuXb4ECLm1gW2irAVz6ZtRXuHRE8T57u
X-Gm-Gg: AY/fxX5ZWfi1vMO+h2YM0Z0dWRAZmj/10xYJsRxjZt583Ro3vMFXZr4RkPKtPi3xzm1
	ZyMH67lUjQ87YNhvSjqIgJtEYtAroW/8XoMcOSodX3nAQyIA8X5LsSsZ/4jVNUb3JeUSZWD1LNm
	ZOlC+Jyb81kNUQbdrv1nlVvjyLN2YaX4irpvlM/o5smiBIDpmbRbVZ9m+2tPAXv0EzUbCiYSyjh
	W9U64tD5WPHhMYtK2nnopVBwF9Vv6bmW3vshpHImo2NjfxCy9WL29zoaU+KMgoWE2IWN4efdGiu
	vbYtVepATxYfoIP1F+tVjR4p8JZJ6+8O3ixaObsS1PsTnGV/EAmuRiRBaNASJ+d261PoPycuyL5
	c1q/tk4lxbytneFIiVrCUqBPg5lEpHZBhx9VkFpXhQhi+o5uJ69PA5y5jLUZmZZCtkk/aQYdU2k
	ZDjmdesdQ9EUWi1TwyEnjeW8/DEHycrV+chVRH/Ci+s37B5kMLvC7fqQkRQVY9jbpLetVhl1FGR
	NhQ82ISAjLuFa24RxY4cTRiiaBkO3TBveBIdjb5jTDPVXyi
X-Google-Smtp-Source: AGHT+IEm7jjlWwyTSs6sdbmIiYVDHLwGxJ6KRoeuqtYG/2ZGYW9/xuOvWl3qoLnUm5Xs8z9KS1oXIw==
X-Received: by 2002:a17:903:19c5:b0:2a0:99f7:67b4 with SMTP id d9443c01a7336-2a099f7696dmr95413535ad.8.1765832974134;
        Mon, 15 Dec 2025 13:09:34 -0800 (PST)
Received: from darshil-laptop.. ([2409:40c1:1012:7689:b029:7cc5:1835:6176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea0169f6sm143280455ad.53.2025.12.15.13.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 13:09:33 -0800 (PST)
From: Darshil Shah <darshilshah7070@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Darshil Shah <darshilshah7070@gmail.com>
Subject: [PATCH] staging: rtl8723bs: clean up redundant parentheses in rtw_mlme.c
Date: Tue, 16 Dec 2025 02:39:01 +0530
Message-ID: <20251215210901.12058-1-darshilshah7070@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Removed unnecessary parentheses around if conditions
- Removed redundant '== true' and '== false' comparisons

Signed-off-by: Darshil Shah <darshilshah7070@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..e10f60d46dba 100644
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
-- 
2.43.0

