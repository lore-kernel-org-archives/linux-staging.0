Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FB65733E
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 18:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400917; cv=none; b=ZvJ8xDNZt3Qjr1zz++bgJL+5c+0kbZQkZiYfFGJ50pF9TzOoJ94tq/v/ygvritSxwHMxGznoOPV80LKZLpO8jLe3jD7ZIgZqJRRmvSm6T+xEqOkg02Cbd0hkjt8FyOXR3Q0WMdQAizzRUfLuHflRst2JyAWQVGbltDFC7Hm70Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400917; c=relaxed/simple;
	bh=MMU5B/GSFrKeMMnz7n6SPGe1UFSUE/LdaDBaAFkUHxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LimPLQf/fIuygi2EHXLjBGYUPTmSsbPbU+HrN/aXG2Qb4MwHdl1nLEthdr34cX7C4D1/fdKtqTtQ9111lzdty6KbnabSAG2KtVhG9V7azMxHLF0fiUjlkuvEUeb+L9uWn96ABb8teml7VR+iELkmid5oVoL75q65bkvutvYoXEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwchHCfD; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwchHCfD"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c169ae1cb26so446938866b.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 11:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784400914; x=1785005714; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Vek9VNoLIBJqK+DxbiXTlmLiZQWFsJV5wa/eMhmj0g=;
        b=pwchHCfDzLsuMJxowt6tImCVBiu2Cgw4+/9VKWRJgouIwUHXCEBttDCAfvuzGuxkSu
         sTfEc/R5W2b+CF22p4V4K03nWJFuSmUTXPksODvJ9x1MNo5XhjNwhkkLFD5dR8Ds5Xg9
         9lHV40cd97z+bySy7GEkr4pOF4pBcjQmGaD9A5wQep8khlZ+zUYpTgFMbGDpv8lYFrcq
         ptYZMhMr2zD1UJrFWn4HagnNwuYqa/AV6odWCTw5NTCRnu2L51J00FdTXVzcwqZ8ot5o
         GdJpSl/nByzDkJcUoiRh4bysbJIWSTqmXCj5xGR3ay1+VGGoNUhT7nX5h+RSdRWlAo6R
         nugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784400914; x=1785005714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Vek9VNoLIBJqK+DxbiXTlmLiZQWFsJV5wa/eMhmj0g=;
        b=ZYVEzHxLJgw1YgQNDUbAxgSED8bMrmh6l5n1yZkLfcrfKc4ny949FLb/cYwAFmf1M8
         +wWMN916G0lEiPq/Qn8m3SI6X8O1J/c4UMc49keZZccuONP2tRZi6WNYGUEBwrXM3+PT
         LTPBk0lpTfVEw96z7hMbbUYmk+hIR+dawVXaHPt+UIu74LEdy71Rg13kHKxv8cAtxmKI
         IbMd7WvrnyZPRzVf3UD91tSR6srMuwCYe3IDLVD+uOYWFvvWQCX2lpcrVIoUGg9SjoAB
         zaPa+0OUmP5ucgOxdgBP+p7JLMBQYuCVt4UapC/Hd68Wr3oCSPoLdyrIgFL5pbkU3DVT
         fTqg==
X-Gm-Message-State: AOJu0Yz84DSWSOLQ12HAt6313PAasaaK6I9ttfsMR1qhERe7LS4afFC0
	12iSh+jDyiesUyEt+hQ86NCpq7i5GVoV5NOAkNuY28vJsUxWxk/ZZPwo
X-Gm-Gg: AfdE7cnncuY0WsYrls/q5qvkOEwwW51rJtt5Fyg6pEIppzPVrNocA6ztdTBT6OWzl85
	20BW/qSibCg7cNkOG5lSNXSNR3frjL6Ls1Je0ENmN0i0lMB0dbrjXIormDmxbpVAwqXfX5637/H
	tN+LCcACLMmxT7xu0eCIsmsOT/sRrG/2KqqGgumN2pHG/9ZD6rTEh6jDirrUwL8WtcQbnXWufw6
	siQPQ562F77UwDp/SKBLcBEUCPubznKl6LPflaMkNH71CTCuoME15XBk6BoFkkdSkz1qHV5PJMq
	nHGlbknWjkekoeNKY4mfzOVaPdkIwWa8SRhm1bdadSKfZsA/Iqz2pmbGLh58xczak4H77LMxw4u
	FxFOa+EwTucwvzBkgkMp6Q0/foFnqUevBfogs9rz671PYn32/ipVZNghUzEFcmt6yPMAF3WRWwF
	75e2VGn/cahOzpnoEwnnP9iAa3F6ff17TF2QSvtE5SCeKDhhUYmYrZy+U=
X-Received: by 2002:a17:907:1903:b0:c15:a7b9:2ae1 with SMTP id a640c23a62f3a-c16b40031acmr390800166b.6.1784400913719;
        Sat, 18 Jul 2026 11:55:13 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm249151866b.32.2026.07.18.11.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:55:13 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 1/5] staging: rtl8723bs: fix OOB read in rtw_get_wps_ie()
Date: Sat, 18 Jul 2026 23:54:41 +0500
Message-ID: <20260718185445.63070-2-meatuni001@gmail.com>
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

rtw_get_wps_ie() walks a series of information elements taken
directly from received/associated wireless management frames
(beacons, probe responses, scan results). The loop condition only
checks "cnt < in_len" before reading in_ie[cnt + 1] (the IE length
byte) and before a 4-byte memcmp() at &in_ie[cnt + 2], with no check
that those offsets are actually within in_len.

A malicious or malformed IE blob (e.g. a truncated vendor-specific
IE placed near the end of the buffer) can therefore make this
function read past the end of in_ie by up to several bytes, both in
the loop condition path and via memcpy(wps_ie, &in_ie[cnt],
in_ie[cnt + 1] + 2) when a spurious match occurs.

The sibling helpers rtw_get_sec_ie() and rtw_get_wapi_ie() in this
same file already perform the equivalent "cnt + 2 > in_len" /
"cnt + 2 + in_ie[cnt + 1] > in_len" checks, added to those two
functions by commit 1463ca3ec660 ("staging: rtl8723bs: fix OOB reads
in rtw_get_sec_ie(), rtw_get_wapi_ie(), and rtw_get_wps_attr()").
rtw_get_wps_ie() was simply never brought in line with them. Add the
same checks here, plus a length check before the 4-byte OUI memcmp.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 54f805a6b5ce..2fb5863dbeef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -668,9 +668,15 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
 	cnt = 0;
 
 	while (cnt < in_len) {
+		if (cnt + 2 > in_len)
+			break;
+		if (cnt + 2 + in_ie[cnt + 1] > in_len)
+			break;
+
 		eid = in_ie[cnt];
 
-		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
+		if ((eid == WLAN_EID_VENDOR_SPECIFIC) && (in_ie[cnt + 1] >= 4) &&
+		    (!memcmp(&in_ie[cnt + 2], wps_oui, 4))) {
 			wpsie_ptr = &in_ie[cnt];
 
 			if (wps_ie)
-- 
2.55.0

