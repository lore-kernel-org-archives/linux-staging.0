Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847B027727
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 02:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781835789; cv=none; b=kiJxFRWR+Uvwmqb10YGdAG8fRRpvUKnjoYjUehBW+S8q7gi/HlfesGuowQooYnz4Zi/7JAkO21PrShw1ZazZC6UbdC3hYt9c25EcTVFflfcdd+3mjPjSCCxojovh8vtj7mSVywHJ6djIP0RsDOcdpztkzGfDlm277fCjdM21dbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781835789; c=relaxed/simple;
	bh=WlFyrUoPly4po1Npw/DcQb5m4Nzzry8Hd4sYo+0bJKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C7GS4mQ6w8B8Uv0+qReyq1iBWBuPsIH3He0c4tpys17lH9XrADPGEx3XjG6Fx6AUSusMvHuCHE5BCUVoMeRl/wx5wwVt4zmtOFrdy+H6qg/YaYji4CH0GptiwOnngiROybctLqE8CvhL+YopzmyziqAJESks35GX0KNCP8O7ZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDFuYVNJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDFuYVNJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36dac5d5da0so724705a91.2
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 19:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781835788; x=1782440588; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=885ZheLC3ilm/H/MdoKXpWbM++l5bgQeNVRWdR2KltQ=;
        b=cDFuYVNJ4hCI9nEuP+q0n0F/dyGiqwoDVQFBfVCIGF/Q6WQx2JSK9yp/alIyxZq9uJ
         wMOzKa8rm12R25u+Pa+kbX5ImiEbRq4GAOS2tC2PE/8ERBeWv4Cr9eRKC6bxB30b4DfF
         qL9LJpShx/3CARwckAifziwQDNw5tPuEUHQk3Y2wknZgyHiFpAG5gqoeY7bOsAYVuVdv
         gADwneNlw9igGASxunx0OYwLo1xQJDQ3mwBSUDZMJi3y0+0w87tgfcWaSnfA+9tP2H+D
         6NcK9wSjbgTNBhGh5NtzRKEjJ58+tIP2eIrnXGDZQzpfuIivctuzUOpf3FcY27JSDdgX
         6VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781835788; x=1782440588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=885ZheLC3ilm/H/MdoKXpWbM++l5bgQeNVRWdR2KltQ=;
        b=WXPvOd8FPDvwmWwK7UuHDfW2D42rsZAfhElIc5M4deoiBX/SSVKxwKxaisqmB5GJWH
         WicAsxaNAGD5cftCjo8/zeKeXiyWp9hhbKiFxc6qXa5oJOos96+D1rELSxcTs/YYEHpI
         QJpNyfOHJaEnAXgJNcas5l+KkgV3wgpICaWFOsxtVqpnQzQI+UAQCjmtxuV9WNWWO2Ae
         fwK/B5CwLHfZ3HhZ3b6ZeBHZeTHyHkyVE4OmydXMOht1ZR7hBNAKl3hrd5p35HrK+00h
         /C0V8ZHoF2kfbvSXlHCy0DwTUSTz8lTrGbRusbePyWRI7htDvr/scqij5DNnZIN4nf/I
         cIfQ==
X-Gm-Message-State: AOJu0Yz86kkNHOwGzhuRpQBA+6F9wayhclj2ag/1HGTnPMRFHsfKyE+j
	B6w9CEySfG2IOPMTolK8VkUBb9ZTNMYQZ6ivQHWr8FPVjAmOmcyQzNta
