Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4339283CBF
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410802; cv=none; b=llJ7gYLpaQCqkz9qv77VcWXK04bAfGzZXUOUYpWgZG4vir1VOcn3rGSv37EPP+7/Nc8qL+EzOP97OvtyH8obmgf9uTLG/4ev4XU75d/CjV+RPtcK/ErhdRoIJM3tAA7o73Z7Pb9uiLdEGD3CcLlazLgP+fsMHi8lY490Mm/RgKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410802; c=relaxed/simple;
	bh=hF1f/XhdiP2YvKEyxu0ITp6VH91xQhL3/cp96Q6vKMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDbqEECGP+tQrP9Azmd+oFIT8OHgcXm2WqT/LwseYD8GuOLX2qXzKWEISo452a7w4FVJnbm3s4V2on8YBZt4C0uEo3GsMbW0ojArF/LHv4rnzC1UtyHmdDHATSt8rUAux9DT7dyFdJ7pIoMIIWsmhLqIpW/RlQQ1XcNvcZaFlz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPVuaV8v; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPVuaV8v"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bce386d5b85so1106849266b.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410799; x=1780015599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iqsl5WA4SGGND602OHgH3TwkzAtPkOunkBnoxgSNAEA=;
        b=NPVuaV8v930iXdIRhC+pgcRQ40mMTCtjos+hMUvrd2YMKBphqVEBUvKvjQPbWipE0i
         4dIwa+f30FC2ZS6LzerMz9zgGBEgvoSMoRvgDtXqA8yLsTMIbiQFqeF8wmDEhxASBgly
         GA5q1noK03kqjbhjkeDy1Z11hxSouGWex9JNtJbfVDCee2qbYYJmRwxaauYQ7rVOOtc2
         S64KMbRaNGlCYtcBNuSreld5DTh2fDJpnLPVs5XX4G2K/ib+iBiZE+NUbG3k9a/1yi1T
         m7tpdc52B8c4haEUCD7AF2LKVDaJ6A0qcVpN/aPVUbi+o+T7p4f0/hNyHBLuD8jQ1G4N
         LURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410799; x=1780015599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iqsl5WA4SGGND602OHgH3TwkzAtPkOunkBnoxgSNAEA=;
        b=CwIpYl5iAZFCMraxQlsDgMznUP5Yu+/i07F8M3yK7z/Gj0Q8pTtEOpO8Lb4RQaD0g4
         ssliN7W55bksXC3qeUjyjUJYhfw37VpMYJFBSJr7bvsRPEmdOoFNlCgku4hJWGNK+6YD
         moxcJjrifuY/qx6m9UtXfe84dmpONeXtCYwUMR7M7/3AWm/5nq08RWmLuKzSyFGUA4ha
         +oAbYXdwii4a9pyDoeVcXSsGfjSmgb9HIVxkyMLlHP8LITvtacfZLTn8YVgtCbZhTBp2
         +6EkE8d8VR1/TqbG3m7UcVsulOj+og3wYFNK4/rbpFu4un3psfJi5D1ApTg59YHsSrWJ
         O3lA==
X-Gm-Message-State: AOJu0YxxKicQuCjjmRDp2W1E129vhia/6Y+fb42s+0n8hsLBFbcSooj8
	hP6QfRpbKyTdy0u64j9dA+qm68n+LAzBhfISmIRNwTRYUC7LHlgWsGVH
X-Gm-Gg: Acq92OFB8+QX4NEo/Sg3l+H93dMVIgglGTl9kNZrOzRk1VqNVgE6VrUh22kga0C+gkl
	mV0ggcRH5uxu+gYkhwXyN95CxmmmSkUBbAojsTVKdnLn5EbiRTQbHZLq5Xrj3yRGG+Rf+R5oxFF
	oYbcaBHm25NtMadpIlxz+6eWFOtaTHogsc9w6M7G8u6ts5nb/U0/4flN8ZjgAd/0w9hnu4nKvP8
	RvPkQKo8FWYSwwnx9RZsRLAPRz50xggIXqf4wusZIIaav1MSNPplra/EsuVr6YK9eYCZAzLzGVp
	PgKVsQF+fpYLjECwCADyqo1qcdlf3dzRekKPAduYlebtupFtxlpiFq7KQzBBmgLYG5iN0j/kHKZ
	HNR9dZreFsadeqbDggyQp7ncx6K2N1qpm5kxbhnQULCxUnLaDHGKT64Bj59CJMP5Gjth36/B95w
	jws84Z7RD2LDfZCL79Wdj82YZYpgtDQUekw/TCV5z7sNETf8Om6b1kLMTv1qUjzQGCyuAxEDLyW
	F1U1KEVAtL4KgXrefXdG+Oy25JPRe3/ZO+IIK6oSS/xbN/4bgafmyIv78IZ3CCLpQ9xBmm4g4K2
	CCbEmD/frjvICOSiRyCBvGqVFhYMapZ94xmKPXc=
