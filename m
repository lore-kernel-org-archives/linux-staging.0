Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35EE3CFF58
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 21:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778015608; cv=none; b=PitwmFqAJZgkPHxq2XHQQzA6qRDrCm24Xz0SbRif3rE05GAXxKS65IXf+Fn6LoqpvxuVZNIOwQXE3rUaWnFv1K/gNxGL95pJI3SRk5q5G9GFBglqD5hIEfj+WvPiiSnOffLwwks0fYolOL+3galfcyLJT3/EMqXK6EKL/Eq44m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778015608; c=relaxed/simple;
	bh=23flgCKPmr/64LZQVG5CYe9gxCAybtMU8IEcjYVeovQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Quy6XGQVJ/Zm8cmqnlZKdakiZxBz5UqoD1ckLKioLLydTVUP/sPlQ0P8V2pQzgKlJmaSfUeVeou04+cknkChA82YoOtQnuDOJw0IJerRS7UOHU+iZlsSxV/cJU11hDn4m4VIl7YsZtSlJZXWnCb9P400TxXN2X0gV8tg64RkmYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEv7qEYz; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEv7qEYz"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso40698775e9.1
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 14:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778015605; x=1778620405; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV8sC4ksQylO6CsH5rg4mb+3+8qM/80Gf6RZW/LIH2k=;
        b=eEv7qEYzlUNVoVU0twV0pu7oLFQRlK8MjHGNamom+uZWRJhPfuezTO/kS+1ezbxd1S
         ZRZYv4tu9kxhJ1xntw9pDJo56xdSsLq4z3xzJIVQKy8yh/duxwv6QzvYGSBmbvuUX4ne
         c/xgLv4JceTDRaneM8Zn9omlNoYUNSGG+DY3+y2c7QLDQHynuwe4fcaxVZFU8ClpdZjw
         8dJi+QzKxNgQErqxlKNcMdFdZ92kMXj4+zLHp14kTKOk8Reh8aAPtvNdxsQe3U+4cAAS
         SdUOjIn6VOk575oge4yGPhsC2zHmYOTwNuYNq+NmdjhjV1vkVtJQJ3NlxizZycjCPtSf
         w0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778015605; x=1778620405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MV8sC4ksQylO6CsH5rg4mb+3+8qM/80Gf6RZW/LIH2k=;
        b=kqhlP+gUH5l+0J2rQ8qa2TIP4wPTBLVo31o1M++J2XZdmijK7Yzg/IzksVOuf9m+gS
         K37lJgncZFzTGYKzbkSTPRtVHs+4lfTHP4GOzE8/11DsJafkMbzcP1ObOmsfKu+Eapap
         8MrRV2UR9gzpoTzL8fxwQ1bK2twh/zet1+dDHVnVmUdne9JNthzARyb4oYClxJGDGVq0
         mN3/SZ7t+I+03K+SBt+R5fKwUQ4QW1ptPuOaMX/eMdZR70TdU6gbStL/Cwk7aldB/Gep
         orpFIQ4xzvV71B/UCJzDag1oo+ihmz74ZVxLnNENWLoCX2PtuS5HG09ZSlVVcB3G+pG7
         aQOg==
X-Forwarded-Encrypted: i=1; AFNElJ9nn2S5l5CAkrBt/+XHkaxn9aBGW/lA14VBWPUwRoBXd7dHZigLnimz0FZE99WhCN7hkwObagTIrZ/FFICr@lists.linux.dev
X-Gm-Message-State: AOJu0YxelK2id9/jBnKylXcMMDx8QIDIKAhzNE7TOsK5sQthyx233Hvx
	1DI2cueWXIH/JvP9GVzWj777oS7OqZj6iYeNnnpQaYCnJCuwW35utM03
