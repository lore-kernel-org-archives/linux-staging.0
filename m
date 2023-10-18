Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E604213ACD;
	Wed, 18 Oct 2023 09:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHeBe6jY"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c4fe37f166so79976981fa.1;
        Wed, 18 Oct 2023 02:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697620099; x=1698224899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xl3s5u4aFpW0tVBln3gd6w2ulesWfdj/cSoOhMXvMdE=;
        b=jHeBe6jYXYlFTVOFfpAGJRB32usR6XnexnpU2tXIt2/IvV5Af3rnuiJQFJodu0Fe2S
         Kt5mVXglIeJIwliDbwMmY3TYedIgni4Hl/jS8Z3wAFew5LgFyNpWR0ssvhQX+ANq/H95
         bMQCFDYNmb0kxgoFLu0t8eWHNswBJ5Mw5jPhvQFxYIui9nM7wnEWiR8sX/sk58NT+D/n
         vDQnGQbaoa8hmqlDY3eUf6mPVWQPeFj4ix28ieoc0ghvcrqGNI9ECe4O8FpQ6/UwV+Ov
         Z/eiVCimReuhIyHSD/lPr8U/zOYatdNES2NNTFNUdxcXOTeJ3YV6MSQy3wOVfn99Mb6K
         FTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697620099; x=1698224899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xl3s5u4aFpW0tVBln3gd6w2ulesWfdj/cSoOhMXvMdE=;
        b=AUQAMNRgtM2Xwbh2QnKm7uComyNAFSEmp4nE6tP7j4pk/dU7tpy7AX/h/rGciqntjj
         OgXu8tCqg0lwjrVRX3AmeKWRLEkMJIcgzjQg3AGxiwhTHpK9S4nTp/Xz+DhinpiCkl9Y
         EcyrClB0Z7u95hP01j1O5Ue+1iVg1SWkEDvoUir1lhjk3SalVOQ91Sa0d0/KCL9szAiU
         LO9ZITFyE5LuGwtAZcZnObwH4UWsq9Ie33XL/Unn3QzqG1OVSYA+znNrQQ0OWn7e9jBc
         yRVF4UbROwPOcXI81fo/cXrlSkLKxDGrVt1L1V6Vi8vCH6gWeD1YAv4EHgHVVaEeo8ll
         eqoQ==
X-Gm-Message-State: AOJu0YyoGRjD7LjSH5VmKHxsSPEHwSaUeoBf68PJAa/kG08UgFvKUi7j
	BOpG2LBCOtb7j6Ly7lVrSg==
X-Google-Smtp-Source: AGHT+IFZxqUnj/AB3+p1hRp/y2wDrCrKc9X/ahR53kA/1QzZt1N36O5r+BKNQKC4kqgoSxtmDKX0RA==
X-Received: by 2002:a2e:9b05:0:b0:2bd:d34:e1ef with SMTP id u5-20020a2e9b05000000b002bd0d34e1efmr3527854lji.3.1697620098560;
        Wed, 18 Oct 2023 02:08:18 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.0.227])
        by smtp.gmail.com with ESMTPSA id l16-20020a7bc450000000b003fee6e170f9sm1107397wmi.45.2023.10.18.02.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 02:08:18 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	andi.shyti@linux.intel.com,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Remove unused return values from functions
Date: Wed, 18 Oct 2023 12:07:34 +0300
Message-ID: <cover.1697619623.git.anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Modifies the return type of different static functions to void as the return value is being ignored
in all funtion calls thus not useful to have a return type.This improves
code readability and maintainability.

Dorcas AnonoLitunya (2):
  staging: sm750fb: Remove unused return value in
    display_control_adjust_sm750le()
  staging: sm750fb: Remove unused return value in
    program_mode_registers()

 drivers/staging/sm750fb/ddk750_mode.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

-- 
2.42.0.345.gaab89be2eb

