Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60923D76
	for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 08:14:06 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id va17so7325471ejb.0
        for <linux-staging@lists.linux.dev>; Fri, 29 Jul 2022 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=oM46eXptfbatvoXc4tueJ2S0lHEzCvpbn6+eK+o9Gjw=;
        b=Cu08n+NMzjQKaMTXkYNop6J+Rs/nc+Zfc/M56sm33BmW2eZXO7rx7c4d9ECpwwNz3r
         oEfAqTopNg8oy7TUaGaMpgZO74hlFdG3Bg3fxim2Vz1HwESq9vJhrSJS/piVKkgBzxrG
         EfIZ5FySpeExK0u0ptq6pGahcH8h0KFFUCxpSCvUqX7dmr1CLGBFS6DxWgcoRBgm7NZM
         UmdhnsxcYvVU/6VqKMRPXodXzjTSyXKP/4DcikNLjW70ahYpfai3rv58SQZ/9CVpkQzx
         wMbN06y/p0TguRCeA1z5LQQTCZmZbf7oqmgnhLRoMytLKAOJDS9q1zJvLuPpfYZQqDpe
         vv8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=oM46eXptfbatvoXc4tueJ2S0lHEzCvpbn6+eK+o9Gjw=;
        b=wHqq8mB4YElAEKW1XETv68LOiKV3p259MC3ywoGJUsEdxpcAcaMtbT9xRuzZXs0sF2
         QNDa43yGu0+DfMroIlCOoqeYEQcAMo3BdEEioy8zgKsgql6eC+Xh59yPrc5b3XaTBVES
         G/z8DvKnRg9Fj+r+7wECbvDBucn6Qtbgv9xvykG8ixMsyH8hpb6RM1ZKFfoA/iPKuicq
         3FdP1NnAV6uKQ/qo3+M4IPWfFhZpIk+MPWn/OJUkpjkxjAgZ1AiX2uIdUXW1bhhSVdN9
         RxOBkgLUk6IbcSESA9fGm9Fr2ze2DoWLHjvFdOwy6VeybOxPjyRgieaGj2CQ+yxAMN+u
         YrXA==
X-Gm-Message-State: AJIora8o4H49TBRsG9SSzbPchKf4OylZO1+c8OhKbynqiAHD/Qm3tDi6
	X6Ks8xajVi0HDYiHka2IAcM=
X-Google-Smtp-Source: AGRyM1sKlFf5DKlbm0zqhYVX1EaD2q4iDOyWD1ZRODA6ja2C5v4L9es0+Rx9uk47bjrbWAQlRBY9dg==
X-Received: by 2002:a17:907:2bd9:b0:72b:1752:aa52 with SMTP id gv25-20020a1709072bd900b0072b1752aa52mr2069615ejc.646.1659082444775;
        Fri, 29 Jul 2022 01:14:04 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id 5-20020a170906308500b0072b565507c5sm1364222ejv.203.2022.07.29.01.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 01:14:04 -0700 (PDT)
Date: Fri, 29 Jul 2022 10:14:02 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] staging: vt6655: Convert four macros to one function
Message-ID: <cover.1659080988.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert four multiline macros to one function with parameter. Multiline
macros are not liked by kernel community.

Tested with vt6655 on mini PCI Module
Transferred this patch over wlan connection of vt6655

V1 -> V2: Combined patch "Rename dwData to reg_value in four ..." with
          patch "Convert macro MACvReceive0 to function"
          Combined patch "Add parameter to function vt6655_m ..." with
          patch "Rename function MACvReceive0 and add parameter"
          Changed order of renaming function and conversion to function
          Improved to early line breaks in patch descriptions
          Removed function declaration of vt6655_mac_dma_ctl
          Changed variable declaration in vt6655_mac_dma_ctl
          Improved patch descriptions

Philipp Hortmann (5):
  staging: vt6655: Convert macro MACvReceive0 to function
  staging: vt6655: Rename function MACvReceive0 and add parameter
  staging: vt6655: Replace MACvReceive1 with function vt6655_mac_dma_ctl
  staging: vt6655: Replace MACvTransmit0 with function
    vt6655_mac_dma_ctl
  staging: vt6655: Replace MACvTransmitAC0 with function
    vt6655_mac_dma_ctl

 drivers/staging/vt6655/device_main.c | 23 +++++++++++-----
 drivers/staging/vt6655/mac.h         | 40 ----------------------------
 2 files changed, 17 insertions(+), 46 deletions(-)

-- 
2.37.1

