Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C74931AF0A
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764069686; cv=none; b=Eg3+708mDTnKtNUAZL0ycf9pFJm8YuTgO9a1B6q13ZYSvkp49pAfFsOB35dJU00a7TT4mddyUf/poKyt7Nl7cRPBn/ycrDPxYVAu7a/XeQJBkHrCD9OeMa2xXT4LFIDoXwLaqpHua0CnLvGsc8Y1Pa6m2zntXhqTNlCW0MnNHIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764069686; c=relaxed/simple;
	bh=d7ggIp9WmDKUq0Bx88AaHSWp7QdXZBaFiW91NBQPfXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/wZDsF81Yo4Xn30zpHHBNJHizP3o9ptVZwl0PHiZ0QELUj0DE5Q5xkEG5MUkYSaPJ2s8oPZGUsHkya6ttZvV7kv2mof+uZaEPhywQRtwYYX2LQTAZJPNV9jcOCW/GegpSrm0mZerrltrtbicgz7pobENXNIIHcXzvmVlhdCKvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDiBxR1i; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDiBxR1i"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3438231df5fso7000565a91.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 03:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764069685; x=1764674485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zIKvcPrVHRY60iEnnzdnX3swFhRRplLLW+yCKl5Bl8Y=;
        b=BDiBxR1iG92f6+1KSbJkqI5RnR9YYwyFazzwiyTJvjCqfZ5BIwqiy2ykUBA52gNquS
         VPEER1N0YKjIgcEn54Dd2q5YVYLx7OXhYC+6ed3imngFewV67foCbTBJzh8B1ELf+iAV
         CQH5uZ278z1nt1L3FIHP36p4RaLYUYISbtV8ovZ7XlYGVwbYHyzR5XyWHv2lh2qQvIZj
         mjXwV+oXOnPnZ2ksn0JIq+G8IMchAAKqNpCCUoBLTt0beGQi6K2vtkvCsZtYOWsjWN6v
         4k7JCaml4XsyGKP9CouzXwyu+hDzFVXT+2LC83oa3NpvnsDTXtj81voZyqk1TdadD7+6
         SWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764069685; x=1764674485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zIKvcPrVHRY60iEnnzdnX3swFhRRplLLW+yCKl5Bl8Y=;
        b=nJn78gJknNUdHgmnhL8nlQaCjucF0U0lT2wC1lgquf4ruVgBdcuNkTloeoMknhU6Bu
         WCixz2PGcuMBN95lHFw2g/Olwcqk2rBhv2E+b5lmVK8EHzKtdIR9sQSIXgqaVTQyEM4S
         bM8zRerBVBAMPvMahGTXs/nEC/SffYhODnEVqa0kpyHvFCJiVTQgyr6AC2yEHBjfMFCt
         TITWGcy5WGeV4cU1FQvTw4vAxEwlXEdIN9n+H5/juayvNwiclV4msTgI9g3C8u5Ym4KJ
         A3sAa/Sk2cBlxP6n67ZEh/mHm7hcUjXaBErWEXat2rr+lY66pMZ/FkZQhHBP24cRCutl
         gWLg==
X-Gm-Message-State: AOJu0YyuxPS+1AAjjKi+EH3zYFUrkTHjb9n7RmATlbL76pNaMWKjWvbx
	U9rmnVBawdukU2CXMATm7JVjqBibClCplfF4rFwB5IloBDqykhAa5AV42Jxg/QJSLtOlCQ==
X-Gm-Gg: ASbGncvs8n4SDc2KNkhjKB7ZPxXBT7Zqw5Hg7X0G0UO6+7EyYLBxosPdLunFeQ6LOKA
	qdCeD3dcNT1m/QSS8618CxhqpaLKOWp93HAK2Y+djIi0Wr9U/5EB9nGN9fKLHf09XHvGv276tTi
	I8Se/feAUxUlNF7ipXDKjmoy1jQzGvv24qfu+E24UYNNciTTUuQiPvOYkLZYYser00HrIFG1O0Y
	7l1VtOyptDQhMt0MJtYWSixbawgTcyQFZtS/1jfRcVS5JH1s7wLOcPkfey/TQHG2UmjXgDteF2I
	w+advFuYlo657QS+yQBhtCNrH0cwj33UyG9jSgrCEYvEoX7VXQI9bfT3b0BMcOafQPRpqTdeLTX
	zvMbTW9OSLyCuVELxheGYzJGvpe9FxVrhoNEXeVDCXaCRj9VGyHD5mnhYOtT79SPBkSV+GzwRhT
	fs1y4GOfl0nQjeQP9pEO4uYGeZ4XjpVe15IdGwC7KZBBfpqplzIqF00IDyPqC87VmZkLDNkUgZu
	+f75Ma6O+HfBPGv10zJiT5ea5UUt/jGu9u6WeUBPoB4M6IyIOaiuVp+a8tY+Llo+UECxToECr7G
	PiI+iR0yejXw9sNcVw/TVxC3b1kKJ4FmAw==
X-Google-Smtp-Source: AGHT+IHx2836kz7Rowql9JbmvNi3nb0WpYKlYcG4iZVPEFRYlU/Xp84X8ugu16J73E5AMPBFzdKvXA==
X-Received: by 2002:a17:90b:388a:b0:340:cb18:922 with SMTP id 98e67ed59e1d1-3475ebe8306mr3115661a91.14.1764069684698;
        Tue, 25 Nov 2025 03:21:24 -0800 (PST)
Received: from cyberkunju.asia-south1-c.c.gen-lang-client-0196962068.internal (125.31.93.34.bc.googleusercontent.com. [34.93.31.125])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727bcaf13sm16296250a91.1.2025.11.25.03.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 03:21:24 -0800 (PST)
From: Navaneeth K <knavaneeth786@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	david.laight@runbox.com,
	Navaneeth K <knavaneeth786@gmail.com>
Subject: [PATCH v2 5/5] staging: rtl8723bs: remove custom FIELD_OFFSET macro
Date: Tue, 25 Nov 2025 11:20:59 +0000
Message-ID: <20251125112059.16913-6-knavaneeth786@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251125112059.16913-1-knavaneeth786@gmail.com>
References: <20251125112059.16913-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The custom FIELD_OFFSET macro is no longer used in the driver (replaced
by standard offsetof). Remove the definition.

Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index 16b270fe0203..8adb95f9f1e5 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -14,8 +14,6 @@
 #include <linux/types.h>
 #include <linux/stddef.h>
 
-#define FIELD_OFFSET(s, field)	((__kernel_ssize_t)&((s *)(0))->field)
-
 #define SIZE_PTR __kernel_size_t
 #define SSIZE_PTR __kernel_ssize_t
 
-- 
2.43.0

