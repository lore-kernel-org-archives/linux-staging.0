Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407620C490
	for <linux-staging@lists.linux.dev>; Wed, 31 Dec 2025 07:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767165834; cv=none; b=JSMqtqYQvydLPbQ708nyw3WgBHFcFwL8KYA1grHaZvGj52awFcncOsqCuT6HBVDcAPPE+MlcT1JNxinCERnqe/bUE1A6k9JMsItfuk/WDblEm/7q8MwUOcWr/THzAS0RNs6UbcjA1q9CAGvktaggCfnYOHzXy4cqf9+Dt81XgWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767165834; c=relaxed/simple;
	bh=Ic729iSxHFJlBWj4QhO96ljPDweuWwGmChE9gmFOKjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J52gMiLqe5HKrOEUj6UvFlneup8QaNNDKsQ6oqUpIKGIc6EYT9Da7WF8Ce/BuKJemcvGL94ORg+PXMXMOYECCzTe2SOUgTIBrg5lKPc+GTO/7+unyw54Nzlj1b9tCua0h150C3XOTQ29gtCUZr4qH/UzZ99KudS96wTfr6L4uKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2drDKmB; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2drDKmB"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-64d30dc4ed7so13324275a12.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Dec 2025 23:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767165831; x=1767770631; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h+b5o973rngY1LzICZlY9YEpoZpOFAzrQHPMh8uFpyI=;
        b=c2drDKmB9hUjmKC5C+ityEb00NUklHMl7VZbSyb+V7MeWZgjLREFQ/L2X3nnNvEddX
         4DbKaL0BsSocEs16ITXlVkvHHHZdqgTdTwBOXdWQ4VN/fVYDTCH0LISZ1nLqzrXjIC8l
         i6KiB01HVJWQLK2Ba//rwqirSaF1+2YBDILbg0NPsfbkyTWspkp1c6gTlMUKHXmYD92K
         e1vtZmkJTtGf4RsjFSaAW02Tj8s9m8bifC6pyBbsFVC+AoDKDhEMJYW5QFNkQs4Q+dIm
         H5P/1N2Ky1f6N9LMdkqyMnKlKR1ljSK83M94rs8TfVddOBIziWr+IFPwMWRwptcg75jV
         hCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767165831; x=1767770631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+b5o973rngY1LzICZlY9YEpoZpOFAzrQHPMh8uFpyI=;
        b=wG54vhRvivWOSM9iOvSlefYwQxGdzdrNvkSMiEDglVBNdBDIhR3rpj7OiOoaZxWHx+
         W/RxWnDWPu3rAeunboWVDqLwxYtF4qN7YxdmjVAmBebmiPrNtfBZm6fWDywOh3UEeXdL
         M3gg3m41EO2XivpaZdtd45r95w2K9ZQy61Bi46qQF+sRaRo1AQkJJ91iBa8pJiRV+mHx
         xSpPhaCumcR6bhnfdD0FFbRYJtDiDCwl3YHUO2Ffvv25ImghYh0nkb3WeO14j+k5VglY
         jvk0ZgCfL2/0LQfTX8KEBoVxj7IZU9lhAL1qCjcsBpIx584agk7vX5iAkYuQUDmKY5RM
         QfIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/e7pnO0G8586PRmBGngtSx1TuRSsPHzj7k5u4bRvJjK89x7vJpKaEZwzA/Zy3P4LoJt2p6FLnV7PG+8KN@lists.linux.dev
X-Gm-Message-State: AOJu0Yws+LPHShOcurq42p4rzD6I8q8/JiAi6eDMQvfbXCiTVccIkqmX
	9q+qOQ/W1yP233sOmqwV38lE8cbCFQRba3tFY76WCiV6GI9SXUhFPREL
X-Gm-Gg: AY/fxX7kl0fxCkSPKx506MkHLiUVanTctbu98ruBp+fPH0CmqIzzOD2IeRxckFzC+Wh
	2P10TJEtmofQ2LquwrpflM49/xXcx2h6WcuPpixWeIfL0q028v0bjqlqO4diohR+GtEhKzkEVDt
	q70C8eRhGxOnGloZIzjsOLePzauimumJQ4pUhe9vYSgXY23rYfqZUmILc9ylf5Xil4kSz3N/sxB
	oAXuPwZwlqLRZy4yfjQQR82wChsfCVcpAGpKXFM6ACOfBoxhgmrE7ITPbRwyvuJELIvHJbaI577
	hgcvMZzFMelXBcv/wpLeYhTMOb3rLxupb7NInsmG7WrbAa8eUwlX/h3ORbrLaj7kC60iYa7YpYO
	ezzJOnSfSQr1fNuVnDukVWkXWAyyKYskFLLcXF8AqNKoQPkMk49dJXbv8AR53pynD5NQn/iXT5Z
	+KXRD+XZoMrJLMWHPK52vqQ4VQqUXZxCqN
X-Google-Smtp-Source: AGHT+IFMsFj5RZJGPp7mNrkG9G0Ex6AGvaDnXTTwc47Xtz7b7EKV3iV9tKu1hpQxcYIzzJbuCW+FFQ==
X-Received: by 2002:a05:6402:5213:b0:640:edb3:90b5 with SMTP id 4fb4d7f45d1cf-64b8e93c176mr36032566a12.7.1767165831037;
        Tue, 30 Dec 2025 23:23:51 -0800 (PST)
Received: from DESKTOP-3B0KT9P.localdomain ([188.121.148.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f5400bsm37051952a12.4.2025.12.30.23.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:23:50 -0800 (PST)
From: "moradi.saeed" <saeed.b.67@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johannes Berg <johannes.berg@intel.com>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"moradi.saeed" <saeed.b.67@gmail.com>
Subject: [PATCH] staging: rtl8723bs: return -ENOENT for AP/Ad-Hoc get_station
Date: Wed, 31 Dec 2025 10:53:41 +0330
Message-Id: <20251231072341.61195-1-saeed.b.67@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cfg80211 get_station callback must return -ENOENT when
station information is unavailable. The AP/Ad-Hoc path
currently returns success without filling station_info,
leading to invalid data exposure to userspace.

Fix this by returning -ENOENT for unimplemented modes.

Signed-off-by: moradi.saeed <saeed.b.67@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 60edeae1cffe..c6562b8a59a6 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1011,7 +1011,9 @@ static int cfg80211_rtw_get_station(struct wiphy *wiphy,
 	     check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) ||
 	     check_fwstate(pmlmepriv, WIFI_AP_STATE)) &&
 	    check_fwstate(pmlmepriv, _FW_LINKED)) {
-		/* TODO: should acquire station info... */
+		ret = -ENOENT;
+		goto exit;
+
 	}
 
 exit:
-- 
2.34.1

