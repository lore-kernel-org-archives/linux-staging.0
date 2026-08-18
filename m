Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B479E35C185
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 08:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787041614; cv=none; b=HtzmKYc0q4xvz5GHHOwPfjpv0CziP9FR0krZEUjI55STH5OsGOd7qxYF/ufv2V7GAMQf86OB38HY00fZZB+7bP/7RfSiNI76ob8HcY1OJLX0PAdBa2suq9IT1gy9Z1vTOea2dsvaVlEgQj/gn86z3dWVdQAn8xhIiz3iAPsNWLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787041614; c=relaxed/simple;
	bh=lwL45gpzImDRlei3OpozWbCDy00pxntKvWgsuB2pODI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OvEX3g9wjhiD4HOtupoA+39Cf140gj4yylbiP2hsAfNLJDjUypIy/MMzJRYMMs6z1fui9rCQ3Khpal/rmf9MzYpe8RG5ec9GWYbgkZ3b9s2xq+FcRYsBSWLhfD1Vl8Ua4G/CRWxPcBfIPSCNJpsF1J25RgoQt1HEGQ4GEo0+EkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLMpcTm/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLMpcTm/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca80d708489so576483a12.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 01:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787041613; x=1787646413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KjI2V4g5duqLwT1Q9oqhAaGcKCAo8dRWsJlKHv5XIWw=;
        b=GLMpcTm/gz60Gdf4Mvjre9rak2YjAy7cJHmi2mX2r329SWbOUCzUKmYkpw82xS20Pl
         pBVLHQHHH86ZMmrlWa1HlBDCdi1N9+DrO517cmzAYyJz4f+D9qtZ+Fry/akPYpI+5J+H
         NLy22CEF7yVh46QzsPPRBKCAox+cIeGZKiE3ChlkmwQjdOpvagRm7VKsPADU7xjsLB7h
         mvz+axhUZgHxabrpD1xeCAmvx3gVdZPLQ8dDP0BEzH8oM50C33RG5qVlmgmenyo2Iwx+
         tIYbEOoC7FS7HGXSbTwmXjDJlEmJVhpcPIyxnju7XgY0oimhD25DQ6dIE2aSpDcTgHiQ
         AK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787041613; x=1787646413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjI2V4g5duqLwT1Q9oqhAaGcKCAo8dRWsJlKHv5XIWw=;
        b=UBVVPbDja9dZ4ZKWbErWpcbQZVkwAzjWgVpXho3QCZDurIQj/ZXFD14XLuI8scpOr3
         JJzx3pCvLLPn3AOWM2Fl7NqWL2Mes90o2RS+jrIxh0I5GCzGGGYcNQMPAhuqcp9BRj6N
         mJWWxwxGl2A7dNe9LolzP7HE3GNvdOmoDMFwiYScYMw8Hd5qsinANKiZAf0nCm50oEz4
         MSZrseGErK4THF2FJTZPgWRmeNfKsijwfkWtN792UcE2rGLFiKp0GDdUuiWojbqrPRhn
         d/QIcaLIAQ2w2GWcpRSjCdYMhWjqpyyXOWNRI7OUOst1Z9UItVsugLFeRIyf4HJrGzBi
         7yZg==
X-Gm-Message-State: AOJu0YzvKFKSzszcvTbQsXzFU+EPh6Zl07VHvUH+dpBzimcr0rp9HCI4
	XFULRFJXEwJNJcD78vPnJegkMfR0BCEPp+RUSxHk75XkeV+8J4UUEoLF
X-Gm-Gg: AR+sD13t4QcNHMejE7n+AxnrWUWtTgXtV1PW3koOecBFRwdVckHk117n9eEMrXtYPOf
	D3HgZIjB74Nn36SncyEJ6JM+yKT/BBJF/+skFcabv8B/BVPvgPCJN42SFfMnxTZojuC13BKRazA
	mLvppMaowQJjA86t6zBNIRPyJpPOVJ7dQE5zztiI6PIYwSPZH6T8N00AUhtNIEnxlPXbe+DJA1F
	YNw4YvSdHksBVidfSiyJGjtiqDv9/ktYBAk49jNIPN0LAduIe7UXq25nbBih9/epY8tgay/OhP4
	HBD1ugQlOp8X2rpi1+XRlmUNJ22XSAgqGTXU2VH03rR+pzD/s4NAiS7wGbASLXQqC8x+Rvq5jC9
	JHG8KG3yt3sR1Soe+aq//3wfk0p5vGkdc9RpvxnrhA4RAscNgauDh3UvqkGarltlF3tQgv1nNey
	u6fy4klmj1DqHnVnL37u6GtnhJCIaeSqBUo9YMgJlONDZILH6awoVaxd7QF8VjPH0YBo+nDmEA5
	SGJHDrFSp6CBGmP9gWgNBRaMf8=
X-Received: by 2002:a17:90b:4b44:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3955f0bfc4emr4786365a91.4.1787041612966;
        Tue, 18 Aug 2026 01:26:52 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm15480740eec.16.2026.08.18.01.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:26:52 -0700 (PDT)
From: Malathi <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Malathi <malathi.a2000@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove unused NDIS_802_11 typedefs
Date: Tue, 18 Aug 2026 08:26:21 +0000
Message-ID: <20260818082622.1186194-1-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'NDIS_802_11_RATES' and 'NDIS_802_11_PMKID_VALUE' types have no users
anywhere in the tree, only their typedef declarations remain. Remove both,
together with the 'NDIS_802_11_LENGTH_RATES' definition whose only user
was the 'NDIS_802_11_RATES' typedef.

This addresses part of the "convert any remaining unusual variable types"
entry in the driver TODO.

Signed-off-by: Malathi <malathi.a2000@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_ioctl_set.h | 2 --
 drivers/staging/rtl8723bs/include/wlan_bssdef.h   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
index c3a1d1a84f78..d8dd4b6d7aca 100644
--- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
+++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
@@ -7,8 +7,6 @@
 #ifndef __RTW_IOCTL_SET_H_
 #define __RTW_IOCTL_SET_H_
 
-typedef u8 NDIS_802_11_PMKID_VALUE[16];
-
 u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep);
 u8 rtw_set_802_11_disassociate(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 812a68394268..4b14eb0caa03 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -12,10 +12,8 @@
 
 
 #define NDIS_802_11_LENGTH_SSID         32
-#define NDIS_802_11_LENGTH_RATES        8
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
 typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
 
 struct ndis_802_11_ssid {
-- 
2.43.0

