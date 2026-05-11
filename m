Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE4F4C9009
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778525617; cv=none; b=X2XVGWzbbobJK3eP3xiiMqy+NzxZMfMssMjc65mIcxNris/ZjSpfQzHc1+O5swunJgtaE49lzkUJJHM7n+JRF+7J3hTNMXyhcelJVqGx4HK7egYxS2nFLWTQIAj6eo42Djih3V2lgIGTXa3v2xZsWlm29o2lv6lrk9AhoYp8LkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778525617; c=relaxed/simple;
	bh=1nRE8JOy2JLcbHw8X50R2pYMpRN0QI4DGUktvzLnKfY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F3XnrKdRVmm9J/VGaIMIHwh60srpeJQvo0SkmcPxADQYs9FM8+lX2C/7mJ/rh2RE4KB5cAGglukMbxbaDKk8WYWlz4dVQT4lrSP5dVKaD1nsu4t/AaiLJbsGJWaudhKkDTzBSv5ZjmhocvLvDP207Te1kb2d45oc50qOrb+wxvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmgbNVNo; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmgbNVNo"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8f97c626aaso779493066b.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 11:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778525613; x=1779130413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IDY9dxT2zvqgp8lt00rKuBPK9aYcf3HfzHToSBInp3M=;
        b=DmgbNVNoXGic+Ty2Lo4Ejce+7wOyVBSJFbRohTsFvMLQcX2h5xAqlBsmPTQQVF2xue
         4d2lvYzzTtiSLqeydyhDutGasE9X0DewyUo2RmK8M7fPQShzGGFJpWXAHXmmIUZUARS4
         WR+32d60GKoynD1mL1WChZI4cVvgnfCgGv+BBwhGl1+KgBJsvmrGst+kby4SqUzXmjTs
         CT6VRwH8Ektb4OWlEva8KbIckR1yVnh92d92MtTQC8VNJzQRnOGvcgucJHasvGmigxoc
         EBiJYXzC4tgtBjg1s9eE7bxQSewmc1SfKSEOs6fdAVyMVD3Xb0GyglxBUteKYU5M76FD
         bRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778525613; x=1779130413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IDY9dxT2zvqgp8lt00rKuBPK9aYcf3HfzHToSBInp3M=;
        b=JPi3XW9zw/KcLVNm2KBci7ZWcfDbt5nKZ8ksChRO1gm0yk8qh0efP+sx4CPm2Hu+jg
         WqL7q2AD0RjGbHPkncZ6IcyLd0KkyDiCrCx08YIlDPsob9wNz48aFnomaP/Iyi8K4oza
         2+RcVfUM7n883DTcr0QbeFEKdIWw7IqiLcnLNlirafiyJQ+OH4XuiR/IPcS5g/D6v+z3
         Rz0g5Gw+rAkZQAFEos/dSmIbOLSntyGAlE88+KD/VGOhMXY1USDMdq/27Gkbg+WZjPJ/
         02KltHGWFzygM8/cGW2B91jiuI+ppklnH1Qdt8sXnpAvWaiobCqrzUG84jyGlg8V3Mvu
         jedw==
X-Gm-Message-State: AOJu0Yy7glzgSnFYsQ0CzZSZyBhgfSr7ItM7LTDCnPn5aZimpGsIOoFv
	1RKLtchKJMF3IEjSFy5ckX73zL46hxknGvRj+Q7+R9xcELFCr2eBXEQU
X-Gm-Gg: Acq92OHBZw2lYZpa3UrDwG9FvMpwgcdpzgJpGZpGdCIwbyhHoqKkklNrJmeFoQQNZE0
	zNZ6r5mGlb+iKkklzd7m1oKHZR7S7QbMvPAxts2dJ9RizG/S7gKewOmBSlo99sTKoLyg29oYm9t
	2QIks+iAArnBSEm5K1lKGJIOPVaZRUklazTe98QfUoZSotNIlqfYWL37gRjlmsF9puoWON1MsjS
	FcLxyswuLrBttVLhHfR76YibTXeh3zY0YddiWvF1WaclZSqFrrnZEkJRfJTedW5LFbO1DEjWfND
	2HPvl/pPKg+cmlYN4udZuRGeIEn+5u8ERmtqb/pIxIOeL9OGBq/y2PhsqoANYJscw1pGaxXYxdX
	S+QJjXYDpRxuIV8Dfrcpeny4D0GD/k2pg5HY+Dola6I+Af3fKtE+rsZ57r5ZEwoxIbUxA1MSo6r
	rdqQu1CFyBigEAOCgilpoL3d6tG4D4JP3YPTUeQhELo5G2HTIen7ogHRZJOLQv2WftuzFkv2SFH
	r6xpM2NOdpbgT7XLmGVTfEoVsoG09pVjk7vOL0iee2eHbitXA9rdn7TsLmez2JPH4QznxwxzcbR
	pD9P2AwvI8s=
X-Received: by 2002:a17:907:d28:b0:bd1:fe0f:1c93 with SMTP id a640c23a62f3a-bd1fe0f2210mr131603366b.6.1778525612748;
        Mon, 11 May 2026 11:53:32 -0700 (PDT)
