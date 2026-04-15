Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605E23370F
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 18:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279362; cv=none; b=TYbNWSSY6oqNx/uvS5MiZtjYSiWA8lpz9KQItUpvg02WJRIxKzm4WsoblkkWjPqW8dS82fiBAdL+LKNpr5eqXun9z4qx5yCqWMXTZSJY3ninYADJMPf/HDj8HEIjjbhLyES/K3eeK07S2oRiO10FVlyYdLZbENcUYrpkMVd/s6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279362; c=relaxed/simple;
	bh=qDgAnsBoeU7H8hWJYwfJld1PdWPKZ6IzYlZmakmFvzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRRKMjXTzxT1mSRz96JaeIL0IxstQdarJHUk9AxOcAkv2BhslUkeiXHdWPmP/k8AzShiWV/p/+M9mqb9UuaeU+J6lK/KaIheDFtgYMthYhZb4iTmSjobsRU+j4MKO+wjLLAudtGxBxwVUimx8DAlRlDcCZI1gD5c/RygWKlgr/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCPjPY8B; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCPjPY8B"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5637886c92aso3074428e0c.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279360; x=1776884160; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=terxqci1pBdDnjeH/sF4SrPTjsWluedBaTM7xGqnc9A=;
        b=eCPjPY8BUoj5gQIlXmqbrca3kF4mVWeOAV8TtDFriaeDJ+1Q2YrqcIJEnIDCnjHuCl
         8AyPDAqWNNLDYVD9ebOxbp4JF1rtUWtyJgEYF79ddg7I+3Qm8U9co954/OLHdSggM9GS
         33tLlHJhRlGadw7ZxAVcd+HMYsHKv71q89OBwaR5spC7En5h2uKr5NJuSIg2keD/cD4N
         iuCJzCpG+X5q1kW5v4tOlgFi4ZDeYY/sOVeBQivHIC75JoYbO4H6L3gMF0Fa/U4l4fdn
         78E8+S8rvp7OYk/vqV5AGvXK851/9acKYtxLWbuHpONwBi6c9Mu7zQ40pNlAC15dL7H+
         PC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279360; x=1776884160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=terxqci1pBdDnjeH/sF4SrPTjsWluedBaTM7xGqnc9A=;
        b=pxVzuEQMnQz2t8VoAlE9ImJfCaMFWo3Mkg+E1391PDO/1O1auAP+rBfpsXyCdzPMHe
         xEG24vxS9fk5G+7JGzOuv1t+wxT34nNgSG7g4v0ZTczcTPfwhTz1IhnGUfMyMJmZ3n/m
         MpCujGYazS/1UtntgMvKOsg7piCh0cRVk/SrCKDjAqTVAnLfB62As27K6Pd+wT3yxOYs
         kgZGwpwh+JpHPNcEL+U/WYQ4hL5RfU8u+j4cBXyVEe0CdqfWoDewGyrhiZjSP6fI21J9
         uNIcmeDpKNd9IQGnlu1iK/hCsegI6d70KEYABquyKv8IDh9fjsxYKYHD6X8mGBSfeezM
         xjBg==
X-Forwarded-Encrypted: i=1; AFNElJ8dfPZoZmOwuk75C2TgtVPtellGT+qBV1KlejJdBg6H0/0JgyqwiJEA2XOUYxSOHmbdMOTgGjUpwmDGIZuw@lists.linux.dev
X-Gm-Message-State: AOJu0YwZDn5GGAbP7bcVZsvCqT6Y7x6jYm7CASGjo/XKTlrdtInrpucN
	XVHqB2MDoI4QV+YPhCpCKZjxgjxkBzY0K5ACyb9u9PgHfFKigg8RFacM
X-Gm-Gg: AeBDievAa/nG4pgfhD6EZJqJVrUPNU9vP1BT2YOZ8cEU9iMhvJJNGIuRuOHd+MCLUkb
	TxyxZpc92l4XaiGI7x7/8W+WWhj6w7H/v+QqvIDkky7iXgROTCTp8RGNt1qv+QuR4lfN+ELkvi5
	pRbQdQQr4Bf5YMpeDKUiKYlpPf47Y0nr7UWTKYppsWnRDFnvM2nS4GXIRnFl5YB0vZ/AW14y7PX
	xVphVPz6eaqFS/V9KZph4eelDMypmg613ZGdhLHNbYX3BlRyuxNNT2D8yfSpTx18mNxeE0xawnl
	iK+5dQjo4UXMpejjrBO4tDZ/bh8HiAmVN4cHojL7VCUQfsIWxKEeCLg1+9Icp82C962UTSeYIRd
	kGv0hIM2gSDGrGf/YfmESNXw0yx5g5n97JjOR+uBmp+YGKwRtJhifjbS2QJiCMfvdOJzXB3GGD7
	SuoTlzmyuzwcIg5ub35Q2EC4Mo5OsMF23DTMUriKSkQYioD0Uuqh6Y
X-Received: by 2002:a05:6122:65a1:b0:56c:d1b0:3626 with SMTP id 71dfb90a1353d-56f3bd1af66mr12017282e0c.15.1776279360273;
        Wed, 15 Apr 2026 11:56:00 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89feb56esm1647484e0c.15.2026.04.15.11.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:55:59 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v4 5/5] staging: rtl8723bs: fix negative length in WEP decryption
Date: Wed, 15 Apr 2026 19:55:01 +0100
Message-ID: <20260415185501.440492-6-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415185501.440492-1-delenetchior1@gmail.com>
References: <20260415185501.440492-1-delenetchior1@gmail.com>
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
the header length and the IV length, this subtraction wraps around
and length becomes a huge unsigned value. That value is then used
to drive an arc4_crypt() call that reads and writes past the end
of the receive buffer.

An attacker within WiFi radio range can exploit this by sending a
crafted short WEP-encrypted frame. No authentication is required.

Validate that the frame is large enough to contain a WEP payload
before computing length.

Found by reviewing length arithmetic in the WEP decrypt path.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v4: add Fixes: tag and Cc: stable (Dan Carpenter); carry Luka Gejak's
    Reviewed-by.
v3: rebased on staging-next; sent as numbered series with proper
    Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did not
    apply).

 drivers/staging/rtl8723bs/core/rtw_security.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a00504ff29109..f3bc2240749a4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -113,6 +113,12 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		memcpy(&wepkey[0], iv, 3);
 		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
+
+		/* Ensure the frame is long enough for WEP decryption */
+		if (((union recv_frame *)precvframe)->u.hdr.len <=
+		    prxattrib->hdrlen + prxattrib->iv_len)
+			return;
+
 		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
 		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-- 
2.43.0

