Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED26C2F2E
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 07:36:26 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id k25so4737872ejp.5
        for <linux-staging@lists.linux.dev>; Tue, 08 Feb 2022 23:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khhrPYhhB+d5bD7jt+HViCNb3g2CeK68FLJCl0hiF1k=;
        b=N4EsKMbbTMGDAM6TclaOWAxv80Dl+AawV34nCCSLGq3svNfM/s+BD+TZFsnQ7EmX50
         END5iKLZ8BHdco3ceVAMFKFXfan5FmMLOIzuoHPF5Hj69+b87hKOSHUoOFHSI2UyDatt
         nTD3cH0FgySyLj8Qy7VtA2EmBIkQ4L6ULWz3t4P9Pp2cXzllo5bx42lOQa+SCB6RdXeF
         fkl+KuyIwfhVNmBhmGZmQmUUbwpFheMWGIsaZpNWZHBvKTFicdqSq91/78C1xZu5CPxy
         g1Qowv4049wUYm3Rub/KUYsbAOXbq5ZFRwSSy15NOIbNTklfJPJHrgZW9YhZrblvbAal
         uI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=khhrPYhhB+d5bD7jt+HViCNb3g2CeK68FLJCl0hiF1k=;
        b=F1wN368PcGh5Q3KlmjfJ6fCaGj3ZKFmGMw80KOZLV2OmIP38y3UDplQ2NccL55YnZE
         XGnQvAsZXmdlNXSU4fppmQF3SbPq03wHpxZujKd4kH5Zb6grXxS80Li7kqtdMfMaRGuK
         fgGyZlzhfgbpfpWMvIMyXv3h4SC8epg3eUp2ZxHWcykm86+sxRNCVQjr10hURApBqRCb
         +KfcHW+sFbem6tA4W8cZ5vrCL7VlLllgoIFvyOK/E92MykrMOCUcaM20lld0kENpfHqu
         OVmXuRBjABCiRU5es1TjSIGHcKOSsPZRIGI7IZKSQtNfaJuS1ICBJDB63nZ/W32K90PV
         cZOA==
X-Gm-Message-State: AOAM532F9cLr1rfWssV2Hop+g811rKAYzXHMOjq7vFxk1xFr06Ieuxvd
	kyvmJZo7CErH4LP+8ofScbY=
X-Google-Smtp-Source: ABdhPJyaIZmFE2PWWixo/NCiVL4Hg1mRmzvOgO3DgGsNdxYQz5e7A3uANmoYGMj8azpPZanQCASezQ==
X-Received: by 2002:a17:907:724c:: with SMTP id ds12mr781398ejc.203.1644392185116;
        Tue, 08 Feb 2022 23:36:25 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id y27sm3731813ejd.19.2022.02.08.23.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 23:36:24 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/2] staging: r8188eu: two simple cleanups
Date: Wed,  9 Feb 2022 08:36:16 +0100
Message-Id: <20220209073618.29725-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes an unused enum and unused constants from the enum
hw_variables.

Michael Straube (2):
  staging: r8188eu: remove unused enum
  staging: r8188eu: clean up enum hw_variables

 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c |  8 --------
 drivers/staging/r8188eu/include/hal_intf.h      | 17 -----------------
 2 files changed, 25 deletions(-)

-- 
2.35.1

