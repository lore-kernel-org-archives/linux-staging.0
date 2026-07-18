Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7234D4D6
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784401359; cv=none; b=FeI0XI90JsVagHQUDPQZp9S8HrqvMmDm9cI10TyyseRezMbK7F/rwJVKRzvk2oPrC29CUa4B7B5MhPxYx3LFCCvZJQcV/tsCd2pXYuyGqaVap+LC4M12d/rBBVaLUthLj2CzERF2xozNHklExNtaN0f9nPiO3k9o2m2fjeibfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784401359; c=relaxed/simple;
	bh=XZdD3zKdSTbuGZxGX0Q/ZUS+GERYGHbGZ7CTTNOTzCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blr7rx5u4jrvffe1sNyYi2VDFZwUMgGhlljmWYNwXJQcR16h1VaCaaZNARgDHdrZqPyhDvtoL2LvfPmCsc50FqL6UYGqQK+C364/xkXro/jVWiwhIpeMtkQOOEm7Dzg7mtvrlofsu3Y9PLHmp6eabqZIrQbMIbVYnuTMIk8fUXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1EZpe0R; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1EZpe0R"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so6673408a12.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 12:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784401345; x=1785006145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zu/jYX89xJfIleoyKAvoiz/I4BllDAYOzQIUgGaxN8U=;
        b=F1EZpe0Rc69aZaPJphbdao4ZreGyGeaRTtD/hMIy9a+4Wx5H5HfXepVD+oCkhTYbW9
         RV1zND7B8k+BloNnT6vvOSrQKKgRONpSEmEERhavgQF/4XEyR04uv1vwLLAwYPn+45Bi
         0vruttUIid+eAz/1dEay5Fh7gYTlBZM+dkCEkb1gv9F4IOEH5NRG9w/yufGqtQXd4qQv
         /abSshD1QvCqziLCe8vnaUHar4bRb6s7FssyrICvZIs99svkF+YOciX7OyArjstRe8EG
         TaxgwvneglgTtWojcZtIw38syQkXloIOzssEwriKeUacmNEWCnKkyKXXxUSLKrzRkSZd
         diXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784401345; x=1785006145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zu/jYX89xJfIleoyKAvoiz/I4BllDAYOzQIUgGaxN8U=;
        b=D3+hmPNP6EMcMRffruS1YAmFjVqIZEnE9Hb/WqxIdV57iPwttQgjqqrwyoxDh0facS
         nI4bSg1KxLffPhE0nyR6GJ7v5pULe3W8LFUvOkIIWy6gSHkuew51IWrHDE0J6H7xL4k0
         pZ1yldx0nWyHUbgxuzsY+KdYrqSh7aaL5rpAUYlFa1Uq3nb9Eb8xBUIs63w6cwvfSIta
         50fmTMDPJgr8PH+D8O1WVWyq9I2K1viRyA4WRJivj0Uywuz3OSbY9xQDNhYL/Io4q2cI
         37PdPQh1Jrp0/0LW+rCAx6UVzdLq5VNaKcmRNuQxq56wrqei9yDyy3VTIP0c1sJwMfye
         gE8w==
X-Gm-Message-State: AOJu0Ywxmz2IdTD658yziF208qh4cf1lyBB1FBKLJoVvvHUANK3s3U3N
	zpScqx0t46cFP8IJrvL9vGyXI3VVM9ZFSNJQQALKcgb9rsDmTEpmsCfx
X-Gm-Gg: AfdE7cnT7xgqmhNZfpkpLVBzQFD5OySD0mRYEiZn4Y3QmDhA7hbZHt8ntYgL2pUBTGh
	NQWRfqEN635rR41FAdsyZ7t5oEl0drB/oO5Mkm7tDKrRw9cWemgGaNm3HfX0W6xoVFGwZefO/ar
	j9fDlfm45f+hOXMz4VKDM9gRPjrxRIXziDw/ey+4pb0HyGvidLesqX+PPHUWEo5Iq/dOsk+gV8d
	VrYNK1G/JpvltU7BFRRxVu8eVJ+RyTVNEW5fk8sSbsd/lB0iU+vabrCsapUL4YZjnMRUYFAOEbn
	N6GBSfgoDEX0MDheW0MRwUptkr71kvKyRdiYnagonTdIXotC/HK/tWdLvYmvLC+MEoG4SCIB8b+
	Zt8deiyMINQMtO/WPAPb9ttWhuyanyidCRKJw+MlKgdGFaExCPrGM1oeteG2ogP4vnFDG4zt9Y7
	6WWTkwUlErJtGggTfffy05NjxBoEj+ANSGBh/hx9nKAO0PjmqVEViOqrc=