Received: from ahossu.localdomain ([2a02:a420:22d2:4061:8cc7:b361:391f:af99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcd7bf48623sm310803366b.48.2026.05.11.11.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:53:32 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v8 1/1] staging: rtl8723bs: fix missing frame length checks in OnAuth()
Date: Mon, 11 May 2026 20:53:14 +0200
Message-ID: <20260511185314.1625375-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511185314.1625375-1-hossu.alexandru@gmail.com>
References: <20260511185314.1625375-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three out-of-bounds read paths caused by missing frame length guards in
the AP-mode authentication handler OnAuth():

1. OnAuth() reads GetAddr2Ptr(pframe) without verifying the frame is at
   least WLAN_HDR_A3_LEN bytes long.

   The first operation on pframe after the AP-state guard is
   GetAddr2Ptr(pframe), which reads 6 bytes at offset 10..15 (Addr2).
   If the received frame is shorter than WLAN_HDR_A3_LEN (24 bytes),
   this reads past the end of the frame buffer.  Add:
     if (len < WLAN_HDR_A3_LEN) return _FAIL;

   Using return _FAIL rather than goto auth_fail: the auth_fail block
   calls memcpy(pstat->hwaddr, sa, ETH_ALEN) to build a rejection
   frame, but sa has not been set at this point.

2. OnAuth() reads iv[3] inside the GetPrivacy() branch without checking
   the frame is long enough to contain the IV.

   When the Privacy bit is set, the code sets iv = pframe + WLAN_HDR_A3_LEN
   and immediately reads iv[3] to extract the key index.  If the frame is
   shorter than WLAN_HDR_A3_LEN + 4 bytes, this reads past the frame
   buffer.  Add:
     if (len < WLAN_HDR_A3_LEN + 4) return _FAIL;

   Using return _FAIL: pstat has not been looked up yet and status is
   uninitialised, so goto auth_fail would send a malformed rejection frame.

3. OnAuth() reads the algorithm and sequence fields at pframe +
   WLAN_HDR_A3_LEN + offset + {0,2} without verifying those offsets
   are within the frame.

   offset is 0 for open-system and 4 for WEP-encapsulated frames.  The
   reads at offset+0 and offset+2 are both 2-byte, so the last byte
   accessed is at WLAN_HDR_A3_LEN + offset + 3.  Add:
     if (len < WLAN_HDR_A3_LEN + offset + 4) goto auth_fail;

   At this point sa is valid and pstat is NULL, so goto auth_fail is safe.
   WLAN_STATUS_UNSPECIFIED_FAILURE is set first to avoid sending a garbage
   rejection status code.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v8:
  - Change if (len < WLAN_HDR_A3_LEN) from goto auth_fail to return _FAIL:
    sa is uninitialised at that point and auth_fail dereferences it via
    memcpy(pstat->hwaddr, sa, ETH_ALEN) to build the rejection frame
    (sashiko review of v7).
  - Add if (len < WLAN_HDR_A3_LEN + 4) return _FAIL; before iv[3] access
    in the GetPrivacy() branch: the missing length guard was a new OOB
    read path not caught in any earlier version (sashiko review of v7).
  - Set status = WLAN_STATUS_UNSPECIFIED_FAILURE before the
    if (len < WLAN_HDR_A3_LEN + offset + 4) goto auth_fail check to avoid
    sending an uninitialised status code in the rejection frame.

Changes in v7:
  - Add frame length checks for OnAuth(): guard before GetAddr2Ptr
    (len < WLAN_HDR_A3_LEN) and guard before algorithm/seq reads
    (len < WLAN_HDR_A3_LEN + offset + 4).
  - Correct commit message: rtw_get_ie() uses signed int limit and
    returns NULL when limit < 2, so the prior unsigned-underflow claim
    was incorrect (sashiko review of v6).

Changes in v6:
  - Add frame length checks for OnAuthClient(): guard before get_da()
    and guard before seq/status reads.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 68ce422305ed..c3f2d4e5f6a7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -687,6 +687,9 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	if ((pmlmeinfo->state&0x03) != WIFI_FW_AP_STATE)
 		return _FAIL;
 
+	if (len < WLAN_HDR_A3_LEN)
+		return _FAIL;
+
 	sa = GetAddr2Ptr(pframe);
 
 	auth_mode = psecuritypriv->dot11AuthAlgrthm;
@@ -698,6 +701,9 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		prxattrib->hdrlen = WLAN_HDR_A3_LEN;
 		prxattrib->encrypt = _WEP40_;
 
+		if (len < WLAN_HDR_A3_LEN + 4)
+			return _FAIL;
+
 		iv = pframe+prxattrib->hdrlen;
 		prxattrib->key_index = ((iv[3]>>6)&0x3);
 
@@ -709,6 +715,11 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		offset = 4;
 	}
 
+	if (len < WLAN_HDR_A3_LEN + offset + 4) {
+		status = WLAN_STATUS_UNSPECIFIED_FAILURE;
+		goto auth_fail;
+	}
+
 	algorithm = le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset));
 	seq	= le16_to_cpu(*(__le16 *)((SIZE_PTR)pframe + WLAN_HDR_A3_LEN + offset + 2));
 
--
2.53.0
