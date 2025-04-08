Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBA02580C8
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744150861; cv=none; b=S7WI7wTx2/w3G+HewwVJ7AAO12XKDwc0IOJsalowGncqbdAfh5SbyuqevmFQaDAnecXYyQbolW0JLJXEvbaDx9ay4eoWK8IT1SBH9/Bz2TGzAUnvykQ4dvOw8Aup15SMuTJtGOrswcOeLks3RufzYrhdt2utd/FXdDCBDKf/vm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744150861; c=relaxed/simple;
	bh=2wf7c7LIBzRB8hZAmqsGJOJRMaXIRHLWvAJXOmvSAzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y0mmXeqljjlHgeVyzu5v/L9yH0bKW9TnmX4XUNA8qsbMHJwvBPup99mw88NPQbXEGLBguXV3XItteJTGn/w5Nfbq4ZT94cxTqrsbueFLaD0BnE12MyqBPAS4Yakz7C7tBqrS7ZkdMV/C9DNWSqv8/00HwVkb336lUJ0YDZhBtss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=ItTTpEsD; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="ItTTpEsD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-224341bbc1dso54263225ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744150859; x=1744755659; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtdVHJyH0NltQn/jp3Ss8N//KtRoFStN3nMWlkLRCK4=;
        b=ItTTpEsDvy37CDL6iB8Xm/DUW3YpjW/OphnFZbDTKm8zq8MB/NlC3C2CNYpPBeRbNx
         Tlk6IfYlxVgGkhv2mQxO9OgBc47p6Q4rp82Mau25vK091sYxDRKCy+gBceSGOrE/8IZL
         RgjxOpzbAHKzJr5URwXUyDnBgOs8JTdH+JD8EyYb6uJSHu+ZZ8w4tymMvTUMwIPqzfOP
         QACYKX4I92lnPyeZ+bgCRb01nx29hB0owP9kjPm/XrS6qLODTlu33MdCpB7FxLimmgEA
         EwgjDl6nQYjDUGL96DD0N36ISt3FZiHB4Pg0kICeCsir9jIf41akF2gl6/T7A/JX38NA
         Lfzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744150859; x=1744755659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtdVHJyH0NltQn/jp3Ss8N//KtRoFStN3nMWlkLRCK4=;
        b=XO1ZsTYKjD+6P3VwrgNqEgBMVWWGqM+gEajML+n8xEvzN/rD/v8ymPsqE+picLYmnA
         /FGn6CG66S7e367TLF8xsPdjAEGmp3q4RAlYVTUQWckODwGnB5CQMq0UfMxXUQQZWESM
         vc8MbESYkSxnNOdNNjmToNLzao4KeGVId7wx85KI7Zj7Fu3nl4VuB1iTt6TXVhvr/S9K
         KWwB9/P3ZDQU2f/5Nsg82NpkHAo5zHi72D246wfd0l37zwW6gbCEXCabnNC2FRQaT0zg
         A7rzzR47CnOFDGMCfpAgj2iDratQ4OWFfR58wnUfLH/0kQPYLflrnZBwpw/cIxj09FQB
         rcCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+belLqxXZQxABwm87qza9KuuziyQtccog1B6wtMmvJEXTsB7Bj/0+iNMHGr1muHdqtXZ+/NwEMaMHEeyC@lists.linux.dev
X-Gm-Message-State: AOJu0YwaVRi3QH+jn0ZGicmgdig+x6cxL41SJgOjOlH+vsGlCs6G84+F
	BsoJ2/o/Ag5tAH7tMYvfs/430KT4tzGC5tRky7SCA+/stiUuXKRN/5mTAPg0+w==
X-Gm-Gg: ASbGncuJm6MOHYA1+m8z0sZ96fo9sbUK3Jf6p+CFCI9e+LBwfd5hYmuSf4eXZT28QsG
	0wk+OGVw7UU7fFpfzukU2dypTMeH01g1CkyRNda5FI6d3SiUZ3i6vO95PdPKLsqlmd/QKMkIE9m
	34i7KicaSTunWqQ1YZ+MoQ3Cw6dWWcaEHo7ivf0OmtNscDrM34aNNCapUR5TsVg3sPxpkVjzZK5
	UqFKbyxQzWSyvyXnZgq8tvpNX1PvLJmTdRpv7JXnvZ+x7L4AgnK8Kp5mR2FYECFYZEiK/2omV5O
	AMIpwWQPdHNL73j0Yztbos9Tx/M2oSAQHxjuOooptoZYwK5egOG+DEuJl5jh0E8YyqMBJ/W5Hzf
	UPesQ8p4H/g==
X-Google-Smtp-Source: AGHT+IHYkZurTfVVRX44HRgPhAugK6vNpTPduXaQU/6BuW0VyqSvT9F4d4SJ8m5K6rM6TCF+LQPqZQ==
X-Received: by 2002:a17:902:ea04:b0:227:e82b:b585 with SMTP id d9443c01a7336-22ac29a7834mr8637105ad.20.1744150858811;
        Tue, 08 Apr 2025 15:20:58 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785adc3fsm106036675ad.51.2025.04.08.15.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:20:58 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 12/14] staging: gpib: uapi: Fix CamelCase and IB_STB
Date: Tue,  8 Apr 2025 22:20:38 +0000
Message-ID: <20250408222040.186881-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222040.186881-1-matchstick@neverthere.org>
References: <20250408222040.186881-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct CamelCase for IB_STB enums

Adhere to Linux kernel coding style.

Reported by checkpatch

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 7f343256c110..301083f287ad 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -340,9 +340,9 @@ enum gpib_events {
 };
 
 enum gpib_stb {
-	IbStbRQS = 0x40, /* IEEE 488.1 & 2  */
-	IbStbESB = 0x20, /* IEEE 488.2 only */
-	IbStbMAV = 0x10	 /* IEEE 488.2 only */
+	IB_STB_RQS = 0x40, /* IEEE 488.1 & 2  */
+	IB_STB_ESB = 0x20, /* IEEE 488.2 only */
+	IB_STB_MAV = 0x10	 /* IEEE 488.2 only */
 };
 
 #endif	/* _GPIB_USER_H */
-- 
2.43.0

