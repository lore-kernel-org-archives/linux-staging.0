Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3EAA126C02
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784447632; cv=none; b=mBaL2bpXsazzGXhMr+NAmCsZjVUIn++va0ne/5RsQyNGUe9Cg4vvEi1fYteL5llYV+YOzR7roP13luAYTR/90e58UL0KZ9fTpQJ7edPWZrmbyxJ0klBySO5DrrLYGR1bqmDagYLcYSD7nmmtUeZdVUYyD0uWnw4wvEfKbyb3AsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784447632; c=relaxed/simple;
	bh=xTk9VPuyH6rNPwlLua9cUMt/B60jldB9QymdVGD3xP0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UJ3A9/UNuMmFXaWGTiteDL+QeiJbUndf2Ntch83TUAR4FZ4lzE7JKLMEoDnssGp9bW1mIrkfx0rkUdOUs4CzLSqCmw/bic3ZHjWB5rVJTQ9TZO3Vba1oQbAcknF7V5PxMoLbVoB/ntYy4xvamcaBj4OzjUEvnmYXg7nhv3oeYqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdJ7fY7L; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdJ7fY7L"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7eb6573bd52so4887820a34.3
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 00:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784447629; x=1785052429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D8Gib5iNS7nowLr+RUxyTYdGwpPd6ikst52ouiqJOeM=;
        b=sdJ7fY7LjiWruUP/+LJiWiL65ua6Z7wXrwhnlmLwQMeMA3EEFKw0wJhX3BfaTUQ0B2
         OcfJjU0o58ih2NChJZFZCeRUS/mw2gd90OMLJ4by03bSa0I+xsUe+x92Lp1UlyZ/CX1v
         FHVPBVHFggaAvHFOydfiNCvDx9lSQUs4pKLOampcMiAKgUy+Vrk6OGb1kCl3zUDsFyc0
         7/6inugoLWa74khWTvdqxmRM6CzRIo0azUZ0or4E2vtc+GJO5FC58YTZzfGU5aHj1lR0
         KbhmHmHl1kZny85wqYIzM5gYtkI7mGOtHnvHfxXNBlRRoAygdRdsdR0y8735/0C1h86G
         91JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784447629; x=1785052429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D8Gib5iNS7nowLr+RUxyTYdGwpPd6ikst52ouiqJOeM=;
        b=e42yk5/KYFW5RHoLeb8tzkPwyuoiwDT33nahppZonBm1KJM3uekxQYHNEsm4WsHGB7
         XvkjjX6JKSVbcDy4aKeFhMKM6FjnF5qgdtcu1KwgSfeAH6J1fIADNc9xx3H7kCx4kew1
         rHg1avgBN89iFKZiZBAwNwiJxK7f68huOSSSa2tIYZ5CUnguIr/bm6v3tGSzH8AQufIW
         VjChsa4Q1WhE6XYgeX5XnXBXueq9U19ZLyIVMaePGYbcdZCQ+9qXuFmMQYsfMlbEGsaC
         so7OlJKfnAMhNyJUjftobElCS2m5NgzptZ0KsdoIAZd9NEJWGez6R0IqDu23xAhX+TDr
         RgTA==
X-Gm-Message-State: AOJu0YyzTFWE+YGGHXQ40EnGphOXNxw1Khc+KDfb77EVpptEdyk9A3pk
	Wr2k2Sf2spx0oSdO4b+f4nuOlKyWivlIScfsw0+M+ATe135MnEwDsF0=
X-Gm-Gg: AfdE7cmiPd41r+xAHvHcOXjiskOVm+2COp2oA6Heim8LKuBynQbRjrng+hbEfNyediU
	fIjS374xr+CVJTyg+dy9xrIeqbtuob5X1RaM8DYqacV1QwfLIEa04fGE/kMo4kdHSLaSGy6X0t+
	hR1i78i+rpyCGnqnZCs+AdJ6priTU0tLgTj+ChYg8AEIpO5enzEs06+QiI/XhAGx+LWJ00Fk4vm
	d1HcAXmbayIPv8DQE6LN0OI7S6K4pNYVvxCMcqJj4nQxAmp+a6X2W+dMs+h3DGdfeskAvmYSmPC
	t4ROMGgkm2sxhI2Es3p/z+h4tDOcSWiwWZ15kiZs29akgOcXoAl46EaKAUefN/sNQx/EkFnL7O2
	9KN6qGuUijF6h3n25PFSO5faa8Is+FwowiPEDhotrrflP3iTBeBn+XmVnEAXUbLLPT2GROPhBR5
	wjgJZgancq2qHWkYj6tqnjoCyWnA==
X-Received: by 2002:a05:6808:c3f4:b0:49c:32a3:8a6c with SMTP id 5614622812f47-4a4d030fae3mr6355807b6e.26.1784447629544;
        Sun, 19 Jul 2026 00:53:49 -0700 (PDT)
Received: from lone ([2604:2800:8:1570:944b:26af:dbf:5be2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a4d3a57b9bsm5080270b6e.2.2026.07.19.00.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 00:53:48 -0700 (PDT)
From: Som Tripathi <tripathisom142004@gmail.com>
X-Google-Original-From: Som Tripathi <somtri@iastate.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Som Tripathi <tripathisom142004@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove extra blank lines in rtw_qos.h
Date: Sun, 19 Jul 2026 02:53:39 -0500
Message-ID: <20260719075339.115500-1-somtri@iastate.edu>
X-Mailer: git-send-email 2.55.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Som Tripathi <tripathisom142004@gmail.com>

Fix checkpatch.pl warnings by removing extra blank lines:

- after the license header, before the include guard
- inside the include guard, before the struct definition
- before the closing #endif

No functional change.

Signed-off-by: Som Tripathi <tripathisom142004@gmail.com>
Assisted-by: Claude:claude-sonnet-5
---
 drivers/staging/rtl8723bs/include/rtw_qos.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_qos.h b/drivers/staging/rtl8723bs/include/rtw_qos.h
index 1f28837f6..733bfacef 100644
--- a/drivers/staging/rtl8723bs/include/rtw_qos.h
+++ b/drivers/staging/rtl8723bs/include/rtw_qos.h
@@ -5,15 +5,11 @@
  *
  ******************************************************************************/
 
-
 #ifndef _RTW_QOS_H_
 #define _RTW_QOS_H_
 
-
-
 struct	qos_priv {
 	unsigned int	  qos_option;	/* bit mask option: u-apsd, s-apsd, ts, block ack... */
 };
 
-
 #endif	/* _RTL871X_QOS_H_ */
