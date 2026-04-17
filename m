Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA6734F498
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776394991; cv=none; b=uXtYU+uKOO2UFj5JkoU7QmXLxnKBV01KlUqtzNq8UkbWvA2zB/e3/McSepZGJleuSRWUMBpiqlZOgjRufPJ49PxImM7YxuJIrL1rTh0uw9CdcCdVXP4EuBA/TMVZ8SK5G0xY1NKFv8mOleV01GrTCqrUuWZTCcMBbusBheIY4Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776394991; c=relaxed/simple;
	bh=Qf2pj9mdWhoOhQaMbpBXpuYL+EpLLGiJqu1COixk28I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O9Rd8/dO2KAOM1EkNQfIKNqKe0/v+aGKItU+ovB8ZAMgcGdXOacwL58R9K+jqlLe9k0X0HR/o1hax3r3LtF9gi4HEVki1Mm4MSdDenI3bizMdtrRK0lAy3MhOqA2y2o5tOPshukGAjOX3z5GKB66D8JOFLYtg3CUmKx77Q25hlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oJ2PvZml; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oJ2PvZml"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56a857578a8so68505e0c.3
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776394987; x=1776999787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rovnln3bQexjtYGlnIDtq4x3huEk7/gghBgaMQ2B6FQ=;
        b=oJ2PvZmlZSLgdAW25egEliRzHHlqnkNcFjG0ztuE+vtkdoZegzk82OWME//Cl7xd5p
         sdIVI3qnUNWg3g+1pHMTj/iXfEdS3fXHh3ezXhrMYpH0LvPpfXqCC5GLYSgbJ0Ascuvd
         6Mdlw3zKk6FLSd+mB1+AzAD5fVapeXX5wgU3y7WiqOPYyiqRDl5hCO/hbmpW9RoRPHf6
         FeGlQ2EdHFze3RXqtEszgK4hfWoQJBpHx/8VIVuBJEY+MP/tI7/Fxuf17Wzk+f6ZFWRw
         iJzZiEIGXJbRCMYDivW7nUHoEQ6dod7x1dsbr8PlgxeWVtHGgl8EtuN2mnMqfiwnxhIy
         574g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776394987; x=1776999787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rovnln3bQexjtYGlnIDtq4x3huEk7/gghBgaMQ2B6FQ=;
        b=QD+ESyfquEnz1rpMiym/4KuM2/ZjtxzInXmZNdzenuJLeRilKoNu5XHZAtqfjoWGBa
         zeiiKSTXtb+u1SInIRDTcr27FST/N6ifLSqCq4dzwJ3zjC9JRWdpa9ZNRtTpECn7RSJB
         /huKjG3BJd4Qg5bbSAegdqQczmvFRpH84ngtuH435hySH1XPhzA7J/V/Ch47FuwGr/7e
         fBKipk0ujlVoM3s0CfwEFTX0gJhkjSu/6mnrT3GwiKryLwQD3diDj2/DsM1vaYRZYxfj
         f3d5pP8Mp263Py5L66nXujCyGBHosEnsk1CnW0lXX5AH1MkU2A+btCBPfwQlgzLMsCc3
         K3Ww==
X-Forwarded-Encrypted: i=1; AFNElJ/xU+/NcAmdXDVWjrsy0c6U2SVdV3Yq7Sf5KEBI5JqkypSxX80Pd5l+6e6dAbgOTEVA7/IcaeAZ3HScuajK@lists.linux.dev
X-Gm-Message-State: AOJu0YwI/PO5cOR3ZHk5iny2TBUXx7RuIxjcjcRxkeB9qtIq76jci9s8
	WaEDBnkYsIxLSX1aRmWewVPcCtBUbU6rO2G4FjsoNKStSDy2hPG/YuWF
X-Gm-Gg: AeBDieuASssL/7xUqb27PtlvKQf6QNUaSiWOyEWrNZnmHe4vxtq77vcdresh3YWpm9W
	70NgK675a5smHkn0ziyxRAavHqLlkB+AqeNijbDCBbjt8JJyl6lyAPcMWVRTa7uH7tbcqHwNC9Q
	SvCjcfWmZ43PJBX64NV3xuAsgEkEGLvH25IjoahQGcwy5EUAtlM77mRB+7cOFYGWPbjhIrNFVZg
	jaWcnqAXsqXhxa+6VuGfy4aa/IuCkmUJ1SGq1yZUX7ZooM+Lzmzq0+L2lJry7H27J9z1RVDHJkF
	/EAwIbM1jzjem4tp0aD4h+OWTwzUKZy+9+PxHfszTc6BHgLp5ujwznof/uXavB+8+W+/64qiEZW
	+QxtcxYjXHtqUslhWEY3dF24723D7kDnS7kGDHgxmltSgf81Zm1O7RYXdwJ2GsCXI0ZR3n9FYPW
	V3YEf+h3U81QmvzQ/bjlDbtvYOKTmN4EnAGt8pHjK1zcrEToY4NGFv
X-Received: by 2002:a05:6123:10b:b0:56d:b4d1:3c3a with SMTP id 71dfb90a1353d-56fa55c512amr711056e0c.0.1776394986916;
        Thu, 16 Apr 2026 20:03:06 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93275f4sm131275e0c.13.2026.04.16.20.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 20:03:06 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v5 5/5] staging: rtl8723bs: fix negative length in WEP decryption
Date: Fri, 17 Apr 2026 04:01:10 +0100
Message-ID: <20260417030110.42991-6-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417030110.42991-1-delenetchior1@gmail.com>
References: <20260417030110.42991-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtw_wep_decrypt(), the payload length is computed as:

    length = frame->len - prxattrib->hdrlen - prxattrib->iv_len;

All operands are unsigned. If the frame is shorter than the sum of
the header length, IV length and the 4-byte ICV, this subtraction
wraps around or produces a value smaller than 4; the subsequent
crc32_le(~0, payload, length - 4) call then wraps length - 4 to a
huge value and reads past the end of the receive buffer.

An attacker within WiFi radio range can exploit this by sending a
crafted short WEP-encrypted frame. No authentication is required.

Validate that the frame is large enough to contain at least the
4-byte ICV on top of the header and IV before computing length.

Found by reviewing length arithmetic in the WEP decrypt path.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v5: tighten the length check to also cover the 4-byte ICV so
    that the subsequent crc32_le(payload, length - 4) call
    cannot underflow length - 4.
v4: add Fixes: tag and Cc: stable (Dan Carpenter).
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did
    not apply).

 drivers/staging/rtl8723bs/core/rtw_security.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a00504ff29109..ddd6ed2245035 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -113,6 +113,12 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		memcpy(&wepkey[0], iv, 3);
 		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
+
+		/* Ensure the frame is long enough for WEP payload and ICV */
+		if (((union recv_frame *)precvframe)->u.hdr.len <
+		    prxattrib->hdrlen + prxattrib->iv_len + 4)
+			return;
+
 		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
 		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-- 
2.43.0

