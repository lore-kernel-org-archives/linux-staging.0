Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E737A
	for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 23:11:56 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id z16so3965639wrh.12
        for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 16:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdPmGJsSD+Rly2C/T4Se+7BRYHNRgvNRspUD0lWhZ3g=;
        b=GVsGKlCSdL6HaRl9VPPqNE7Zdoc9KafkFtJjRdFFn4Bbbjxj1JE9qwruodhBwuYpWk
         0ZpixhvNVwBIA3Tj1hUbD3ap1k+SP1idXxCirpgtSI4QX2zeZ7EIixe9rtgmaozYjgtm
         vc9qHEmFsIM9yS8fiTj1EJ+++HJc3Z19qrmMv+bKJn46uMfcM0AyUJP9ZOPOFnCMoSjs
         fDvL15juEQtJzCKieY3nGai6k8llgGb1briAaUxyNsm56Ylm+KaXlCAyaF/qRhK/LOKf
         tzAfM4L4UzwJ+cZuyEMypWgh3ZToloHyyy2lsjn/4cB2Uu5RMYYFd62e5W41lcwGGijk
         Iu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GdPmGJsSD+Rly2C/T4Se+7BRYHNRgvNRspUD0lWhZ3g=;
        b=kArBHTYl6/b4UTuHSZb0/zBZWYmmt6EsqrdG96VXPKsPYRImr8YysRbTUNuwGxy+KR
         hV0dKn/eRQWa+C9pEkdXNShTbv0ECJfF0By8L3prtyBHhDsFHDa3x9yTsIBACc2OlWHc
         wPYSjvbNVzC832826aVvlyS2ZkkUhjOEJU5pjulRxlcX8cURYck9hUfQQNkfnX7/RnEB
         vQybhxlOHMW9hoV/KWRoanO+DA77emKOsYxoOt30JqHoQfVvOaA4riA7ahMhwZODWGEn
         kwAhd5y9kAqCXqXPavfqNNE9bJ7amPYs22J0y1qY6QObD2G9anJSkG7LAaXqEfjCAxv7
         WTzA==
X-Gm-Message-State: ACgBeo2qZK87I1pvy88JwaE93XsMOHGNDdoY3I2yZVvNgCCrfnw6Elyk
	Xc4OCkYeWq1s7enUnhwexovIEQ==
X-Google-Smtp-Source: AA6agR4dKGi/q//WSFXqwam3w0BKNlwdDxyw6zTLZ7WLaHZG7SNOY8elsnub43cOxcnDSWrj7kMTgQ==
X-Received: by 2002:a5d:64e1:0:b0:21e:8d9d:e920 with SMTP id g1-20020a5d64e1000000b0021e8d9de920mr608652wri.667.1659049914337;
        Thu, 28 Jul 2022 16:11:54 -0700 (PDT)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id m20-20020a056000181400b0021e571a99d5sm2089419wrh.17.2022.07.28.16.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 16:11:53 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	paskripkin@gmail.com,
	martin@kaiser.cx,
	straube.linux@gmail.com,
	fmdefrancesco@gmail.com,
	abdun.nihaal@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] staging: r8188eu: more error code cleanups
Date: Fri, 29 Jul 2022 00:11:48 +0100
Message-Id: <20220728231150.972-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series addresses a cleanup suggestion discussed by Greg
Kroah-Hartman and Dan Carpenter, and also includes another function
conversion. It would be a larger series, but my time being what it is,
I intend to chip away at these slowly and steadily.

Phillip Potter (2):
  staging: r8188eu: remove initializer from ret in rtw_pwr_wakeup
  staging: r8188eu: convert rtw_set_802_11_add_wep error code semantics

 drivers/staging/r8188eu/core/rtw_ioctl_set.c    | 8 ++++----
 drivers/staging/r8188eu/core/rtw_pwrctrl.c      | 2 +-
 drivers/staging/r8188eu/include/rtw_ioctl_set.h | 2 +-
 drivers/staging/r8188eu/os_dep/ioctl_linux.c    | 5 ++---
 4 files changed, 8 insertions(+), 9 deletions(-)

-- 
2.36.1

