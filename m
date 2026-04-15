Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F71A21CC4F
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 18:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279357; cv=none; b=Dg4D0SZBdV6alrVqCM3o7eOpDWG3k92oEd7aLQKCAotC9JLDzb1+MtMqVtzEASzrK7nLBoOhin8jqExcOKbJY/LGJOfX/EjMXWX0afD8crKDlyi5vxnG9bC+G4jl8niwoKAaILZHaETXUQy6BP885cYASUoJf95i4KWbJVgu+To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279357; c=relaxed/simple;
	bh=4reUDLZlj/PYeJKnXw0RmQ0kJhkc5fPrtbvWTnUv6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VQj9aCe0YpAK26nr+6b6T5CGPZ2L2PS6kZ5g2RHxmrrlCDlawcGVcSoS8FPKP/oUgQz9cZAiwAgEXzfStDXEdl3MU5Rm8yFUQJU0+jK4St8zIpSveH2tnyQzduQ9EMQMak2blue88DGfvvwR4yrrXwPUSFeOm5cID9YQI3WzKhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o1BjNCbw; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o1BjNCbw"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5637886c92aso3074364e0c.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279353; x=1776884153; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2swcOybNQxoOTEXoSldGalBD6IDZJiaiZhIwmr4O4s=;
        b=o1BjNCbwLG/S3lhdnmgDoBewzFHhnkqoh99pPGVC63ELiES/QbanQItlpT8s2KvMgO
         ZVZXWCQxvwFoDwc74aI2Q4KiXfNq7E3MlPE8qw76cAy0ELp6XeBNcn6agVKO+sBKjV6+
         iX+IzGFcZ/jJA3KwdQf1lV1FP+FFcMeDgMIqcxyvoILPQUsr9n3yiiuQgT8ghgtMxInK
         6aq52o9xOornfsxp0kfcG5PlUwiBZoHsDIZ8RwJmJnS1o9wN/Gj7hDUIXV2X1Veep2hL
         H+70QRcf61AHTK6zmSGOMhOOZraHqXc55WvBLCKoJseay9VKuPNOdS1CWruL1Pn2he8L
         fRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279353; x=1776884153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2swcOybNQxoOTEXoSldGalBD6IDZJiaiZhIwmr4O4s=;
        b=PYQNx/7YyKiqgKRsJvniHoWzqxBSlTjPy1vh+Py5Dfl+/BPQlkjsY5bA/UAouq5eZa
         463tmEuu1K+X0NGpYZ9YP+/dJiYpJ7RsP7k1wjNQ/54HV9DPJ3YTJGB2ngSPuPlDk1pk
         jt85ecUgw2z2O/5KHfZofN3nHXOH6VQ2DNN5Vg9vgDonfpQsj1K48ZpS1HnEAtXIS9zH
         6BxHPW/kSI2oExLj5p+ALjz/Zg64oy4xxrXOQqmb3E26Q4tkxzqeuP+0L0vZOMUNZwRw
         qOTa5qotuIsDZ1OVMTO7qccCvelQDS3PCcMjQJCAzw6TQKkWirv0K85srzfJePdkkF3W
         BDDA==
X-Forwarded-Encrypted: i=1; AFNElJ96mVy7M/59WoGbDar3WQxnoYQSFNRdlTouX4/ESrJQDq3J+oX46tVIYC3PPJM+L96yYwjhRM3tJRJF/dKl@lists.linux.dev
X-Gm-Message-State: AOJu0Yw363LaumTMIzmykzNPsA3Ci0DXM27mwzZQOrmo8o3XqLCtaPgJ
	v8u9QC4+53s0+QXHYyAdKiwJOMBTclIAcifKt5Y0tCeoAYR/+dz5CV9V
X-Gm-Gg: AeBDieskfFj8zdi6DcFX8j2BDWwhwUR7YDeWNazcEmMP3LS7EfBWUoyW4mUutW0e3fO
	b98/d3GNXrw/wEke39pphnjxG3CrCMB4pH6Zb9o84VfcFCCUyxkuWXUOfvzkQqGap98VCZBG+YO
	idE1NKzmKx7+OeelnkzHAv5lO8aGnIYDWNYb2Ur/M7Pblih5KZQsY+LHTcpNa4R8lNDafpIcMlh
	sdqB21QTZ/0/ZabeAm+Ts43wdjWm65sO7nVwVBW6yjS+kXuDSE8IXyWg9SrHRYpaVV4oPHr228b
	tuuCg8nZvu0klBQjQLQEfS2khE4NreExEO8puP/t0YHgdacxHx8oxhryzE0o2kykBwAmPIrUSYs
	eYkRWATxF1eABpbr/fK90mcMYtSaDZhuFIwMOEJhYnxrhz9ueHaAsSqL5mtq45AptcSP1gKiEiY
	kzEkVuBsZKzn6v9tBWuKY6fc+H7kDPognFjs+MRSzc49Ab9O4mIDTs
X-Received: by 2002:a05:6122:1d4c:b0:56a:fff5:b4d6 with SMTP id 71dfb90a1353d-56f3bb66d4cmr10771333e0c.4.1776279353283;
        Wed, 15 Apr 2026 11:55:53 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89feb56esm1647484e0c.15.2026.04.15.11.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:55:52 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v4 4/5] staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
Date: Wed, 15 Apr 2026 19:55:00 +0100
Message-ID: <20260415185501.440492-5-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415185501.440492-1-delenetchior1@gmail.com>
References: <20260415185501.440492-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_wapi_ie(), rtw_get_sec_ie() and rtw_get_wps_ie() walk a
buffer of Information Elements using the TLV length field without
first verifying that the length byte itself is inside the buffer,
and without verifying that the element's declared length fits
inside the remaining buffer. Both conditions can be reached with
crafted input, causing reads past the end of the buffer.

An attacker within WiFi radio range can exploit this by sending
crafted beacon or probe-response frames carrying truncated or
oversized IEs. No authentication is required.

Ensure the length byte is inside the buffer (cnt + 1 < in_len)
and break out of the loop if the declared element length would
read past in_len.

Found by reviewing bounds checks in IE walkers.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v4: add Fixes: tag and Cc: stable (Dan Carpenter); carry Luka Gejak's
    Reviewed-by.
v3: rebased on staging-next; sent as numbered series with proper
    Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did not
    apply).

 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731dd471..e0fed3f42de0c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -582,9 +582,12 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		authmode = in_ie[cnt];
 
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
 		if (authmode == WLAN_EID_BSS_AC_ACCESS_DELAY &&
 		    (!memcmp(&in_ie[cnt + 6], wapi_oui1, 4) ||
 		     !memcmp(&in_ie[cnt + 6], wapi_oui2, 4))) {
@@ -615,9 +618,12 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 	cnt = (_TIMESTAMP_ + _BEACON_ITERVAL_ + _CAPABILITY_);
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		authmode = in_ie[cnt];
 
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
 		if ((authmode == WLAN_EID_VENDOR_SPECIFIC) &&
 		    (!memcmp(&in_ie[cnt + 2], &wpa_oui[0], 4))) {
 			if (wpa_ie)
@@ -658,9 +664,12 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 
 	cnt = 0;
 
-	while (cnt < in_len) {
+	while (cnt + 1 < in_len) {
 		eid = in_ie[cnt];
 
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
 		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
-- 
2.43.0

