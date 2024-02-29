Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406C97CF16
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 12:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709208897; cv=none; b=E2IX/uotpliHXQSgqLAZmvSH447CE+d8yZEUm9R4cTTPqt0PvqA8jttIEL+AKsyAWBTYy2f2R7OM6E+Tfq4FY4O2+C/54vnw/vNmrANoebIB/0Vc+5+bxdzt0V4N7TaID2GQzOzFoaALkvkougSTTPsZSw21O/oh8kOaXdyKr24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709208897; c=relaxed/simple;
	bh=ySkx+nF0oOo09md0ORc8Dfqmpo0SPAXHrokykDeq3VI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KaX4trq5iYDyVhka/TsZJ5BF/7PA8pE4JH1yFdphh8BLSU+5TfVchuPLqp5DU6BFaaccbPSXw4vf7bsHA7X5GfrGOVfjBXWhrAJGmfwnue9RrWpJzj8SPSDtq9ghzzAkO7ZxwF8qhZwes6RdAKWqfZAce3crze2eJ30IXmhhECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pe0/0ZYr; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pe0/0ZYr"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-33d146737e6so692775f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 04:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709208894; x=1709813694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J1VdybrLw49RhnSmXSNVwhPANRO67JVgxx+H7CTRzq4=;
        b=Pe0/0ZYrUX98yzFtNzDWzGkEDna4kgLqpl6NU9w6avEG+y6yHo3R6IGPrutMRf8Ga5
         a26m8AkfVmfytToISp0+fQMA3o7T3zbWcK5ssv6rwr0P5MUfOo0Tg6/7mKH3tcmLzjbr
         X2tzrz56n94Ha5ZwDVWepIJxN5lkfaKuSl+WMWVGMJ8hjQrAyjQaZrY1lTTUsL0gsVqX
         EY7w7fjFnDNc5Le8FA5xngeiuRW4zCX16sxfu6cLC/uvwprkpvcKNC3Ovn3VgOgiJe/Y
         lSJjH/tSey9G5RbfnrH9WNuMUxvoA/aqD3Wxv7WYinlGJP1KqHVNFOKHF8nYxE+pyAhB
         /Qfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709208894; x=1709813694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J1VdybrLw49RhnSmXSNVwhPANRO67JVgxx+H7CTRzq4=;
        b=Yj5t5g1k19oHgMhUTBW9zXr/UCTGcDsEbQJPzoraJUsVHodh1KVIX9BJ1laxjeosxE
         Fn608MnZ7M4TII1Kcsxv5YZ+7sng4915eQaRgXiZn4idC+/z/ksuUz1Du67ER6hUAsct
         8JtxxVaL4A0QZyG5+tNZbl7Hge47UbMXov1MtzeQ05fW5JMKTTQOP595jRzHuVjddGnE
         hWJtXviK3n8lq/AhCq/9dBmXj282Co8siM03DnRXqkI2JwQhWDJKnqpkPmOHaX8sryXa
         u1gH8wc4mE46JUzxGbWJCcXro0TNWs7lIbbXFpA0d8RJHUnwuArWtwY6FCR0ud3P6amv
         DXPg==
X-Gm-Message-State: AOJu0YxoaWfukYWTqq6iYBXN2I91wke5GUDD+0mq0wFo3CCgxdqTqYJm
	kGzpWzUo9SnC5VXXNOoC30ZOFR/jyh0r4471/ZRXlIQpO25S6khf
X-Google-Smtp-Source: AGHT+IGO10l0BIfkOZZeL6729rY0wh3AB0FiSPqwCHnZZfdJzJs7YzsXac6E2dDLIwI3+lkO+59Cug==
X-Received: by 2002:a5d:4581:0:b0:33d:bb65:806d with SMTP id p1-20020a5d4581000000b0033dbb65806dmr1352355wrq.50.1709208894422;
        Thu, 29 Feb 2024 04:14:54 -0800 (PST)
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.152])
        by smtp.gmail.com with ESMTPSA id bj19-20020a0560001e1300b0033e0302d892sm1678557wrb.66.2024.02.29.04.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:14:54 -0800 (PST)
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Thu, 29 Feb 2024 14:14:51 +0200
From: Meir Elisha <meir6264@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@gmail.com>
Subject: [PATCH] Staging: rtl8723bs: Remove dead code from _rtw_free_network()
Date: Thu, 29 Feb 2024 14:14:45 +0200
Message-Id: <20240229121445.22257-1-meir6264@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean dead code from is_same_network() and _rtw_free_network().

Signed-off-by: Meir Elisha <meir6264@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index b221913733fb..a6bd7f15aa08 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -169,7 +169,6 @@ void _rtw_free_network(struct	mlme_priv *pmlmepriv, struct wlan_network *pnetwor
 {
 	unsigned int delta_time;
 	u32 lifetime = SCANQUEUE_LIFETIME;
-/* 	_irqL irqL; */
 	struct __queue *free_queue = &(pmlmepriv->free_bss_pool);
 
 	if (!pnetwork)
@@ -389,7 +388,6 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 	d_cap = le16_to_cpu(tmpd);
 
 	return (src->ssid.ssid_length == dst->ssid.ssid_length) &&
-		/* 	(src->configuration.ds_config == dst->configuration.ds_config) && */
 			((!memcmp(src->mac_address, dst->mac_address, ETH_ALEN))) &&
 			((!memcmp(src->ssid.ssid, dst->ssid.ssid, src->ssid.ssid_length))) &&
 			((s_cap & WLAN_CAPABILITY_IBSS) ==
-- 
2.34.1

