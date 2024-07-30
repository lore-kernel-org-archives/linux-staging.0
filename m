Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C48156C4B
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722328949; cv=none; b=k8Txs7mXc0sHSYTLiK19xQk56YSDU0gsk/7uf/CRcqQCtvSvIQhG7g7FCWPnY9vdtegSUA8DSoVNbBLsdqXxxC/8JH8WjI6g6FjZP4Er6cxMGKRviLxCSPoU1Ft/d7cZ922QEQVEAlcMLZ+aUH5Qf7mAf3nVVm+uZDr3Rsta7xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722328949; c=relaxed/simple;
	bh=9f99ZshAdpMzhQgkOB08+VcEn19vXElnV5/Jww6jgHg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NZixHfletxNNaZde25tu8ONnJHEjJTj6qc8W5Ai3eTYVYAJTBod0Zvcr1wkx8Kf/pLbJRqUT7GWwX53NUTgF6lLmRLAtws79N1qups9MvmPo/yjcpi40aRC1V0G/NRvnV3efKWitq96tstVcPxVDVJLX1ITX6kqAgVj+KDQ2C4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6Kub672; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6Kub672"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc6a017abdso25115445ad.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722328947; x=1722933747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktc+zByxGCpNSn/SuzIQLblDhojXKqXPkfeQRZpAx7s=;
        b=c6Kub672qHnugj7d/2jqbllMjrM8ZxaSaWP37SvmG5vZuH8bQSOzsgNR40cMlq277N
         iz3Z81t+SeXK1nZM19ojQ4bqBjx4pJiN3Ygrez7pPojpLx0tuAVGLEOe/M+hJo637Siz
         /IeGHFOI2fo8lC1LY0GmBQxvutEb0KffgqZvhwGj11a+UNwK4Hm70REBF5u0M7WPv3A/
         cWo8hZ6E819KzcyvA/5ADf6rUSgCQ7/ku/Qze/uVITbIda8Ee876dNv1QDMKaVyYTwU+
         cd65lJRppB4ZRCnHlUpigMGu9+TiZatZgbP94Jc0TThcHkMCkICNmqpRGzjSFRBtwIkZ
         +LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722328947; x=1722933747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ktc+zByxGCpNSn/SuzIQLblDhojXKqXPkfeQRZpAx7s=;
        b=EZXnIkTueWhKR5pqccxm7JqDAItI8alPrHfe4i8NxCSyMSCi5Mx3WhySu38CJ/euho
         f99BUsNLV5SA5lZyPzDmyqqbDG3+80NnSxW99kjnFyR/PIMwx6piZZISp480Kbs0M1v4
         PXQ/WvsHGYMbBHUgfIupNlCy7sXp6sHNDnmqzJmUJYnDvCHQfb7ayDwg9abgqZNgIRcH
         5/PJGpd8W/Rnet22u+EReDTFJNxrICZ/LeGZotAfCfSYPU47OV5YQdMNX8woKo3ejJG0
         BSUgTTUquPcr0ot1NJjnhRersOlqOzAMSsHT74ESG4mW4Vh9GR6FMyb2FD8yji4BmwGK
         Uw6g==
X-Forwarded-Encrypted: i=1; AJvYcCU1swQwdRuOKAP6w6FsLJWxTTCsBnOnqbhvJKga/tE11HPEVHOSQKEwOEajAWhepmXk94U1dFTtKj/fbVAgrr4v5HbpCXYiTmhoDC4oZQ==
X-Gm-Message-State: AOJu0Yxa+AgTygPAUzOTDNUeEakP3m5ec3lR9hH+wiscFS9PM9Bbgy4j
	Tya5vrJnTQpN6vTyMMWXCIlK4DOoPpSfR+osa/YR1YAwMsiA5TTQ
X-Google-Smtp-Source: AGHT+IFS5roklR7pqnpjyRBbYHJ/0G3WGJQkAF/eeS2Vklr8/2pmTx6NEMdxypvFZ67euCGuzjVM1A==
X-Received: by 2002:a17:902:f093:b0:1fd:8eaf:eaa9 with SMTP id d9443c01a7336-1ff04853333mr65520745ad.37.1722328947234;
        Tue, 30 Jul 2024 01:42:27 -0700 (PDT)
Received: from c4897d9ba637.debconf24.debconf.org ([210.110.131.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee889asm96193975ad.126.2024.07.30.01.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:42:26 -0700 (PDT)
From: Sakirnth Nagarasa <sakirnth@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	helen.koike@collabora.com
Subject: [PATCH] media: atomisp: move trailing statement to next line.
Date: Tue, 30 Jul 2024 08:42:20 +0000
Message-Id: <20240730084220.38204-1-sakirnth@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <sakirnth@gmail.com>
References: <sakirnth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpath error "ERROR: trailing statements should be on next line"
in ia_css_fpn.host.c:46.

Signed-off-by: Sakirnth Nagarasa <sakirnth@gmail.com>

---

Hello, this is my first patch to the kernel.
---
 .../atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
index 57b5e11e1..8ccfa99c6 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/fpn/fpn_1.0/ia_css_fpn.host.c
@@ -43,7 +43,8 @@ ia_css_fpn_dump(
     const struct sh_css_isp_fpn_params *fpn,
     unsigned int level)
 {
-	if (!fpn) return;
+	if (!fpn)
+		return;
 	ia_css_debug_dtrace(level, "Fixed Pattern Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "fpn_shift", fpn->shift);
-- 
2.20.1

