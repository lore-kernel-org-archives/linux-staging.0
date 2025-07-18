Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29ED207A20
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752867737; cv=none; b=WU5KlNM9VHRQ2KruT/Bh4yuz/26EMi0GRx91dVw3Qt/ruYL3wwfXbFmZqU2IC5yQhNITYb45UvWPiDKsC7Pt/weEv70UFO3tSZWwxhB9VLgAJC+aIaSFtX+Oe0ySGk3q43KmhoQWUIeQlwgU3W1ouap9YAdOYNCT25TzHa8x5Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752867737; c=relaxed/simple;
	bh=xVDQBp2kNmq7ZFIJF9an1SRxLAkQFM0n1leyv1gldKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6T1wuM7AgZAQYeenkHMTJ8PxNYIN/2tKnmnEQX+MHYQHsFMmj+O10GAHTv0fcYSUe6ZcAT+Al1JooP5N5tQBWQfZ9i0wWqOJIf5mIoukhlAFcxAmo0NHZ/GfAgYImsXseWpiSaTYt9WAcollLGgajqZbVYPGph0pl6TMqgWl/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhNIvjVX; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhNIvjVX"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-41e41691ee0so42726b6e.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 12:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752867734; x=1753472534; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PF6ZIh74+yQsLkVBg+PAXhNfp/uQQfNbO1i3gpImSpA=;
        b=DhNIvjVXLPLpiuX/MqQ8tKi/o1Q+lL6bi83/loxZC3abbeOu3nQker2kalrcrgVNX9
         LLaXrGCCjn5G0ered/t2vq1KHWPXYgPbdevtd6vfjCYmSKx9yYmo5Ii/bM9VPl6eOgN/
         0d6dw5Hs9S2R6kGyc9JSXuzsPyH6aQFo1jFMMcXH9ohXbuOdwhydTi3WOlk33MtnJE6y
         vuFwYfTm486qC2zd21OBOLGlnHXlS6gfEQ7G7ktJ21xke/Zgjarz07iTJSDYeMQUTnbj
         nOiPUtPJtefiXMF5pJDnJljszJgH5cyGA+5UfvP7YAKAa/oyxYldCPwLueVI+5PynqQ/
         9S5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752867734; x=1753472534;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PF6ZIh74+yQsLkVBg+PAXhNfp/uQQfNbO1i3gpImSpA=;
        b=nJ/zO8sS7RJwUCCIthDf2UwyomVhmlTRFBW+CPspl59979Bb9R7TT/pnBmaHyRc5Kn
         LaSvx+1Hu5+PVEsay4fYid6EQECsE6xpXxZHngAZ+fc128jU5dhzRtUfoDktz4IMPp5t
         0dLx2kugesiO/HRY0SSA3pyr0LHXB8oVuGD9FdAItODSi5syeESaI4venIdY7EQnU64p
         qX7igDDN0BfPXhEAOhOnNm0aZuHjQ+YtcxzO/iYki51AzSOeHfCDDrYeU4+wp3h8+6t4
         zSgVHo7otlvKndOl5W+eFoPDOjJFFfjptJZGKSe+w6vXXuIFuzaMAQ5+SRo263jDTpcP
         e+Ew==
X-Gm-Message-State: AOJu0Yy9lK86uBhwRpCFqIiuw0Hd7oYzrouwQzfXTCvbiRWbgZH71Js/
	Biixw3RKPadB1RdCehnrfcQxZqXRwioeNfu+ESq2f5+ylYzhtLTofM+lJJk2hw==
X-Gm-Gg: ASbGncsYQDwM6QvgQrbunv1ep6gD2Dpg4sUXcg2Kj33FyhPvxvBq56Ks+EexZ3yplYY
	cNXN4LJ3djcShg9iQCW7zokc94596HpWBKFY0GuJjJBhjWXgSpjKVEuc1dXAztwTYn0e3zcp/Wt
	BLzZ2H2+xRuCkTjPPuG67mxKpte81zJxC2E/EUzsthTgQHJTQGoOOO3CQl9H5dcrA8AXhc8UdHi
	O+BIQIPFacHzeC3rsbRjWInoB0xi2SUuHCOraQQj8I+DSpaN+/KagyaACpXIaQgQw1dv/Nk38tH
	NRyf9QAdPn1tLxIxDmhzorywA/Y6kn1iCc6Nn5rPpIwYbuiXYl+mp3isKLj6MjDnylcZw3PkFSN
	N8C3jTI/548X2tfFbBa8r/M1CCT1JXdZJaXjANQ==
X-Google-Smtp-Source: AGHT+IHz6cYJ4/88emSkcnwmxrsfF4tpQJcIeBsV2u9cA+8AV+U78qOKmxVv8+3tedU6zxAtlIR08g==
X-Received: by 2002:a05:6808:50a1:b0:406:682b:881b with SMTP id 5614622812f47-41cf04daba4mr3456899b6e.8.1752867734372;
        Fri, 18 Jul 2025 12:42:14 -0700 (PDT)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-41fd19bcd60sm627051b6e.16.2025.07.18.12.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 12:42:13 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	matchstick@neverthere.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH] staging: gpib: fix typo
Date: Fri, 18 Jul 2025 16:40:30 -0300
Message-ID: <20250718194029.35652-2-gascoar@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typo in comment: dapter/adapter.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 625fef24a0bf..17884810fd69 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -169,7 +169,7 @@ static struct gpio_desc *all_descriptors[GPIB_PINS + SN7516X_PINS];
 #define TE all_descriptors[18]
 #define ACT_LED all_descriptors[19]
 
-/* YOGA dapter uses a global enable for the buffer chips, re-using the TE pin */
+/* YOGA adapter uses a global enable for the buffer chips, re-using the TE pin */
 #define YOGA_ENABLE TE
 
 static int gpios_vector[] = {
-- 
2.50.1

