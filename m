Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0792F4A19
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854339; cv=none; b=YucbHzzrkkfN0+GCKnm8Mq4lrNyHH2jRUbHuCdR3UtJ6QWB4CQcKn2LCB+Ly+NG6/DqbLdPStFOhgwfwL48pjLr3/UB501trcUT988vEAbCp4ZA42USmtb6hOpSKJFCsbFiOPZY6xnpD23ASkErOoHPfLUOsDWNxVDuDaaecm4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854339; c=relaxed/simple;
	bh=+XnCO9qejTe4ztQ5le1uNUFmPXCcBG6FCCQyy4ErpsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJcToeVPch2hh/gCGm3g+h7VTJGgT/xp5WXR9imH0O3GrT848vtd4vfAtbeaCPk0m8DRwSI9gOhldavDH632KvnYr3Q/L9uNn2llMgxZVMjOGR6iafcQuqCabaEtzaLMxkpPeC7ruW9PlYWl9ykXbDhygmvxpPqhTgqdAUh27fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pt575eXf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt575eXf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477775d3728so23036535e9.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854336; x=1763459136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCSGnpbgz0bliYKvoZoaZD9Q232D8JPebeahtnpVkpQ=;
        b=Pt575eXf9k8JijaEWMwDcZwxhICI9SLWeVQR9KTHUrDvhtNe0+xDbTeK+s9d+eWZYp
         E8UYdQy1dQCTyzYW9p7BvIcrihzBG+9edD7STCEgxSYns/3boxoRVl0MqKp4XJWtQH4B
         FAaGDQ6IZW3DH26Hl2dpIhzxIQ6+i5Vzz2/9umDdV/N4nuJ3m4r3weQI3fyfSnUf3QP8
         B7plKqRB8AczOd8owWD2mON0CjsjT89iermUGlrDCp9weP9qFHyGoj9AY1L7/2Rru1a4
         EUibUjvtucLHg3RGfIU+liwlmNBx4idGelqKIkIsscUb66zeAVMKvO1bpQ9pPsestkXp
         7Gcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854336; x=1763459136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CCSGnpbgz0bliYKvoZoaZD9Q232D8JPebeahtnpVkpQ=;
        b=E0itIvq5MolFm3xn7yqRxOzqmHasyJFwDlb9tPR4Df6vjZpgx4R2qYYUiLPvVTEY5T
         syJo+XbEdTBqXL6kt3sCM4bTASuXRx0i2A/k4Xey4giazIN0dRB2kPStbGeHcAN560PS
         acyys7dGET1cnfzl4Un0UHlio7iIoTMW5Bw91Cq9YLpiKIs58CYIlPE8CEA+S3ToB6vo
         lLyB8DYrsRLCmNDwGhEm9KeZ+KwGvM6etz4Yut5PbUrj7AxQUCev/FcufqRKYvse6IO0
         NjxfkjJvhnufZng4DVJ7e8NkbaXSVPWMOIaP/phQGRVR+1X2lWOl7gyJta3Syk17AnfW
         xyVg==
X-Forwarded-Encrypted: i=1; AJvYcCV5guLt7vhk7CtQZh7qlVMdkgC8JrWSSQxgLnxM6iGtX/dWT1bb00czYuKN7GB4cU8HlNoIHZBoTmF4Itfk@lists.linux.dev
X-Gm-Message-State: AOJu0YwLcNIg3aZBqO0K6EfugkQsTCJqZcE0pWnRAzC5os/DyMLn66Gp
	8LDNQ1uI3ZU6CUmCZrdH/JzLa+Rn5W7yJk1C/dEssCwEdowpsbnsbFSX
X-Gm-Gg: ASbGncu4r1JWV1IV1gueaHfNogTx3L1YpAMPJjR+xuXpU1g2mL1OURP6DN9UNrGZTrD
	Pa6KabtAgwgCWHNrsZQZVuA9JnOyHBdImcLzMUL0BDcpB93GKTSt94PfTZJVL4yq+K5eyjH7PlY
	IPS+U/y54VUJJsKSNG8iDyW4wabO/Ve79GxHFke2Rd1vL3gM1x4Tv5ppoxua9vsj6IqYhn7/4pa
	fFA/LWe91raTtZBVE8ZQIyU3m6BlYjZbYmMCpCX1fTk/67SexbWYEiU2a412PoQ+bUDpGxsclaL
	/EMuVqTl1mmiZHiEGXRxJA0EVsQOT3y5Rz3fmc/+TgN/oaQz0WJHue1LZhnpXgbnOAG/8JN+QoQ
	j4bi6Pn5pzYic6r3A/rm56a9VhAwADnqiZHvD9SIF8cfnvQo9Qy8etOelFW1SdSc4uX+pW+9coK
	eJ+CGe+l4ft+uFx/pUDt6nMHaNiWk=
X-Google-Smtp-Source: AGHT+IFMwBYwj8RzHSh4woU0eevledo4c8hN1mPiW76L581g+wR11bGflC1/9eoKimvmIw7JWJyzbA==
X-Received: by 2002:a05:600c:1d1c:b0:471:115e:624b with SMTP id 5b1f17b1804b1-4777323ec6dmr96147085e9.17.1762854335978;
        Tue, 11 Nov 2025 01:45:35 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:35 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 06/10] staging: gpib: Fix SPDX license for gpib headers
Date: Tue, 11 Nov 2025 10:45:08 +0100
Message-ID: <20251111094512.6411-7-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251111094512.6411-1-dpenkler@gmail.com>
References: <20251111094512.6411-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part destaging the gpib drivers we need to add the
WITH Linux-syscall-note to the SPDX license in the gpib
common includes as these will be part of the kernel headers.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h       | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index ddf82a4d989f..2a7f5eeb9777 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 /***************************************************************************
  *    copyright		   : (C) 2002 by Frank Mori Hess
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 55bf5e55507a..50bb6e251e45 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 /***************************************************************************
  *    copyright            : (C) 2002 by Frank Mori Hess
-- 
2.51.2

