Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5815402439
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 08:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500233; cv=none; b=Dncmu5Njg2x8dNipq16ry2hn6pxv8oDuvHw9mReZCh6opg29ML+blH10kCS2afOuggZ4Ddgwwv9qhXkyDxhUaDtFPMazwNDmNcd7aPKY/heqUQTgC3AfZE3UALf8OPMKfnJQGXwu/0cZsjGmHVpcEuGi4klm0+5zd/pD1uQ5V5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500233; c=relaxed/simple;
	bh=coXAOqh54O06cdwsWZhAVX1eDRPqTpuYjLzzbMpMqEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gb2f6utu1QS3w1GIUsYZWDjxod2Pgidk6rrtNoQpUVIh8RvBi89oYowleqRRUT/ULSFyGUBwUHAZ7PFj8mrOcGy2nXRL43hvKCzlDS5OXNpNHuRfaMr92bi05zVvd739TBzZ+pNs6+9zuEtA9xTFNNKaTntij6bozRwmI/dYXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFbRRtke; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFbRRtke"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso2985035e9.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 01:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783500229; x=1784105029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b4UxBahBQcan7ix1kOENgrscU0vnxasAiMKDV3UuEs4=;
        b=FFbRRtkeggxZj1W3hG+blKB7cM65BagJ2z4nlzqsWhG+aDZs2cfQ2g8rPbYVVBIsbO
         R1pdOJ/sXK0XnUmEZTWunSBOSLe8eIcDw1CxSa2G7hSaauWMbjaYHYDhfQ6xsyG1y0eW
         MsUPGTfzAO/xtZMyoYHeqi/on18tnOXIE13QxvTklIF+GsaT3foLxxHeZJT6J3LKsuw2
         8+LtOTF23KsqoC6yQQ4SUeiRCikdkYnbn7V0/uyuGLXWUbhu9B9KKQx055NaI93b2Qhn
         ZGRhCGZItbjwoOAbwS/OSNLBOl6KUf3uyZB8N7cJ01pJOuP5gRW3exA+jTnQ0cak/CE4
         JmLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783500229; x=1784105029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b4UxBahBQcan7ix1kOENgrscU0vnxasAiMKDV3UuEs4=;
        b=JTbCH6ezQU0GG+3R2ewubDJxfrHu7czGWg+Xbmx9xQpMk5+08lOWTNCvs+Q1qdSuBz
         +t0kjh45wor3L8+acbmez9WAOwGsYXNHZhXhGLm9MsmqvgQhu5qrRk7upKwcRnODccbW
         iL+MFYkYn1vxCya1sSrU+YOXxn8NEgVNSAKYjB+ycMLqzkrYVDhNk2esSqzz1W/TiHp0
         Va6B0pLcTZvonCiRu8wEAOIKV8NadEHHfO3P5rlv0R2eo0wwdGQD5S9sKnJ8ciPP+MrI
         Ct18RK94HpMoWpBcUXHc9nHIj88jSIRk5DO+bwIXwd9LVwiDe/J8GKV9wzEzICzcrTrz
         C7Ow==
X-Gm-Message-State: AOJu0YyPiSRrLoK80mil/LN2N9TLjX9ywiXbSybaxrj+0EGs7tJ8/ZvD
	93+kI290YJSzw9x72feYRD0scK0Wmc0VA+2EJSgHofM6RtCB8/aJvEsa
X-Gm-Gg: AfdE7ckC5O65z4VXCRcNl9Un0hKDHFllLqd5XNKDswxQzPgP11kHxQipasJj2ntbXLS
	rPDOA214QXCdUhu4E9XY1WpJu0/DAkPSCVw+I8l4jeGOeGk78fMoXnD6Wgk6oRecpE31GUtW3Fg
	MPiztXffYnqQmpaN42axJ3cTYz0M23h+fLwAjDdXhexvamoYlvGzJl/X3rreXCzBvo8kCWmUsDz
	GFz4JZQbjmPjIaQSrpuI2Og1xq5hDaMkupfcct5N5dRLqFXFbKOCUBnsf1mUYnH2MAaUdrM3FU8
	medQ06e76Rx04BYMTQ+AXUPeQ6+HbFeDkzUt1CP5lwALSnw84MR6LmD1EA1SwtzdjgBxFCwuypr
	M4hXX+sdBIl7nm9L3G2JcUhome3SrLnJyf33mSTbq24NftQs4L83MthnltnKxNJRRw7+fzn0eTJ
	2P6N2ffPbKw6rU/TP0+wR9wKtXbjALFa5AzhGa6AwLqJidlCFRV4vg
X-Received: by 2002:a05:600c:871a:b0:493:bc4a:e7d3 with SMTP id 5b1f17b1804b1-493e68f14a9mr13221615e9.39.1783500228871;
        Wed, 08 Jul 2026 01:43:48 -0700 (PDT)
Received: from fedora ([2a02:586:e223:fc00:8acb:cd0c:11d0:f2d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm41581979f8f.3.2026.07.08.01.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 01:43:48 -0700 (PDT)
From: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix missing shared-key auth challenge length check
Date: Wed,  8 Jul 2026 11:43:42 +0300
Message-ID: <20260708084342.136878-1-npetrakopoulos2003@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WEP shared-key authentication handlers use the challenge-text
element's attacker-controlled length without checking it against the
fixed 128-byte chg_txt buffer.

In OnAuthClient() the length from rtw_get_ie() - up to 255 - is used
to perform memcpy() into the 128-byte pmlmeinfo->chg_txt, so a
malicious AP sending a malformed WLAN_EID_CHALLENGE element can
overflow/underfill chg_txt by up to 127 bytes. It is reachable over the
air, before association, during shared-key authentication. In the case
of an overflow, the driver can write out of bounds. In the case of an
underfill, the driver can echo stale buffer memory. In OnAuth() a
similar issue is observed. The driver compares a full 128 bytes
regardless of the element's length, reading past a shorter element.

The challenge text is defined to be exactly 128 octets, which is
already provided as the WLAN_AUTH_CHALLENGE_LEN define; require the
element to be exactly that length in both handlers.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Panagiotis Petrakopoulos <npetrakopoulos2003@gmail.com>
---
Compile-tested only; I do not have RTL8723BS hardware to test the
shared-key authentication path at runtime. The change only rejects
challenge elements whose length differs from the spec-mandated 128
bytes, so conforming peers are unaffected.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..13634d4e83d1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -787,7 +787,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
 					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
-			if (!p || ie_len <= 0) {
+			if (!p || ie_len != WLAN_AUTH_CHALLENGE_LEN) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
 				goto auth_fail;
 			}
@@ -873,7 +873,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
-			if (!p)
+			if (!p || len != WLAN_AUTH_CHALLENGE_LEN)
 				goto authclnt_fail;
 
 			memcpy(pmlmeinfo->chg_txt, p + 2, len);
-- 
2.55.0

