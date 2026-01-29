Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC53328E0
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 16:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769702681; cv=none; b=lIkFvvff3TdiUimVmhbCb4voNTrFvZLkUxRuWI4KB/iq/koBD8gfykoWF0GhkCY1iYzd//EvGdGetQWhTM3aXoe0/NEbcDUbFxOazGLJjBfRWNMHBWowlftXBswvTwol3BaBYdkr36YW5DQgXKbWe/1fTBcrPunMgGrNelwrIbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769702681; c=relaxed/simple;
	bh=zOfSPCiFKqmv34rNskZtHpQC4of07HLOi8SsOKfq/E8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QP+sHWXmQ3ZDsIT65Uo5p6/K8NU/NnkgVvtoJ0fjcrEsWWxRyxh9o7CVp4p6S00FFHt+w/A/9vg3qIwTXSEQlKGUL0FB0vSJq8CNZ9DCCq3Rj7Rxt/XIZUOl6iiumKNzMto49v2rZqW/U8L9nd/ghpMTMja1tqYVNS1l8cWW51Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUOG8LKF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUOG8LKF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so9359185e9.1
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 08:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769702678; x=1770307478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh/uPjKkjFTzbQKBGAxp3Ww1JQS4t2qyH2DOcG7BnPY=;
        b=LUOG8LKFA+VbLg8z/fs5arxZZrSEsBT+qquMOaGUvPYTXw0ircKB94Pd+T1u6JKWfG
         VOZTiGt74Nu1acjJ/eq+bG+sNDEGsVxlPwMpF4ut49ptWQLJFordgBEXrsWBLmmoe57E
         w/wmMJaE+ocGlIp2cpmfF30BGc2cTYNuJpYnQQLa+HNNO4tmMt51zqhbTDe0sox8l7kp
         wIs5Y/Ga1I0E4UvzlDPwVzopCQJJtl151gX/YbZZeNbpz0Ct9dYylrtdvr7ozP0ugFM2
         7KlrAB1zSDDrFrJC4XBVla4gSjixgHsBZz/c0Dr6Lw38VX9T3rr/rpaOKJgw6GFFrlQd
         vKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769702678; x=1770307478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vh/uPjKkjFTzbQKBGAxp3Ww1JQS4t2qyH2DOcG7BnPY=;
        b=OZTJ+jvpTBy0etIxfQOtay1GRZeT/ZOymi9Wt4MbU629XgOw0GIl7idS1bGRZZ/Eg+
         mPO9zgP1XsuakQIb5BctqMTCXogEOeUqfolhsCOLDoLGdvXcfgFwg5+bxgChFZSJYXRD
         RgvlpLz/WuU39ZWNtkOLFWHbs/sOEDUrjv9u4oaH/7SHd5mMycE9LfbL3hVmfG5PDPVi
         uM81oHWui461BWvjp0wGid20AzvceFR6btUR/I9V/pZkLBxEMBZqG5qnnzhKdHf9+4cs
         OiAjDgNo8GZbs/j9dXZfM1wbR4ZDcBN1wxSl78OSUbfD73zLnSlyUM31sePH97T2ct1O
         wJRQ==
X-Gm-Message-State: AOJu0YwtJmTIQ2R5D91iPF4WrHenB8FXl715v0m5/Pc4nM61kK0B6vM5
	0iRCtWN1VK3a9fxGG3TuHRnxW7rxrCa25zDGJdOJR8ZZnpGmr0xSu8zD9P6gFNHC
X-Gm-Gg: AZuq6aKA0XcC4jqQ2Thd1cj+V6Ck4Zt+esK1Bph8oAoUwuXaJw6huXp62UIdwQGTZ11
	WQeDwfY6REdO1+lgyiR7UldPxlEaC/vwsuh5u8dVWeOucPdvDGiBlH09aPYeB26+ngXfoUADaMS
	/l7uwJ4LwXjjLfp+NbwnMBrInK7Uw2yN74vrhs0lD2XH232Fez8Pl7Zn0y2a8rDfAyM7BjyRmOu
	9F/CLJ0n+MhRvPcCRzCgp0RsNQq4/HP+mNGWfvDaGrHuPoyQ3sq7/Lsj9fN2mE34qh+Vw0ztxO2
	PrpyiFqcaWGWNZ1Mld/PX6hqM8AMUcW8cFwKZt4LROvQ7Grj5ZiYAC9mOhYck523isQHrc8onxq
	q7+GEaSgfaJHAzoxUDOYjSpXsJ0Wgs6te911Bgzes/Kl0Akzv4QFCDR+c54w4Oy14qcrPq6kAeO
	wNk+9gvttGnQl1O3f6rnLhWsbAYE0Zshk87vGsmC8=
X-Received: by 2002:a05:600c:1992:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-48069c789e8mr119108505e9.30.1769702677711;
        Thu, 29 Jan 2026 08:04:37 -0800 (PST)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c515sm135883175e9.11.2026.01.29.08.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:04:37 -0800 (PST)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mahad.ibrahim.dev@gmail.com
Subject: [PATCH v3 3/5] staging: rtl8723bs: fix missing blank line after declaration
Date: Thu, 29 Jan 2026 21:04:24 +0500
Message-ID: <20260129160426.13737-4-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
References: <20260129160426.13737-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning regarding:
- Missing a blank line after declarations

Adhere to kernel coding standards by adding a blank line after variable
declaration.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
index 1fbb71149cc7..b7176a992518 100644
--- a/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
+++ b/drivers/staging/rtl8723bs/hal/HalHWImg8723B_MAC.c
@@ -47,6 +47,7 @@ static bool CheckPositive(struct dm_odm_t *pDM_Odm, const u32 Condition1, const
 
 	if ((cond1 & driver1) == cond1) {
 		u32 bitMask = 0;
+
 		if ((cond1 & 0x0F) == 0) /*  BoardType is DONTCARE */
 			return true;
 
-- 
2.47.3

