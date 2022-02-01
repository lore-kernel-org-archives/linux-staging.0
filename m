Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726642CA4
	for <linux-staging@lists.linux.dev>; Tue,  1 Feb 2022 08:43:12 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id k25so51424535ejp.5
        for <linux-staging@lists.linux.dev>; Tue, 01 Feb 2022 00:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AY4/TLKg4nBDSqO8QlLkXd5EAxzP2IB0RJLZxohCkH4=;
        b=kSjzGRNv0u0sZNDxM+TD1KeebIt7Lp0PxxGaiYsh20s6vtV2lYZ2koFB3WIt5popdk
         rFKHBOJqv6/PRFd9BUNK1RBR4TT5T6ebP4hmRfIiX0WBDM/X9D/kuyYAiH7dw6WLJ12B
         eD5s2YO/Y5beEn4EAUnMLpBo37U70BGO4p9E2HbMEqDJGHUpJO1LoJDFdGucUmdC+cib
         xJWmNLHJZtv721dJRmyD2s/D3SVJzbt13gIWiRsekSe+S6f+bSuTBbmKmySrxArNI1IW
         41GAnWqS8WehcuyEZ/ejl0Y9BHlN74avMYeyD2DLRjJUJsGlOm9F5LMWuRT0+50cK9Eo
         Z1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AY4/TLKg4nBDSqO8QlLkXd5EAxzP2IB0RJLZxohCkH4=;
        b=Hj5gtRSYPhsRyK38u+Y+z0553SVCp7d01q71+T3CjKud1+Gkc6RWFOaVPtl2uh010F
         qmjCHPsdmlsUy86tfexMxiMSESn8Y9haTjnBmFL6CHITPeOJXiEQ9cqcTaojbRB1iSgd
         FrdsCLnUIZl+O/OucIXNuAycdMeUwnV6yZMlOGE3+Outo5ZEZ34BH9M1KU8RYW4K4ps7
         nWEH0vXQaoAZC37bsUeHnAoETz9ItK8QaWIIIZXlfUNcivWpNDA+YY8SAmiurtjepwEy
         7DyM7x7NWPCttUe6nrlUgrbizmfoipyDQQ6IbhzAcCaBLnPO4Ipw46V2lqZkhij+rDKA
         4DeQ==
X-Gm-Message-State: AOAM530OT3xaC5+DgP/qFNzXGpTVFcTjUawSEojgmosI3ZCOYbyOlKG7
	5G2E9ueQ8mQykwWhL74nZrS2gm802kA=
X-Google-Smtp-Source: ABdhPJzfiokD/cOFOfWe7SOUqFFEvlK4NMX/cdmop+vDETdD1nMiM3A+AOWc0G+OhPLola7/yfYFqw==
X-Received: by 2002:a17:907:2d0d:: with SMTP id gs13mr20169633ejc.161.1643704990757;
        Tue, 01 Feb 2022 00:43:10 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb5a.dynamic.kabel-deutschland.de. [95.90.187.90])
        by smtp.gmail.com with ESMTPSA id c14sm19123431edy.66.2022.02.01.00.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 00:43:10 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/9] staging: r8188eu: hal_data_8188e cleanups
Date: Tue,  1 Feb 2022 09:42:50 +0100
Message-Id: <20220201084259.7497-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes some variables from the hal_data_8188e structure.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (9):
  staging: r8188eu: ExternalPA is read-only
  staging: r8188eu: remove PGMaxGroup from struct hal_data_8188e
  staging: r8188eu: remove ReceiveConfig from struct hal_data_8188e
  staging: r8188eu: BasicRateSet is set but never used
  staging: r8188eu: remove UsbTxAggDescNum from struct hal_data_8188e
  staging: r8188eu: remove UsbTxAggMode from struct hal_data_8188e
  staging: r8188eu: remove UsbRxAggMode from struct hal_data_8188e
  staging: r8188eu: remove UsbRxAggBlock* from struct hal_data_8188e
  staging: r8188eu: remove UsbRxAggPage* from struct hal_data_8188e

 drivers/staging/r8188eu/hal/rtl8188e_rf6052.c |  5 +-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c  |  2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c     | 86 ++++---------------
 drivers/staging/r8188eu/hal/usb_ops_linux.c   | 14 +--
 .../staging/r8188eu/include/rtl8188e_hal.h    | 26 +-----
 .../staging/r8188eu/include/rtl8188e_xmit.h   |  2 +
 6 files changed, 26 insertions(+), 109 deletions(-)

-- 
2.34.1

