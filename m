Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D152C80
	for <linux-staging@lists.linux.dev>; Fri,  5 Nov 2021 16:53:42 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id v23so1505462pjr.5
        for <linux-staging@lists.linux.dev>; Fri, 05 Nov 2021 09:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4nGHuCf41SngR745SwIkimU/Vz5GHGbBbJavoYdXknU=;
        b=cvlBAU4nu5Zfg7BqZjgLR7OzjV6Q/yQ1MI3p5KYU+MbWfFYAN5EaU1pY3SlYw6k/CN
         4NRKMukOUbn/W+Tubf9Z9KdM4Qr7/8VN9mt3WxjLprN+g7hXLrGRZzFZ3amYuTc+71/T
         6+5Y9u7BfNClL00+y41u+I5AoM5QsUrLPHAalCPG0mLdkKqHMlmsa4vzW6KUaB35Yz1e
         X6xFOmHrHNUKOTzNBLnSj0r5fcnISWHcr2sWUNxGDupgd3kGm34ZwkWFy7P8C7x3uqRO
         moozdY1w/STHnTkqLheHWFHwhuTZJNXU6HMQn7hJ5tzLhP9qHPd1GXlkFyUotADabZ9X
         3Ovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4nGHuCf41SngR745SwIkimU/Vz5GHGbBbJavoYdXknU=;
        b=zWTRDWc9pfnbpbj6twY2unUhh60T+dAFceVW6REQ+gGHFGpWXYRoCOcyPP6fvLQx0Z
         W62rOjFUptAv9PugFpFm2f/XGAI3VA2EblvJx4TUhIhB34CQFz7Q9dbSbMyCyHtpsN62
         hWpKb/sH+Eh8hICrX5VCy8Han/DKR43vvXKvxrtYN1e6+8LZ4McOKd0aA4SwmofA+Ihc
         +P9AYOsEtgLg+PUeayW/9IP4STbSmIgaLGbMhh8H+4keb1wlv7vsCD1BvcGANMcYeMbz
         MEML0UtTyTYcq3Ptrsvzifgp6JcYXi112RyZawytip0P84Pp9cJyYxw0VL+KCwy52DI7
         J1dg==
X-Gm-Message-State: AOAM530xUyJpujl9Qij5Zl5j3IpHL4wUmJ+EXS3Rkdrij3aNEEZwX/rL
	2eaV4OlGmIxs9am9Qq6jfCuVm1/iZw8=
X-Google-Smtp-Source: ABdhPJwUiTStHlUz0AoR2/KXSCbvRLr5WBjWiWLRorWKks+4plI1K4xZeMemnQ3lFWKVsD9JQJzPnA==
X-Received: by 2002:a17:90a:fe87:: with SMTP id co7mr31139202pjb.21.1636131222166;
        Fri, 05 Nov 2021 09:53:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:4490:4409:3406:a18f:7c45:2f81:cea2])
        by smtp.gmail.com with ESMTPSA id s30sm8524425pfg.17.2021.11.05.09.53.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Nov 2021 09:53:41 -0700 (PDT)
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	saurav.girepunje@gmail.com,
	dan.carpenter@oracle.com,
	shreyaskumar1035@gmail.com,
	ross.schm.dev@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Remove unused local variable in rtw_efuse.c
Date: Fri,  5 Nov 2021 22:23:28 +0530
Message-Id: <20211105165330.78524-1-saurav.girepunje@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <saurav.girepunje@gmail.com>
References: <saurav.girepunje@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series to remove the unused local variable in rtw_efuse.c

Remove the unused variable padapter from Efuse_Read1ByteFromFakeContent.
Remove the unused variable padapter from Efuse_Write1ByteToFakeContent.

Saurav Girepunje (2):
  staging: rtl8723bs: core: remove unused variable pAdapter
  staging: rtl8723bs: core: remove unused local variable padapter

 drivers/staging/rtl8723bs/core/rtw_efuse.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

--
2.33.0

