Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDED1CEAA8
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483272; cv=none; b=NaQTeKrw0XmUNMkZgn5H7DfFWg12LAKtW2M52AURQk++5dzvCgxO8Eemwslic41d4e8UOVNMC5Xsv1cLc2LZFxdV9Z8w6Dsjkz2mZ9iVnHx3Ds2YbqwHr6TEwzPjR0n7mRZ3eo7wTZyABnFHtnahzcAEAjJLwIdmwQNZa6u6kdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483272; c=relaxed/simple;
	bh=oa7FxakZaookSds0SFTFTDKYzsIa7xsMb5ayvu/2Js4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPrP1Zs8uHuFpRjq6FE5egqgeY7briPF7x88f5XcWzEpROo3IlGmmVGmhifm4vZiib9dbKdQO0PM18gP0eMfTYlYWQ7FkBCVY5QipXO6AJ8J/DynbBWp3qeJ2gZfFX/FQg70W+5a2dW0fAr7gqTjUiBTS3ROmgBr40ei0iazsEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hs6vH+JB; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hs6vH+JB"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4315baec69eso18900445e9.2
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 10:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730483269; x=1731088069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dv3PqSzswe4Y5a8fVVX7vlIBbx348r3jo5xKs83X2jQ=;
        b=Hs6vH+JB6s8A2zHzFBYEtjc20nu6tC2VqN306l5j24OwVs6ayp3IQaa2JFr8t7pvZ+
         Ql//3CEp8P4DEp7sMmNPF4RFXKnYpk0sXZc8Dw+RLpGR8Y7RMGWTE+uG3OEGQfL7y5il
         9OtuuYv+dVgDko3t5HUEfLj4cBgiMUlpcb+Z5G8NNOLifEc6lVy4702U1rjxfk5aET+w
         F/y1J7NQ4C6uRsr0s9s4IiZFEhDlH3hPGU0Vw2b3jfODbdv1uPhbSMFRzEFdcgdP7hCj
         CTn52KZdElSvERSBhkIsDP1ZgtC2pWu4MHzJJIdlPVF6oKM8uRnXucFhQyaQK0c5+hfg
         ubGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483269; x=1731088069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dv3PqSzswe4Y5a8fVVX7vlIBbx348r3jo5xKs83X2jQ=;
        b=SQwnSxbt19iT3JhowPr0V4H4GUYx8xkg4YZAvztRzu5tIjVQfKTy/SvAjrYX8AnC3E
         mzKybpxXum8/5hPlHTWJgDDZtYFKiBKPmaxv/gSJZg6sXztUyRSa8OPrCHUHkMXN4wHW
         TZyaCzf4rbkHnF7N6wYVpzPv6O25OuttRXGgNI34q7TJi1YI3YHk20d+jsADF2RyT1+0
         aP4GheXE7ON4e1ryTF1DXWfxkvlaJhukA6eb1BlG3R59pO9oRABOv1U+TP5s95u4+3Nz
         aWPvRrH+xUN3AE22XZ75kXXpFBD/puuhNIjFQ9dODGTj0RljKkfPa+c4rGFnr+Kytjd/
         rFjA==
X-Forwarded-Encrypted: i=1; AJvYcCWutH7dNVWdo0JMQxTfV2/9CTXjYQTLCVmV3Sa5CbTubUbgjAl8McwtoTa8xbKcHYQISWSnJVG2/OBhA0w/@lists.linux.dev
X-Gm-Message-State: AOJu0YwdRu7E8z9ZgvDeDutGW232d86xKmBdHeWYd7zqZH+NfVDr6xFf
	sIDNLbof74EliiTPmSWSicX1EhpOo9k3RmkdDc+kzMDZ6ob03IKE
X-Google-Smtp-Source: AGHT+IE0O7ngfpdMaxPEYBKK5+0KGkwJ4Bru5OWs4wnoIv0xOr7IFO5MWtlBds+6seq0q6jQeLc8Kg==
X-Received: by 2002:a5d:6d8e:0:b0:37c:babe:2c49 with SMTP id ffacd0b85a97d-381c7a4c7d7mr3540674f8f.19.1730483269243;
        Fri, 01 Nov 2024 10:47:49 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm5732933f8f.112.2024.11.01.10.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:47:48 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 7/9] Fix Kconfig
Date: Fri,  1 Nov 2024 18:47:03 +0100
Message-ID: <20241101174705.12682-8-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101174705.12682-1-dpenkler@gmail.com>
References: <20241101174705.12682-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

   The NI_PCI_ISA driver also supports PCI and PCMCIA
   Correct spelling error COMPIlE_TEST

Fixes: 2c9f5d8c6ece91ecd33350749230494d224550f1
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/Kconfig b/drivers/staging/gpib/Kconfig
index 0ea9a276c389..95308d15a555 100644
--- a/drivers/staging/gpib/Kconfig
+++ b/drivers/staging/gpib/Kconfig
@@ -61,7 +61,7 @@ config GPIB_CEC_PCI
 
 config GPIB_NI_PCI_ISA
 	tristate "NI PCI/ISA compatible boards"
-	depends on ISA_BUS
+	depends on ISA_BUS || PCI || PCMCIA
 	select GPIB_COMMON
 	select GPIB_NEC7210
 	help
@@ -138,7 +138,7 @@ config GPIB_FMH
 
 config GPIB_GPIO
        tristate "RPi GPIO bitbang"
-	depends on ARCH_BCM2835 || COMPIlE_TEST
+	depends on ARCH_BCM2835 || COMPILE_TEST
        select GPIB_COMMON
        help
          GPIB bitbang driver Raspberry Pi GPIO adapters
-- 
2.46.2

