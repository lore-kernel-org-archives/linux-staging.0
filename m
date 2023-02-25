Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41824566E
	for <linux-staging@lists.linux.dev>; Sat, 25 Feb 2023 18:20:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id p23-20020a05600c1d9700b003ead4835046so2709778wms.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Feb 2023 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677349217;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ttL7bgAKkimESUSg8lrqpEXaEc6mFGIu/p94BALCC84=;
        b=QYbLU95BiQMPQCnYSF6BJa3l6wGsNwmTAnJH6xdMAvB7LEAQJiz06uclR+rhkYeN7M
         fh3WifeHJ+5dAXJRp+Lp/YJRpf/R+ePhfe+T2FxIq9B0PnxDAVhR1KgD2YM0w4lpggy/
         lPfAvFI0X75T4P5pju7CPKP+koZMg/0Mkapyml/rAnjC9OGE54X5oMBNAs5cVzD1fTNu
         dd3Jdcub6C6KjMgOpKD8t4J28bbnc9j5DSF0SaPX5rM/VqEkuZPVFrVq1hT4AYk27nar
         u6ysFfZeBCAIG0ZjXakJbRGdF0JKIAe3bC50dh1IE3M1MI8cIdDYJ3mPI3zudeVlEspv
         VQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677349217;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttL7bgAKkimESUSg8lrqpEXaEc6mFGIu/p94BALCC84=;
        b=fNx+va08fLoJe/KGO7ddUAN/aJcmwVFIdP1YnxNPvRh2kMrBS/V4SLarKQUqosuM2z
         NzpWjqShwGJWsfEg1903KwgyQ3Z8hV61V1hiBdc3Ptqbm90PTo4qj0zzqQSAvhEUnuEA
         vDFUXVRMrB1KbRgJJKJI2YZrHvWajFw6A61HFukqrJSZRTk26S2DKE87beE4DroIVI9a
         ox4A0+UmB6VSO8sJZweYOXqbPTYVgWS4swexnk+SrgwO4QD8ySwJOV6rysIRx7IL6AeN
         IJkCADM/znpBeaS8kZ3K2VFAL1FH389tRIl/pjVDhSdwxZC+H9/FicNBa4xw24+jVl0M
         IDsw==
X-Gm-Message-State: AO0yUKWJ4VhfuzbhrhJ/sh6lG7DAbtiUxbfXvYXhKZXrXzBqfWKo90Si
	arzMozRcm9fWAhn4bj7aqyA=
X-Google-Smtp-Source: AK7set+RtCfbk4VjUMDkjOPwOW0sgAhnhpm1abdqWOm1IOU/uYyvjIwW1rgZ/rd+LLEPRM45N8DQVw==
X-Received: by 2002:a05:600c:3b8c:b0:3ea:c86e:4377 with SMTP id n12-20020a05600c3b8c00b003eac86e4377mr7381893wms.0.1677349217279;
        Sat, 25 Feb 2023 10:20:17 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id y7-20020a05600c364700b003e2096da239sm7072561wmq.7.2023.02.25.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 10:20:16 -0800 (PST)
Date: Sat, 25 Feb 2023 19:20:14 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: rtl8192e: Remove NULL checks of function
 pointers - struct rtllib_device
Message-ID: <cover.1677345331.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove NULL checks of function pointers from struct rtllib_device. This
checks are unnecessary because the function pointers are set right when
the driver is loaded.

Here the flow when function pointers are set: 
.probe	= _rtl92e_pci_probe
In _rtl92e_pci_probe the function _rtl92e_init is called. In the second
line of _rtl92e_init is _rtl92e_init_priv_handler called that sets all
the required function calls.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

This patch series requires the patch series:
"[PATCH 0/2] staging: rtl8192e: Remove struct rtl819x_ops that has no entries"

Philipp Hortmann (4):
  staging: rtl8192e: Remove checks of pointer to handle_a.. and
    handle_b..
  staging: rtl8192e: Remove checks of pointer to LeisureP.. and
    start_se..
  staging: rtl8192e: Remove checks of pointer to stop_send.. and
    rtllib_..
  staging: rtl8192e: Remove checks of pointer to rtllib.. and
    ScanOpera..

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   |  8 ++-----
 drivers/staging/rtl8192e/rtllib_rx.c         |  7 ++----
 drivers/staging/rtl8192e/rtllib_softmac.c    | 24 +++++++-------------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  9 +++-----
 5 files changed, 16 insertions(+), 35 deletions(-)

-- 
2.39.2

