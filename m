Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9583225F7A5
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 01:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550304; cv=none; b=rEXL+vfnoM16KAnmpunITYe5PlNVnPX2ShYNMpbQknlkZBX+d7jNNI8vTit5GS7j29Mz/PcJChIDz7NUDswlvkYCYrT07/k8BJfC/G33cEemqAc6wUDrK4i9AIGFT2X/PVBa/drSLoRqSZKGVfWcLeK5v1/+rigbKLs0VhZ1GvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550304; c=relaxed/simple;
	bh=04mrtEa5PdHocCigzzaMYLeTA1Gx1ZWtCa5+sch8j3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R6cwMhA8VXizKj6JBgL4woGa/N6dx56P3Nt68hQ9cilrU3PqOWrzEB/WWjv3LSzNk+NVqF9jjM7kxHOqfelijcXTRpZ+4ia5+2oioFzBVEwNX7kRDmecM6UhxFurn9l8Qz+Xj7QqVOsepcCjNPLIJvm06OOqL0CnNHWlvQb2AJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXQUk1/H; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXQUk1/H"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f7020a928eso6924156eec.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550302; x=1779155102; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RsKAyjFR0CIqyuPNV+dz707ncCEoIu00NYQpJfyiZw=;
        b=VXQUk1/HCAL2Up1dS4k6pjq68NZ7Nsnqd64FDtb9pwEPX5WF2Vj706F7os6D33f/l2
         YOGXyWsl65LAQhrHA1RL9KJGG/5b9rB89SZBejEEaWXdZbIYUVBynDHGFXZuAUGGzunF
         9NcxUwm3LD91ghstS9ysWWvcWRMCXGL7HJgcb0R31jwa9BdSUgCTIHsYji1sj5Okrvml
         FOycaHzhDkUJa7RhYY4I1pTFmCIbfBQN85A1/8Ypjg/1yKQOfa2VBZ4NnTnjRduB7id3
         pWlwMKpNuf5610qc26RtUyXrLt7WR28hVrdCtUMMCAci4jiKd+f7GT4lJL1wFwJK5JF/
         wfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550302; x=1779155102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8RsKAyjFR0CIqyuPNV+dz707ncCEoIu00NYQpJfyiZw=;
        b=Zop+EvFgHnptxCTpCS4AYPidPLlZQ5b2Lmf9lqmQ6a10qPHdFaHxISDaMgXnhi/5i8
         7ISMvT+pGlOZqLj+k6UvnnQGIoK+mY7WLyVdYPNogsC0wzLHcL3HYa21opjIiFiL1rsB
         NAnVh3c30Hp0fqvNX8JcVUealKYbe0N2kdgIqgLGDLh0n+jQRu6QLDpu+mqm2rDniqjG
         r+67my0zrK5PwLpQgHOZey0yPZ1CtOkOcDSZW9pcmmpRURCseNM3TA1ETSbGy67G4ZtG
         mAvaZeRIbFRPB+x5m5QkO/PBJ26EV7btkzsN63+vodBJo3lJldfa4Q//JbPOZ0JRpmJf
         ej5w==
X-Gm-Message-State: AOJu0YwfQhhIgfCLH5LzkiY/CcrIIUXWtJLiZzrapucgT4ZfeGM2e/ZV
	Tb4sVEDrKFR+Q/PJsG/aqpd30o+vuuIa5i+Jum4h7gV8MgRIqDk8d7nS
X-Gm-Gg: Acq92OFxWOo8/EYHeb/EgnLL3GenQGoFxzTqVS1Eao5vmohHPRQ5NiY1EVpK5r7n8cb
	Ou2HBHBpRLfe5q1ZEAuVXAptfsDTvZl5IDuZZwM46yheMm6mCvP+lHFg53Ud0eJukSDn7LoUVmv
	+zn5++FK2dKLTWMtDilJQ8yhxykzoKnAQyww8NSe5EANp2ELabURpxpXfTOKCeY8KKZfiNRiYs7
	QD2Q2vpGLse9Q3Q3+JQaRAcYfFa89STJb/CndBLGJ02jgYnbVtR65bcPaBCjUJK9BvARJGBvryZ
	2x4t2FvmKc2iXGNqHv1EZI4CtB5012BGgFU1E+JQpIOG5TMMbKeKvS3ACcLQXFTxwXr1MVP55xY
	uq9S20YJHAx/96XFCvOKIkn4OGFjDNwww7GabvPW7g5iCTPIjCXCpeO3bCSJoOrji0MtGPAI+nO
	xKg4Nsf0hNLByoXX85trTy8JWRmAymM/A/WDDRXHKMEcurJAb7dV8QVLEyvOcwgsa4l9TmKYJ+b
	4v/EaPQPmUrkRyqhA==
X-Received: by 2002:a05:7300:7244:b0:2ea:e93a:ff9b with SMTP id 5a478bee46e88-2ffd5cbbb6emr603958eec.13.1778550301525;
        Mon, 11 May 2026 18:45:01 -0700 (PDT)
Received: from localhost.localdomain ([50.231.3.67])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e4016asm15816499eec.28.2026.05.11.18.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:45:00 -0700 (PDT)
From: Shayaun Nejad <snejad123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Shayaun Nejad <snejad123@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: fix use-after-free in validate_80211w_mgmt after decryptor()
Date: Mon, 11 May 2026 18:44:55 -0700
Message-ID: <0f4cbf05a7a594be4629ca4d7c108e6df1463321.1778550157.git.snejad123@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1778550157.git.snejad123@gmail.com>
References: <cover.1778550157.git.snejad123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

decryptor() can release precv_frame and return NULL when protected
management frame decryption fails.

validate_80211w_mgmt() still uses ptr and pattrib saved from that frame
for two memcpy() calls before checking the returned frame pointer.

Check the returned frame before any further access, then refresh ptr and
pattrib from the returned frame.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Shayaun Nejad <snejad123@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508..0e1d248d8f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1433,6 +1433,13 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			if (!mgmt_DATA)
 				goto validate_80211w_fail;
 			precv_frame = decryptor(adapter, precv_frame);
+			if (!precv_frame) {
+				kfree(mgmt_DATA);
+				goto validate_80211w_fail;
+			}
+
+			pattrib = &precv_frame->u.hdr.attrib;
+			ptr = precv_frame->u.hdr.rx_data;
 			/* save actual management data frame body */
 			memcpy(mgmt_DATA, ptr + pattrib->hdrlen + pattrib->iv_len, data_len);
 			/* overwrite the iv field */
@@ -1440,8 +1447,6 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 			/* remove the iv and icv length */
 			pattrib->pkt_len = pattrib->pkt_len - pattrib->iv_len - pattrib->icv_len;
 			kfree(mgmt_DATA);
-			if (!precv_frame)
-				goto validate_80211w_fail;
 		} else if (is_multicast_ether_addr(GetAddr1Ptr(ptr)) &&
 			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC)) {
 			signed int BIP_ret = _SUCCESS;
-- 
2.43.0