X-Gm-Gg: AeBDievPJ3fGKsls/i5quohnxAPNw+0GTLK48D0L65FhvERpTh2iXSXDbUeU0maS8y9
	3adFWl6vmAyCvnDyaYPZcsW9N8ntwVZcisSG8s0GKkE0iajaa4umZp5RfbB3B7hbAgEe4BmvQTN
	9h71NVcIk20Lhe4ivXD9IVAJl3nofSLRbTas6Ku21tYMNwsHzs1sghAHB5tk7XCSZIh+wFAjYev
	qEwuFy8QOKNIpb5IVfFVF974Zvg6n+DC6a1GX3n0nzSOF8yu/OPSRNRhVoLYzNzmLCOReuwDJVO
	8sKTj95BHx179rHjvh4Q5B5dhOo1pDIw0xW6yaTIbr/2+p9DTOX3cLWrzoD/JeNvU5Y3VsyDURm
	n/NyWFHilqBdLvJc5I/EoP00fFyCPZaAMtZlxbOir4SMd5TJxfULIUBSpr8jwK4VVHMUd7mqBZd
	KwUDAoZ3hJPDG+WRw0SBNqVl3Cd7D/O2Kgvcpc0MXzbWjAlRW9CoMKMDQOZRjt+PL1VldJt1N1E
	f5dk2V7rdMwZIGKfd8lSDqzZ9TwhfnTwyMC1ExGfmqIznYsJ+jHF2Ps5T/52KexGNnUiNc=
X-Received: by 2002:a05:600c:4f53:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-48e51f44577mr13674245e9.22.1778015605001;
        Tue, 05 May 2026 14:13:25 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6fffcsm403400045e9.4.2026.05.05.14.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:13:24 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	stable@vger.kernel.org,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v7 1/2] staging: rtl8723bs: fix Challenge Text IE length checks in OnAuthClient() and OnAuth()
Date: Tue,  5 May 2026 23:13:15 +0200
Message-ID: <20260505211316.3837020-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505211316.3837020-1-hossu.alexandru@gmail.com>
References: <2026050453-scorer-rebate-3898@gregkh>
 <20260505211316.3837020-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two functions process Challenge Text IEs without verifying that the IE
length matches the 128-byte buffer:

1. OnAuthClient() shared key path (STA mode).

   rtw_get_ie() returns the raw IE length from the received frame,
   which can be up to 255.  This length is used directly in memcpy()
   into chg_txt[128] with no bounds check, allowing a heap overflow of
   up to 127 bytes when a rogue AP sends an Auth seq=2 frame with a
   Challenge Text IE longer than 128 bytes.

2. OnAuth() sequence 3 path (AP mode).

   When a STA completes shared-key authentication, OnAuth() calls
   rtw_get_ie() to find the Challenge Text IE, checks only that the
   IE is present and has nonzero length, then calls
   memcmp((p + 2), pstat->chg_txt, 128).  If a rogue STA sends a
   Challenge Text IE shorter than 128 bytes, memcmp reads past the
   end of the IE payload into adjacent packet data, causing an
   out-of-bounds read.

IEEE 802.11 mandates the Challenge Text element carries exactly 128
bytes of challenge data.  Add len != sizeof(pmlmeinfo->chg_txt) and
ie_len != sizeof(pstat->chg_txt) guards to reject any element whose
length field does not match.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
Changes in v7:
  - No code changes from v6; dropping Reviewed-by: Dan Carpenter because
    patch 2/2 changes code from the reviewed version.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..dd3c94d314d8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -802,7 +802,7 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
 					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
-			if (!p || ie_len <= 0) {
+			if (!p || ie_len != sizeof(pstat->chg_txt)) {
 				status = WLAN_STATUS_CHALLENGE_FAIL;
 				goto auth_fail;
 			}
@@ -891,7 +891,7 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&len,
 				pkt_len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_);
 
-			if (!p)
+			if (!p || len != sizeof(pmlmeinfo->chg_txt))
 				goto authclnt_fail;
 
 			memcpy(pmlmeinfo->chg_txt, p + 2, len);
-- 
2.53.0

