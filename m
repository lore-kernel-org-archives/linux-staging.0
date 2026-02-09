Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48379326958
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 23:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770678596; cv=none; b=RBlNjziXGWw9u+RqRPTDtDRBXIu4BiiFzihKq/ycb3oKgWAbLsP2wBSeU/y5hH4ke2nUssr0MC4Q7ho0cYhcF5i9yKddx1pcHdmyxVaVtoFz5zF39wF4i1y8dMyez56YrgpHzvQlV5s8U7cZJ2oZzPSxwUzUfAn4tM56ElERxsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770678596; c=relaxed/simple;
	bh=RhqaPnOpI4u5ANvMgPYk/6qODXiDEPNGzSRWA3sB/tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s1+YXC8sUBxeqcz53oZ66Hywos6EHIO5k/UYHvIlJUZKDrH4RM/Ktnl0yGldb77n4yVI7JMuNr5VgbA6EqZX4YvrpBMk7SPixwLZvpCEGwg4jSzf+N0mKjVKWhXxPKC7kw0V5wm57g/oWuvIxg78pSDg9kqzZCFmlWns7yCnBY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXDt+f0C; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXDt+f0C"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7950afac0ffso51432737b3.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 15:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770678594; x=1771283394; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=irU5b7v2qXlIXiIB/FSAxdt0dXgnpYIuw78qgWrcLZ0=;
        b=BXDt+f0CWOvQ1wfNnysZ1XBugJ3IL947f6KTzZwGnt9aJnGRDHFMZhILXcbZyjMjLP
         3wYds/z8gQhNtDWl1h1GSO/bxwAAbTRskbjJ/Ar0o8EPVJZm3qXp1QIF9jVPHNFPLfOh
         HNN/+/olUAbn74XsmEg8knP0GCJtXHFzxTOY6uYc+AB6p0Y5GkCk1Boch4KwNdZOX9+g
         E51OdqIcZQRFHNBSfr/RIi2LgHvTPpY8VH9ZWmxI+0y3qNwH0fbTLzgZ3BhyX1B0rjTz
         DCs66bih3FLQsTiuYvzciYLYryTfVxEtIm+NKhbnj7fVou6ulPhtOMfU3rC16o9ftKEK
         td2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770678594; x=1771283394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=irU5b7v2qXlIXiIB/FSAxdt0dXgnpYIuw78qgWrcLZ0=;
        b=DpDY2dzush3vOlVfaOkWtK1VyAfqCL/JWgFQNMqA0K/6qX7VRtDfwWAAS0bNP0okoy
         hKtYIkBFtsv70xIY2YMOpZuo+L9bSr4nNEfFZtjX5xWjtz9xxci0X2m1AJFBaszHsIgN
         joOZa45TlDTekSviEf7IHIccYGllpk0oYYK/usO3+9xRnIKU0lZq5ocRfACel6cGqIWG
         AfEcgFrFczHWLV3GvhhcepUdepMMTU7FHjkAUmgx1nn1CoJ1V0YBTac465IbNCHDOl9s
         18kECFV0Xv1UOUgnZPOGdS7zm6TGdnRJLlcPGukQ83HDoNg47sO8wCf3nUz0iTPVBrVj
         gsdw==
X-Forwarded-Encrypted: i=1; AJvYcCVIyWkNsB1+NCPMZd3Zz0r7YZK9daEvPHNNrc50naIonPYGQ37AXvTGTeaOjrxFKuKLHRQQg86pWMVWBOG7@lists.linux.dev
X-Gm-Message-State: AOJu0YzBFIIDkYgURVocPQ+ouqjKeCa2+TRoshEJ8rCcPWjN+a2bsCJp
	pKyh6uwv/OIRLMs+Uy1b9GzsKvOff9kX9WRY5wXOvpXYZEwmX4LVQoXC
X-Gm-Gg: AZuq6aKL+GBoN6LfrQcj0pxXH1GwGeGgHMDnxjwebqiLijHgeGQFLaPAq/kBzzvLR42
	+Tm2bUByF+Y2Q5Dx4MFHSbHsQCjfBKxeMNvJ/v+ot86YYf7i62+1buUvrnIjHcIixX0eXO51osD
	rr3NKab86HDv6ED7ND9gQ2onn3vZGmUuPxQJkmuJu3E9/SsaD577mXweTFNfvcqvleBbAF5bmxs
	jyUg84SRYrmgegr5J7Gt3KRShD6DciCIGNbQNmVrTFn3ZymUD4Ht8Ku4A/t7k2UNRjCV6EG3PTm
	yzm4UnR34uRxNtX9Jk3OEqwbtFY44n2Ne2KzaljkphdeY1HDoCFQJ3eX7SlhwarbEav3B1iD4+9
	6GQODpuujiyXW2Zbkc15dHIQoXZFp2mMV2cimeQtLwu2JXXeRVXFs9mBBqmgzv6hMShlJ2hbAe5
	jbE5S6J7lnG7q++EkhKjVkroxHG1r7nGoBCNPVLs0FzEw99yXsjfwx7xKM3GcjDNXooDwmSnqSx
	XfYQIAsfps/I5AZwzviidY=
X-Received: by 2002:a05:690c:450c:b0:796:2aaf:e0a2 with SMTP id 00721157ae682-7965e2dfd82mr4077847b3.33.1770678594004;
        Mon, 09 Feb 2026 15:09:54 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7964a783a03sm34544197b3.49.2026.02.09.15.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 15:09:53 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: Remove unused members in struct rtw_wdev_priv
Date: Mon,  9 Feb 2026 17:09:36 -0600
Message-ID: <20260209230936.37385-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209230936.37385-1-ethantidmore06@gmail.com>
References: <20260209230936.37385-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove members p2p_enabled, provdisc_req_issued, bandroid_scan in
rtw_wdev_priv as they are never used anywhere in the driver.


Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/include/ioctl_cfg80211.h | 5 -----
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 5 -----
 drivers/staging/rtl8723bs/os_dep/os_intfs.c        | 1 -
 3 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
index 782f79e9228a..bc62b7285950 100644
--- a/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
+++ b/drivers/staging/rtl8723bs/include/ioctl_cfg80211.h
@@ -18,11 +18,6 @@ struct rtw_wdev_priv {
 	struct net_device *pmon_ndev;/* for monitor interface */
 	char ifname_mon[IFNAMSIZ + 1]; /* interface name for monitor interface */
 
-	u8 p2p_enabled;
-
-	u8 provdisc_req_issued;
-
-	u8 bandroid_scan;
 	bool block;
 	bool power_mgmt;
 };
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 21b1487d32ae..3c491f61c680 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2749,11 +2749,6 @@ int rtw_wdev_alloc(struct adapter *padapter, struct device *dev)
 	pwdev_priv->scan_request = NULL;
 	spin_lock_init(&pwdev_priv->scan_req_lock);
 
-	pwdev_priv->p2p_enabled = false;
-	pwdev_priv->provdisc_req_issued = false;
-
-	pwdev_priv->bandroid_scan = false;
-
 	if (padapter->registrypriv.power_mgnt != PS_MODE_ACTIVE)
 		pwdev_priv->power_mgmt = true;
 	else
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 21a0c3cf4c31..7ac197462773 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -960,7 +960,6 @@ static int netdev_close(struct net_device *pnetdev)
 	}
 
 	rtw_scan_abort(padapter);
-	adapter_wdev_data(padapter)->bandroid_scan = false;
 
 	return 0;
 }
-- 
2.53.0

