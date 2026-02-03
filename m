Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024438F935
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 07:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770104299; cv=none; b=lrgbYwGIt/iBvTybAwYcY+9t95LfYblNCKD1BNhb1AtJEBE5ftTC/246sN4nvuWgNGFvVV+bvfU9Bh4Zy4W6LRJuz4/7r2ffr5NF8NK8RsraVgMYWxhWhQdYPD0EDgG9SHi4YrXUHQyFKKzoMP4eFo86pzCJcoz8qO/bmQPFcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770104299; c=relaxed/simple;
	bh=EuNsIZAZDJIiEUR+UVFXz0/7IV49tdQ0vLj8jcDYzHI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZKQ3i4/ygGYAqZkR34OvK9p1j6407S2WnvoI6U0wLBE6LQ0NAOq5U3LP9ZGzYvdUx/EoeBRprabVOCYHJYYBoYaLtYFzwonaP8qNHXYHoDohYjAOovYVwa4WJ/qIWbR1Zy+ruNIYENQyIKaNGLJsz+AUGHhZ3dCWPYqmUZEg9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR/lmIBo; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR/lmIBo"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4358e24d3c2so356698f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 23:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770104296; x=1770709096; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpdgeRL7F9zo0n1i2+iruTJGYYg1hxclEOCr/JSZKig=;
        b=CR/lmIBoRHcpp1+pq+4yKSxHMkPsUe/gOGOrq7W1jrHcj8cAkB5/NSK9hqGojghCrK
         yWNVDIUEiDWMSyjSWaR6sKGwI3oDxEJVtMMi8YHv4T5eBhhS3k6cFDBIzmD2LkHFNvvS
         bhc7Ufx1z8CysMrJMfyAp2vwuKBl62iOwnkameEQnbqqmaak6jpJhWp/vk69cyuZ5oCK
         zqbDeh0NLNm72bO4B1R7behtuhOsLel7v8CGgpCQ2CG1NW2IETQbB0nSJLJI/JtHHD67
         I9gjpqdCpM4MttBEZmobvZTC4ZJO5D9p1eywTHEp234VvStu5Wyf4KUk+vEo9+r31p19
         ePgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770104296; x=1770709096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpdgeRL7F9zo0n1i2+iruTJGYYg1hxclEOCr/JSZKig=;
        b=LUTzij11pfLSBR5wN7BAFC4XT7d/Mi/ddNJRg6gcbNBeP6WwMMCSsT2E8Nh5Lme98n
         HSq21rXDHIJlKZPE05d09ACXHABs7qocX3pfCVhWW4qEAHFIj5JAw8nvgRYejdPpaUu5
         giB4++9nSJKqOBuhDB4GEIQnVcTS/GytCjClnzwUAMeDjvw98I+YXGLcNzZjGiPDoWMb
         gNfP35j9TRjYVKUMU9Mxv5W5XeX/MDimkHGqkRM8pBMLQa+/CKEjZJcL30u6cFsGGxVw
         oYxwH4/Ru1Go5THFC2ynFwEusDhOvMYCrgpD1SxQAROAYQukgzlxWCWDMlqagGCRB0Jg
         iSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/lhcZyViqndvI8FYgLTL/xwbPctWtR8RvxH+mvs4yCfsrzj0tH2zpca6fHdNHjnf4VaXzzIvPyz45mO4Q@lists.linux.dev
X-Gm-Message-State: AOJu0YyDvc73M6Q/9UtRnlaTK6jmwtifdWgUy3BvGC7qbHOt125gZDBE
	Z0r7k9O0L7KaDxRyAI9iDgYx9yHydquPciAENVAdCHd6X0SVIDGY+Qo5ItWlrEgU
X-Gm-Gg: AZuq6aImVQpZ5cnkZ/iZXGN796P8guHIMWLTE649JbVxJkQjyenu+qSazXEfMVLIlC4
	QRsdodDYWsZwxMF1zHLHDTzvzWUIgMl740XDKfZu5fGfY8OzpuzqlD3XxT7y4ZqL1hMAt9njBqF
	DCIp36m/xSX53toCos139SVk9hLqiW/YSjzZBnOcQk3y35mi4Z/x5lzZb9+zHZJboBAsyoRkete
	x+ZK7w1xAwz5GHBS3HIBGww2wCooRRpCmVS+XhHh7wt8UbD2D7UCUoMvFTh2YYBOl7GP/+Mr1DM
	Z/fq6Ijy3DmFrU1pe1E/3m0rOXgP86NsfscsZIU6XikV5eOnodDdkzvVFkwSsA+s4S/vZS/pa8j
	M851uiStSDuf5oR8DTDdGOcwMtYYal0s3djF5Gu0B3inUU7OqL6i7V2eymLkUYu7moYPrIW1I2m
	H7RcOL/sPLLR4K5uKNHE3GVChRoelpMWpAp3EWVMTeYMLpI8BjFok=
X-Received: by 2002:a05:6000:4305:b0:432:dfea:1faf with SMTP id ffacd0b85a97d-435f3a745e6mr12908383f8f.1.1770104295993;
        Mon, 02 Feb 2026 23:38:15 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm49530496f8f.16.2026.02.02.23.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 23:38:15 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove Yoda conditions in rtw_get_cipher_info()
Date: Tue,  3 Feb 2026 11:35:18 +0400
Message-ID: <20260203073516.20175-3-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert comparisons from CONSTANT == variable to variable == CONSTANT
to follow modern kernel coding style and improve readability.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
Note: checkpatch reports line length and "spaces preferred around that
"+" warnings. These are pre-existing and I figured fixing them was
beyond the scope of this particular fix.
 
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88a6d..92b12a13d27c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1009,7 +1009,7 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 	pbuf = rtw_get_wpa_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 	if (pbuf && (wpa_ielen > 0)) {
-		if (_SUCCESS == rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+		if (rtw_parse_wpa_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 			pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 			pnetwork->bcn_info.group_cipher = group_cipher;
 			pnetwork->bcn_info.is_8021x = is8021x;
@@ -1019,7 +1019,7 @@ static int rtw_get_cipher_info(struct wlan_network *pnetwork)
 		pbuf = rtw_get_wpa2_ie(&pnetwork->network.ies[12], &wpa_ielen, pnetwork->network.ie_length-12);
 
 		if (pbuf && (wpa_ielen > 0)) {
-			if (_SUCCESS == rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x)) {
+			if (rtw_parse_wpa2_ie(pbuf, wpa_ielen+2, &group_cipher, &pairwise_cipher, &is8021x) == _SUCCESS) {
 				pnetwork->bcn_info.pairwise_cipher = pairwise_cipher;
 				pnetwork->bcn_info.group_cipher = group_cipher;
 				pnetwork->bcn_info.is_8021x = is8021x;
-- 
2.52.0

