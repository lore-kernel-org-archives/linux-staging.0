Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFAC332ECB
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 22:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331466; cv=none; b=AiSK0w+kMzhyVfa88kZlwLSy7UvSsldz6MuegnhpZRTLI0VlG//G6GIKDZc67vEA3xhM+XfnGLcY4V/7ChkZwm49GNv+VkiT38e31zv3luTzVOPWp3ww4M2mxkd5+OFs9qAQBhfBJmqE+GpgXRAgcR3p3WUuVKrHF5+ZMq18C84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331466; c=relaxed/simple;
	bh=f6xoui0xxYDQTblnjtJ0LPI7XWuyRaUyzXwuvTdUlSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a5ske2YeCrPthbdf33PFTXIcstG7IRzxcgmsTjWYKZWjCZ5ZVjRQ8FjlmPCPcP6/HiBagpbLycODUviI+VWgfgiCaMLqw0b94HlLaXgzMI5T5xaGYtR1FmwmvGC1YcplBn8tS9IPN3xTMsgE0w7gVr1/BT6pQ/2y6oU7H+ZfgbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/sootqi; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/sootqi"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fd45a1feso15728921fa.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Feb 2026 14:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770331464; x=1770936264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OtuOVWkgaNS8XSxb20RK1UyOTr+IWGsU7UKYsX7PsKE=;
        b=K/sootqiIhBRmgn1OUTFdtaobvqW0D5WrUMYa/Uytl17aR4YnAzfCQxeYNLYk9Wi8D
         gact3OXBLDnV6W9ylngmnC7SGeCfCTmkp+thfmcKvU/+XrymFXdM3jBFOrtce2fS+294
         8Q28I3UVjmkB3h/eAMEPAWweq2n+0TU2jS/VrMzO9TtOYGRaFjhl+Suo7ZkvGYuYUmPF
         eUKzPXpPpy7lZR726Abty+ykeyfk4ir0K6CLh6Aee+BZk0GUb0KyW09DjJnDfAt29ooe
         t9uSlv4fh6W0zu2l+4ORa5cwCx/8LhwKA/UBQbwLmS2eKK3HIMIIJ7r04ffFKXU02jrX
         aDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770331464; x=1770936264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OtuOVWkgaNS8XSxb20RK1UyOTr+IWGsU7UKYsX7PsKE=;
        b=eX4PI+nrHkQhJ7IkicXEBt3ag64xF9xvbmBdhzc9ZXaNNOU24T0XcMGRMQTu2XKN3g
         8W4/d2qgWWD6P2b9ezqCfPYTR1TIkHEFqROY/+cK7xP59w82wYXTMfuSDyvB85d2hnou
         Zrnc3DEr7tutRhidf91BWebZZgVDds8M6yUAqijXiE8XujQ3RLHUp3GCGU32vjkzUncu
         hfr3g13pNZk5xZk9+VRDjxfyUT2XPG99hVMrT8dv2jobklhvofqvuSpNveYO/Owr6ctU
         vZsIBAAM+EMA6QQhI13xlCW3Z0NC11yvKwIvLAqQjzaxK2LNZVnFtWZ1TquAxoudiq1t
         /Cgw==
X-Gm-Message-State: AOJu0YzuIjnYB6OvSpQ0T8KeS2YKVkGBOTcRcneWwlNur2M+03vFMJxH
	KTKf0uVcwBkbbRr8MbhNXIcDDmlksbb7nyvlCL5Wnb0iRypx1Tqbwmzz
X-Gm-Gg: AZuq6aIOwmCVhry/ZTYucNOSlFGMwOvJL/2060xYQ8pB7qq2PZk/XKrM35FF6+G47Sg
	RgEG+Vtx1BvWx+3eXF4Cd6iUJZyoD0D0YNrRxkVxrmxjlp7jpSbmaBoZR3EwuXHx0NBvTi/cbMO
	Uh44XpuPYFhPK6G1M31fVgR+Ev2hoSwANDCj66Ovb8wVfkxhscdhkFDJKzx+Oz0yiMa8uGDjIcx
	vdl/E+Pn0MBfC4MBjbKoxqPn3krZw3pLbQCn5zjxOjFNZnYHNgQFB+N5sSCJW1PO6vQ+wlPIqcN
	kEIeNwMnadHKAqs9qlCz2OCJAw6in2AWAiIiZL46NRdEBHuQiDJIX5DrP4G7w61CgxF+2sKQTOa
	pRHocYK4p1OdFdZUKWd5gAtR0Bp/czayluvD9tmBSao8eAQCuH1pE3WO263p5eqvR9iaCjV/xPP
	gK8zqq+uO55kuR
X-Received: by 2002:a05:651c:23c2:10b0:37f:d9ba:747 with SMTP id 38308e7fff4ca-386a0ad2254mr14331821fa.5.1770331464120;
        Thu, 05 Feb 2026 14:44:24 -0800 (PST)
Received: from archlinux ([185.140.160.223])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b63e884asm907061fa.37.2026.02.05.14.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 14:44:23 -0800 (PST)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary boolean comparison
Date: Fri,  6 Feb 2026 01:41:40 +0300
Message-ID: <20260205224210.64920-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove explicit comprassion to true in boolean expression to follow
Linux kernel coding style.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 477fe238add4..82f05dacf41c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1157,7 +1157,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
-			if (paclnode->valid == true) {
+			if (paclnode->valid) {
 				added = true;
 				break;
 			}
-- 
2.52.0

