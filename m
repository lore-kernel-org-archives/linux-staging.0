Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1B217C1
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 10:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/Q8RxLa"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6b26a3163acso1652400b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 03:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697971116; x=1698575916; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CRC3MPU3+PlhHX1INeJam66eUqKFQK25lowlCfDUuQY=;
        b=e/Q8RxLaqhM126idaCCwZO/ruF7tW3JbNtZBB1E/Slmg9nQXK14bO2wF3KadAB0bgo
         FvG/YZ1WFhQVetl+OBSyaA6j172StgzD7QU8Akaav6YNFbv/+F7dJPOb4t9QxRV5UxOV
         vgT5MdmAxuLoEIyYTcQUMXMHBG3KnyYFYNH2dkEzclBWk3X83CI8spDr6NmXZnyCuq2T
         9/CwGWsE343IgUOSqxPk59zBeI67u7bKlaQURyr0sqLu4RoI4fcZNxzfi0wVFOv/B0Kp
         f6BwPj9TNi1vW6bSNvWmYKMCmYSpPvqfXsFdnwbhQEzaLE83wKeVvTuSR9FCx/LleLBG
         f6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971116; x=1698575916;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CRC3MPU3+PlhHX1INeJam66eUqKFQK25lowlCfDUuQY=;
        b=qQfmb52J1fVSvABxiUEZLW6/fjE4UH/1HRDgQlQGk88/RKhHSKzlI6WgVTFkO3jJ6k
         NmejVQ8cQH/X3cPQYFAzg02IAqbFfgAjtuiruuJr46xx8Y/afPVs9IYKsAAKWCYXYZnI
         w1HO5foJUbSArQixK4jVA7V8Pw7K644ex/qRfSGlE0xgK/m3X02oOH9j5dwDRp9x90G1
         uibeIF3wCa8iA4FC+m3eGZJpH0Sonl3pLZvNNZJ0d2pyTBXeYnDExweIYshmXE+P/hQ8
         QOt0PBTDCh4nn7ywbJ4FDYTcF2B4XZ8zW8F7REmpq6JFpuFJBglIJJtBt+mn9vzXwrr5
         6ljA==
X-Gm-Message-State: AOJu0YwRNfIWcVYEye9FAgd0vALGGocZOs1f/W9msEfdGwqUzonL36pC
	ZeE1lrWC0EB9lY+jHPDC8Ko=
X-Google-Smtp-Source: AGHT+IHLNW3llJuF9Jr1idWiYVPYxCXj7/J92O3j8sKW3d6kkonFkmwwSrHZIRNVYjH1Gjo9LhGN6g==
X-Received: by 2002:a17:90a:c20d:b0:27d:2e5b:55ca with SMTP id e13-20020a17090ac20d00b0027d2e5b55camr4158127pjt.26.1697971115820;
        Sun, 22 Oct 2023 03:38:35 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a1a4800b002776288537fsm4538411pjl.53.2023.10.22.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:38:35 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:38:21 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH 0/3] staging: greybus: Coding style cleanup patches
Message-ID: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset performs code cleanup in greybus driver as per
linux coding style and may be applied in any sequence.

Nandha Kumar Singaram (3):
  staging: greybus: Modify lines end with a '('
  staging: greybus: Alignment should match open parenthesis
  staging: greybus: fixed prefer using ftrace warning

 drivers/staging/greybus/bootrom.c |  2 --
 drivers/staging/greybus/camera.c  | 13 ++++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.25.1

