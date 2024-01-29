Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA71065BC7
	for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 14:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706537949; cv=none; b=RbmCkMJRR35SCMVR+0Gsf89BlmAWdCm3oYrbND6ZBbIRL/jG5/5Qz2Lr4Wih4ohxSGRQTqThVkHbNfaVXuo4Ca/v9X306u1YiUeG8ZDcQQ4AIeaF0rkHNCbYLGRqjS1q9URwfruNpHTas9OgFjp14QLE4bXEnJvGlECReLVLefQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706537949; c=relaxed/simple;
	bh=AmgX4dnIIJccXjS/P1Fa4Yt9LuV8HcB1AwdQ1cxH5cY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LEzodOoNjUT94bCWpe9mGlXeQ7ZHU4IHDTyBqF/dLdEEvxyyMVYBZdWrE7jnNtSnT9iZLOsPpvRr+3veFOop4BN1uQKwsx0TGh1Eth5vo0JHdiQVSLELp7dqHG3n0dWGGTaZo9p7Msp2RRAyNRWWayvcEC8Qzrvt3FyxQ7Z6F+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDRf8Czt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDRf8Czt"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33934567777so2386909f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jan 2024 06:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706537946; x=1707142746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WZVZh+TcA52yG10ogW2Ket+Nh8qPqugIsfHxx9AocE=;
        b=HDRf8Czt9eFARC/xKvTfKjLyaUyhxnSQjyxpuglQ7/nxpasUia91I76/o5xrDRaMWj
         ZmwMoj6etoMptY1zBaO58TLWAFqm0bGez+3uTqaxsR32ilfu2LAJuQVFGQ4EfhFODP5+
         U8peltgY7pq7jv5h+ZUYMXDYWQAzaQxg+sUc49/8CrHkSGr8OQWZFwdOhhtK9yLillH8
         ZGkpboTYCmxDrAlVkeaiFRDpTe1y1RUlZOUToEQRjXLiAJJa9jBMRg/sRG5bLiUxZdIf
         7nnhfmXYSWdB9uiJJhjUChELU34/hGcsQIX7LdM4Z0MdTQaGcm1byeGupw/fKR9UIPG8
         skkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706537946; x=1707142746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WZVZh+TcA52yG10ogW2Ket+Nh8qPqugIsfHxx9AocE=;
        b=W05O8QAOSXf6mvJxyfSajge2hEYUUn5ovBaLL9yojv+rkxNVGL076Ji+imq/mihpEr
         niiD/UVEmbnT+J+BaQkvWaycSzMTlOgmtAeEs+h1/9wRXjaISeZVBaMhfB1jS+LcC/Om
         5RTwitBB7cBPASU2VptwolUNMUV/J5whMJyPtKIhDN3gg5oEHLDstRte+cnn/Pc+TqGd
         eWkZdtXGmE9UfOpXdmnJYVW2M1Hlp48T3kufdvNoxBziWDPoQ4dSL9ahTMktpudWrLdr
         g4JECXAVyzqLWricmdjgwihW/hbEKqT4GJK7a/0Dq0rMEMxOeCuem2DnnM1cXAYRUBzm
         ovvQ==
X-Gm-Message-State: AOJu0YxDuddK67smDlD5QJW1cetIn/Ariqen7VImz6kVZ8ucF6RCxPeW
	zQhCcH34S6mrM8ctCViZWakPlKt7BZSrz4HIqg/YralB4AommoWn
X-Google-Smtp-Source: AGHT+IGGSunYjC5DCO7P/65m0wPIlDiZUpBKsSOdSPvhn+m+mbRuNRO/sDbpbI3gCSFdhLd0Y2wCNw==
X-Received: by 2002:a5d:6da2:0:b0:33a:eca6:b2b5 with SMTP id u2-20020a5d6da2000000b0033aeca6b2b5mr3494482wrs.36.1706537946077;
        Mon, 29 Jan 2024 06:19:06 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW5v43gZr13Z1BIwOHTF0NcR9TzueltCHzUtZYG6tBovnmAhQ0duIsp26IEquV9gDmo1tIobBQAW+DmPKJ5imSTmoJ9JYZik5UsAF1VPbBU1dXZCRLaLRglo9gG/FmeImz/VM2WRP0dhGmNYeXTyh1eukUfsWR2iiDYnJfmf60H/gTBFtai2E+W3wk5wMqszCJ9387Nq4TCNQSS1aY/05FPoK6ovxBq
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.152])
        by smtp.gmail.com with ESMTPSA id ck11-20020a5d5e8b000000b0033af31c1cfesm1699009wrb.29.2024.01.29.06.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 06:19:05 -0800 (PST)
From: Meir Elisha <meir6264@gmail.com>
X-Google-Original-From: Meir Elisha <meir6264@Gmail.com>
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Mon, 29 Jan 2024 16:19:03 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@Gmail.com>
Subject: [PATCH 1/4] Staging: rtl8723bs: Remove unnecessary braces
Date: Mon, 29 Jan 2024 16:18:53 +0200
Message-Id: <20240129141856.416532-2-meir6264@Gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129141856.416532-1-meir6264@Gmail.com>
References: <20240129141856.416532-1-meir6264@Gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

braces {} are not necessary for single statement blocks

Signed-off-by: Meir Elisha <meir6264@Gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b221913733fb..5568215b35bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1548,9 +1548,9 @@ void _rtw_join_timeout_handler(struct timer_list *t)
 				int do_join_r;
 
 				do_join_r = rtw_do_join(adapter);
-				if (do_join_r != _SUCCESS) {
+				if (do_join_r != _SUCCESS)
 					continue;
-				}
+
 				break;
 			} else {
 				rtw_indicate_disconnect(adapter);
@@ -2432,9 +2432,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 		return;
 
 	/* maybe needs check if ap supports rx ampdu. */
-	if (!(phtpriv->ampdu_enable) && pregistrypriv->ampdu_enable == 1) {
+	if (!(phtpriv->ampdu_enable) && pregistrypriv->ampdu_enable == 1)
 		phtpriv->ampdu_enable = true;
-	}
 
 	/* check Max Rx A-MPDU Size */
 	len = 0;
-- 
2.34.1

