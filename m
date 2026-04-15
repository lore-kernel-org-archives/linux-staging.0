Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D902EC0AE
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246401; cv=none; b=jyNIfgyJciu5PgsUzA92rqSuaEHScHzuB0Dh/xsAh7csaUGAh1EHsyrIyLPbgrDngsANUm4NCuVlaGuPD1q+FCWLInMEiXVhKUg/ppg7+L7jp1BsrxPGbSjS7lpVXUIcA/BhXC2R0StzfJdl9Cx+Pzn0E1yaS6UGlkme+G57bxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246401; c=relaxed/simple;
	bh=LKL/MhWeV1FzrCZwdQLSjCSaRmITso0Q7UDbgZ9YwdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JooE5d9UFINHn0RaQvrZHAZ7jERAHCfNFGl8wAsucbFIg4+htg7UQqUvHGveaKWUyJuTgYAYT7bEDcliRXumDIYoueKI8MFRHS1RkPMN50Kx1g3XwZ2BB0ZGZjUMJYuNWiGElfK9UjtiEy3T1ySVChx71fdQlj+5ryQP11Iu2jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuiAaQ8l; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuiAaQ8l"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c280322e0so799738866b.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 02:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776246396; x=1776851196; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMZ3rmolb4xRGVlwbHJI7Qiu+rWBXpl768B1YvbmjeE=;
        b=QuiAaQ8lZLVm114q+Sz0t878plHzCGjCtKkevdb/Ao17PU4vrYQ3bh05Qr2hfh7YDl
         FEKnlwEqPtWvBHjUHF+efzR8sFSRb05hygj68FT6BDmMkWP8UrWDVHar07qEEip1xLO4
         VDMg+is0YKwJyZl0iQQbtOYBVC4jRPWcflgzo5Se/04l216VtwI/G5kV97J5ETeOB9gL
         2Ycs+tOcsci9aBtFxsYOO3vAD6vUFifNEX3F4zn8Ewx5pKPWPkeXhQbB7w/6cp7IBMQk
         WyrTUBQNczzjcPPoMxDqZCMItrAhkKw59AvcfFFyCwPThIKK8jHFX+sahcHqv2Z+wAmG
         uGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246396; x=1776851196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kMZ3rmolb4xRGVlwbHJI7Qiu+rWBXpl768B1YvbmjeE=;
        b=oYBaAW8IfzXHrnfe4ZBfbIOETOUp/euXyxcfVJJjkPcLHeiYvrGxa1Ay/ch0G3ZbeX
         92Kb7lvcjzS6WTGF8MpNA1aMlon7AL+xohvxVkPWfCAFtWKC0CvH8kGylYcGD9TLznF3
         TrjkvnsoanHSNnjm5pErPx8M0yWdkxyr7JmAspnij70z0TTgVAqwUXRK9Id7TmsVILmI
         DkK1Up3/cMgoyvdoZGnlaNeybqRtJloc7JsAu9b4WFncJjKxAxyr7r73H6cERisKFbYc
         flhOAttb+f9xHQgsG1wX7tULKGiTiK6bRbdfcFNgFW4JWW6WYVsPqEoyyWc21fJP1TW1
         ibFw==
X-Gm-Message-State: AOJu0Yy7nuCHaH553c8+nEnKFXi8HakKkXZPpjUiCGY56BAqoM1rLrWa
	7GzOJ3cykdTh2BOi6wovyYZEEcT/p2841E6xZvTBYSIVLlv/TRf1uV4x
