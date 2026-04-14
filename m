Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268F733F8D9
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 14:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178523; cv=none; b=pmCLvwXKazGqRdT3LWbGW6iTzb/yusm9hEhEgsUFavoShEMIPFe7nep2N155NQtzZ0O5sY6QqtL574ss+fpQ7rm+ci2UyTuvIPKo+PTFRvHcHQSR0Mkr10HulJ9C4hP8X/02j+OlySJrG3UR3H2xKB0vqlPb2cHE8Nxm2nPKWsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178523; c=relaxed/simple;
	bh=/MwhrxoIu5RZNhD80qK+rDFnDRJTEReJvh+FoxmXEK8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PmTcHmck07JdaktFZoHH/FGFoHGOlU/9YX6ENrTKG6ejwdF+1cmSJY/ObXoasTrVA8s2t6I56wa6HaMXTuibeInU07utwFZjpnZXXYn7Y0gvpA0npaSEc5B6X5IAk6IApeJM1Krdq8GcMqvmAflJqzGRaAPRPELICmIwlrRb5hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrIcnI/c; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrIcnI/c"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1055772066b.2
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776178520; x=1776783320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AI6lzRoh3NUnk5S17bU5XB84Xw0u3q8VYePy9hi7D8=;
        b=TrIcnI/cBDa/DfaUHQY2/5ov1g3jXK+a2la08pMf+0LFf/ZKSvZF//L564ST07wAYZ
         gWrDSnSqa3IYlJqX77P+mfJY/aGhMvLK4XTxXtzHG17CZehaTzr2aOL8vhCoXZgxSl7G
         NiPtL3zD4ZzrmiLnDq5Ezm6LFPb7x5VNuYumTVA+omavcvHFcWVougYcIuawKR5FemWs
         A4cFq6ARvjiYJInNHLaRnanJckOO9HHzxth+CPjiVgzZ+ItA2d35VhaheBjqmy4YhzYp
         9kRGakPZP58B0UQotDzXnjwcikZSt0hIvuSSRMkbZz3iLxJxIdqHLnkOXdS1kfFhBTuV
         nSCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776178520; x=1776783320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/AI6lzRoh3NUnk5S17bU5XB84Xw0u3q8VYePy9hi7D8=;
        b=eAd7iu7VgO/9AZ3JkR+4Nl63XC3/VpO4E5K20xPazZX7iCaZsxhfMMQMwnaSgpVwT/
         VcLlWcUk/ajIo5C69YqC5WW5p6RgArAy1mreiFjjDZHPfTdjR7WM4rcJ7x+aKVcszX79
         9pwLrnMM546WvThw3ucH5Zgkjo7aAVSTjmZ1MCW+YOipi8vzvgJv8DuFh8X/kV7sXmWT
         TrmcYH7IlJZv37Q2v2M0McAt4/kP/jn3i43amy9azVEpULf24bhLSzzGZbATRxLe0akc
         rk2DNjPojra35Fiqam/Ms571MeVCovTbKDaosrzTTLuRW6Ed6sO+ZPv92dktTWsRe2mv
         CZeA==
X-Gm-Message-State: AOJu0YyYK400BSA0OgJCQ8ObxgJI02mo88vcMRIJrsb5t6hK13jAMY5Y
	9/XttDTl00FsgZKI5LG/IUVavY3kSv0eYTAQWNx5oln2BjIQXNj6rfeI
X-Gm-Gg: AeBDievaY/qj13hIZ7jCzcxC6Hl4nPx/4mQLwb3SIn+Hv39td/FyWZR3IiRvaJn9U7C
	7l3o1bifYrGGm7zUk9KoomXMuWDyRwVDVE5AFkE22GEW2PXA2DzGvctfLFI8LmRLx6aRX6goSML
	jK2nE5mhCEmn2kl/X2tpTVozN6f+5Ii3g+W+3YXlgSFGM1BDZOsurjbTPnX0Yi/h7FsUV0NaQGY
	CGKTQIKR+Tr6tuI4OXW62LN7RVoIofrQHqjLfdotO8JNpIIaqeHjri57RwEpef5ICgYMCG9PIzz
	+M1puXwPfplTDTFcB4Y31cXGOUpvJ0uAJfoOzUgQy8kmUMRQwfQtTzScH0ArQT2lTLidohmVpQg
	NcwbUVbJTZ9g9HqIkDVsSLGk4BJMcy3ilFKx0BVSKsp/EDZrT0cjim3UA+hNQsWJ2ALmtv3aqv2
	mat+sAg/KSX/7iFMFMalYA16fKCkxTghfgz41ZvppKLyGghsLrvh4bIeg9mBO98VZVRik7e3GQ1
	cbAEknSS8VQkBkdnZdOwXylA172lqNP9tYvFsVK10d3M4qHcYNUHLZ9fkTmme2fIDA1
X-Received: by 2002:a17:907:c312:b0:b94:1224:c61e with SMTP id a640c23a62f3a-b9d72792e67mr951642366b.14.1776178520284;
        Tue, 14 Apr 2026 07:55:20 -0700 (PDT)
Received: from ahossu.byod.tudelft.net ([145.94.221.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba0574b41aesm10101166b.24.2026.04.14.07.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 07:55:19 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	hansg@kernel.org,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix missing frame length checks in OnAuthClient
Date: Tue, 14 Apr 2026 16:53:50 +0200
Message-ID: <20260414145350.903996-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413202824.740653-1-hossu.alexandru@gmail.com>
References: <20260413202824.740653-1-hossu.alexandru@gmail.com>
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

Reported-by: Dan Carpenter <error27@gmail.com>
Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
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

