Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514B17A
	for <linux-staging@lists.linux.dev>; Mon,  4 Apr 2022 08:21:48 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id ot30so8310468ejb.12
        for <linux-staging@lists.linux.dev>; Mon, 04 Apr 2022 01:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eJEB66crM8wka6AgbPIlBAB85bR3Q+QeItJHEO/CkzY=;
        b=NSgjwg2RoYh/+XpTr3R5TuCkjFX7yNEIK6jdvNow+Uy/BPh6WeL7PfrqC5NpmQFN6V
         TelmxfCQ/KFvOfqfsH6gzy7zRs9zA8Zz5PboVLrnXPGZm9IP+HswrSrvqB6EBwbMz6Zi
         4GneTshZWbcpGWX1qGUipZdUTf5wRtITojxe+LQfDFGOSbzBOShsrRm3vDMUlIaGCCuJ
         MGmwRCVHlbfDnhSe01HS5+62ISDc+l21f2V7Qwi0RbEWQ38TWw41phOXhH0bgxScBH4A
         1NKoOTS0jBBZKLmZuKHvaeNlqzVN5aKUCT4khsEShLZ/CcCGiM4NBRHeGvK14+87gpgv
         evPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eJEB66crM8wka6AgbPIlBAB85bR3Q+QeItJHEO/CkzY=;
        b=sd/IwUUAy6hIY5FNVNxJxjBG1FPZco8tina4cpfY0ZZnu2gV6q0/jGgo6N/iHjwxri
         EZRqfnfLVWdhklb0Q8MwmJ9vp10PcOGNwGcUwCNORSw8GRppIuHJUGaUgqf2wmwPjsIf
         /Y+c5FYfoE44owokWc8KfhqhhI2eLbT7UkOTcubGZuiCedW4JoORX5MLFWQQQg+oNEVD
         Ib37L78eEZroE+EOCxTmlOCY6WaIUPFphSKm+qwAyysTYF5q1vUuZhDi5nVk4NdJFU61
         +/Z0AYaVIQnXGPN9mB4dijl7cP5B7LiyhyTUz+z4B+6ay7FBLvuq4X2ovWuPqcg1kuEh
         c9ww==
X-Gm-Message-State: AOAM5309DahNvb+5XqADFoKqXWbDy2vhY/gEUWd734K1g/lb60npkmZp
	dg+AcBvh9HKXPtyRyCr2bME=
X-Google-Smtp-Source: ABdhPJyt7ZSqeKdu9FtZ2+rGfh9A8mbIzAD/JBSfhBsVbLrrdCic58UP9MD2382z25K+xJXpO5FVgw==
X-Received: by 2002:a17:906:37cd:b0:6e0:bdb6:f309 with SMTP id o13-20020a17090637cd00b006e0bdb6f309mr9792863ejc.394.1649060506624;
        Mon, 04 Apr 2022 01:21:46 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709061d0300b006da94efcc7esm4047336ejh.204.2022.04.04.01.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 01:21:46 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/5] staging: r8188eu: clean up struct pwrctrl_priv
Date: Mon,  4 Apr 2022 10:21:37 +0200
Message-Id: <20220404082142.4639-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tis series removes unused and set but never changed fields from the
pwrctrl_priv structure.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (5):
  staging: r8188eu: remove unused fields from struct pwrctrl_priv
  staging: r8188eu: reg_rfoff is never set
  staging: r8188eu: pnp_bstop_trx is never set
  staging: r8188eu: pwr_state_check_cnts is always zero
  staging: r8188eu: ps_flag is never set

 drivers/staging/r8188eu/core/rtw_pwrctrl.c     |  4 +---
 drivers/staging/r8188eu/hal/usb_halinit.c      |  4 ----
 drivers/staging/r8188eu/hal/usb_ops_linux.c    |  7 +++----
 drivers/staging/r8188eu/include/rtw_pwrctrl.h  | 14 --------------
 drivers/staging/r8188eu/os_dep/os_intfs.c      | 10 ----------
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c |  3 +--
 6 files changed, 5 insertions(+), 37 deletions(-)

-- 
2.35.1