X-Gm-Gg: AeBDiev1921jqz147PcWyhvWGBCsSlu2ieRSuBFsQ+j4+p1GKBeIrteVfGFnp6hQ2VJ
	HMqysu7wKEkdUTzCbDgcJZBpdhgb6ccod47ivrTh7tyFF/ApkkYCE4gdNVR82BXj3uwhljrkYQr
	KiAPi7vI8sQodWRGjs3U4M49JADhrzorqwg9xlG4cEsPh9o1l1f3VPjjImxc0iyZSSCkT6ab+lr
	EFZrqwaoVygQ/NcCpUgS7YOVcy37k6GAK3MXs8Yn7gaSVMFuBxJNEiQ6I/hWBnDO5HYyH5SuM4P
	AUif62IIZ45kunvul8tvZTIiL9tXocMO24KipxbGVDME5PEOR/Bz3a1iJmQtIpbrQvlQTL0JxBx
	fflEUgnv+M3l7tSHd73Nno0Sb9aFRdEV6VSzSpFuFJJOfWycrtQbz+8syD4dvbdIwbH/h2ST4nq
	WZEXpvhyTq0nS+64/kfx98qSzR/G+o6rWtawiITcPDV4XKd/gOXPvRz7r/th/1hyTmYeEguea6M
	mDUwW4WPSystEI5ygCl9uTg+AmUMv0GWnfrXfyx2WRYHxg2bIQW6T2mWHqW8XqlnI+XnixJdEEW
	r4KHnVIkhKhM8ifW
X-Received: by 2002:a17:906:f582:b0:b9d:6109:f1fb with SMTP id a640c23a62f3a-b9d72440757mr1236270966b.11.1776246395751;
        Wed, 15 Apr 2026 02:46:35 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1778c4e57sm39310166b.47.2026.04.15.02.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 02:46:35 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	stable@vger.kernel.org,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v6 2/2] staging: rtl8723bs: fix missing frame length checks in OnAuthClient
Date: Wed, 15 Apr 2026 11:45:05 +0200
Message-ID: <20260415094505.1115208-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415094505.1115208-1-hossu.alexandru@gmail.com>
References: <20260415094505.1115208-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnAuthClient() accesses pframe without first verifying that pkt_len is
large enough to contain a valid 802.11 management frame header:

- get_da(pframe) reads bytes 4-9, requiring pkt_len >= 10
- GetPrivacy(pframe) reads the FC field at bytes 0-1

Additionally, when pkt_len < WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_ the
unsigned subtraction passed to rtw_get_ie() wraps around, causing it
to scan well past the end of the buffer.

Add an early check against WLAN_HDR_A3_LEN before any pframe access,
and a second check against WLAN_HDR_A3_LEN + offset + 6 after computing
offset to guard the seq/status reads and the rtw_get_ie() call.

Suggested-by: Dan Carpenter <error27@gmail.com>
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Cc: hansg@kernel.org
Reviewed-by: Dan Carpenter <error27@gmail.com>
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v6:
- Add hansg@kernel.org to Cc (original driver author; accidentally
  omitted from the v5 series)

Changes in v5:
- Resend as 2/2 in two-patch series at maintainer request
- Add Reviewed-by from Dan Carpenter and Luka Gejak

Changes in v4:
- Replace incorrect Reported-by with Suggested-by: Dan spotted the
  missing length check during code review of the heap overflow fix;
  he did not file a separate bug report
- Add missing version changelog; correct subject line version number
  (previous submission was mislabeled as v2 despite being v3)

Changes in v3:
- Add first check against WLAN_HDR_A3_LEN before any pframe access
  to also guard get_da() and prevent unsigned subtraction wrap
- Rename subject to "fix missing frame length checks"

Changes in v2:
- Add single length check after computing offset to guard the
  seq/status field reads

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 90f27665667a..884cd39ec756 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -860,6 +860,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	uint pkt_len = precv_frame->u.hdr.len;
 
+	if (pkt_len < WLAN_HDR_A3_LEN)
+		goto authclnt_fail;
+
 	/* check A1 matches or not */
 	if (memcmp(myid(&(padapter->eeprompriv)), get_da(pframe), ETH_ALEN))
 		return _SUCCESS;
@@ -869,6 +872,9 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 
 	offset = (GetPrivacy(pframe)) ? 4 : 0;
 
+	if (pkt_len < WLAN_HDR_A3_LEN + offset + 6)
+		goto authclnt_fail;
+
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 	status	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 4));
 
-- 
2.53.0

