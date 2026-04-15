Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9EB33B6F9
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776245993; cv=none; b=KsJfb9TN7MMBxPjLw2QgKF3Joe2Kz/1vw29AqqBeAJJ2YZGyoQc8DubwAs1NtecjqyGceGauThfVHm58CJ0xfLpvFdvQqAQI4TuGxRhGarWUwl58ZruW7HamdANAazJfhsBh8ZTJgQ1s/BmbQkIwUP2MTLrNhxKgwJWmFTPf3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776245993; c=relaxed/simple;
	bh=79jkhX6L0rBiDaMw9KGCWokyNHaYfAJhroi5fbYnBpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qYynGVyb93XTTrBs4N4r3HwLEr8Z+pf9MuYb4nHke4+e4FWjj02LHGDL+ntakHsl4bjiu2xVuAK/eD6bTje4Yh1yun85M+e0au4qiv9Ys3Rjkz3FjEUQmo0uaBRO834PVi6OPQoju8avv5HY7a4prc/Tb8xxjT8+dPldyWbd50E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYUq0409; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYUq0409"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso3730232a12.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 02:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776245991; x=1776850791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CqKmK/JJrk93cYqAAf+AkPWuMzdPTTW+W1yFJW42aNc=;
        b=AYUq0409iraZzsiZbQHaNnZ0YeqZZZ1z78ytn0AvhNfkMWOKuWQlBNvLnyQDFGhEwX
         xrxxH9QeGDE1WPdyzbTCskrBuVDWwCjohZQdxpIobg4N+xmh78rWIZYfR71AxgLzwYh9
         DTU1MFvsgjnxPII5LhY6kuRvhexbVyt3zJ7Bx7LdCVGFyRznHVlo+n45sz+FpoaNrxw4
         GAVNYz4FccXNKy+9cg70xvdEGSKhJFvfSDUv7LHZO03IcetCn9d4LfEp5AlqNVWEu4IE
         pmeHDoj1kkiQ5ei7bPQJ9PI/qa6tcfujLypKY88DIq5vGyzijVnsOgfHvwlBmHLgBzN5
         8d1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776245991; x=1776850791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CqKmK/JJrk93cYqAAf+AkPWuMzdPTTW+W1yFJW42aNc=;
        b=ENhJklwL1FpCNYPzN9Fqy6zcMJ+c/caBLaMgABhG2PuB3fjNKvOxJURUhzT2PlmSU/
         mLP9TNDZD8vMZUKfl/0qNTou8sI6wtYxW1juebn2DSEtr/onWifOC41qUvKDQ8kGmWY/
         cfbHN/hDnT7xEY8g4GlbbyikSPIIlCOqYbemgl7cEQAxQJf93kYNAhL3nwRnLgeUggMC
         sgVv3XWG4iIAAgqj6JdwCV9fukDsrTs+YtKS6w5sMjUE9BeytFWCfp0HxU7wfVHNCzPO
         IwpD6AbLsD8Kt2h4zoVXS84/7FDH88BxKWM3hHf9giIvnf/lHnyVnkE+lUS2gi9L7FqF
         Gm8g==
X-Gm-Message-State: AOJu0YzjRib6jyQjZON+nEPD6JLg30RyfK1vivxefpd1ICGiLYRU+TYZ
	N5WVkMVw83daGszDg4kfPABGWoBZpx0vNt1gCvpmfaF1ejhe+JoksPKX
X-Gm-Gg: AeBDievDJTzF0m1SPpvHOzxKwARc4NTXV0r+xYjFW+iay6HX62dauvUUQPznmZd3rtB
	sW8FYM31E0YsLGJsPVpAeE9anB6cWChYFZzG9HKTP5+tEa269JgKnivAt7Xqwrp39cGuhnwQohe
	HGBCKMHA/GoSmuA7FUFtewFVQvYkUiQRscKiJ2WQhgHvzBK/gPgoje33eNheAq34GupcUwh/olV
	V0QRxmo4BKk8WMSy6+pIi70s6CYhAcXxEJ/jVFEIptjVwjp+NfnltbqsMF2vBPvasZ2+6BoQiZA
	7LyJlNS0BxOmlk5tZqdYTOgP8hHdKgcjnGbkztVZo2mZE4cRD85BmiNegxOepi+vByNZoP1imzt
	3g6bsDa0+kEuu0OFLEAdtNQ66PwV+HWhiBidOGmKl4VQGmtH1iHKcrvujAXgfOVPJOS9nKnbJMo
	labWB3wUeLqfUCiPRamUsxa5drwlDmSllup5V1anbWQaoXJWDZa6Dhtm4ReWxt0emodA+xq/NXj
	Uhoqyw9PlXry4KL7uJcaOpsI7E5YIPGJS4bcUVws6ewGCfftyOpFvq9FeI0HmRyycuq5wrVzbxz
	+Y1VISiGNLSRIbBD
X-Received: by 2002:a05:6402:46c7:b0:672:f3e:1475 with SMTP id 4fb4d7f45d1cf-6720f3e160emr1674008a12.12.1776245990555;
        Wed, 15 Apr 2026 02:39:50 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d8cd5esm252223a12.11.2026.04.15.02.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:39:49 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	stable@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v5 2/2] staging: rtl8723bs: fix missing frame length checks in OnAuthClient
Date: Wed, 15 Apr 2026 11:38:19 +0200
Message-ID: <20260415093819.1112313-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415093819.1112313-1-hossu.alexandru@gmail.com>
References: <20260415093819.1112313-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnAuthClient() accesses pframe without first verifying that pkt_len is
large enough to contain a valid 802.11 management frame header:

- get_da(pframe) reads bytes 4-9, requiring pkt_len >= 10
- GetPrivacy(pframe) reads the FC field at bytes 0-1

Additionally, when pkt_len < WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_ the
unsigned subtraction passed to rtw_get_ie() wraps around, causing it
to scan well past the end of the buffer.

Add an early check against WLAN_HDR_A3_LEN before any pframe access,
and a second check against WLAN_HDR_A3_LEN + offset + 6 after computing
offset to guard the seq/status reads and the rtw_get_ie() call.

Suggested-by: Dan Carpenter <error27@gmail.com>
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v5:
- Resend as 2/2 in a two-patch series at maintainer request
- Add Reviewed-by from Dan Carpenter and Luka Gejak

Changes in v4:
- Replace incorrect Reported-by with Suggested-by: Dan spotted the
  missing length check during code review of the heap overflow fix;
  he did not file a separate bug report
- Add missing version changelog

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 90f27665667a..884cd39ec756 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -860,6 +860,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
+	if (pkt_len < WLAN_HDR_A3_LEN)
+		goto authclnt_fail;
+
 	/* check A1 matches or not */
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
 		return _SUCCESS;
@@ -869,6 +872,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
 
+	if (pkt_len < WLAN_HDR_A3_LEN + offset + 6)
+		goto authclnt_fail;
+
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
-- 
2.53.0

