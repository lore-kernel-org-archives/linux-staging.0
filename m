Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598DC340281
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384267; cv=none; b=hkVQ7dEDLxYehuoCumXeT/JW9rcQXl7HcidcxeDDzyvt4mrJ9QtyRpneCKaw/vh6h7yOKBCyaCKBQ9nfGXdXFBLrR9uHUE+BASnxBOwcxVxNtvyQWRWQf2qWEtkXHNi2KKnm4LilHvpBnT+jp9uiIHYZ4Rtsmjv8JVDFyD8u5J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384267; c=relaxed/simple;
	bh=WvXwoqID+W+qQF7PnB69MiuKzHz4ZGK/2zS7Kb1WCJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XuDlQD430bXvhRQsXx8X7YuWTwisHs5vJLCBz94ByBuXHBk0g6N3G2RVZOg1/403rdZ0LHznSUMZdNAqTCZMpZY7tx2x+blcWBs6vqQ9IafrYguEEn7h8o1fD/qeMt8IUBYST0ez8EVoZXL8tj9nN8SCFxiNlaLGE88moMuoDXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqdyl5XN; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqdyl5XN"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56d933b555cso1161049e0c.0
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775384265; x=1775989065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n5p+dCyDkNnPBsGngHUJndKG7h0qsW6y+KF0M7NEV8=;
        b=dqdyl5XNw4AmfyJfvguiDFu7G5b6tjEqzjuq/EoAhNamaarNSR83IuZ29srPUwny7w
         9MEPrcjMMnfLtT/A+jJZMEJVvPVxXREIoiyiDkPXIvA9pD8SeOg012sD2ZI7NWNRjZ6j
         4bojJy+oafpp8806bawCFZL309xLvrW5lU0rDuDimON1zGScTVWLs54IDoz7n99KsTJm
         W9+Bu/m5rm+TV4DNWs8QHn6t1A+cYjpb5Gv84jFzpizbmXcaZezD70OjB6LwM/y+WcLo
         aVThqqMtImtWda7SBcgii9JZ8Ihs4W+NtUvHnkP+cNKGIqY0Tc4dshprgBXjagU4Ua11
         qmYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384265; x=1775989065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4n5p+dCyDkNnPBsGngHUJndKG7h0qsW6y+KF0M7NEV8=;
        b=jRsJfRDdQvkV5VTWoXnssgGTvSS0pp5JdTui5IJ+h+DteSpwSKt5Xn4DijsmD7RQDA
         +vcc1020iLXKZ+FDb+tGUK1EpjNgYU7o8bk2qDlyYGzY+SEO7IAyuFYbWd5qhuEWACnJ
         3DOg6OI1dUtZtc7H81nOrsiemJjMdNzXAJuPYj5tbUXWRgMX3YnbwwpHA8kSHOTLSN8p
         7B+gIynLLLpf/cd0Vu0GDAjFDQxXOz8CN+TqRPe9S2HMvtisjV79rUl/7rIDRqHG1cSH
         AcnqNRxUN7cnXF8x/is0Y5rwX0lIEB0bUCEWuWxSMoaIllkPgVo9WiwrQCoQBJjc8JCV
         EOxA==
X-Forwarded-Encrypted: i=1; AJvYcCXNzwdYxovK7PaSnlSxDF/SkJ/DW9YIq3IGPAdfIvd/Fmj7PSHEHv31bfUGMshaNSiMXK/PLUOEuiFHHzb9@lists.linux.dev
X-Gm-Message-State: AOJu0YwzajQB/RFRn2agjlL6FqFkASPmaCCBcFMGLGUPPvC6ErreWRcP
	dIIMOSxvDP877nSNPbLyjW0jWyXUEuXQXX+6NkGe/iP9sWNEhFB4ycbc
X-Gm-Gg: AeBDietIWhSZjfXuv+uu7pUwyu0nHi5ahbqGP0/bEa4yoLntPAbF8JtlB5CMCa4MPV+
	If7O/z12LpvSopVthIibdSHkCCT56MS2oVM+1eUJeR/TUm0i4SWy5SjwoJj2k8v+jyL2DMMmKUV
	CE5yGJqaOBlMLwbgj7gSXtx15hSKK65gBr3UGVnPaB4qIAAWtZGSWlvsnrme4UthIIWtOfslpL1
	z8QWUj5KK9CQ3G+AXFs29FC27nWS7Zhe0YaUHseT1RLtZCLoRZ6zI4v9gPj7ECLGOMPm7MODJC1
	URVes1T07N2xtJI367bd2RwQZUA497oyZhOXirujfMd2vtf4uooHQEfd9NhQh5eyLMmbdU62jD/
	/Lc3jfea4T9/B0IjxZc2q0HDZLCfTSL2a8bc4N6oa4ZdcSKQC2255C2f/3Y6XAp68XOfebRU5PM
	Kj8Y6f+4Duh6lzGOUC9YqEsKaCebpJWNy0xQsNaq7B
X-Received: by 2002:a05:6102:4a88:b0:605:38d2:26d1 with SMTP id ada2fe7eead31-605a4f65a2dmr3497198137.15.1775384265193;
        Sun, 05 Apr 2026 03:17:45 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm10473385241.7.2026.04.05.03.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 03:17:44 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Sam Daly <sam@samdaly.ie>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v3 5/5] staging: rtl8723bs: fix negative length in WEP decryption
Date: Sun,  5 Apr 2026 11:15:48 +0100
Message-ID: <20260405101548.124829-6-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405101548.124829-1-delenetchior1@gmail.com>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtw_wep_decrypt(), length is declared as signed int and computed as:

  length = len - hdrlen - iv_len;

If the received frame is shorter than the combined header and IV
lengths, length becomes negative. It is then passed to arc4_crypt()
which takes a u32 parameter, causing the negative value to be
implicitly cast to a very large unsigned value (e.g., -8 becomes
4294967288). This results in a massive out-of-bounds read and write
on the heap via arc4_crypt(), and a similar overflow at the
subsequent crc32_le() call using length - 4.

Add a minimum frame length check before the subtraction to ensure
length is always positive.

Found by reviewing memory operations in the driver.
Not tested on hardware.

Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v3:
 - Rebased on staging-next
 - Sent as numbered series with proper Cc from get_maintainer.pl

 drivers/staging/rtl8723bs/core/rtw_security.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a00504ff29109..f3bc2240749a4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -113,6 +113,12 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 		memcpy(&wepkey[0], iv, 3);
 		/* memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[psecuritypriv->dot11PrivacyKeyIndex].skey[0], keylength); */
 		memcpy(&wepkey[3], &psecuritypriv->dot11DefKey[keyindex].skey[0], keylength);
+
+		/* Ensure the frame is long enough for WEP decryption */
+		if (((union recv_frame *)precvframe)->u.hdr.len <=
+		    prxattrib->hdrlen + prxattrib->iv_len)
+			return;
+
 		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
 
 		payload = pframe + prxattrib->iv_len + prxattrib->hdrlen;
-- 
2.43.0

