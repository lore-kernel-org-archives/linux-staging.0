Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A112F3F
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 22:45:53 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id g12so26955625wrs.10
        for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 14:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HwnAmAjAMwtjZoPh/wvNWfHfRdEY7FzZJcayQD/cYNo=;
        b=dVQCNhCbERZyTd+bv2KF63naFelmgh73AJnR5uDLCAAkpNf2Fy7unE4i3UpRBOiHdv
         XWv+eqY4Qc/5Z57DPvm2ZeUiLOFji+aYkh9ylayw1bhkVOD6RA5CRa/jnd5QX9xtoMxz
         kRkAHtZu7XFIPFThpSJtufFIFYa12IOOJWIaK3lB3P+yUcRcqlUriymVpsuIFeLH3oI6
         PbwmfJNeWhMWqs5d8pLXXtJaZD/+wB2Ni1DcBSLljjPzKmNYMtbbewWiCE8qqO9WNGSF
         VfvqGZa+GYnMDlw47ox1IrBX6pr6lynk7PK+A51udtddGGKdAtRx7fe7YWzXOh9XaItH
         pVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HwnAmAjAMwtjZoPh/wvNWfHfRdEY7FzZJcayQD/cYNo=;
        b=IaAX+M27WKjcZFbCQkau7VUxThCgE+51noLqXEqrLumAfa800kjRLMaE7Hde32EaVa
         0UAwBhZVO6A9YLkFwSvpwUja4Eb53tWhzc49tDFf2s/7daXh0fcVhmwLf2cxnDiUDOK5
         0I3/UyOOEmflNMWvkgO+MWnExwMgteRR3cbH3BqyAvt0Evsqh2Y5toXWPkagiK8Wqxk7
         nBzpFCo5Rp9tMA6DbdSUyuY9F18CjY8TlGsBRqxkUwqDkghBVuAEQwvcNo+miXekKQFl
         QnKiyskQXLxmS73tv8kZtWpqFom7TtTxLk3FiAwK51BCqCqT4XmSjv53SnYAMeCKeTt0
         0tnA==
X-Gm-Message-State: ANoB5pn8R/ZouIIo1SvpUP54i36ncwmRpoicQLHcP2PFO9DhQ8HZdSTT
	oCH+3i9oFChRG7UEBFjwrwU=
X-Google-Smtp-Source: AA0mqf7KDia5bRWua40jNjtBWXuw+NCBaVXTq+aJZMnz/ReWXZpoAKjGKkJo+38DQk0JPtmYWDT+Sg==
X-Received: by 2002:a5d:6b84:0:b0:236:6fb2:ff91 with SMTP id n4-20020a5d6b84000000b002366fb2ff91mr15066595wrx.520.1669157151478;
        Tue, 22 Nov 2022 14:45:51 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id bg3-20020a05600c3c8300b003c71358a42dsm231159wmb.18.2022.11.22.14.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 14:45:50 -0800 (PST)
Date: Tue, 22 Nov 2022 23:45:48 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: rtl8192e: Remove unused variables in rtl_core.h
Message-ID: <cover.1669156825.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unchanged and unused CamelCase variables that lead to dead code.

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (5):
  staging: rtl8192e: Remove unchanged variable AcmMethod
  staging: rtl8192e: Remove unused variable skb_aggQ
  staging: rtl8192e: Remove unused variable initialized_at_probe
  staging: rtl8192e: Remove unused variable ChannelAccessSetting
  staging: rtl8192e: Remove unused variable int_log

 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 15 ---------------
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c |  4 ----
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   |  7 -------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   | 17 -----------------
 drivers/staging/rtl8192e/rtl819x_Qos.h         |  7 -------
 drivers/staging/rtl8192e/rtllib.h              |  1 -
 6 files changed, 51 deletions(-)

-- 
2.37.3

