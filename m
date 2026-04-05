Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A02E2663
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 10:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384262; cv=none; b=Vad8sZUi7Yheb74EU7ToEKua0QXqcUAPvUsRWwZk9xPS0ggi7rCWFX/XVY32tpOpUEOBgTbtnzC/iq6heKRp8z7XgK7o6Y+OEVcVP7b7Ae1kMb1P89bxYM5R0pc/ffBdxnDryGseuk7AHT1FZAip7bUkNAjFxSy3lTwEzBF+kIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384262; c=relaxed/simple;
	bh=yfx6lPvgGD1BjXJbwxifAAQq3rRl0uxOfdzToGyIlaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvl0mVOliRwUJBOfGdm5fRu2B1SSVNmwfSkpBw/FKgpBohZbHUEQx30N7mUjMykGXaDDptf1P8e0/UjzofnsYQdyGmQxS5kkMTgfF0XKD672s/ateQMpce22b/jN50xKlsJ4xge1h64/XtZy7zQHS3GeexNzM0OATws56SiFVoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPUkvKOI; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPUkvKOI"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56db63456d4so497788e0c.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 03:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775384260; x=1775989060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iC79OkyMhpMLObAOX6AAjV7rcE6Oha7GoNELSHflFk4=;
        b=RPUkvKOIO+fJQNyThEahaaoHU1Gfaipptmz8Msv4GU5tT1Vsiq7R1C2mxXvqw1wVsj
         7s5FRddY09Tfpf5Ye4eQNvRGDBa0UHyuGjQOi8i+HIhevtSwtOHsoaIJ3xbloYEtr3hg
         3JffjxXn7p5a+MCRGQiu5+NVm98oIvgpXjOgTZE73Vpl6HebZujdDIN7/vQGhRvNf8ju
         NFKiin/gLULyaPdhS+QW48rRecwuFbwTFFhbJMVdNpvQAb3ycMuQOVKkqBD5HWIG8UZw
         PSx62WkvfuhYBZq5wdb3Z1g34n0solklhW93wLSd2uAAO8SneYTdJFtKNwmouwOTtolQ
         ioBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384260; x=1775989060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iC79OkyMhpMLObAOX6AAjV7rcE6Oha7GoNELSHflFk4=;
        b=S5MwXX+Vju3pz78b7W5OA2VxW20cbI8aiuFTZZKHJSrgniaRaPR/YBWXonMKASrkun
         /BQVWdai0C190gMEeF3mHyfB2QF+rGCTwvSKcQRf3I3zYHnhcRfw5tnaFTMVjO04h0EY
         vVJQWeDctsu98UoQGAosbPsEUE3pX0DJEuytfMMiMENi1KNMz+YQQUp+2k49O3BG0oQt
         vIy2pm6vMGziPXwh1XE0A4ozzh5tPGi9KBbmUwBez7u5xZcqvRvkNPjwc7XHSPU512vI
         Y4/OWJPhuLwptg6XQi8gyJ1flHaD1MoX6JV2ze8qdE9nq4urxQn04jqMGQkfhve7WF1G
         MACQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkPfmk8oL0fNAp8SlMvLoJo+VvaSaUlkrsVgoBRPRz5XtRWLTvedrPtKxbiMZDo7dARStyo3TEFgX5aFFA@lists.linux.dev
X-Gm-Message-State: AOJu0YytvxCcaxqGceFF+bliH9kgiowMbn9HBJAWUsYyPuEgLTMBK8Qe
	HkaI8RUdLcZxLtr4VZ3tyB3vR6HcH80S+P6KigcIAxjBtdFAOI+DPNKy
X-Gm-Gg: AeBDiesk1deJNbA6IJ6/uJEUUAIzppneJUq+okOX6IGeQiPi0UXfIGsbbHTgXV85w/6
	8bTkQF+jfdd9/NTI+LFk6/44QrXkebaX7T3N8KOpvabEvDonxVNjaW2gAuDXihmqnKYBfGfLUzt
	WU2ZgLsKTvgrjYpRwa4U9uVXM4m+p/KXpHxDlPz6UTrXgPxZOgfVYvTy8a8TmaTP3FaV2r40u/n
	jkx5RgiryEviVX6XvIg89lTFMTGqCIsALdXg6D5Gqs1455sqHGIOYs5RF8wg38Pa6elDwszqAjm
	W91aMrcel7ODOVARspAWDhCC83g2racx2f6/Q+OtQRCAJYMz7jlegrRxJP77h/PsAdAuUEWxdp1
	nEgErIBNb8HyWhpsGgIqTB+pAyGUCZ8ku40ir9YFLaXdoIFBDMbdmgh+HRLLEzSOcFOADm1OqaM
	/xpoIlejWqz5Pg/YSp9RXi34yx4sonCVXMBKZ5laL/
X-Received: by 2002:a05:6102:9d7:b0:5ff:ba2d:17a6 with SMTP id ada2fe7eead31-605a48923f3mr2888675137.0.1775384260395;
        Sun, 05 Apr 2026 03:17:40 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm10473385241.7.2026.04.05.03.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 03:17:39 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Sam Daly <sam@samdaly.ie>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v3 4/5] staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
Date: Sun,  5 Apr 2026 11:15:47 +0100
Message-ID: <20260405101548.124829-5-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405101548.124829-1-delenetchior1@gmail.com>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IE parsing loops in rtw_get_wapi_ie(), rtw_get_sec_ie(), and
rtw_get_wps_ie() check only that the element ID byte is within bounds
(cnt < in_len), but then immediately access the length byte at
in_ie[cnt+1] and data bytes at in_ie[cnt+2] and beyond without
verifying that these offsets are within the buffer.

A malicious access point can send beacon or probe response frames with
truncated Information Elements, triggering out-of-bounds reads on
kernel heap memory. No authentication is required.

Add two bounds checks to each function:
 - Ensure at least 2 bytes remain for the IE header (cnt + 1 < in_len)
 - Validate the full IE fits in the buffer before accessing its data
   (cnt + 2 + ie_len <= in_len)

Found by reviewing memory operations in the driver.
Not tested on hardware.

Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v3:
 - Rebased on staging-next
 - Sent as numbered series with proper Cc from get_maintainer.pl
v2:
 - Rebased on staging-next (v1 did not apply due to code reformatting)

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

