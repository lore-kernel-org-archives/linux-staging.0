Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E2834DCFD
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 11:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600401; cv=none; b=A1FdqX1qJ/GnBC2DmVBAoMHpF2ZMR9AyzGkFgeWZMOnCoPOSIwPqXRTn0UpEXXrbbVnFUuqvG+qbfhvx3jtAvrr7MgE/VLunffDdzdWkh+kGOwVyO3HYZwaeyOpHMY0UANFntkNxGhWWglhlWZi6od0CGVS2VphXYV/2j4Pyolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600401; c=relaxed/simple;
	bh=RorAImr8MvMOs4Mvvxtqeas3COsEE0bYKanESek/MhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RdkgwT/zQAQ3mil8xFICejQOrK2mB0KVGsh43z0rzRLi2lQwJJMhPCG/+l5Nei9uKha1hW0/FYc4mm85vbXvmWHWyOfouIhd4+ULApuecnX3Z2JRF4zgqunqIH+FOm8OImnzSX1eBkV+DfZ3rxziZdclCxgp1sH7LDeoliO1CZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CwSm6csf; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwSm6csf"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b1981ca515so8179400eec.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 03:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769600399; x=1770205199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdHEEMovVNSA9vh37BRFtvu7Uaa/6HUafe2gUZk4LVw=;
        b=CwSm6csfoUYPmlzLQryyZfvSwCkXUOw9bW18ptJ0xlkvP33zG4nYxCCt3fu144T9UG
         B+Kfnm7OFijbqlLo7Tu8EmsdBYpw5AfxPuqVUC1rlcMJf0AAv7UBo6Yk19ZEjW9MQoIr
         CmmbG+09sdSCbEIglPePWBZT7dMWnVGVnYmW5mJiUL7zZNLSGwPAjsNahQgjHwJ9ZX23
         XS5qDc+j54Qmxplp3n8jhI12iMZ8FSPB90u8eQtYtL25Rr9+t3MFNsnXdT/TIv0n/f0M
         ovLrTPR6NhO3SKIfRgfGDCuAYU3LnZCwv+xQT8Tzt0fwpgtwLG5WjIk4UXFPmwtm5COO
         iLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600399; x=1770205199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zdHEEMovVNSA9vh37BRFtvu7Uaa/6HUafe2gUZk4LVw=;
        b=M9I3RWKf+ynrDsEMLcNJAroHARC/MXulNSCT41Irxyma7E4+gEZh0OOJg1BkmkJmH5
         xizt/R4xQnNSWVpQs06fhIfNnqYITRNop5CSoBs6gZK9CRTJMZDNIjispo285dRnoofS
         YZF6V9G9C3ZRXxuYEF+VbAE5zYchtdFHJWAFSMA+etTlOzDfYRUGhZfIbFSpB6egaTPV
         H5IauK+kAjbtl5IClFzRPAHux9w79eXiMknCQV990qWODugMgzC+RYbRJ81gLWf575tY
         vhah2c/btko2AoaspPcaD6jVmEPT0nndrRH/+7vS+n6RT8vtGG+WLQhbx/XG0p4MCOdh
         vfHg==
X-Forwarded-Encrypted: i=1; AJvYcCUDD40YEHmFih5d5xPoOZT7zNj4FqCfK9f205+OWetTn9q+miUDCSocwUfNj0UaM1oEcrpHVzEIUqmDZaqJ@lists.linux.dev
X-Gm-Message-State: AOJu0YwYGv21+S81O19Dcla3qp+hi2ykn1Mn7ch1aVDY2sZsr3wW3nPo
	VJLt9oaDWzlHm5tcsf2f0MKoHDM6vmCuW7i4JBOSuukTybjKMHQOWQIh
X-Gm-Gg: AZuq6aLkYHYGJM9vxaUKRD6J1AEVDpXTpOopzXj5UXEdULhzrQ1oYDM89AXXQoYZeDY
	kP5rG5T3Y/M67nDyYoNDSFxKBrsgqFxERlm0GxFaGcWvUmI9FNKxHrGyCmiCjOI0ERTPos4VCH0
	3nzYJo27WoWzHk7CEn57v5ga6XiIQVQIqK9ej/InIiGasCYpX3sb+2rDx0pEZz9xOK621eSO29U
	RP+gWrZN6cI2Afc1Ud6LBLgi3/g6sWGmpsFicQMB07OzuRChsRGTpNaaAGvq9o46JtprZlO9Dai
	bF/a3Y7eZdHUhaDrvljypf3Yolt8Oa3FF1yq1D1nWFP5AGNhIXR0sP192ud5aPRxjLCjCWjEQuS
	t7auFevZDHBeo1ZqZ4xpacO/XWQrtNP9gmYHlNe4ZP3ehV0MoOXdntKIGxv1uSOK4iG2cg6t120
	LKR3Az3El4lY+keWiJKiZsHLbLsg==
X-Received: by 2002:a05:7300:ec08:b0:2ae:533d:19ee with SMTP id 5a478bee46e88-2b78d9fdc3emr2893150eec.21.1769600399043;
        Wed, 28 Jan 2026 03:39:59 -0800 (PST)
Received: from localhost.localdomain ([20.171.108.164])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1add664sm2216535eec.26.2026.01.28.03.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:39:58 -0800 (PST)
From: Tanjim Kamal <tanjimkamal1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tanjim Kamal <tanjimkamal1@gmail.com>
Subject: [PATCH] staging: rtl8723bs: constify _action_public_str array
Date: Wed, 28 Jan 2026 17:38:59 +0600
Message-ID: <20260128113900.44852-1-tanjimkamal1@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This array is never modified. Add a second const to make the array
itself be placed in read-only .rodata instead of just the strings it
points to.

Fix a WARNING issued by scripts/checkpatch.pl.

Signed-off-by: Tanjim Kamal <tanjimkamal1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 92b12a13d..febc14de6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 	return true;
 }
 
-static const char *_action_public_str[] = {
+static const char * const _action_public_str[] = {
 	"ACT_PUB_BSSCOEXIST",
 	"ACT_PUB_DSE_ENABLE",
 	"ACT_PUB_DSE_DEENABLE",
-- 
2.47.3

