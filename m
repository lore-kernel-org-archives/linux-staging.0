Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B101B27FB3A
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368639; cv=none; b=rLTbiKy7y9xBAHKIjozvh0DyN5CGgL3D2QWqCf8215DADaB7LFAS0GwZm9JTcRujQNYLZKG47C7Yx8F6I+JJMmT0F6EmNs1iSKlhVJ6R45Dflr/ulUzIymvE36tAKL9aHTS9XpVZFmJGlXrgD8Vd9BhE7EXe8HZ1EnPj0PDnKiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368639; c=relaxed/simple;
	bh=6LgPQvpg4uWi2+g0oRu5FfUq5FLkAdJRzagqIsJygBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IJ096IhOeyaA0bjNv3evMYIt9/Rz0P4mJ4rb22jgFNEdRVng4ebU3Kke2mWZFQj88GbyblC5TrC3SplUKIUQ2N1i2XT51HxB1IjcKcR69ABcxo3AJdBMYeDK+ZUIRS2COitqp7UL04Jph5tj9s5yH0nosneuGaqFNrofimvCzM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FsVHTfU/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsVHTfU/"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-bd8f9725b30so558008866b.3
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368636; x=1779973436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QCJ+miUX9szQ9qxrJpRnPrac8eYUQHkd+CfCVdwfbkQ=;
        b=FsVHTfU/UMljuoSWhAAbqKkJttUshUAUYrBwZdeHbw/aty7I2covKHrSDm4STn3JZV
         DalM0fnR1sclyr9FcWADAMNLR5aBMmb9q/hUVfVqStXyfVWkJH8jQHQA4Xr/DB/4ROfa
         vo0JQy5QAnmZJzd604IMTgUEmz5we4dV8/VFe3jH7iKdbXyKyw9FMsVqWqVa9NboPUoI
         SozSUvQBATN48+K/dmIIFR38CgFv0cwz8xdThzfaBEsIRzS60U5no9hPixoCe13R55Xn
         zRlexTNx0t8upLxxCSw1pF7X0xTyajWt2M20sb8YkHfOtzXAsbN/Vx51M2NMrLyeXFSz
         ymhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368636; x=1779973436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCJ+miUX9szQ9qxrJpRnPrac8eYUQHkd+CfCVdwfbkQ=;
        b=LCH70zTvH+xSARzmYO4M06gb9JRqQTGRfLnF2E0koFeMbTB6Po00U3C1w7Nh3abDkD
         DMCwUpMPh3uol9btNcRMIw0VxYNcWSnCEHQ9TgAGl/IkvBpeCroGr+S6NcQvjub2YqL7
         ezSyZqXhg6NZ4ge97bIL37pZ8GMJ5tnw+8091Pin44NQUJoGSGQ0FHfja7QO/qfTUlGY
         /l1qAminXq86PuHsfgIlgHvEEFC7jLlPGAMLPQDy6V53KrIWA/MkQQcdoxsQqKF5zKDu
         FJ6kQarbxfDqEyZCv8s5zyInaBJq2MvSKQBPTCI52u2qmbAms3pqRoz8FbGMTnqG7pgP
         2Ybg==
X-Gm-Message-State: AOJu0YxoAy1CiNFpV+VJfBdcbdx2OzPBaxMGXJpB7vuB2qoJkRCaC+Nj
	UO4LdACbfifa+xAZEIxaUB7pBP39F4RTeg1hnpkR7Bk9AAjuSc9gA4z8
X-Gm-Gg: Acq92OFuAU2ArNBj+8qnmM/Wq9SvnzEfC4oS+Nmzm66SNCAMjJuAV3PG5g7Dx2RANe9
	XSl2B/6R6DBKSspYDIBm7PsvGwrk3N0sZFJ63IxYB8W+a4QJja4O2BXP+h3l3MJwyLXhJUJ4nSt
	n9hn3a5gdPJQbwmdINoXWnazep6uFC2+KUJvR81zh/PCJq9htDu+V8MW4pylxnmMsG/ibG0G7Th
	oiq7kY3l+1kaC8zA+kk6F2V073xnjSt4T7a3rCFldaXyMldZuN7cZi0dd6/XNwctxJGa4dTZV6J
	kgOG+MrVmoNE4KXytydcbX3gLJFsRmItYwWeKW4JXifbebzUcjL8zcOG8fCQAVSzcXw9RyQYV7A
	oRr/eUiaHHaAuIgHU0Yd+SGwQSo6kh2Ln9xOgCRUz+kha9+zrLd788G9JLr8n/qBYWcK2ZEgMdr
	rLuSso7Wj8CEXmQOAGW214SOQ+w4fWb70LtP51GbshSTGf/rcbWe8nXWhsqXWHgQ2G7vbKlHwbu
	PCampt4uWRPHbQMYMDXg12peFlDeLwehf2duhlUlQsKm6BayNE1xXIfUjWGR+yjPy6BT4+7yLea
	PoAnqeNI54LOqJb8xohey7e6X64E
X-Received: by 2002:a17:907:d01:b0:bd8:26e5:d79b with SMTP id a640c23a62f3a-bdc188f291amr147500566b.43.1779368635329;
        Thu, 21 May 2026 06:03:55 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa05cffsm42042766b.50.2026.05.21.06.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:03:54 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v9] staging: rtl8723bs: fix WEP length underflow and OOB read in OnAuth()
Date: Thu, 21 May 2026 15:03:24 +0200
Message-ID: <20260521130324.754100-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnAuth() has two bugs in the shared-key authentication path.

When the Privacy bit is set, rtw_wep_decrypt() is called without
verifying that the frame is long enough to contain a valid WEP IV and
ICV.  Inside rtw_wep_decrypt(), length is computed as:

    length = len - WLAN_HDR_A3_LEN - iv_len

and then passed as (length - 4) to crc32_le().  If len is less than
WLAN_HDR_A3_LEN + iv_len + icv_len (32 bytes), length - 4 is negative
and, after the implicit cast to size_t, causes crc32_le() to read far
beyond the frame buffer.  Add a minimum length check before accessing
the IV field and calling the decryption path.

When processing a seq=3 response, rtw_get_ie() stores the Challenge
Text IE length in ie_len, but the subsequent memcmp() always reads 128
bytes regardless of ie_len.  IEEE 802.11 mandates a challenge text of
exactly 128 bytes; reject any IE whose length field differs, matching
the check already applied to OnAuthClient().

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v9: add WLAN_HDR_A3_LEN guard and WEP minimum length check before
    iv[3] access and rtw_wep_decrypt(); tighten ie_len check from
    <= 0 to != 128 to reject under-size challenge IEs

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 68ce422305ed..8575b7bd6d84 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -687,6 +687,9 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
+	if (len < WLAN_HDR_A3_LEN)
+		return _FAIL;
+
 	sa = GetAddr2Ptr(pframe);
 
 	auth_mode = psecuritypriv->dot11AuthAlgrthm;
@@ -698,6 +701,9 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		prxattrib->hdrlen = WLAN_HDR_A3_LEN;
 		prxattrib->encrypt = _WEP40_;
 
+		if (len < WLAN_HDR_A3_LEN + 8)
+			return _FAIL;
+
 		iv = pframe+prxattrib->hdrlen;
 		prxattrib->key_index = ((iv[3]>>6)&0x3);
 
@@ -802,7 +808,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
 					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
-			if (!p || ie_len <= 0) {
+			if (!p || ie_len != 128) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
 				goto auth_fail;
 			}
-- 
2.54.0

