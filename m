Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77828E5
	for <linux-staging@lists.linux.dev>; Tue,  5 Apr 2022 12:43:35 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id x31so11954989pfh.9
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 05:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFy1qZhdMdbp63fvqatp60F+TUWmD+XE3qD2we3Q3/E=;
        b=ICHmkjwoT02evQPvLG67fwtfT+/HO34QaDa64NIblo3dX6mBddVU4pztRQ3PiNWgV8
         Q0atQj4u8oNo9+UKieBwV9ZSUi0gX8g6YmUUkG7ROH5NlrwVNyJUy05Ht6G+QDTCaeyG
         Mv1OIFqk98ytWz415A3HlO64EKjnlwpok1u+MnoORc3QBmzBC4YJTJ5NIokC0Q0f3LUX
         7IqjjjiDnbWIhf0fAe1OZR1bG6XlOr3YwqYmO5nDUKhnpyec1xesRMYWb7wyDJ8ABL/u
         NMsJKvTA5/JDa4gpiHwmq8dVoyh7mO1SIZaipTf6SJlAqGh/cHjXNFPmpUQCsL/U//Yu
         YOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pFy1qZhdMdbp63fvqatp60F+TUWmD+XE3qD2we3Q3/E=;
        b=Adm8Qp73fQRMf9ZLSeDHiRhmie5Yl67YSQpxQEt6TKb/X1VXWew8HXeJFTkxkmX6Zb
         FlFiYrBXQmngNmYVryB5WfKgMa2qYJ0QXZxRAwqstK65Lyca5PVo49diKAA/D1xDZdhT
         Ud3kfYHvDr7JcBpV9uSyQFb0IbQX5RwWh1XZScW2rvSCphbZS5wBKBlBKoGsTDyI4A8u
         stg8r5plyI0UpSkES+tbjYV6R7EMnI5Lth8M7zcuvWN48u57ewlE/fum2Eg5sED1n5+f
         gU1mCaV4zHRUTy2Ww9Bd0fo+mnKGm5ZaJPglG+OmdOb4kjDn3UB/2mot96UsZ4q7Bmbb
         iuKw==
X-Gm-Message-State: AOAM532PEzx9VNggQRJkjx58jE+mkcMGP6al+tah+2+zyh+k7NPYDRN7
	dnQ+m6jA3uOyMMgDZKKvcLE=
X-Google-Smtp-Source: ABdhPJyDfpN+1H4PfHUqp+rp8XEL538Oc78MuEILvTB/wjQSaNjaqZgkugyg7zTaw6Hwc9tuD+WpFA==
X-Received: by 2002:a63:3756:0:b0:398:4086:16 with SMTP id g22-20020a633756000000b0039840860016mr2741728pgn.55.1649162615312;
        Tue, 05 Apr 2022 05:43:35 -0700 (PDT)
Received: from vihas.localhost.com ([103.85.9.59])
        by smtp.gmail.com with ESMTPSA id nl17-20020a17090b385100b001c70883f6ccsm2760014pjb.36.2022.04.05.05.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 05:43:34 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: some refactoring and cleanup
Date: Tue,  5 Apr 2022 18:12:37 +0530
Message-Id: <20220405124239.3372-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop some redundant checks and cleanup the unused functions.

Vihas Makwana (3):
  staging: r8188eu: drop redundant if check in IS_MCAST
  staging: r8188eu: drop redundant if check in check_fwstate
  staging: r8188eu: simplify rtw_inc_and_chk_continual_urb_error

 drivers/staging/r8188eu/include/rtw_mlme.h | 43 +---------------------
 drivers/staging/r8188eu/include/usb_ops.h  |  7 +---
 drivers/staging/r8188eu/include/wifi.h     |  5 +--
 3 files changed, 3 insertions(+), 52 deletions(-)

-- 
2.30.2

