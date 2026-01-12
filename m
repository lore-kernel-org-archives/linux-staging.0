Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F19C2C17B3
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214855; cv=none; b=jlXa8JdSBEdimdxPJAhcm7pjraLe4S2k8Neod3XQAdMWZJBURcOmKzUZx45ZBu1zxK65m5+ACD13fg9SWj5IMe+0oy/1ESUB1rMoVgolV9RZlgQxJB2+C3POmjQFTmDubF4iVzYTg1m+rkrZeRmucp7XWx1AX+rxs6Q1aJrywgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214855; c=relaxed/simple;
	bh=kaumLG96KxaawxEmhPLvCMr94bC1Z3bR/qlaMNRhtEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLXbH6mzZCE4gWrYsIAit2+snb0PgGmEOpik+81+9tzAoJjWUghsP1Db1qDzLjWqWrUtSO48vOquQ6ECd1uM8cAOY3sTxVmEXgEHJgGp7vYGz+dTlKG2Fc45sjSJKxk/uUSzUMncQzZ0CUQBYP4SD1wYGQp88y7RtNkt29Q8Gm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IS6pnpC/; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IS6pnpC/"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81e8a9d521dso1282429b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214853; x=1768819653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q1YI83NF84eytvkWUoWr+GMMVGTIGw4tKxRWdpHZzY=;
        b=IS6pnpC/zKJQj+rVJEiG4CGjFKIcbqU7t2Gk+n6WpWqu/XVRln/yJYXNQNDu8qJGHG
         e2tAcfsaO09apB+HN65p+JAEUZOM/rVlGAEXpS1zRCTkHvE3/alEiRd1ChVBmJbVBrPt
         l/3qqUSWlmN9gDDVZT3ZOaIh0jvJkoaoi4kN28KJL222Qlj42Fn2OXI6c4lgNw29aK+2
         j+xWXiFd78e6IQWCOyWRFaS3aoHUkE2eS7rOXm4jSKPNzQRc+uAGbWXH2izlnS6i/F9J
         3wP9/MfwUA2sCnAlfVwuiBzkAkmIZDvxvm2lYjQm3/sa2s2Fk7gfqDyMXFVgklm8UpIq
         PsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214853; x=1768819653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Q1YI83NF84eytvkWUoWr+GMMVGTIGw4tKxRWdpHZzY=;
        b=jbQw8TPnCmgmX028LB4UxxmLXoXALKBALM9Aw2QJKLQyo+cjqy0VmHRXO9OIpDJYID
         mewFQCqcU9OuVk7cOhwjxldJJeRiCsvCAFIIvAn8+ObYvGVp4q3xj9fhlhfFX2E0vGjy
         uKIASORy1kDw2Q0oCzI8dhKtHLuBHjXMbck8irNeyRMkL13sq+r1JaGKB/ahM7Xu+Yld
         q9498QIgLIHYA6+GkZ981Lax4Tdfv4iu4oev5wMhwk6V+jZzxHQdPES17VWmCiakm4FS
         cx6lnAhJFpgt90PbWfzpnmbnuTo7N4XP8pJ0MIbHJ4/RtaZlCGF/dJ0D0P/RW4497cuU
         yCKA==
X-Forwarded-Encrypted: i=1; AJvYcCXwEm/f2ZyWzZcqjbdEvVdac9/iUD4gHXHeiCAImoHT3jV7vjX/GD8kZuqtNP489DAG7amyYZUmPjm+3en2@lists.linux.dev
X-Gm-Message-State: AOJu0YzdhPrk7s6qYY2oYa0pJIihfdrTf8YdVbC5L8wgVtD0B3Y/HW7j
	ALqQ71T8asVFzHpZ2+u0n8gEmzxmm8YBhA+1gXoe2eCdILeWhcwLlFK0
X-Gm-Gg: AY/fxX6WJ3UkiYTnGpmVMjp66SyndWlsIoGqDUh8HE1Jp8s1vxcscg3H8EpRWzHUomj
	3Hyx6cPk2FHZiNMuO8ihBhAAVHzGHoNpvX0Bz8amp1xAZw9mHCFoLcGpoEo6+Py4km1PLPtDTf4
	xUuNemsmAoBV8HU8ymci0T9vsfzK3ENaMVX0mBodAdxfqrhCzPF0nrwfmn2IbnGRg/Wk3MVxJYn
	GpkNaX4kTUZw7Fyle9GG5tp3wTwEIQ63Rdn/xj9QbBkY5km9C6MQdU3U7uZn2n17ec//JmQDjfS
	6a3Ik6l3jhmvcUB01q+D/EyUoMQn7teYsAC6mbC0Gd3OH92j3jbLbfV/xtxk05DjTWqOaxSyNHy
	jpI5Y3ObPmiJRv03rzeHGLN1x+PdJy+Yh0bN8jZ5uQr73vyHc/2OnLud7ymYbUCDWq7eWKHAk7r
	CxChGa/k5b2+5BoWFQcmZv
X-Google-Smtp-Source: AGHT+IELoJTtLkJo1D93pa62nLWA4ixbhAHuLKgwIlpszdEiRBvjyPyxPoqCpdi0pYVwL0KFtTvWuw==
X-Received: by 2002:a17:90b:57ce:b0:33b:b078:d6d3 with SMTP id 98e67ed59e1d1-34f68c001c5mr16522169a91.23.1768214853507;
        Mon, 12 Jan 2026 02:47:33 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b10a44asm5686116a91.5.2026.01.12.02.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:47:33 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v4 1/4] staging: rtl8723bs: fix block comment style
Date: Mon, 12 Jan 2026 10:46:51 +0000
Message-ID: <20260112104654.45175-2-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
References: <20260112104654.45175-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed multi-line block comments in osdep_service.c to follow kernel
coding style. Fixing the non-kernel-doc comment has been merged into this
patch.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index a00f9f0c85c5..9d676a61981c 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -7,9 +7,9 @@
 #include <drv_types.h>
 
 /*
-* Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
-* @return: one of RTW_STATUS_CODE
-*/
+ * Translate the OS dependent @param error_code to OS independent RTW_STATUS_CODE
+ * @return: one of RTW_STATUS_CODE
+ */
 inline int RTW_STATUS_CODE(int error_code)
 {
 	if (error_code >= 0)
-- 
2.43.0

