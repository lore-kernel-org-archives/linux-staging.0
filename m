Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F94B2741B5
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 08:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771402801; cv=none; b=bRJq5BiGWqo6lEOsmwqZrXAyF9ab9C5IHvDh9cVrFHtO9vN9+uU0vkULCo/8Xa7vh3UCQW3qmQ1w+OiRTvFTFn2kWneuZQc9wGen59cZIg0ugHoSheJmAEebtth8AVWpfk2UKeWdLrpwer41mqsYOB0JwaOe6jGjNfUtmbPc6s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771402801; c=relaxed/simple;
	bh=Y7VlG/j30Yzun77FVIP/WDoP/Z/gchxZ4XjmWslObXA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/U/nbuTM9qN7WWXFgzdus/PEr2+nFTE4jEovVicQGJTxB6WFHDZk5Aiv0QTAbCEZXZXbpVUn7wrrB+ALnDRNVp0+JD87Ps5o5no3vZi6Eeq7qZm2jUnpHhkRZ0e82UPags5OVawTFYuEpROqokX1oGAf9+aXlDocpTg6R7f55w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EaoGn96B; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EaoGn96B"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4830f029407so10497795e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 00:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771402799; x=1772007599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BApAKPtl1bJfP0DU1ZHl450DzszOpGAuNeZ/OhTkB/M=;
        b=EaoGn96B3BihQTIPL4EBaVIzNtBKCOdOjYe/Z0fngy1tATLVikr7Vumk6Ws18Qvd45
         3cVN+EdtPbdr7uiJPujo5j284C7HdRPn9b2PUWvjNdOrwjc2xazeFz0MASXjV7CUZXmY
         FHJkrk7dFBfOHFrQPXfmzynsHQTOFcddFQpQZsc1WZbRg6DFNMnynlnmIlQS9hJbsxXs
         8Uy8JUPjURyct37DpHCiX+v3t3C+TK5PgDzMaCnujOaKEB/AAd5DvfHi7IPld09gRbMX
         8wxBMmseRMQa4cHIJRm02ml7L+eeaGQv21b+RcdOmHFO534mtPeZixyZnSgSf64Mc/nI
         UVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771402799; x=1772007599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BApAKPtl1bJfP0DU1ZHl450DzszOpGAuNeZ/OhTkB/M=;
        b=nLcLdNq79GjuJBsTGh4Jh1QcL2wXfrkaz/4WrpBOvhdKsdEK1ZLv9TfR0TJftBr6yi
         xkbt5lZjJumwgwBEoIWdKbrLt/3oFI2bitaDActxylQkJuXCaWiHXQatrkPr/lLH29J8
         SZqD7PkijoQVRK1Y6ydgHcnM59qVKDOSp73h63LjI8rikAtBLlpvk+YY3CDjdgVNJea9
         laySc3AZVkjaimS8PQawyGBDwy759GoJnOmI8H8CBfD8vlPCBEyb77uAcua+4bSy3AHc
         LQolp7NkSsaP/CibNlQiGMHEYE14LcegLBIxo3STRAdsXTVjE1sgNvRsAw8LPxtUJNDe
         rIaA==
X-Forwarded-Encrypted: i=1; AJvYcCV7KckU3NEOb32cB/9LyYxnBAqiXJK94IZMGeEnRhJRV523cTRa1y+PTpt6BHacy3Sss1MzJ2KGDt1rSMYh@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7g0ql2OMwpLs9JnSAoob0oSrqNEskgIz2KLhYSATgQeIzVNu3
	ptd0C8RQDXFkDIEnN6JU4LCnI2Fjr13nkLZ2nUBOp1DBaAZT1oiM3Ycr
X-Gm-Gg: AZuq6aJ8eC3v5eqKnerA6dtWYhz/K06JK/F+VLnwfWVK3t3178e/EIeY1aZdYR8RhZB
	S/tAR8jyRN3V4aRvc8c2e85Xtbbwjgh5wSfFNHAH4znpIz5Ve5L1a+ZJ1QrOMb8V43vICmSRTeA
	XrH8PKPEJQcCObuuScmqhmwhdSLx85SoueUPP20jNcilNRfOVnelkV4jlT6Uw4pZVl5lWPRVLZV
	cP2HP7dUKs13EvAT+bzrZmDHSQlNA4HxdXm5alxJzk0en5tGe1PbCPjphfsnIHD+eacQdBnEGtw
	bYIzEYO7oPyq2W0s0WT9x4t+HeAsAXfJyy74GbIeyvDUvbziBH+qyci6PCmPfqcYAduGSlv487b
	wzr+d4q82r/LxwzYRwgtiJCneYGnrHPHRrg4MdK/hM2cZt0+hkJbA5upOUfzjm5N+KSYNdrGjiN
	NjbXRIzUxJieozOAN4ooUc5+x3Obf0wahSvOUx5ZCVc5isE2ehiXHha2ao9fRYY8p4Lw1nSNMYj
	ZZGgVCDClzZK4Culi/avpM7l9ZFCtoYehN+uHiBrCs03+nIE65a
X-Received: by 2002:a05:600c:4f4d:b0:477:9fa8:bc99 with SMTP id 5b1f17b1804b1-4837103666fmr182826605e9.4.1771402798585;
        Wed, 18 Feb 2026 00:19:58 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5b07fsm39499918f8f.2.2026.02.18.00.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:19:58 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: johan@kernel.org,
	elder@kernel.org,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging : rtl8723bs : Fix typo in comment
Date: Wed, 18 Feb 2026 12:19:09 +0400
Message-ID: <20260218081908.53776-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change "inclued" to "included"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index a47d0d3fa2b7..038157442348 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2264,7 +2264,7 @@ static int rtw_add_beacon(struct adapter *adapter, const u8 *head, size_t head_l
 
 	len = head_len + tail_len - 24;
 
-	/* check wps ie if inclued */
+	/* check wps ie if included */
 	rtw_get_wps_ie(pbuf + _FIXED_IE_LENGTH_, len - _FIXED_IE_LENGTH_, NULL, &wps_ielen);
 
 	/* pbss_network->ies will not include p2p_ie, wfd ie */
-- 
2.52.0

