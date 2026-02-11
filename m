Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A308460
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 13:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770818261; cv=none; b=ehA0mF2WjhoIxiahQCIaTZaCc9pmlmuqVkKA5k/sffr2ZynqwZm9Xe8c9jKxLzjGZpQUXh4T4/CN9zk13k9F9NKeQO917Ec7D+Shvlf3nAafj8VgRAyqqWoZDMNs2qLBGhr7+CqgOf+qEXBWrsPV1q+mEfQ1k81JOQrvgeIDPI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770818261; c=relaxed/simple;
	bh=nOpcu90WA2R9uXSKx6/TlPQ/HvBsepY7KRcRGH70Ntc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rfpXuVj/f6MqRKBD3mfRdUHNFstpK0gIyq3VLTPUfcyr+Cz36h6tAdsy00ABuODkgPLq+jRpFfTsji8sfj88dFMCzZrDGAOF1AB3o7eclqeGG39bkaEJgfJnxB6MyM9rAFRDhTjyvZ8JangpKq1Hm2ckSOW0Sj42841cofzQTyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMyPfkMN; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMyPfkMN"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4359a302794so3513931f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 05:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770818259; x=1771423059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d+9TfAUjeBuACIB/Bd1iQF+yD56azf2MlLBlQed5AnI=;
        b=hMyPfkMN0dbm30gqpj+R3Ta6+BNpGsoTUQ3Lc6+hzfLwxDOiE++tMNT5Dt2JD8XQ1P
         LTDilC5HsB4rIJneaU4gU06AYTR7AzYvPX3kYUTxokwXLCZXhqEdWH81gKvskPihSTKY
         OOdISX45wXRgvVvULkty+adW9nRJbHcAFf3PTn3DWL/Zt2qhzZbuY15RA4yOVHnoP2Oi
         QeCSygPSsDkulhfV9kfYTILfOrlLjGmjXaB+JMPqKJ14RJETWHAt80jzkIg3kfBB00Y7
         0aEB2sMgnkTdhmv9JP2cJjR6G8okuOZ4nRWdSZYjHfJY+28hR2cFHhtLW1Aia/VP6QS0
         NzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770818259; x=1771423059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+9TfAUjeBuACIB/Bd1iQF+yD56azf2MlLBlQed5AnI=;
        b=mtQLqxfNORkRgx+disQAsgU0a8FRpLlds4YQnASUf841xg3I6DOQoikgEyGBhnJaFy
         q8IojgpOI2TwSnXWIfBchP6fr/B98lE8xSqnoldbsknr5iWX2NlqscaipRrg3MzfIgIJ
         MberJ51DUc902Sr7xpPZXLeMui3bGq58XFMm9J2pjS5C1mjkc3oLxJ/vp9lKnIRvwjfv
         vvfPaHWCtUpf6tbQLvMnEaBOshasOruSSy12nnV+9u/nLl2Bph9DfW/l5Ue4c4IJMjQP
         3SN23leTjA3rvcMqCG75RxW7morasYLjLbx/0isWcZ/dvsRCmVhHQcCkR7VlpwfQtMBJ
         Levg==
X-Forwarded-Encrypted: i=1; AJvYcCVnCJ+JLXfBoF++l01l7mYuge6vbu4c7MNZWa7RYjBX2PaHkNgKbAU/1KXmBRY03M5bWZfffIdddZncewbk@lists.linux.dev
X-Gm-Message-State: AOJu0YyO0+/zAJFVKdEy5mdn7BOtKgCchE/NIhFDlneX/Q8YJZxmaYhr
	eoxL7GAm61kOpyuTmEICOvyAIwySRw8AsSPBo7aaxip6AqiO5rZfjx1L
X-Gm-Gg: AZuq6aLTSKErfEP7bH6Sxkro+86aRPNgU3sf5BkO+zbCYBfXQ6JeiTE1povuz7rUzUZ
	IpnRiIqlJk+76zWY95nWQY/p/uWjKW/jkpS4S9kW+lAcXBiGedzYr6rYSxMy8lUqRrC0xqCfGwQ
	1PXiLoWKWefcTMgSzSYJUSi1qqf7ZJKr/8MYiyJSsbfSpto0vbOtEDr9n8soCr8Tm2QCvFU9WWN
	c87RVvEZP1VWtFjmplNUDMZsjcivvg2+xngRB5NrnhYz2HOc4t7azbNfdci14wixxJosgOdNgqQ
	AOQ+VhBo99jzSMplc5nYgDpC9V1WM6GvljkElpY5O5z4Y7Ei4O/HkzsJ+hLPHEroC0m8l23G3Ma
	6m/OYeAmp9v5bXznATnaBnkX9grDkL2MPryAwEq0YZVe+Tl6TYPaZXbkUFxkESRaJjoJJSclVZf
	7rr+/Hb2gVJmhhQWye6bTk32ubBabkoqvImgqsTTBi+5jq5CDnQtI7
X-Received: by 2002:a05:6000:420e:b0:436:1517:aec7 with SMTP id ffacd0b85a97d-43782c25862mr4320987f8f.17.1770818258335;
        Wed, 11 Feb 2026 05:57:38 -0800 (PST)
Received: from mariyam-Latitude-5310.. ([39.37.133.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783d310c6sm5289978f8f.2.2026.02.11.05.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 05:57:37 -0800 (PST)
From: Mariyam Shahid <mariyam.shahid135@gmail.com>
To: mariyam.shahid135@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix YODA condition warnings
Date: Wed, 11 Feb 2026 18:57:31 +0500
Message-ID: <20260211135731.13560-1-mariyam.shahid135@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place the constants on right side of the comparison in rtw_security.c
to follow kernel coding style. This resolves a checkpatch warning.

Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 8ee5bed252bf..601178dafcc7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1488,7 +1488,8 @@ void rtw_sec_restore_wep_key(struct adapter *adapter)
 	struct security_priv *securitypriv = &(adapter->securitypriv);
 	signed int keyid;
 
-	if ((_WEP40_ == securitypriv->dot11PrivacyAlgrthm) || (_WEP104_ == securitypriv->dot11PrivacyAlgrthm)) {
+	if ((securitypriv->dot11PrivacyAlgrthm == _WEP40_) ||
+	    (securitypriv->dot11PrivacyAlgrthm == _WEP104_)) {
 		for (keyid = 0; keyid < 4; keyid++) {
 			if (securitypriv->key_mask & BIT(keyid)) {
 				if (keyid == securitypriv->dot11PrivacyKeyIndex)
-- 
2.43.0

