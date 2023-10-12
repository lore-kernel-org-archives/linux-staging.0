Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3B33D03E;
	Thu, 12 Oct 2023 23:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B82M1aod"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3af957bd7e9so904865b6e.3;
        Thu, 12 Oct 2023 16:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697153357; x=1697758157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PQzVbFzPaK/7j+0uEoI7g4sCbjf7855ArRv9lm1q1A=;
        b=B82M1aodlnRI9nCFZVMU/mqp4O5CjkrwhgZWcX+Pmkal/z7glFud78cyTIvsuKdilB
         AKwoO2tGAYO5jyktt7HD5NcxVet9nYTE9f5k3CzVf/DgGNdSBPfhM2rCIUbtN8yA2h/i
         Menw3hZOCk31FT7M6eQuYh5/zyMljeS1d9Y4LOO3wJhLcAqlVop+PF7uuwny5cMikB49
         AbTYjlx3dA44QFcMbbgv0XH4dBUAOXSCYQtW69lFXZ40LjKo1rvA/1DDDGTKAy4jJT2l
         puG2teqHCd1yitIHdtIn/HC4dZ8ucud4ZJhndX8G35/ksfjvAypgovwQaS1ljWUr81vJ
         hYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697153357; x=1697758157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PQzVbFzPaK/7j+0uEoI7g4sCbjf7855ArRv9lm1q1A=;
        b=wfyhoMCg/tzjA6sMrkXtd+c/ZNc4E3AAm5ERUHvasRGz7z6jQIwa95ppKWldltF8js
         RfEcTEKO50armB5JpqPtNReyQqpLr2H+UsyrVOyPXfpDcpXRNsm0s4cbLai243hsbBPT
         xRYIfSipiPOXysTQYO2GxHBR23xxohQnjcOijz5l8nllVoOU44qbfZB/MHr6jka5eUJB
         eOWuzjMm9O3JFasQHFqbkVEjaBLud/XD/jEd03Q2MIVSOej27VA82On/Kx8YqxOkpwZk
         q2EcuIgrQREFnd3dnvOn/fSbhfLBqibRlIHUPMoUfRmnh6DIdpIqM35cG6UuL+w0aVQh
         g9Gg==
X-Gm-Message-State: AOJu0YwO67fFfX5Lz/E4zYHVTvZU8FfGNGKkxzSEWcj3aFVRQjX2mGri
	dAZW7WzAKJmMWYT/FqzKGIg=
X-Google-Smtp-Source: AGHT+IH6y78R4gypagB9eKwVM2UDqVio3PcPJNPwqL/9bWcgnOkEZB+C7vXkwYV45RImeq5Kj4hV3A==
X-Received: by 2002:a05:6808:1313:b0:3af:8050:369f with SMTP id y19-20020a056808131300b003af8050369fmr33008736oiv.6.1697153357378;
        Thu, 12 Oct 2023 16:29:17 -0700 (PDT)
Received: from Negi ([68.181.16.134])
        by smtp.gmail.com with ESMTPSA id z15-20020a056a001d8f00b006abd5f6802fsm3263319pfw.60.2023.10.12.16.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 16:29:16 -0700 (PDT)
From: Soumya Negi <soumya.negi97@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Micky Ching <micky_ching@realsil.com.cn>
Cc: outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Soumya Negi <soumya.negi97@gmail.com>
Subject: [PATCH v2 0/2] staging: rts5208: Fix checkpatch macro warnings
Date: Thu, 12 Oct 2023 16:29:04 -0700
Message-ID: <cover.1697152251.git.soumya.negi97@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the driver staging/rts5208, checkpatch.pl warns of possible precedence 
issues in the header rtsx.h because macro arguments are not parenthesized.
This patch set handles the respective macros differently(as needed) in 
each patch to fix the warnings. Patches can be applied in any order.

Soumya Negi (2):
  staging: rts5208: Refactor macros to static inline functions
  staging: rts5208: Remove macros scsi_lock(), scsi_unlock()
---
v2: No change since v1. Resending patch set because the patches were not 
delivered correctly on first attempt.

 drivers/staging/rts5208/rtsx.c | 24 ++++++-------
 drivers/staging/rts5208/rtsx.h | 66 ++++++++++++++++++++--------------
 2 files changed, 52 insertions(+), 38 deletions(-)

-- 
2.42.0

