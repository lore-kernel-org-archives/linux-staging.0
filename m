Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9577533D6FC
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 12:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009355; cv=none; b=uPCtqF9ksg58fIeU30Xg46dSUqeimlWjoIgWqjB/ChXo8+HUEkAddPHaLOR8qgWgyuUJsSot2BSznjNQlNHGTwD09Uxqr0vkz2/ZHdQ27gsOIiESrudWj5qcQsLy6nHN1oWiR3GTWUQfXF9TIH2U/p+8GiK1YBn9PFheI2xCk0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009355; c=relaxed/simple;
	bh=bm6h1ymG+y9mIW0+XaQyl43qmlFuAOVoQobAEeU+3/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FgJMWskNefmPR2QVNN98yjS+j5r4XeU0YiGEo0OBuea36vPit3Yk9oOqMIXrWxdE3cubfGGPnACELSXP3X6cHgXQ58indyX2rIavuok4vnU2xAw0HMEoh1dkqEm5zcDgscW7IGlSVczuVW5RwdCm+9P82AwVg82P1w71tAwhD74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTr9Jmog; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTr9Jmog"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79495b1aaa7so15233367b3.1
        for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 05:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774009353; x=1774614153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML7RXYz8MTP5Ouq8ahIDz2se+GkDBlr79uQrydoL5gI=;
        b=CTr9JmogGL8+3TC7NArB3zM63C9V2iAlV3fFG6PsdnTMGP4pesEjdog99BAWQqFCHn
         FemcflyX76yPZX3cIERydtbY1d7v8bLchbMtaXe3fya8IoQOdxpSKk+792AhwGPt7ttL
         Yy9AmxfripZ4pFl1xrCr52Lu/VzDJvovj2l81uuLCHIisqSHDV8Wpb5wp14ts1L16kIV
         rhTzkldp5jr5NetVZg0uzDD9SAdSAGSOU/Vyy907zeXvBe8TDZkwVh+NlzsaGwGg0wM2
         70obwaz8j3zsXzqljiFnBPAF1smLTz1Q40BZEVgrJy53Zg4rAQotR8aUNAyFmWmyoktD
         zShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774009353; x=1774614153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ML7RXYz8MTP5Ouq8ahIDz2se+GkDBlr79uQrydoL5gI=;
        b=CDqeOhG5hRMnaX8xH+dxFmNNkEwx4eUuZ/D54AELuPsZ37ax9FTa7JrxRFkAyzKSjU
         wDVIr+IvQmpbP1g9yvZEJ8FicNq3vRqHqE0fSzUW2AYvbXBfXnRntmGREm3l8Ql1nbcn
         TGOKuaNBrc5snmIOftkDSSTYvEZNQRDgAuCjunKmL7n9iQKh0cusNwcoMZPyD5CJfFFs
         h18nOx4Uxq2pKfwXEQqZGeI+sdl1BdRtCvbiOYjqt/haIdo/Fr8Y8yK8Mtj8ljpS07cs
         zkDrIQJCaNFx0xEpXjJ2UKDBAt+MOJkLkQSHz1YGz4kyoPi5bUdbXf8EFA+Oh594V5Fw
         qsFQ==
X-Gm-Message-State: AOJu0Yy5et45bTu6ecKDWHJmv8LSeMHly6xTI9i1sq+hr1A8KZD5jM77
	mARkmOEXKOgRXIeu76+16xvjPIKurIw8AtNuPeO3CXLjpkLHOtmUW86j
X-Gm-Gg: ATEYQzz/e8oakIRho8trQ+smG7bagYoRvzX3oWuoX4f+vzSxRe0YXAj6c8bHz2uYva3
	80ShXPTOwDNt4f3mq36BuOXS5faPO+YY3u+IcIym4szqNajiuOxQC7BpiqeofDPKFH1iNPgWzJC
	ynZ66pxSgrdqVa98XJHTuugtJK75IhQo1WM0uCkoD3ZSsKnWCc0bUig3o1GdMK1yBZUOdN50Fwf
	2h6d4Wd+3L9wRECcsHH/+F4FTzSPow/zm3/fdvoKxIrWFBMaSXgir95A8QRUlHVLUvBXljiCwI3
	DOjI2I+YDAHCHpNBMbPmIfSmuZoV9qqul7uN4JfZNC3d0H+5VY8ibFTVJy1AXvqPg0PHhM4sMKV
	HldkheU8gtAG6+5wzCpJooeHvitYaU9xC6coGWuEj5eoTishlvCRX9i/sxjbpvV8B0nR+luJY4+
	i1NxKKtiHX8rsArP0FLJVDBA==
X-Received: by 2002:a05:690c:f14:b0:79a:1aa8:c78f with SMTP id 00721157ae682-79a90b9c383mr27225107b3.29.1774009353495;
        Fri, 20 Mar 2026 05:22:33 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a9057f820sm14075977b3.40.2026.03.20.05.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:22:33 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 2/5] staging: rtl8723bs: move logical operators to end of previous line
Date: Fri, 20 Mar 2026 15:15:00 +0300
Message-ID: <20260320122119.19563-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320122119.19563-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the position of logical operators '||' and remove unnecessary
curly braces around single expression to fix checkpatch.pl warnings.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index d92ec9949d00..eb4a32a998ae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -11,12 +11,10 @@ u8 rtw_validate_bssid(u8 *bssid)
 {
 	u8 ret = true;
 
-	if (is_zero_mac_addr(bssid)
-		|| is_broadcast_mac_addr(bssid)
-		|| is_multicast_mac_addr(bssid)
-	) {
+	if (is_zero_mac_addr(bssid) ||
+	    is_broadcast_mac_addr(bssid) ||
+	    is_multicast_mac_addr(bssid))
 		ret = false;
-	}
 
 	return ret;
 }
-- 
2.53.0

