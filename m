Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99044259C94
	for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 09:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762854335; cv=none; b=PC3DQFwp/z5AE0JfSzoVK5VIckR+gWwlt7b31oqtmFKjlfpIDZxTjfsHI+s7EjReVqPnBpTwWZTE+hefQXeHVr9QuTxyVtAiWVsuoBXWiL1guaPpRbJzop9SNcVwfXSx3TWD/VvO9eRzQbGUaOOBXpd30pd6UfGgFVAgjRHZST0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762854335; c=relaxed/simple;
	bh=DgA+YQZ2PXtKWbfJH1XR71F2ykLEULNrwbgH40vjVnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FhnMStXJ5A76/AaCgA6DlzomSCAb0mrEDT671SMH459XVV/xh/kgQD6C1ukc8kBgAfQsZzzjl8zKIxxD8HB2uBvVm+5faUy4X/ovh78bYIfrhq8nD+KFZ5ACcbqmiFJmAYcUh4Urdk1pkIiioNQfKGAVLrEZgu66C+A55ClVkZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxQxGW1z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxQxGW1z"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4777a9aeedaso20115225e9.3
        for <linux-staging@lists.linux.dev>; Tue, 11 Nov 2025 01:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762854332; x=1763459132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Q6cLMd5HkJMSjJpe28rjQcWfQMB7GUBaFpYg6qXkBE=;
        b=SxQxGW1z0N+0fEZT4Zv3g4oM93d5pFefFmaN+gWGhFYcWs86p91d+nITO0K36wIIdL
         DdetZbB0if1orWZw24iynQ+CCjTc1vgySwso87T9O1XYN4+ZfzSDQ6isr3W25BNWLS9T
         GkYIhfgsuMGCiZ7ytyVG2uzX5t3GUPcS/wvfPE78t29IklDcGjWYITt/VY+2B4md/oVB
         tbAL+nnISjIUoxZRMv9kJ8W61sPvUtVLLdgqzSmwGqyPQjv8m7/b4JfQW8mz/iYLYTi7
         D/R2mYNYXOKj3WZDzvF6/RTqXf0SMNkAQRiOPj4/o4tH86GjxgSvOFwcTQ15mXDQgndy
         RYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762854332; x=1763459132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Q6cLMd5HkJMSjJpe28rjQcWfQMB7GUBaFpYg6qXkBE=;
        b=frcWWm+s3Uge9g2qWn3hcjZQh2reEcKZcmcXcQbOQ8FDYAnpduSI407GJpTxvOVn7r
         sZqAea6H7jnZMREUuSLdu3gtAyQF/q6g+rYkhYnprgvtko1pPSmbVfcJ9W/bvRODygTe
         5DZ/2/D/c5jew/2CfQnJW7ZFwxzhZEWnsEAOn+iGDwYRN4QLOrRT+7D51iXwrKRuh8A0
         WDkSN44ALAcJ+GVz3OufCKGBYvPHrRLZS6JBtsV4OfLB/EXklY3/mdhRrB6HDA8PaGaF
         VmHjcdev4OEISQ9GDmK7smqoQvoGPoaqPDDCWqMVFW7aZF7azYo351JVUMM6SJuUD1vS
         Wjhw==
X-Forwarded-Encrypted: i=1; AJvYcCUKLLrRoXBSSy2t92ZYlp++c/PUlqdcsGpntnsZOcT6tBdLVC/1QjfOJ6e+vesWNywvbE/Xd/JlrdzYVCCy@lists.linux.dev
X-Gm-Message-State: AOJu0YyHc9aUnUWo0tfXYSiFsZnL4j0Ghe7k74JELhml3PefjOXZh54F
	xx5/7CKKMZB26tENVeVBEw4ffUPb0UXjKjNSZ4CaMOr4vmk7IMph7dvz
X-Gm-Gg: ASbGncv1CC5chZyaHOVLZ1PXY56F/BfT4Jtm4zcfqi8Raupzcp2Zjz3OXgU45mVOVjE
	MtiaPXHxkgLJTCNQ7NOXjx6IcYXzEEwocfHk9+JpAI1KOQecnSSBIbz567lNeoFG8g5mlx14G8E
	VJHc1RTtugQiqucCFBa8pXqv1nREEC1+VEBg+Knuizjg/zSBEzrMKU74fftFTpsNHZvxtIxcfYP
	pkrMqAw6kpfPMDEQ5dPmXxB3Lu+t1BeuXQzgnoFItNL4KxvKLEcVIprzGWFJxVHFVCOeP6sF+Au
	4y1tny88vgkC+senRQdsgWKhiVpGg7a0yTEJMqwNe28HY9+j5pmlrXU5KUmPD1ystSACvCXeyRv
	/DkhVnBDK4MK8sefPCu7OZiHQJ0SDzX4eNW0TrlcLX86xjkkto1AJBX+GXlfeIIO7vhFIDGPB1k
	euR8xBgNNVthtRshlRSrvFCBx+q34rd/N8+UfUhw==
X-Google-Smtp-Source: AGHT+IFfazzHe5CL6AcUJ7owIgI9DCqe9HNl/2w37vTq4ZGQz48QlaaAWva5IFao6kLS9S+USHkJWQ==
X-Received: by 2002:a05:600c:c4ab:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-47773298039mr89418525e9.41.1762854331642;
        Tue, 11 Nov 2025 01:45:31 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm359537865e9.0.2025.11.11.01.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:45:31 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: johan@kernel.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH V2 02/10] staging: gpib: Remove gpib/uapi from search path
Date: Tue, 11 Nov 2025 10:45:04 +0100
Message-ID: <20251111094512.6411-3-dpenkler@gmail.com>
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

The gpib/uapi header files are being moved to include/uapi/linux
as part of the gpib destaging process. The latter directory is
automatically searched when building the drivers.

Remove gpib/uapi from the header file search path in subdir-ccflags

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/Makefile b/drivers/staging/gpib/Makefile
index d0e88f5c0844..2d44fed2a743 100644
--- a/drivers/staging/gpib/Makefile
+++ b/drivers/staging/gpib/Makefile
@@ -1,5 +1,5 @@
 
-subdir-ccflags-y += -I$(src)/include -I$(src)/uapi
+subdir-ccflags-y += -I$(src)/include
 
 obj-$(CONFIG_GPIB_AGILENT_82350B) += agilent_82350b/
 obj-$(CONFIG_GPIB_AGILENT_82357A) += agilent_82357a/
-- 
2.51.2

