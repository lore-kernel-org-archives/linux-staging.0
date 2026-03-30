Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A4C3876D6
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 16:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889716; cv=none; b=UbQ0+73rMMh6OvOmdSw6S3EyNPccMXhBMGTR8dQkRfZ5UcDJ7ueqlQYXe/4s1SWygWeZ5WkvZ6qDBwpLqecRp/5BdJKuX0qisynjl4k4B/UG6a2191StL69OpovsT5kMs+6CVF3rRfsOpxnGkpDexFB71S0kzIlCqxFfk5QIHJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889716; c=relaxed/simple;
	bh=2Iiud2Wic0JJm2FW3KzrBLPokecGlePlQ2HrB1ySD4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2K9pRPJF1s2DMxrlZHVnLYg+V5pmsjGwpPqPTb9qqOYbXS7JCvj1khSIsNNATVRUeGEH50hU5fc9BHEps1jVOOczmBKblWkH3Or54haOIWwhwFI4WZ0YFd82HUbQ/GyVgSWGVczTetqsd1/3vp6GrbGisIhJNDMNHWk/u/jThY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEIh+RuA; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEIh+RuA"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6501e465a8eso2727676d50.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889714; x=1775494514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmttACh0RHQZpesmoFmA5r6uoVO2zux2lii6rr6COc8=;
        b=hEIh+RuATRjBL8Qk2S0sgIecbrXQB2wWOQZojP0gEeKhU0dpM3jUSZrx+0KAO1kw1W
         caDSM6PiEJvg7p57z/uY0o0NAz0a0zu/KTyqjn2s2nADVC+8ptbcMFVc288V8aELavw9
         0ecu+p/z5MxiPNNsCh169o34ltrwRLxVX3yb4nAyl4MrrnmaG9a47687JPcl80jP956g
         wS0wyQN2txvAi7bnR42VVr3G2f6vdL8YVuT8RtvbjhpqQTkq9JMLia6sY5aQ8V485cDE
         vwP0EjPzYrargWh0fKsTijlrVyYXGrT3anLYWUalWONAHgaZc3F8yH5OxUOKoDQ4sJYj
         zs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889714; x=1775494514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RmttACh0RHQZpesmoFmA5r6uoVO2zux2lii6rr6COc8=;
        b=dqBsR1lkiHN5TcsjbB67eMM/qVpw74YUBdbNBNZdL16m34I+TJbexBKRCoLxq+GIE4
         hVvLoe18zn+kzzrrcngZXox6pHUEbMDqyT3HDnI+Gm+w8CW6NFF/LJwFCdmsyPnwML75
         ifiDqoHLu5w00YuhyFVkBqoXur99rRNKKKKjFjHu34PZB0Tm2gkC5KgqqD8VLR2Ks9YS
         Bz23fzSKgBFg2mXVdedH2MPfuRlHsFtEv/r1L8R+b35BvJGgGfVoz46wPQFvyuMfvkKY
         EC6VGbJsY1TtFR3QhVZFk82GOgRhc5g/Pc9CnFI4K3hXxUwLi9Tx7vedQrocUy45Xy01
         cvYw==
X-Forwarded-Encrypted: i=1; AJvYcCX9KTFhosHmJKzupyuwPRZJELWMdJXgR6xMf6FT6/Px6rsMHn+oEKa0NTsTlBvVdv58qeCh/XfajqGKT6Xh@lists.linux.dev
X-Gm-Message-State: AOJu0YzaJpNxUPXxQiIh8q22E6ZwLzKZ/xXzNOYE7Yf0Wd9+qw30/LTz
	A6haOE6CVCfIT+G27FNDtxUnMqimYDXj5RRd8492YS7nTy42I7yamC+p
X-Gm-Gg: ATEYQzxK4orDsFWzCnnDJurCdPw6+SV1jgnfnzxw0efjJz+n+sI98op0mVu+0lDKYh6
	jt5eiltW0E+6xPNQHoJTqQslh9bZ5/C/jevOFs22BrqGDPMc26JaQUztwxf8a9uy2qcxd0c+iSS
	oa0bV9JN1Mh2T3LW/b7ODqG8bBK/3E6/0xtiye7h2BOH6JR+HZ684I9Bd/Vmlt56t2PtPqk2N0H
	WKzd12d0kdHV2OlRwYr4m7lTJ+JER6oR1ZClmsmznZzkXC7U1LTRk0S+LQTy1Rjyzxvuw5F48Fc
	LDVq4oLfBWXQzpVC2osuyqTn7HObAVgbSTC5N80w1HdpsGF+YTw50sVXwm3R0F+Dpbnjk6xz7pf
	Rdh2qzquTgIY0+kWxbYSDMpSRiMwpFVn3whCiuMVFTqJk2BVyAtg7A3u7plrs3DhYoGsirguLBi
	A+D4KiRJMNpiVKYAKmgZLIUDtmIjNPfL9/NOc11hBTUTzJDBa+3O2zeop1GO1zb96TzcJQYBdLS
	Qhr/+L66r8hQDwHTkzSNnAv
X-Received: by 2002:a05:690c:ed5:b0:79a:7a6e:3c7e with SMTP id 00721157ae682-7a0a2160860mr3306607b3.18.1774889713986;
        Mon, 30 Mar 2026 09:55:13 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a09583f32asm1639527b3.24.2026.03.30.09.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:55:13 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: Rename pHT_info_ie to ht_info_ie
Date: Mon, 30 Mar 2026 11:55:10 -0500
Message-ID: <20260330165510.33134-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330165510.33134-1-ethantidmore06@gmail.com>
References: <20260330165510.33134-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert variable pHT_info_ie to ht_info_ie to comply with snake_case and
to remove Hungarian notation.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 3327519dd729..b9c5037afd1a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -751,7 +751,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	int ret = _SUCCESS;
 	u8 *p;
 	u8 *ht_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1004,7 +1004,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		ht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1035,7 +1035,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)ht_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.53.0

