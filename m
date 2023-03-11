Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9AAE7B
	for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 21:50:08 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id ek18so3317248edb.6
        for <linux-staging@lists.linux.dev>; Sat, 11 Mar 2023 13:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678571407;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dlfB5JbVu/U11Cp+nQwAL8qvcirLFzR8pf4WiBE+k8=;
        b=ScEFLFjkZ1gjXw9Gna6siYpeeSjllKpiE7BmMib3pkK+9DpPlyUQC1O+pBzCJa9bJP
         aP2+sr3hcOahGYs1FHbkBl6nNtywTQ9sVbhedpA2sxalKydU77zf+uwYgjzVrywW8hwR
         dMzjKmh49bTRfceAIhvxz5D5nbzk/wvmmnJY4H+LWAbQ9YCdUYdRw43mAnep9CX2K4vn
         +67s1G9A0YFgPQovftdvUv2eFLcBYB1yZrLwWoUmeY/AkdIp8a6j/470LDXhz6KBmbrv
         lFUMraDTmGkJ8yPLGA26P1Xk5KSwmPc/YdXd48wKPg7ovIXodcozYWro/XJsI926+uOs
         BnLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678571407;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9dlfB5JbVu/U11Cp+nQwAL8qvcirLFzR8pf4WiBE+k8=;
        b=IZGmkYZbqWLujadVfpIi7mfmy1ur4OJAklItNECt2KYhbCfCjsLJ86rcqWqmLhKnx8
         rR9mV365vM3Y+zMYX/JXqWwKvzm1/reseMcBzD2JReJlx3eplQ6Tzu1NfYkQcxVt3YJq
         Y5S1gFcDQ9TZnPDR48xrBTR4pin1SUcam0aGiZncjZ4M4nsKJvaIBgMyRxT4EHhKhkHY
         M/DYLQlxB84hZ7mLnTkZtuN3iKIjSmFkEHk7cuPpgqw4VUF6VCMEJCc+XKG2/zqPK+p1
         hRZynY3qTw06MvgrExy7OuM+0Nid4l4tvkiff20K0gJ7I9bgics+/F9hdxWjKy3XdG4R
         Q6FQ==
X-Gm-Message-State: AO0yUKX5D5cEevYIjg2F9hSDcBHx54+zSJrRxvoCKS1SwzAmAM8TYh2g
	ejUH5i8LD5+Hpc2DqnOWhLQ=
X-Google-Smtp-Source: AK7set+XthPov3/TN8NFgrA1vj+sTF4ZWxHctnskm4C99VcbJM+r2VmVIo5zqaqd/J1u80TezNcQTA==
X-Received: by 2002:a17:906:d4:b0:878:5fa4:7443 with SMTP id 20-20020a17090600d400b008785fa47443mr5802283eji.3.1678571406766;
        Sat, 11 Mar 2023 13:50:06 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id jw11-20020a17090776ab00b008d53ea69227sm1497680ejc.224.2023.03.11.13.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 13:50:06 -0800 (PST)
Date: Sat, 11 Mar 2023 22:50:04 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 00/12] staging: rtl8192e: Remove unused RF90_PATH_C and ..D
 starting .._phyreg.h
Message-ID: <cover.1678569965.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused RF90_PATH_C and RF90_PATH_D. Justification can be quite
complex. Some variables are unused then those are completely removed. 

The following code lines are mandatory:
enum rf90_radio_path {
	RF90_PATH_A = 0,
	RF90_PATH_B = 1,
	RF90_PATH_C = 2,
	RF90_PATH_D = 3,
	RF90_PATH_MAX
};

Index is saved in variable name: eRFPath

Code likes to shorten variable name to the array with this line:
pPhyReg = &priv->phy_reg_def[eRFPath];

Tested with rtl8192e
Transferred this patch over wlan connection of rtl8192e

Philipp Hortmann (12):
  staging: rtl8192e: Remove unused RF90_PATH_C and ..D in
    rtl92e_config_rf
  staging: rtl8192e: Remove unused RF90_PATH_C and ..D for rfintfs
  staging: rtl8192e: Remove unused variable rfintfi
  staging: rtl8192e: Remove unused RF90_PATH_C and ..D for rfintfo and
    ..fe
  staging: rtl8192e: Remove unused RF90_PATH_C and ..D for rf3wireOffset
  staging: rtl8192e: Remove unused variable rfLSSI_Select and
    rfTxGainStage
  staging: rtl8192e: Remove unused variable rfHSSIPara1 and
    rfSwitchControl
  staging: rtl8192e: Remove unused variable rfAGCControl1 and
    rfAGCControl2
  staging: rtl8192e: Remove unused variable rfRxIQImbalance and rfRxAFE
  staging: rtl8192e: Remove unused variable rfTxIQImbalance and rfTxAFE
  staging: rtl8192e: Remove unused RF90_PATH_C and ..D for
    rfLSSIReadBack
  staging: rtl8192e: Remove unused RF90_PATH_C and ..D for rfHSSIPara2

 .../staging/rtl8192e/rtl8192e/r8190P_def.h    | 11 ---
 .../rtl8192e/rtl8192e/r8190P_rtl8256.c        |  4 --
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 68 -------------------
 .../staging/rtl8192e/rtl8192e/r8192E_phyreg.h | 37 ----------
 4 files changed, 120 deletions(-)

-- 
2.39.2

