Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4603FEC
	for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 19:31:05 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id r29so12193066edc.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Mar 2022 12:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=a7HRwjDEJxx5yg811uZ+El9Irh6PSqQjZkDfhBzyEJc=;
        b=IkPMoMgeiWX9euzrEh34idXsewhkiTsDMfQ4x8fRuLFJvG9pkDB+Ej6bDJHbiXiT79
         5pXld5HpJfCGZ2zHsa10iVQA1Fr3wPQOO4wXOQP6wkUhPEF3vrLUN7YwOEKWhUU3qiS9
         d3WZQZw8yJd7xZeupkYX1MQeZQT3j3Ss+NkALo1eO1H2AsZp5XAAfCyecn314RxQ+ct1
         iiGjSKDWcelHW5gdiDwfTFiYIcbwMr0VKQnrtvv24RcR5QGQNEO8cga3HfAr4x5nCQBN
         X/b9/CsLo9ES85BCdLCbc/OrpydZ1Y6Atoted9VZla7MHkrmb43BePn7DgxHpItnopa9
         10wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=a7HRwjDEJxx5yg811uZ+El9Irh6PSqQjZkDfhBzyEJc=;
        b=dQUtBvqQMKoveohAA1dnGhI0rBPYeg2iwCHSk0s+RQqOehphZHDN5NySeGaIVdpBD3
         mnW53+1Arigj6LgA/vjgFvtHdVidgG/W6DkWgbdk4oAJmUeD36aPPyqoOLYItWN1J9rU
         S/KvEU5zXJkCm5b7ks1ieNKTwa16NhUU09fzja0v1dnQFC1L56NFER+Kv56bOo1ZuE/B
         twhsoMTLoyUOFI8lRgcmkBUVAX4Ri2Un6tDtt84QR15QaX4O+uJDVKjQWq+8MMnYZh80
         bWOPLKTku5aBA6jv3L+6NTMdTGVj6icHwju1+gfl9opB54qhrF5RzcfLs4+J6xOL/Mq/
         trgA==
X-Gm-Message-State: AOAM530nP270dlnIhdY/bHmXSP27sMFKRDS923POQWOzbcduCc8kifOy
	PIJV0bibeN91VT8LGWMzsd0=
X-Google-Smtp-Source: ABdhPJznxEeaNX3jPoinMgMsuNlfxcF+mxXZYgiZDGvyjfezB5HidM24ew+6yv8Vwildii8rh4dTWQ==
X-Received: by 2002:a05:6402:b78:b0:416:171e:835d with SMTP id cb24-20020a0564020b7800b00416171e835dmr21786233edb.270.1647286263620;
        Mon, 14 Mar 2022 12:31:03 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id n6-20020aa7c786000000b00410d2403ccfsm8638437eds.21.2022.03.14.12.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 12:31:02 -0700 (PDT)
Date: Mon, 14 Mar 2022 20:31:00 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: vt6656: Remove unused bb_vga_0 and
 vt3342_vnt_threshold
Message-ID: <cover.1647284830.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused variables bb_vga_0 and vt3342_vnt_threshold
missing in staging: vt6656: Remove unused 5GHz support
Reported-by: kernel test robot <lkp@intel.com>

---
Tested with vt6656 on mini PCIe card (connected over USB)
which is using rf_type: RF_VT3226D0 (2.4GHz only)

Philipp Hortmann (2):
  staging: vt6656: Removed unused variable bb_vga_0
  staging: vt6656: Removed unused variable vt3342_vnt_threshold

 drivers/staging/vt6656/baseband.c | 24 ------------------------
 drivers/staging/vt6656/card.c     |  2 --
 2 files changed, 26 deletions(-)

-- 
2.25.1

