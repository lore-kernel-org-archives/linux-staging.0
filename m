Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89F33C9896
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594857; cv=none; b=NBss2FIgRIaESSaewZPVppYoESa+JUPefxGklwu5FSIXTxbBLaQMGzC0QsUlEhnHRAgQtv/N7xi2wk4vweinmTkkuUsex+48VXRqvKjbBdDJuUL4Kco7jod55M0yhIw2aqMGCaoMGUDUA2gSC272DmPZd2M0fWFy7vBCbB29KII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594857; c=relaxed/simple;
	bh=eRDKcfkGufstzPLREi7PHuZIfleOaG+csOTZdSfsFHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PH5B2abZDL/421/j5+MLZjta10jNBGRYmxdDdenwMx/DnRmvUJjCT7/glgQ63QEOqmaxSn82rnZYXXAxq9+zxTjvi4Ja0aRb5lUnoe8WAo57lKKTu/G6iLxJh3LTbT6YaIY0H4CDETV0SkiX+6toczaZVDMQ4u01fE0AkQQ8aEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UCGLSudL; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UCGLSudL"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45fd45e596cso537593f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780594854; x=1781199654; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4orD+FEDYHldRpS5xBOZ9Xy+f7A2SZ2xVn8cgdrlFuQ=;
        b=UCGLSudLy8Vl6tx+4bnl91jf2XLzTemhSgl8LlN+dX61kr1qN551DarNegLjXTvEoR
         PUw+MSjpWQ6Da9VRRukOMEteG3NQNSdrbZcSMHsbL12GAuEcApqAPybDgwG2B4gOrKup
         o6uygKBzCkdqRd/LPhsI6S5M3XP02HHLshzuSh+avnYjZOhdlMnwQ5NjeYBdhqVMaYSp
         6h6F8B4r7p6dG8EuuNZJBahSXKwxTqJklOIFCtLuSYsHmDCR2JBlOqBZsC/0Ixund/Dj
         cFF/MiVJQYZN/Fcm4G/ZKYe4c/3SFtvhVImc1gIKstqMVQjkMnulHdNpL7rDO+ZLX5p9
         s8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594854; x=1781199654;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4orD+FEDYHldRpS5xBOZ9Xy+f7A2SZ2xVn8cgdrlFuQ=;
        b=otMCT5Cwt6m8wBEHPEQn1qUbtFUHWshMMCCpaSxWdSw2mMWjst+cUuOXQlV7Q/k8Ll
         rDhn/75pOvIS0PVmATOS7W5Qdfniq6cvhLD+jLWLBxu6NU5wqJCPaExFotPTNTyNfjKj
         Q5/Ps07MIKNbLxs4NVASFSQiBNSDlMo/VexLfmYpxPZxczA8Kl0y1lyerN3Jf0sV5C/H
         cesCj93EdLCSYxOj5UC73esRGgr/uoxh7kwgbYf+nNgnwUzdT+gv+UYi0gNswTQ6gqqG
         8GoZVwDso9hZi+RUcKpvxQu176+mru7pRQewBiJjxs3Y7EI0LdaTmVPl8nrwom2NNDQE
         KnvA==
X-Gm-Message-State: AOJu0YyP/gheUC5tFbAJ0TL1fWk3x9YJ8hGldZWOTf3Vcpnm1wzjeRPz
	7DX8klxV5HBgHD1kFcuyCkWsgzvJqiMikx12ChNhdIdHDztpSSVcIR6f++36SDK8
X-Gm-Gg: Acq92OHjdfIQoZDNq9H2GF5/EzvSxgz6EBwGKjoQRAj7BL9CGBfDAUYNcMJh95W4Jr7
	Tkgmmo8s0WVzAdtxjalpsEzDchOH+8BvIGGBBGEVbkRkxJP5jZdZ5nekQzRaKKhuUpNDdLwtIEs
	ZGw8X8U8v6pKz0SN3ShxfDupQsr6jHxV7S0mQYuFjhSK3Jhno9t1oFcKkDw27U3NEaBrDe1L29Q
	vfFVT7es5e0oYhOa+XWgq9R0onCc2c6E4D+xIqF9AHI0B+koiiuLDdqmvft46djdZYSpwZm1pQy
	LiLL/AB8OJP4m181HdOuS3iALLDWtoaNzEsh39rcoxaDDfvXvRYSMyuvHhSQ894aMqFrW8nIpHU
	eEZkWdmkMBVPtSH6+kRfeXfRLekU23zB/i1RgIzZ+F0lSUZG6NMem5sXLBZBOdTSf6GDLU5/0HC
	k3EDyU05a77Yj60jJG05Q4BTjM9xXTdQgoMJoNASZlqqHJhtVD3ePFPMIZ3u4WyR7GGfhWmxeDN
	QFu+VVIowOJARH+
X-Received: by 2002:a5d:6d4a:0:b0:460:e00:121d with SMTP id ffacd0b85a97d-46030510a10mr111027f8f.14.1780594854176;
        Thu, 04 Jun 2026 10:40:54 -0700 (PDT)
Received: from localhost (dslb-002-204-131-161.002.204.pools.vodafone-ip.de. [2.204.131.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344541sm16423765f8f.22.2026.06.04.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 10:40:53 -0700 (PDT)
Date: Thu, 4 Jun 2026 17:39:52 +0000
From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: add braces to resolve checkpatch
Message-ID: <aiG4aDh2czwJ2-bf@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Resolved checkpatch finding by adding braces as shown in styleguide.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index d0bbe1bb979c..8d4bcf7ebeaf 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -472,8 +472,9 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 		pos += WPA_SELECTOR_LEN;
 		left -= WPA_SELECTOR_LEN;
 
-	} else if (left > 0)
+	} else if (left > 0) {
 		return _FAIL;
+	}
 
 	/* pairwise_cipher */
 	if (left >= 2) {
@@ -492,8 +493,9 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 			left -= WPA_SELECTOR_LEN;
 		}
 
-	} else if (left == 1)
+	} else if (left == 1) {
 		return _FAIL;
+	}
 
 	if (is_8021x) {
 		if (left >= 6) {
@@ -532,8 +534,9 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		pos += RSN_SELECTOR_LEN;
 		left -= RSN_SELECTOR_LEN;
 
-	} else if (left > 0)
+	} else if (left > 0) {
 		return _FAIL;
+	}
 
 	/* pairwise_cipher */
 	if (left >= 2) {
@@ -552,8 +555,9 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 			left -= RSN_SELECTOR_LEN;
 		}
 
-	} else if (left == 1)
+	} else if (left == 1) {
 		return _FAIL;
+	}
 
 	if (is_8021x) {
 		if (left >= 6) {
-- 
2.54.0

