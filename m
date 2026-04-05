Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245511427A
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 00:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775347246; cv=none; b=j1oYq4Y64Rk8bpmH5usYPUJPQkt7OSFS7NGvenS3sg+C8uzhd9XAcKGUDfyb8t/XErel7bn0nu0gcsXwb56l/qXoy9Tsu8+RWuXauZrjI2+Q0dWpqTZcBH54tISAXiJjHI5DgaG9uuFDgio1G7t+8QlVDWeFwuvdQr40g9fTNgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775347246; c=relaxed/simple;
	bh=MFYXzeV+MYNpZTCQHYFr09VgVSxe+OjOWjIuHtJ6XNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkvOHiOOER/LGeXDSH/RD//qaNAkmBVQsP9uGkXY/chv8Dw0P7u5QYFkaiCuCYa8jJgBGeenmsjco5UUVCSW483oHaw1VndW5oD0k+2Gmw56CixUzVJHvt2omBIV6XELeiu3tduVrrRCmqXVjC8Tf9U57D7zy4SxuwZBy9QafNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atdkq1FR; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atdkq1FR"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-953a2634777so873768241.3
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 17:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775347244; x=1775952044; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbKn6m9xcag5finRPB+a0t10FFieWhhuTYJnUAMc/5Y=;
        b=atdkq1FRzd0cDHQPXqwXeGS4i3Z/WAN5UwXBFffpMUClHctxMSkfAhtRHJA6RJvN5H
         rpOAVouUTGLO6Sx+7JewAnlU5UdQKe4Ho8N6cag1nXTBu18R9CGjxNUB5DOxNiMDW+gu
         pKjPfJTrUSX9xu4Tg3RxKOMnKUFSy+dLESUIVF0as64nOJnSIOCfzbUovofnAwUALr7N
         jtN2LlDgvYGNmrJnhVDA5cyFcGMH2A1IlPxG1H9RDXJuAzV1nuVgkHIFNb/HY4X42dxU
         4/O61r+C/3kF85qzLgAyYF9IU0P8pPnsUZxrUnlt9v2Eg5MP7SabXfMzOeB+RQ8e+c+J
         eTwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775347244; x=1775952044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zbKn6m9xcag5finRPB+a0t10FFieWhhuTYJnUAMc/5Y=;
        b=p2xE+vBFIf0TrFZKEmosqWnnMZEn8t2j6buV04+Btx0k8+EuZ9GhPmqWKmD+eH6kT+
         3xu/OH4oIiYQozoKh47KesPjpDGzKgjEH/nU4/wHGrx/0Y6ZSa7AKdzzN1J3Xs2QjOfI
         dwo/EAfWwVjtgmAi/39dTBaXWF1YF/6B6YhJdwshJ/BCljtgnXYPjSQdV/3nf03f3hjB
         GP8vRb1nAzg+S9FLixubsEb3AuUIfqCLSbZxlAPufVyB8OKGgw2tbRlt4laujnPRC837
         /jQqncz3ifpt7k6m4mn1OWo+8i1l+HGCQ22SZOargwNmvRfqBCg1UowRdWXw4ubsOty6
         kngw==
X-Gm-Message-State: AOJu0Yw+4Mw3NB1EQkW+hcWhbwgRQ56po5wTYSBGUB1UDDNSsUxAitof
	+IRhMYNDdRlpZZ0TZGoGweq+K49yhNSiFpB4mCM+xLdq0J36qK80rkfo
X-Gm-Gg: AeBDieshtwnSRB6uslpMV206tS5TOrVTabqzzgfHKsZrmiF/E9FtuCrBnQ2cLgPTpNO
	ib9muUCohNOKc0FUoKXxwtHf2b9LwB8piCSPSTbX3BsuszHHAQYoxRN4mf1gboAvsSTVGsbARIi
	lNKXI/ye+4244+Qcww9dB4TxWb5H7bi6tLJhGYa1yEgnMtz94Mhi+e81+w79OaaM0vrYJXBpeQ7
	9VSjH1Pwp5rF2dIe5TYjjdKMwYbGBFBjBIhaX3+HSgg7TqMcf2d2RUQnw3KaxSC0/MWb/xB1cwj
	/B9ycIg9N4LOtrKlVE0E/z8vFr7YqBRdiFwVDH/2xPxOKPJUO5j7w5IITbu2HgwKtrT6hsgbLAw
	ztyAdNE8XDYJzYE3kbABnbvRodl4AqWYW7kZSP0tKZlPifIskpzUWJSgFrkgpDjU6KO+eg1eXAB
	Ervy1DrduKRIQG8T9gyIRri3xZpja9A3XY0daXwCW1
X-Received: by 2002:a05:6102:689a:b0:5f9:39e9:3562 with SMTP id ada2fe7eead31-605a4dd9a49mr2482596137.2.1775347243859;
        Sat, 04 Apr 2026 17:00:43 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60582e1214esm11671585137.3.2026.04.04.17.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 17:00:43 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix out-of-bounds reads in IE parsing functions
Date: Sun,  5 Apr 2026 01:00:24 +0100
Message-ID: <20260405000024.73568-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404222100.57946-1-delenetchior1@gmail.com>
References: <20260404222100.57946-1-delenetchior1@gmail.com>
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

Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 72b7f731d..e0fed3f42 100644
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