X-Received: by 2002:a05:6402:51cb:b0:698:c1d9:8134 with SMTP id 4fb4d7f45d1cf-69e6525c1b7mr3043951a12.9.1784401345439;
        Sat, 18 Jul 2026 12:02:25 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbba0fsm2392534a12.17.2026.07.18.12.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 12:02:24 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 5/5] staging: rtl8723bs: fix skb->len underflow in monitor TX path
Date: Sun, 19 Jul 2026 00:02:12 +0500
Message-ID: <20260718190212.64409-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718185445.63070-1-meatuni001@gmail.com>
References: <20260718185445.63070-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_cfg80211_monitor_if_xmit_entry() strips a radiotap header with
skb_pull(skb, rtap_len), then immediately dereferences the 802.11
header fields (frame_control, addr1, addr2) without checking that
skb->len is still large enough to contain a struct ieee80211_hdr
(24 bytes).

Further down, it calls:

	skb_pull(skb, dot11_hdr_len + qos_len + snap_len -
			sizeof(src_mac_addr) * 2);

again with no check that skb->len covers this amount first. Plain
skb_pull() does not itself validate the requested length against
skb->len; on a too-short injected frame this makes skb->len
underflow to a huge unsigned value, after which skb->data and the
following memcpy()s operate on a corrupted skb.

This function is reachable by writing a raw frame to a monitor-mode
network device, which does not require elevated privileges beyond
being able to create/use a monitor-mode interface (CAP_NET_RAW).

Add explicit skb->len checks before dereferencing the 802.11 header
and before each skb_pull(), bailing out via the existing "fail"
error path on any mismatch.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 6a97afd89dc7..eac1b6ac4c67 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2034,10 +2034,15 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 	/* Skip the ratio tap header */
 	skb_pull(skb, rtap_len);
 
+	if (unlikely(skb->len < sizeof(struct ieee80211_hdr)))
+		goto fail;
+
 	dot11_hdr = (struct ieee80211_hdr *)skb->data;
 	frame_control = le16_to_cpu(dot11_hdr->frame_control);
 	/* Check if the QoS bit is set */
 	if ((frame_control & IEEE80211_FCTL_FTYPE) == IEEE80211_FTYPE_DATA) {
+		int pull_len;
+
 		/* Check if this ia a Wireless Distribution System (WDS) frame
 		 * which has 4 MAC addresses
 		 */
@@ -2046,13 +2051,19 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 		if ((frame_control & 0x0300) == 0x0300)
 			dot11_hdr_len += 6;
 
+		if (unlikely(skb->len < dot11_hdr_len + qos_len))
+			goto fail;
+
 		memcpy(dst_mac_addr, dot11_hdr->addr1, sizeof(dst_mac_addr));
 		memcpy(src_mac_addr, dot11_hdr->addr2, sizeof(src_mac_addr));
 
 		/* Skip the 802.11 header, QoS (if any) and SNAP, but leave spaces for
 		 * two MAC addresses
 		 */
-		skb_pull(skb, dot11_hdr_len + qos_len + snap_len - sizeof(src_mac_addr) * 2);
+		pull_len = dot11_hdr_len + qos_len + snap_len - sizeof(src_mac_addr) * 2;
+		if (unlikely(pull_len < 0 || skb->len < pull_len))
+			goto fail;
+		skb_pull(skb, pull_len);
 		pdata = (unsigned char *)skb->data;
 		memcpy(pdata, dst_mac_addr, sizeof(dst_mac_addr));
 		memcpy(pdata + sizeof(dst_mac_addr), src_mac_addr, sizeof(src_mac_addr));
-- 
2.55.0