X-Received: by 2002:a17:906:dc8b:b0:bd4:b787:f1d6 with SMTP id a640c23a62f3a-bdd2542d83fmr82049366b.6.1779410799134;
        Thu, 21 May 2026 17:46:39 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdd75f9cf85sm19122966b.53.2026.05.21.17.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:37 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v10] staging: rtl8723bs: fix WEP length underflow and OOB read in OnAuth()
Date: Fri, 22 May 2026 02:46:05 +0200
Message-ID: <20260522004605.1039209-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521130324.754100-1-hossu.alexandru@gmail.com>
References: <20260521130324.754100-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnAuth() has two bugs in the shared-key authentication path.

When the Privacy bit is set, rtw_wep_decrypt() is called without
verifying that the frame is long enough to contain a valid WEP IV and
ICV.  Inside rtw_wep_decrypt(), length is computed as:

    length = len - WLAN_HDR_A3_LEN - iv_len

and then passed as (length - 4) to crc32_le().  If len is less than
WLAN_HDR_A3_LEN + iv_len + icv_len (32 bytes), length - 4 is negative
and, after the implicit cast to size_t, causes crc32_le() to read far
beyond the frame buffer.  Add a minimum length check before accessing
the IV field and calling the decryption path.

When processing a seq=3 response, rtw_get_ie() stores the Challenge
Text IE length in ie_len, but the subsequent memcmp() always reads 128
bytes regardless of ie_len.  IEEE 802.11 mandates a challenge text of
exactly 128 bytes; reject any IE whose length field differs, matching
the check already applied to OnAuthClient().

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
v10: no code changes; add full version history below --- (omitted from v9)
v9: add WLAN_HDR_A3_LEN guard and WEP minimum length check before
    iv[3] access and rtw_wep_decrypt(); tighten ie_len check from
    <= 0 to != 128 to reject under-size challenge IEs
v8: standalone patch; change WLAN_HDR_A3_LEN early exit to return _FAIL
    (sa not yet initialised at that point, goto auth_fail would copy
    garbage into the rejection frame's destination address); add guard
    for iv[3] read inside GetPrivacy() branch (len < WLAN_HDR_A3_LEN +
    4); set status = WLAN_STATUS_UNSPECIFIED_FAILURE before goto auth_fail
v7: initial OnAuth fix (sent as [PATCH v7 0/2] 2/2); add frame length
    guards before GetAddr2Ptr() and before algorithm/seq reads; correct
    commit message (rtw_get_ie() uses signed int limit and returns NULL
    when limit < 2, so the unsigned underflow OOB scan claimed in earlier
    versions cannot occur)

v9: https://lore.kernel.org/r/20260521130324.754100-1-hossu.alexandru@gmail.com
v8: https://lore.kernel.org/r/20260511185314.1625375-1-hossu.alexandru@gmail.com
v7: https://lore.kernel.org/r/20260505211316.3837020-1-hossu.alexandru@gmail.com

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 68ce422305ed..8575b7bd6d84 100644
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

+		if (len < WLAN_HDR_A3_LEN + 8)
+			return _FAIL;
+
 		iv = pframe+prxattrib->hdrlen;
 		prxattrib->key_index = ((iv[3]>>6)&0x3);

@@ -802,7 +808,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
 					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);

-			if (!p || ie_len <= 0) {
+			if (!p || ie_len != 128) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
 				goto auth_fail;
 			}
--
2.54.0

