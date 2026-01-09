Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17745339705
	for <linux-staging@lists.linux.dev>; Fri,  9 Jan 2026 11:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956768; cv=none; b=JBoJKWhSGFtVVRJODSouqSiqQ6BWO/nF8iM+YlWZws0EEfgpq0PyJ5s8EpbwvPYrPxr7b+Ohs5xzwnElVVa37NobKmKgcI207r/Tk/+RuVkkHcmO0lvSJnYwp43Q/RzlyOgIffYhWYdm291TaoU4Xzi/HUx7S/UmLU5F7w2ffPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956768; c=relaxed/simple;
	bh=Qc85MFpnfmV9gh6PEOVCy4HWaqRzXk5RlS+WYVYU3O0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HUdVpDBRo4vsHXM4zXbWMUqmTae1/ytkXcVbRHM2V37wDs4ufJuvFOr3VGcmTfT1+5Pu0dUsSyr1Iagpd+TEesvH/hS8Y7M7dIExvYTTYEJ4hEhFvYD+j4wk90waNUrtfONbFvgnDzSCX+qo8HNWRCuEjy3goB4sWK+w+6SftW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcWaJ49J; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcWaJ49J"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a12ebe4b74so41733865ad.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Jan 2026 03:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767956765; x=1768561565; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cNqBa2NEMZlSq/IvbZLP+HdJzrzTFSiXqKg6f5na7yA=;
        b=JcWaJ49J/tkYgslST8rVS9IOq6cJNCw1aujV6sWNLVdS5BVcz7Ya1rZGukeERiItyW
         FoROVVf3OZbewMrOfl2z8USos1O6mYnhCpQdxojpzNDK5PtwUmz0CXK6jNzV+4bINPz0
         IaWa2e/yIbrkEpn2K+ElbhPgYf0wC5YWxfB9sMJRJsJmvkzAx1UBe53/n16geONKLRM4
         fIfIMozCeoPEkHgPqbonm+1e+Ec9NOEc8NX+eHphgyVuaewaWi+Gg2wLOXgH2idY90/c
         53krlCkPanBa8tTjD4xM0cK6BI/OEtW1LuiJzVoo2JmAZyRRxrrBDuRZOYqv+n3VWf0+
         pxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767956765; x=1768561565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNqBa2NEMZlSq/IvbZLP+HdJzrzTFSiXqKg6f5na7yA=;
        b=rLHPwZxHz6AIkIVHs0rSwLzF4TkcfMWCAZL7ZCDStuJ4KIuVe6iN8HmSy4LQWXFAxW
         EDi1CRtnraQuqXMsmFRN9fp4cXuKMDe7fXenrK5LUNtOLb1yS2+lxcJyvlTfgLYZHyPw
         a3xsYqH5IRe0he783FbN5Dk6TXGNEyJd7HSvT0WYFkNPlhtkodMUbVi4k8cBotbnnTTG
         gsewgr0T6SPhDOlDhlk1yKRVCVVqCV2h/p57E4RVGffJ/T3NBK7x8Uf9nXZiGX4xMQbm
         EGLyOp1L/L1KnsJlcYlzuQPCfmzHLaW/FfIgLC88lEfgHVcj2NcQlNTmoqE44Pm0viKA
         ow/w==
X-Gm-Message-State: AOJu0YxeS6OA6e3Dd2dTV6X2H3ki4AjtAzKTc+yyY2ENxUG+Sn6c5dLw
	6EsZgrPxZxHeFksVMkXTglYz2EgB0MyQ3ZCbrEDv6Gs9nRznfPqfesBA
X-Gm-Gg: AY/fxX5xaBK7+ri1ugFpJzgCGmVx7Rh681UkpURy8kiA/qXiRf9PI4AsfZy4I0EjgQG
	bsSlzBDDo2t6uBuFW3Yjc5DQJjTMiBpM4fup+YR3lenJvks9ZMH8NgOUQ4/esSf7tFplNpYBxjN
	LNMqvQ8jYRbeEEdEbHocM1q+D1ofwgEYj/N2yfLJgMNzCDm/Z2piQJpnBoxa38Zw+s5QedsClQC
	f63NyG0Es7ddv1hcHW4U0giwbVWnWdqs45qx2/P6XIO+MoxlDK5q4pBbvNE7BqqebIreVqaO5Nx
	udlM0ARAYEBudrcrISG6AvkBmRh5ORd8Pl3f1/cBN6ANJHUBUfQiAx6mSwjD9CkKg1Uu5e+Yo1o
	Ej9Ik6QpwObxm7bCfhwRK/U3VZIjoax3jJPerpAFMxdwh1txwDC/6QeHL9qmnrtwvBLYPPu5NBq
	7rUE3771L8UUChc4q+TAga
X-Google-Smtp-Source: AGHT+IFdoRs4MLDQhLlEi8e2Ioth7zosKed8+TL+MXPuH9K43/CraCft4QkjyFp3WTBWNfJewsRM7w==
X-Received: by 2002:a17:903:2f8a:b0:24b:270e:56c7 with SMTP id d9443c01a7336-2a3ee4137cdmr95433415ad.7.1767956765383;
        Fri, 09 Jan 2026 03:06:05 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47303sm102491515ad.24.2026.01.09.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:06:05 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: remove extra blank lines
Date: Fri,  9 Jan 2026 11:05:55 +0000
Message-ID: <20260109110557.16381-1-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary blank lines in osdep_service.c and related files
to follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 8f6dd3560303..c9be4dc63598 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -152,7 +152,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-
 /**
  * rtw_cbuf_full - test if cbuf is full
  * @cbuf: pointer of struct rtw_cbuf
-- 
2.43.0

