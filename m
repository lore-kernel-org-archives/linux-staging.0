Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6FE71
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 09:53:25 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id e7so81817849edu.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 02:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fBSgjBNdxte1Vivu5LDpQPAo+k7uzN+EmhLuoV7VqWM=;
        b=AlFnVwHwJlRnAr3omoF9QiU4okufovYE5Hl+g7u4QX145UTL/w3pr26Xrs2z5ZG2lZ
         glzT3dq8lDAqhkwPoKumXgU7OSVmIRk7iabOwra00oW5lRN2UPawHoYFmdemtbPAEUw1
         G/w/15GXp8y6P3lavC9oc38rgopY700OqkFxop37WzJKSfKb1oOVCrqeqe+ZWVMrBoTJ
         yRjQryvDLhX+jvo2pV0W/IjphyUHPvpi5zHMLDrYHHw7HUkwkeIEeE0ItBCGoEDnc7Y9
         40i0RQpZ+CXtlxYlLLmH1SpcjZADxOMJRL26Gjrnn3EvD+hahOdMyTnplk6KznfQJr6i
         nBSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fBSgjBNdxte1Vivu5LDpQPAo+k7uzN+EmhLuoV7VqWM=;
        b=NohLQPV17YDDF8qLRWl90NgjMsuTAbwNrHI1HUqBXARlSzQJE3xcdTXDAum7p4wiT3
         dFG7pRudPUPyxeTrsva7xG1Pj2Ox/Z632To+0Lam+TE+YxG+V6djGmaWo1FAYQtticqX
         Lglq2pZeUQ5axJOv8XmlW95IsJ2YONZXdn7Dxy86HawLVP+TrhO0BIP9YV4NAYdOry44
         eUE38A6M6g1x8LwaV47sQOFTC0gRtDsnS24ScHAj8GaVUV68aQUiRthbrEXmBmaGFnr9
         bQTJLK1ZPs6umI2YWe+W6kG7PUKmigeXXgF7zU+/kTipnmony27GhNi7ARWpKsvrB0bM
         cj+g==
X-Gm-Message-State: AOAM532R3daRaNRt+8lnahH73FfWYHC1sBqqH/5YlOlMlg/rTFH4S9vk
	stQPH00Vl5ggCBXJ6bFURVE=
X-Google-Smtp-Source: ABdhPJwVsTcCiUv4Yaw4pi/Eb8Q0EPsYsQQo4dPZlhMQuMxgADF7Os1rkI+cs3NMKM7LYdZHBUQdqw==
X-Received: by 2002:a05:6402:6cf:: with SMTP id n15mr4723481edy.51.1619776404091;
        Fri, 30 Apr 2021 02:53:24 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id f30sm1626861ejl.62.2021.04.30.02.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 02:53:23 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH v2 0/2] Remove set but unused variables
Date: Fri, 30 Apr 2021 11:53:17 +0200
Message-Id: <20210430095319.23226-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variables. Issue detected by gcc.

Changes from v1: As suggested by Dan Carpenter, removed no more needed
curly braces around single statement blocks (patch 2/2).

Fabio M. De Francesco (2):
  staging: rtl8723bs: hal: Remove set but unused variables
  staging: rtl8723bs: core: Remove set but unused variable

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 9 +++------
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
 2 files changed, 3 insertions(+), 11 deletions(-)

-- 
2.31.1

