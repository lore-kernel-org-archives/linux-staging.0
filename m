Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716913CCFBC
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 15:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774021664; cv=none; b=QHmqZgScPFStP50v4ZDx6vCijmqbLausY65ldG9Jdyh5voJQK1POq+qk+18ZMHEEo+UJYMjKhkcpQqrX3TznRbZMqdCwF4B1YooeXVfOvE8i9KcAGc4Raeo0/e24TsRtr0TwpsTnIOm+QwM4za3RmZQ/VvbA/RPNaSt4nwnxstQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774021664; c=relaxed/simple;
	bh=Rb5q2cVKE/i60YQNzhcWKZCsuBCDYj5j9Ur7wyxdN58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayzcfKL09BDI6PWxEOgQcBnTDakafQtCOGKdd84T2A39iDdTEEUdbk0j9oqgxN7k7+a8yyoxx+Ke2eJsp8L95EJ6/r1yvYgYdeJoO7QROJ0FWaCP4nVGJP93zN5OjNJrhwQpRcSiSP0smY9biam5nWtFboTJirVSF4zU1B5/rZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeZ/ymbH; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeZ/ymbH"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b982518b73fso132230766b.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774021662; x=1774626462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOKAl+grmbYmAipqSN0mmuoeI8iGbd6yWjBpKti3GlI=;
        b=aeZ/ymbHrYWkeFr2PPalU9kZU13AJdQeRh+s/WASzr4KBNzz48pPLmr/3NZNYAoJKp
         EBHNuL1ARAzpPi9LGpL0kW5vKeAsPl5IIOvQlgSmF0otBx9obqB1wigkhcn5FRvOdvSp
         FCedX7Vjn9U6jlO5woXA+MnEFXZDTjXzqURdnoEJ53rIfwX81hTntznwXNGguNXj6g74
         h2mf7UVc0onB5jn0Tlk50j/OsQj3Lf3f+lpbgqiBMklQAgC901VN43g3lSuYA/pJkFIN
         exVVvzHc3KdoaKYPSJ7gviOZQ7l0g4V6/lR4jm2s9hfd+xTZDDxtogvGoyYrIB1EA+e7
         APSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774021662; x=1774626462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FOKAl+grmbYmAipqSN0mmuoeI8iGbd6yWjBpKti3GlI=;
        b=Vejf8s0mXJnLv8D8Nbbvkdt1toyguoK8DkmulOWJUs1kmJNBr2lhEfArVI1VgsrEFQ
         DBXgiRY+k5LGfFJozazAgFEV7FEuBPRELDjpyq/e4SMNuYrz55MniYkn4HQdSjetEseB
         +bpIDpmwh1qAOq1DTx+H4ifMbIx8XtbtJ16SBf4tKeUdWTumM9TiPGFcut2VrT6a+V7v
         ojpPnXhYVg3k6HniP+xnt2L1vHEv8ivk4p9R1DxPAJfmA5BYhv/FUfSxRZ0BDd1LN6FI
         d8xQOQdKOuMNijPuHAch7QRLYurIwvHRLa+ySW42uIG3B3ZnKtbL8H/Qf06n9qYFDJuF
         FWvw==
X-Gm-Message-State: AOJu0Yzoz0hlEEnUm9Bo02W2rzWhBqmtXxkkr2gbs4h6WoR8fCRLN9ad
	wsPXr85RqFzgSUbwNvUaRRwFFsYQJFjNzGdVSpEq35QFBv4VIKvJQlgx2M8Pj/7P
X-Gm-Gg: ATEYQzxpg3D0r8o5T/lsGtvrFfRtyv2CnVcvcReSW0LKZLMA2j+oaznzJuHV9w562hB
	9LvPOzO6ZwDc5I8LWfvIfQjcLvl8HYC3o1IjqCfBfLhkPDtxWIrDA+I3konW1MKyFfv92qQAenc
	Rw28UBLK7HxA3n69TWztz9NbjPB815WyUtFE5w2gS5gJkv8xIr3CA+R7bWO92mQ1yJnE0KwQOoE
	4fdQrF1cCVRBhDOi+H7OOh52E6ydntaefpfsC1j3E8CnT2+W3WohcdVhUOqp1R3khViyxxHJXY1
	LpKZSHL70hGnt49RiCT7TkeJZfMOcwEuBaYxJ8zFv+zWXWJJyPeFtsEjRJjjeNTEwFFFBSyQ8tc
	9LxspHKC0cBZoOjo0NoBPOSTzWAX5l+Bhm3t9lZnjWYfh92SYxZpSS9NFX/c5LLyglFR4f1tJlL
	I5QfztNrx1WQ6qRH5yO76ViiuxVzlwIe7nGU4yT+BL9eLdBQvxufuBBfeM
X-Received: by 2002:a17:906:2691:b0:b97:d126:c007 with SMTP id a640c23a62f3a-b982f37d448mr188035066b.30.1774021661472;
        Fri, 20 Mar 2026 08:47:41 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cd8:5427:4c74:c4ff:fe18:7da5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8d3d0sm173658966b.19.2026.03.20.08.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 08:47:40 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] staging: rtl8723bs: remove dead REJOIN code
Date: Fri, 20 Mar 2026 16:47:16 +0100
Message-ID: <20260320154724.603847-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320154724.603847-1-azpijr@gmail.com>
References: <20260320154724.603847-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The REJOIN macro is not defined anywhere in the kernel tree. Remove this
dead code to simplify the function.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 28 ++---------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2adc98c955fd..4bf6d1865391 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1153,10 +1153,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 /* if join_res > 0, for (fw_state ==WIFI_ADHOC_STATE), we only check if "ptarget_wlan" exist. */
 /* if join_res > 0, update "cur_network->network" from "pnetwork->network" if (ptarget_wlan != NULL). */
 /*  */
-/* define REJOIN */
 void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 {
-	static u8 __maybe_unused retry;
 	struct sta_info *ptarget_sta = NULL, *pcur_sta = NULL;
 	struct	sta_priv *pstapriv = &adapter->stapriv;
 	struct	mlme_priv *pmlmepriv = &adapter->mlmepriv;
@@ -1178,7 +1176,6 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 	if (pnetwork->join_res > 0) {
 		spin_lock_bh(&pmlmepriv->scanned_queue.lock);
-		retry = 0;
 		if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
 			/* s1. find ptarget_wlan */
 			if (check_fwstate(pmlmepriv, _FW_LINKED)) {
@@ -1250,29 +1247,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 	} else {/* if join_res < 0 (join fails), then try again */
-
-		#ifdef REJOIN
-		res = _FAIL;
-		if (retry < 2)
-			res = rtw_select_and_join_from_scanned_queue(pmlmepriv);
-
-		if (res == _SUCCESS) {
-			/* extend time of assoc_timer */
-			_set_timer(&pmlmepriv->assoc_timer, MAX_JOIN_TIMEOUT);
-			retry++;
-		} else if (res == 2) {/* there is no need to wait for join */
-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-			rtw_indicate_connect(adapter);
-		} else {
-		#endif
-
-			_set_timer(&pmlmepriv->assoc_timer, 1);
-			_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
-
-		#ifdef REJOIN
-			retry = 0;
-		}
-		#endif
+		_set_timer(&pmlmepriv->assoc_timer, 1);
+		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 	}
 
 ignore_joinbss_callback:
-- 
2.53.0

