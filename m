Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A98A72F1FCA
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 04:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192506; cv=none; b=u5h/8FNwMOFjx5ANfSiP0ytdYFAIj0SLrw0Hg23L3vg2HOdiHyaWRf+PV0kWUQ4f0b8dEsk6FrA4qxZY6T7jyckP601ps9SDxVOCTOxNQpbWDxeGfR/CU4Dx9QX3XX6H8WdSi7cKEZzZhMSiE0bzIaRunmN/cgeazQcB/BN87V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192506; c=relaxed/simple;
	bh=2VV/3JRUbpX3Mt/rpWRBVj7/8nT/dWxAxwMEuBJp5aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMMDkPwcXDsAuhAwtIQPRJSedTEq3E+KYDmJqJmKAVFA+361G7kvl5lEJZiLzN+iT0/+uUptqPLjm/MGGbZWSJkvAio8dwNKzMExOsX/Fg9gI8EDaSl8fHZFmfQDFJVz+Ygu6+ZLsPa9wpn1iTusLQ6oDoV5roVOPN06/aEeXw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGMcbyT3; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGMcbyT3"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-81f3fba4a11so1187200b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 20:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768192495; x=1768797295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhOAkftyUgGWTKNPNqIsFMady3FhxjZfEF6SBj5+Qvo=;
        b=EGMcbyT33laMTxJO8rLjxNC10FpdaKLL5qpFFdfmnrYmLdmTYbhQDrPMlX1Yp4MIxt
         s/hFOtk7DJZKgjx7l4Og+gQoewm7Y/1Btd1L5KiB5BWkmXFuoSmoUeyLAW1gDFtr0col
         wW+6f7THajvFmB+rgSl6XGboAHNpUYR18RzLY1Lq/ZuBRe/Cts6BSa6SF/pNerroT771
         4mZ6cfAdtIP3scOy8K/QgcY7EE3gWlalomMehRixjsR8Qq93v81rhQSkIUMsncU7t7Tc
         fS1jDOx2tbVcAAOAsz1JSUYqY+vfdbiC989jTqCVBXqUusAQl+jjmUcno2CkIBAf3taD
         AYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768192495; x=1768797295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhOAkftyUgGWTKNPNqIsFMady3FhxjZfEF6SBj5+Qvo=;
        b=EsHV0TfVJ4MxVQ/rsyP6KxQNwxnqGyO34S2cwzu0t8C4q+cS73eq6A3g3uwXbxWS36
         3pknsnIkrMQzmz00DiOfG6+wM2m3qhtmOJtYEWXM5J0rJ9y46J2R5HERKhm53gaWSoEl
         3CPJNkBqsNV1hNUDPfXNbMecqc0oTMkC4U3hoQrN7+QytN3dMoI62H8WpY7wg1DSbF/P
         MJ8OhVdCCKm+VtgT2OliD1BDFF5/LzlUOiBU/YhuBGQ1ZIgJovTHlnZMuA9ZqzBEoGB6
         XqcJGqyZr8ZTdPpj0nx6NcXOVXi5KqYZVLhf5BCY+thp1j5SVLudxTiQDccgMX3/37CI
         bfkg==
X-Forwarded-Encrypted: i=1; AJvYcCWSI/KwdrFmE+dvdJJFXjauh8IX+BDzq5pZ8VXWV/CbPJXUmVpOCIjsBowuwh8RIeb9suusqm1pHJNrSLPp@lists.linux.dev
X-Gm-Message-State: AOJu0YyxneMTAfSc/94VC/U4FwjLBKhTxxr4ebvZsTgCrkhYPmLjW8S3
	aGZdoD8lJz0rDGBfZfJNB4fxt6luNPTPFPtkiI+4kITbl5VUDVHzTS0z
X-Gm-Gg: AY/fxX6OvaXmxvvO8ZIut12YnXnuLDLfimNqZ1ZtOtMxBDPfJydJp4t5kE4sG8ewBLY
	dQRK2WMZIkjLuwRihB264NL94Kvxik1LW9GqDymseTpJftY1ulzSG+ooz5OgFLkt2ERcEyEOVru
	8EDLVe4oq4r0uOst/bUEox4jrD2g1YzwGUxJwPLCl6VL8ia9YSIIZ3jODJFAGCUUvbeM/SctrTt
	NyiWWZSJqEO6q3aeT827MrJ6KNNhFAh4ymwlU+TDA/McQCxoN0VRaMTXT9pOuM/2Mc+Ujuxexiq
	WGsZzRUctYX54mOcBelLp0LUQxhsMZ77o4ZvgW/FLh0EXfa/s+7F+eiKZ29qMefwUr4ELJVJkT/
	oqVH3FGfH4Cowp0rPoJ3JZuYHtg2DopbOnTpKQw/7ZlCBU9pr6IVljhIRQE5SVPYyPenJoQn3uf
	7kuPLS0BOD9eWpl3RQfyOo
X-Google-Smtp-Source: AGHT+IHD0ZUCFaooKQiAasTQHeUNWNH6jSvU0pmBNED1Sy2OTCrKuJdnGO+fGMBSgxB66GT9xK+QRA==
X-Received: by 2002:a05:6a00:2992:b0:81e:ef16:b26e with SMTP id d2e1a72fcca58-81eef16b4abmr5978265b3a.56.1768192494596;
        Sun, 11 Jan 2026 20:34:54 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f3909d2cbsm5418655b3a.48.2026.01.11.20.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:34:54 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 3/4] staging: rtl8723bs: add blank lines after declarations
Date: Mon, 12 Jan 2026 04:34:28 +0000
Message-ID: <20260112043429.42615-4-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
References: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added blank lines after variable declarations in osdep_service.c and related
files to improve readability and follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index c9be4dc63598..c490de437bf1 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -203,6 +203,7 @@ bool rtw_cbuf_push(struct rtw_cbuf *cbuf, void *buf)
 void *rtw_cbuf_pop(struct rtw_cbuf *cbuf)
 {
 	void *buf;
+
 	if (rtw_cbuf_empty(cbuf))
 		return NULL;
 
-- 
2.43.0

