Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B1223335
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952121; cv=none; b=eUngattpjlVIkY2U2UKZfAfT1IHNuTpx3VNK+cARICZAOdTed1sT5qsX8mESHFNSOBp9oiFm56ci4MKl+V/czSF292SVSaJAAh5ghOGwlHPsVWreHP2+5DHZqA5rYfk8bvMPVU3NezLNl+yDLA1U7SMnN2nN3F5wc63hS73iuzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952121; c=relaxed/simple;
	bh=VNfrpgpxpbyw8ERke3BpjHKuLSWG1u6qfMBqfz4ZVu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PiAYoNmKmG8a616fAdkb0twJBbaPDY25LIfhWNaCneZlxq+gK5hI/3D7b45bAh3wE7SwmIR59sIIsgCfEmYMS+54fkjHKV1Bb/K2SztE1sQGU/doXymEv5ygSYV8XxSD57VvTCB13NhdIskntQ7bU5S17cY231mxQRGy5aK02u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ra377AcN; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra377AcN"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-72374d6a6caso6107696d6.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952117; x=1757556917; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYBVwg0qNAIsIE/fwzqPoC8Ske/D+V21MDnSh+sC2qg=;
        b=Ra377AcNhO1kiIDzxtvAR7mAjbycrU9aiuAVQmb/x76Fmx1P3OkmXU3aTbPZQfdDV1
         SH5Nrv+PfoLeZy2Pmzw51/cjeeUsmdR2yL1+FM/n/QUf4v5EN4C8m7FasHJekKAACwFF
         wR0d5zTovS/ike1us85bAa9nXexo0eGj3D+BShsN85724tmMWrNXIvHZ2qqkLa3UkpXf
         OG2Lc44RrbhKMJaYFAGkVJhTVF3gt1tjpQsmbIaYh3xSfDBGvwFOb1B2MLkURf9WQQlV
         cyLrmGS3ktRLrL0Hx5S9uhm80+2VB94fENP9MGsXqfWee5CQ2aPMP9IZCZwchzEtmyv6
         m/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952117; x=1757556917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYBVwg0qNAIsIE/fwzqPoC8Ske/D+V21MDnSh+sC2qg=;
        b=TErfaiIdcL4r99hYheZ9zj2FOO5u7wpKvy2bp5odc26UvF/o6tJJrC4jUzBm3Pomi3
         0V3Mj0uC2OTJdZKo8WqFxI8uZMvs/fRsiHnTl+/W2E5ITDDBEVS7c99mOG9Vmv9OWy6/
         US1W2coQp1IyZoIKFrG9iXKBfRzwIeHeb3EbXuWSwUYePaq+zf6efSy+gvxTBTpR9xje
         OeIIy0o08ANQNwGt4htEEneQWej+/4G3P/cNFOXf7pFP/BXPXHu8O3lqfGdthrI/zDVa
         JY37P6mhMbk2ksQ+g8QzpILBXeJEc1CpAjWWoVyOnXbBWmSYQvc5qarD0DRlFgFEaK0i
         Uuyg==
X-Gm-Message-State: AOJu0YzpVISth0MZEWuXe6tMsAMs2qtedDeWAT+rV+FZ0pmqGp1zjB13
	9YUX9AzQ8GMR+IYLPWMZp1XguBdtZGCMFCMmLOiiK5oGgSXJaiieyHLk
X-Gm-Gg: ASbGncsBwvUlPddIPMq3dtRLOPaJssjO3G4idch62jj6CqRnY6ozLkJEpH4P5EmRtIv
	fnuDCGy/D7bF6cwNx/2Gr37mB6f+0C+MiY45PAxNjNflEe8Ds0o+omYZSpvysP+b9zFd5uax4Ks
	lpJSZOfYP9sxXO8UPv0wA1/xckNZajwSuE9cM+DBoD6+iVSos3j/6zVsXg9+MeZqz23JohKPnZ0
	eWmfkI9LWNYpWZe8wiH66QWPpHWjBExbOJWgfje3idZT/P6kWPVSjdBmqlbbhSfK4N3HbpLsgAU
	SMWaRDyRblJNejKMt0DH2CBobd0nvaa0sfguK/T1kdROWq0O47jbCVE40Lv9MVwXwyIbRrZMAcZ
	YbhpevxZXwsHPrIaCITPwv5d2AvBJHQvfwkaRjmjOsnsR3H59EhM=
X-Google-Smtp-Source: AGHT+IENMrBTynZbyGyfB8q+/58Eg0BHsH4+RQH1e3wRvk32JEjJHIa0gL4gEN1SYR8DTi/CwrZA5Q==
X-Received: by 2002:a05:6214:3d89:b0:710:2cc7:83ea with SMTP id 6a1803df08f44-7102cc78feamr216822476d6.32.1756952116936;
        Wed, 03 Sep 2025 19:15:16 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:16 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 12/16] staging: rtl8723bs: remove unnecessary braces for single statement blocks
Date: Thu,  4 Sep 2025 02:14:44 +0000
Message-Id: <20250904021448.216461-13-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop braces around conditional blocks that contain only a single
statement, as required by kernel coding style. This enhances clarity
and reduces visual clutter.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ef9057456768..27be46c11b65 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -514,9 +514,8 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			break;
 		}
 
-		if (rtw_roam_flags(adapter)) {
+		if (rtw_roam_flags(adapter))
 			/* TODO: don't select network in the same ess as oldest if it's new enough*/
-		}
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
@@ -2546,9 +2545,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 	len = 0;
 	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len,
 		       ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
+	if (p && len > 0)
 		/* todo: */
-	}
 
 	if ((pregistrypriv->bw_mode & 0x0f) > 0)
 		cbw40_enable = 1;
-- 
2.39.5

