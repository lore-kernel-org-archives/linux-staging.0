Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948ED18A6C7
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 04:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726113881; cv=none; b=PIGmirNu8f8R4AySY0reJPEnXE39dw+iBKZoVLwecleMRh164c4GaENOyunZq5T5m/YkVSWNnRR+UCqw9H/bPUHDgptiRuvxSnnEUjOyQzJSguG6QQFGwv1gKO7IpzFgGaOEYji3oQXX8GSOISZni/V9qMMN3pVK99dh1mcBZ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726113881; c=relaxed/simple;
	bh=zyyawO/uW7xUYBto29DhygmEN66WLE+uMJwCMx/YU9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AGbDly7vVILrhuwPdNIq3pBheWbEQGQT5nYqmWal2F56YWEY9+833s+I2AtWVGtuQnIq2xb9m544FVIkfW94SR3BxlqDecMlWUWOG9mJZDScNQOBpFC5XEk/bOrNOgb4RTqS/IICEo0LG7z7pzP8QkoFlbLc+Szc1nc8dLE8gqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8ALTff4; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8ALTff4"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-70b2421471aso392518a12.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 21:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726113880; x=1726718680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc0/4aLhAOlQgNkq7UXPdLlR9BwhyToHh2UX75c0BdE=;
        b=f8ALTff4bhDu2JPbs4YjkmCa3pWJpjF2/Iy0goZbIuAPEik1vE4xF8EjNzM+dRYsjN
         yZ3NvAQzPBLb6iH3rqGBjB4P242SlcEs/0R/MqrbZGRYlt1/cCn+ekLO2kdvCELYsTit
         JDtywrTahqbiBi98J4fv8utB+POaXg0lFGQlGX3vYGC2UPZiyIwn9yIFtFbi4Gra31jv
         UdcPeyjhNtsemsVQxFd8uzM/fY5YlXFoa/VgS2FI53yI4t4qLkJ21hmPoKB6ixXfuBgk
         UVrWqb4uzVfq/PYzDujX4m/zRzeT12GwCuY8Fak4dSz/9w1x9hC1WlNw8VLcjC/McpEa
         MyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726113880; x=1726718680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dc0/4aLhAOlQgNkq7UXPdLlR9BwhyToHh2UX75c0BdE=;
        b=U4J2wqL5LZVrV0+W48oJrYtW6xEOBZ8VvL+HXWlfZ2TdFmEkDvieW0QfAMBAJA0aew
         qEsZcSaOlAVFryMhmjgEpSFh/UEcKLEADPkuBOHd3PTjYhuJ8qls7/eI9kpNGc6bfkTr
         +gcKGZhxQahFVuA8YKTCAQDEu/531WvqgPjj9ZsIk+wVI0JO05eZE6cY+1lYih6uV8m4
         PjYUhYpMyW6vdu6kUiokxoYz+PjFJ1XeyylCua82r7XFIDpz57R+548ettqXoMiVrtOl
         BKAY7sRR+wa3BGGnpbAaYAEaDzRAA36v0p0qqUeq5qTsQcuH6OxddqeVw37Rcm7PSljQ
         dWeA==
X-Gm-Message-State: AOJu0YyoDH+mSHWPt5IAAu+5tQuneA7rn9lo2WWmV8eiJ8TZYu0liOb7
	bjbXvWgbVq3zPcutOEgE6zeViko4HP9RIIHiu2QaR88ihCPaNQrt9CiTNz4dv28=
X-Google-Smtp-Source: AGHT+IFIwqIPMdCXEORiJbR0FOWqpn9jQVC+F87+u3NtDpFEsSTH9/30FsN8vv5xzf9GpcTMHy2ZJQ==
X-Received: by 2002:a05:6a21:4a4b:b0:1cc:ea18:27d with SMTP id adf61e73a8af0-1cf764c1253mr1923547637.45.1726113879605;
        Wed, 11 Sep 2024 21:04:39 -0700 (PDT)
Received: from debian.tail629bbc.ts.net ([2409:40c2:12a7:616d:eca9:534f:4e49:7c41])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fba469fsm768359a12.11.2024.09.11.21.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 21:04:39 -0700 (PDT)
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	guilherme@puida.xyz,
	philipp.g.hortmann@gmail.com,
	linux-kernel@vger.kernel.org,
	Sayyad Abid <sayyad.abid16@gmail.com>
Subject: [PATCH v2 6/8] staging: rtl8723bs: include: Fix indent for else block struct in rtw_security.h
Date: Thu, 12 Sep 2024 09:34:07 +0530
Message-Id: <20240912040409.3315067-7-sayyad.abid16@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
References: <20240912040409.3315067-1-sayyad.abid16@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change improves code readability and maintains consistency with the
kernel's coding guidelines.

Reported by `checkpatch.pl`:
WARNING: please, no spaces at the start of a line

Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_security.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
index 7901cce76443..6124f2ea2431 100644
--- a/drivers/staging/rtl8723bs/include/rtw_security.h
+++ b/drivers/staging/rtl8723bs/include/rtw_security.h
@@ -61,14 +61,14 @@ struct {
 } _byte_;
 #else
 struct {
-  u8 TSC7;
-  u8 TSC6;
-  u8 TSC5;
-  u8 TSC4;
-  u8 TSC3;
-  u8 TSC2;
-  u8 TSC1;
-  u8 TSC0;
+	u8 TSC7;
+	u8 TSC6;
+	u8 TSC5;
+	u8 TSC4;
+	u8 TSC3;
+	u8 TSC2;
+	u8 TSC1;
+	u8 TSC0;
 } _byte_;
 #endif

--
2.39.2