X-Gm-Gg: AfdE7cnl9JGGjZ+b3FoQtRj8EBgeX+0rthQyDQaZJ9NoioCsqgDoFptVUfGCIir5nsh
	xDF2rTihr4jdSOoRV4gH7I9dyvBivf3rr227ZLFRAVdCC8AhjcLtsDyDoBiige2IzYZBOAqxXAx
	gTTQAcH0mpkKOOUCK6StLgaEpgHZXpe0IZ+AL/WnBKQvEOHSUu9VRnnkJ3u+03XvCe6tdUuOaWh
	z4xVwzDYFv32wC4wnBtI7D1gpF7sZfGHdkO4NUNEzUL1Rhzz9W7NlzYAqAlFNwNQAdimF2J+/gu
	/WBkVaCu/4ZaEdgbhla8gQ9Tibe7C3mqhtD58G9w3C5IHFHwMrTcIsYrttKRF/ZwMbTeq55XjCC
	72NZh/QpH/qwkezK7JZUm7ayf4HTGZDqLDDlDkxmh1JJycSKP3kEytafi0rNhnvU9PUtV5hP4iD
	fGCNYgJ9zyUeQyk3wqSVYZbKvvB2osScXcf2icz1VMrpNbgoCfD5AZxuU5NbnN8/cbEe26
X-Received: by 2002:a17:90b:568d:b0:36b:71e6:3de3 with SMTP id 98e67ed59e1d1-37d160bd31cmr1842339a91.3.1781835787755;
        Thu, 18 Jun 2026 19:23:07 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([2401:4900:c0b0:86df:f75a:8ee6:3dae:31fa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8a888e219fsm768539a12.21.2026.06.18.19.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 19:23:07 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: Replace bare 'uint' with 'unsigned int' in rtw_ap.c
Date: Fri, 19 Jun 2026 02:22:10 +0000
Message-Id: <20260619022210.143940-4-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619022210.143940-1-mokshpanicker.7@gmail.com>
References: <20260619022210.143940-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace bare use of 'uint' with 'unsigned int' in multiple functions
in rtw_ap.c. This fixes the following checkpatch.pl warning:

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411..d4aca0c0c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -60,7 +60,7 @@ static void update_BCNTIM(struct adapter *padapter)
 	/* update TIM IE */
 	u8 *p, *dst_ie, *premainder_ie = NULL, *pbackup_remainder_ie = NULL;
 	__le16 tim_bitmap_le;
-	uint offset, tmp_len, tim_ielen, tim_ie_offset, remainder_ielen;
+	unsigned int offset, tmp_len, tim_ielen, tim_ie_offset, remainder_ielen;
 
 	tim_bitmap_le = cpu_to_le16(pstapriv->tim_bitmap);
 
@@ -156,7 +156,7 @@ static void update_BCNTIM(struct adapter *padapter)
 		kfree(pbackup_remainder_ie);
 	}
 
-	offset =  (uint)(dst_ie - pie);
+	offset =  (unsigned int)(dst_ie - pie);
 	pnetwork_mlmeext->ie_length = offset + remainder_ielen;
 }
 
@@ -801,7 +801,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	u8 *pHT_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
-	uint ie_len = 0;
+	unsigned int ie_len = 0;
 	int group_cipher, pairwise_cipher;
 	u8 channel, network_type, support_rate[NDIS_802_11_LENGTH_RATES_EX];
 	int support_rate_num = 0;
@@ -1408,7 +1408,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	u8 *premainder_ie;
 	u8 *pbackup_remainder_ie = NULL;
 
-	uint wps_ielen = 0, wps_offset, remainder_ielen;
+	unsigned int wps_ielen = 0, wps_offset, remainder_ielen;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -1428,7 +1428,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	if (!pwps_ie_src)
 		return;
 
-	wps_offset = (uint)(pwps_ie - ie);
+	wps_offset = (unsigned int)(pwps_ie - ie);
 
 	premainder_ie = pwps_ie + wps_ielen;
 
@@ -1437,7 +1437,7 @@ static void update_bcn_wps_ie(struct adapter *padapter)
 	if (remainder_ielen)
 		pbackup_remainder_ie = kmemdup(premainder_ie, remainder_ielen, GFP_ATOMIC);
 
-	wps_ielen = (uint)pwps_ie_src[1];/* to get ie data len */
+	wps_ielen = (unsigned int)pwps_ie_src[1];/* to get ie data len */
 	if ((wps_offset + wps_ielen + 2 + remainder_ielen) <= MAX_IE_SZ) {
 		memcpy(pwps_ie, pwps_ie_src, wps_ielen + 2);
 		pwps_ie += (wps_ielen + 2);
-- 
2.34.1

