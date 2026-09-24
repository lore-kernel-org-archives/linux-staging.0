Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058614BFE67
	for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 18:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276046; cv=none; b=abM07JPYER2gqRy3qTqsUULpg5tcGMdqmMtELTnyxgkt0ldCdUwTS1+lpBGlQiH60AMeqhexchrEXaWx7v1IRvKMicinceW2Ya6/5LKToKQrUDwGYmlKHyn2PGEtrebdVnV0DT+/Hd0uDgUE3ox7YBdhdwOLkTdRIhZPFx4nFqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276046; c=relaxed/simple;
	bh=zFkMOllcHrS6pEnX9XO0Vwq/OY+p3PIw5QAvu5BrTDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k7IDocUCpziA8eCoNP1m0O3RrH3Ot5PEp7tIkEmABVIpZHWq2SSoGgPmBXS70N5zdkd++Kr+ycivORInr/6CXxRxoFX6UF0bV+5xVmEGTqb6MMRU5U4wHlCFYsaIRKfVQu6gO5oijn/jAepTI2MpCROUkipcwuWz6RKd2F58eYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwB9jFCl; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwB9jFCl"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so960535e9.1
        for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790276038; x=1790880838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Br6bJ2Gt35fGfFnxQNY46odJs2rrBpY5wuK/cZ+VUbM=;
        b=jwB9jFClIi2jeVUxYj9ajhiu78RpFZsqA8x/5E5kFbl3iRwiq8s7dOZhvuDvXydn0v
         Xtjvrd6jfaaqhIPYQ0twNGBAKHNGn7pTepCugzx7Zn51a1k12Jj/VFoc1OHGAE3fyBSt
         fSIx4DnsM6ODW/FVhzs3xoStdk5Ghm3wTpxJn2+epBxcLh350AdvXsFcoqtCfUbiHkLB
         mtkvCYxl3KpRs+uzSGIbXPDFPLVz1lI1KZM1yIaCcOG2YQnJtI6Mgkby6j+NAdSwoWkF
         nmaPaNPPi2TaHeULfX+Zv12NN4K+LsY340Ta1SDDKvCoP7Aovhz9b6EUe0WpsEgeo7k4
         7AzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276038; x=1790880838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Br6bJ2Gt35fGfFnxQNY46odJs2rrBpY5wuK/cZ+VUbM=;
        b=ks8x2noFYioH5ZC+cUjWLbDyDGE1U9cl7K9Pym+r62Omy3yAZuZwlYUWsWDDDH3Fbs
         5jTrpr1RugzLe5QGozNyu20tvHCip1eeP/Q6piPyX6WAzddtzl1CtvSFV8QC2jbJ/nbp
         mprGIldNK85easksGifA8WkDN9ID49EWChuVBbIzAzIfeJoW8Pd7koZ8TMwA6xIJ0doO
         PvRVG1WicruJdc2aSI9VSdWi+jpsJQEeG7ZTz9Tq4ir5N4twz959EqbYRQstZ0mzVLB9
         kywNqT98JaAtn/d2Vykd/cUaoVmQa0eLJAMljMjQTZhJEVbgidt9WqCVi+ftT8yKC2de
         2cig==
X-Gm-Message-State: AFuF++lgUu1MBziVAsfUPsJhPfmw7IrXcT0KcRHOTGdQzIJj5ReDdFhx
	ulVdpUMSioiydpOeIVczJF9jpzQfosKxFrl17RH1/ZOo+BgHQYP8dMQF
X-Gm-Gg: AYBFou13PYdI/GG6Vd35h886n/v84xh5dZt+UMXQEqCMaoUVlxYOThkNxFnkReZAaHe
	boD32HlDhRNn3bqSJ3h+vKIOEMIOpRJWpKpmAnGrK+lbV95sXWfM6a5EpT73oTCY5TBHz10PZor
	HymBsqfngUp/ArTmn8qmjte+3ubp/4qAg6f+QTNMW6uEKGlhTB5NVLqSjS8gPdnW56ter9gDe/L
	NiP1XctPjLlyDFx5L396txoNPCPPFxFVp1WqhZ+tvc22AuvRJpAGHTxxWUKgcR7TsJPA9D+fek9
	jHJ6AKLnlEGMY6j7LmOJAIEo/zK09ijYisFdq5RquQcN6HUSKhORdJffNKCWJT4GvRsn/G+V8/g
	E0J1n7rCEP02dNml9UyAibNquGxz19gzRVuQXOOtVfq9cI0vJltlREIRKNesUdiv+m3LXqLL0QM
	z75cb0x+sAmuLw20pkqEHx0O1w5X+tg+JXQbRn0Cts5Ng7gkhX8U0B8/tflYM9WaNq1rLSsg==
X-Received: by 2002:a05:600c:4f86:b0:49e:84bf:6110 with SMTP id 5b1f17b1804b1-49fe66bdf47mr56579105e9.6.1790276037988;
        Thu, 24 Sep 2026 11:53:57 -0700 (PDT)
Received: from fedora ([2a02:587:200f:d100:bf67:f785:caad:e278])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef605cc5sm958245e9.4.2026.09.24.11.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 11:53:57 -0700 (PDT)
From: George Karagounis <taterraster@gmail.com>
X-Google-Original-From: George Karagounis <mail@taterr.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mail@taterr.org
Subject: [PATCH] staging: rtl8723bs: remove unused variable 'phal'
Date: Thu, 24 Sep 2026 21:53:49 +0300
Message-ID: <20260924185350.42180-1-mail@taterr.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In rtl8723bs_init_xmit_priv() the variable 'phal' is assigned via
GET_HAL_DATA() but never actually read.

This triggers a -Wunused-but-set-variable compiler warning when
building the driver with W=1. I removed the unused variable and its
assignment to clean up the code and silence the warning.

Signed-off-by: George Karagounis <mail@taterr.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index 7f55448d544e..0441e84ea87d 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -525,9 +525,6 @@ s32	rtl8723bs_hal_xmitframe_enqueue(
 s32 rtl8723bs_init_xmit_priv(struct adapter *padapter)
 {
 	struct xmit_priv *xmitpriv = &padapter->xmitpriv;
-	struct hal_com_data *phal;
-
-	phal = GET_HAL_DATA(padapter);
 
 	init_completion(&xmitpriv->SdioXmitStart);
 	init_completion(&xmitpriv->SdioXmitTerminate);
-- 
2.55.0

