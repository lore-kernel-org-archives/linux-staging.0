Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380A736C0DC
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 06:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406360; cv=none; b=UovBJod9G9IuxHtC98f+2e5fjHHX8mK+nZHH49apmnzVUZwxRRqLfybyfNmQUqdFLxJbyCwkqE79xjq6tZd9GAoObkR+OFJhOFQxOhG38duDBlR2A7SdQ6kAZmOWSeUWLhIa02xRGBuf++p35rCtkct6QBgZPq8VQL3Dyp8lFdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406360; c=relaxed/simple;
	bh=Mkn9VdUMU/TvZ8JqVerjm7KuO8HxezoafwaUYXwJEtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FmmBlzGtCK0xf9a/cmBxLOEOA86wdQed9TJ2VaCWZD4oSMMtDB6qcJ5p3qv8RupZpJZJJ4H6VRtQK4CwiWog3hGCtHTE0+hiOevhIhLdwNol5c9Mm0BjgEqJ9f9OkZQbTb1MEZn2qjlFfSjufcQES+lAyS+JXla2UAfcYBf22II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+SH6BFS; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+SH6BFS"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-953aacb9d78so67804241.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 23:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776406358; x=1777011158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chi0rjV8j6xNxAz/qcwmHJNYbKqeX24uRogPLx+nbHQ=;
        b=V+SH6BFSHTQKKKst2kTMOxcuZSQn4VlW/9nErZbkgZhk2gU4G/EJsQH+fhbc1tpehr
         BNltjGv9+Rfd9qa1QtvTR33pRLO1eNrOQ3lvuXEKNOEZa+aEV7xrtiJYQw5kGWDdP+6Y
         8J/nD3FFsrZ0BER7Z1B2HOtR4ma8u1xAJEk1eMrjXWsy+Gcg/GD9+quE2HR8HpKPgn0G
         4zWGSsUMPdcpYtcpuH6zcmbUQjtuYgyTC1YChR7rePg2xij4m0DIOwA9MpB+NAV4ckSj
         pbfuC1/3Uvh5BAcVmP6qvTFiSV5ubjEQzSlRfp9dhtRirmvFCy+vlI7+WBpwc416Gxd0
         QpMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776406358; x=1777011158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=chi0rjV8j6xNxAz/qcwmHJNYbKqeX24uRogPLx+nbHQ=;
        b=QUJ671L8oPm05UxHyO7MO0rmmNm2FBD1dVnKR0jWqi54qTeq2KIFePu0xvJPQDx3bw
         V19mlbvX1W4iaMXLj+axauvOc9jmH6bnA92iUt9Wy/h4CU1tIOlJXZktpOYP8PJwIVMr
         LRcpG7453zC1OL7p9e19kgXifUiModVuq5sJrueNRKEDWhv4bGMWvTO+/QITsh/eoyEA
         HD59gLEG3xu76lcDc8MbEWsu2h5ddk+wMf1br7kQwQOlZtyu0oFqGECmShwD0958N8C5
         WyhA9BH/mP8E7FGpqFXMT4Ssz5CdvhmN7XNNloJkHFH+ce8piq/NL1TJevL2QjJiQeaM
         eReQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RcRbFyE0UKgzbHipFbqQPxTA8DoF0Br2aLSpomq8AEaP20GcWCOwk6r0yGn2V6C39GZcpbugfcPVPjqoF@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8S2MAXvSVKINnd1DntuwQC+cr7L2py71L9DDgz0cPThhNaSrM
	ZQzUreduNiNL9g8lY7+JAMfybzxgvw7SDiuFjcr5BC+AGmH5ycLI/jjH
X-Gm-Gg: AeBDiesAD8CnQJoIoJgosBML/5HCiBPdbtBFWeQCcOEkDBFydpJYVBCHvXhZsHwac7q
	3P0yy9cbcCfjXRl/yAP1XA7rFkEtwrmC8DH1TxGhGUFiLY9ar7xO3H3YxjL7CDXv3DgywJTyp4K
	LNTJvU17q+W8XhQoOnAoUodqOE7DlDBRsEfVhIIaIvSAOJR5LW78Qt7Oys+pazOz/k4Z7D+0t7h
	0w2u9abzaeXUFxyigsu/M8NZOPucScSUarjdbtbfUlXaMCFvV+8XlB84KQtZn8m/uvteF//+e9q
	velqqz6gpLuNH5xCUYB+vSKF0g5vdI8CE9UpKHNHJnrd7GJ3VHkllCd9YaF5bjbuuLWW2Xvi5RQ
	vRNpw8YYpyOdM3gVFs9vfGpDpEVkefAuV4hu1ff1YqghYbqnBI2seBwxJ6ybMsrw5oUX7m+ypg4
	6mxODPMjNKSl5p9OYLRgQ+DAkSQMNawgMfRGeXDP1hE5I3ryvY+BwjmO8DPAfRRDc=
X-Received: by 2002:a05:6102:5122:b0:608:759a:53bc with SMTP id ada2fe7eead31-616f1c595b4mr526551137.0.1776406358162;
        Thu, 16 Apr 2026 23:12:38 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589093a8bbsm297947241.3.2026.04.16.23.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:12:37 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v6 5/5] staging: rtl8723bs: fix negative length in WEP decryption
Date: Fri, 17 Apr 2026 07:10:48 +0100
Message-ID: <20260417061048.62484-6-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417061048.62484-1-delenetchior1@gmail.com>
References: <20260417061048.62484-1-delenetchior1@gmail.com>
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
v6: unchanged.
v5: tighten the length check to also cover the 4-byte ICV
    so that the subsequent crc32_le(payload, length - 4)
    call cannot underflow length - 4.
v4: add Fixes: tag and Cc: stable (Dan Carpenter).
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and
    did not apply).

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

