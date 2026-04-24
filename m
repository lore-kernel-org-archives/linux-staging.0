Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78653016F7
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 15:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044076; cv=none; b=p3ToGoqGhka5/oG9sw8Lc8nN0gTg89ehEZWsAnMWa9EHmLyfoinPffgGkfN8g0xipPLQlHQ3k4Q/S0qe0IwsvxTzA/bOppTascXqhB2gkCywtN+/CvKnWGsCkZ5ykdhzLtvkldEebyvG2+/WSegnNVgDBALz22CV61bNl/sVh/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044076; c=relaxed/simple;
	bh=fKLa0E330LnbL3X1f9T7ZCkxNgQwTmMwQC7FfmEqsGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KgqmTsNdK6v2ATGqkXVtBPsgStGpVmA30/C2OGGwRMH9yWhMOXTvF1/u4tv/wHFHDaOwAR6ka3CAaMjO8OiEnpaMw0WKHFa7z9M5M/uIJkptUVfM8sUXKiha+XthzumTAxF8dYQxBO5/ZgM5KzJWoumB4Vrya8GKL6TSGWBNKI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBBxh/5w; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBBxh/5w"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so97812345e9.2
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777044073; x=1777648873; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lbk4nOOwn7Y3WK1TokxRbj/c8v2Ahd/1okpLG6qqqvc=;
        b=iBBxh/5wFdQ/d/2t7ozYJPlXzOHHSE4GJeM4JhuPpioybLqQAP+0KU/gDnr1PZ1ZwA
         E6PDoC96DqsRtsyHfIacIct22T4E1kLlKk2MiFGGFf3mJUZ3To6UfN5Qc/kIqrMjySy3
         azpAZKvrbvsW+A8453SM92Tv5cKG1TsVzA7eES/DVzjbWQmKuwkTKvWmw8tAWRpZUFK5
         buW9MrviZQSPqqo0zpO+tAVxjScR4fR1Z5G78+1ZMfnQuX6J9MKOlAvCYd1w5WjJvPQE
         YPCpo7VMfdsAuAUQzpVfvk0tmfZSt++n7deMqTyvREdjpk/bPz2KssUz3a2QsjW2X2JX
         LiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777044073; x=1777648873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lbk4nOOwn7Y3WK1TokxRbj/c8v2Ahd/1okpLG6qqqvc=;
        b=Vd5NYiyY7Mk5XXQ6hv7mRddMyy6dhya9qcoBSbP2iK2WTUJjm7NRe/IFzw/B3TAffV
         fEPFlveYiHTMi2m2bVSp+Ypz3ONOW3Zy1Nd4q2zGLuCACjk437Tc/Dt3HySV+/Sxtsu0
         imeABuI0p6I3IZWkzPNNGz+yBpUWieZeE1EllT3gPkbEZ9EdY1izYCyTAJ3s8h8k/3Gx
         4BDCe3bbqB8J7QN58Pv+CwprYkfM9PPJqN3bK+f6eGCfJuyRMjmCepjaGY6+tPpXNy2x
         9XUDlsb/XRYyFBQQ777vo7qqvLeK7J4HMZOfpNzlNkyJ7yW2yH9UbcH5nkwuU8d8U3IR
         vxqA==
X-Gm-Message-State: AOJu0YwEjff2GWVr8wc6CwLlpOEuYmMii9a9TSLFhjSVLWL9M+Y+UCDD
	OZ+KWS9Eoejly/VKEo6pggfSSeQy6+JKwo0gcmh4CdACun+BhpCAf0VC
X-Gm-Gg: AeBDieuYzke5IiPUS3J/eokvIqEUhCDfh1SuIkrXlF23i6cQdwPWsQv+uAKrbbenEvB
	x6+0Hi3kmMLPgfc86OpKkQoLIu/9AguYmelbsVYcwieNNYAgjTq7LIaDlJ8tLRgBRoTkqqUMj51
	Myj5P+7PfJEJqHMWwyCg1IWwEZQEpbSJ3lYqIMxvd1ieBVOTu5xT04Ja0AF8QOsGqd9UKrF7wl3
	a6LISe1st4dgoYIyFBNI22OxBNXSer6AU80aDtMIDyU2Nl2KmsEpXk3CIojnvuA9M3LMp9ARZxl
	gMMcuXTU1JYKzK3bwQITKtdjtQ8um+C8ianUZbWV+mFd/dlqL8zySorxDMlHXsIAx8tU4k6xU1N
	vi4NO875Sg8OmIWyck1xi9YspYdEIPrioUtGM7OgNJ/EtCxjDyUSDeFcJ/DlSCGvCtPARp2zVZr
	e+AQfQtlqxgamR6eCTV572MxFbiJp9w6c+/rb/+QgXh+oftvX+E9qgX3ZdocWetsctiSWmGOzzI
	frOAjrUO3VjAZ2jlwbr9vaeWBaB/7DJc6wfhzQeZeb0d17I8bXAFXzqAeNV5Ed8Joh1jjA=
X-Received: by 2002:a05:600c:c10e:b0:488:9439:880d with SMTP id 5b1f17b1804b1-488fb792c69mr345912595e9.29.1777044072751;
        Fri, 24 Apr 2026 08:21:12 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm65670960f8f.6.2026.04.24.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:21:12 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: fix OOB reads and heap overflow in IE parsing
Date: Fri, 24 Apr 2026 17:19:29 +0200
Message-ID: <20260424151932.3734611-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three related bugs in the rtl8723bs staging driver's
802.11 IE parsing code.  All three follow the same root cause: IE parsing
loops and IE handler functions do not validate that an IE's declared length
fits within the actual frame/buffer before operating on it.

Patch 1 and 2 fix OOB reads in three IE parsing loops
(update_beacon_info, issue_assocreq, join_cmd_hdl) that lack the two-guard
pattern already applied to OnAssocRsp() in a previous fix.  A malicious AP
sending a beacon or association response with a truncated final IE (e.g.,
only the element_id byte present, no length byte) causes the loop to read
pIE->length one byte past the end of the IE area.

Patch 3 fixes a one-byte heap buffer overflow in rtw_cfg80211_set_wpa_ie().
supplicant_ie is a 256-byte array in struct security_priv.  Because
wpa_ielen is taken directly from the IE length field (u8, 0-255), the copy:

    memcpy(supplicant_ie, pwpa, wpa_ielen + 2);

can write up to 257 bytes.  rtw_parse_wpa_ie()'s own length consistency
check silently passes because it casts the arithmetic to u8:
(u8)(257 - 2) == 255 == wpa_ielen.  The overflow is triggered via
NL80211_CMD_CONNECT with a crafted WPA IE of length 255; nl80211's
validate_ie_attr() accepts this as a well-formed (though oversized) IE.

Alexandru Hossu (3):
  staging: rtl8723bs: fix OOB read in update_beacon_info() IE loop
  staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and
    join_cmd_hdl()
  staging: rtl8723bs: fix heap buffer overflow in
    rtw_cfg80211_set_wpa_ie()

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 8 ++++++++
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c    | 4 ++++
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 8 ++++++++
 3 files changed, 20 insertions(+)

-- 
2.53.0

