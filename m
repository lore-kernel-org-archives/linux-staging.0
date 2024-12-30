Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE84A195
	for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 19:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735585784; cv=none; b=O5z544QE8RqOxNoG6LO8POc0Ar+aUt0mPi3VqvSwXOlFvyEGBtDPy4j3uuxIIqpatfL1MldbGGhZVZIPOqrhsPFEndUnq+QXTqIZalzSKagE6Mu4YYYBsBNcgi4BXOgZA017GzX0RLHxnWeDfkDZh2wzs2f5ZCUvaFfs/IC3ghc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735585784; c=relaxed/simple;
	bh=ti/h0JlZCcvwXztMOtcLnErhMkQxg8ll/nJCtHUPT4o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TpL5E/opPaH/KqYpBLRjeUllmNtdE3vVReAFemREtcidpSmMw9xWbJX9t1eiq3Fz30cjBbeYVEKGsCYad+g00jg5Yo8mvnRZcXPXfwojjPYjvfgv9ZfAWC9/dNdTjYurTTKozF1b6c0NGwPnFfcabAKWnFf3RUWQz0IyLJPEiGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PruITtSA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PruITtSA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-215607278acso10736815ad.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Dec 2024 11:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735585782; x=1736190582; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uojV6TQ4snS+YKZDoP48BlLzgCJTKTlueFKh6Nr/vc0=;
        b=PruITtSA36niwU/Dd1dD9wUSEl3kQOQ3v5VUSlVHhGFIhdnvFoR3O/kKCElCvaLPLy
         pT7z9BuDGG33Y13u58aHtvFy6ws4U2YqFSmh/zdpdqDurGuze0XvqUz+Ezu8aee58OMv
         fsF0bOj6b1XyaEsf0vuYsrTS30g1xSq+CAE6ZgF8tgMYhY7laysGfFJrro7uFfUWZdIR
         u9mjb8RpQHX6fDKJkEjJuu+UUzJ2lJe58OsKC/xlLbVD3yKzv7tFyApDinM1B/ykt2fz
         25Kkt1iglZytRTgJin32YWa8YbHQIpkKmydM8ZL62j0UuHOO9logQktWuhP2MAbLiILX
         Lmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735585782; x=1736190582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uojV6TQ4snS+YKZDoP48BlLzgCJTKTlueFKh6Nr/vc0=;
        b=bYRqOTtZAYkMsOvKr7JUQUqMEE9wCFTawLSqoKqWrh0wrWZ17cbEbV4UiZkBRxUa3W
         wOfYaAXHD+VBGjuHTMX5O9mefjeZBPTESexkH1uQGa0r2ak4bzfXQx+7wxE4VMJy43Ib
         QJ010Mg31sMLy8wRFtFtCfzRZ/wIKln4jVID/q7MWHKT7Nezgf9KfpNLAk7pe4ZDLLwb
         XooZwlqwVlYQEVcb8iDB/5Zu5tcErl9o5Wqht7v0I5qnUTp9O9b55y5qRiKwBgTgmIhW
         UtP9SFB0BhgPYa+WzStkqTVlblLcznlkalXc7jBLPTTs9dGuCD+aeuJ26af3RoSXmplF
         9XQA==
X-Forwarded-Encrypted: i=1; AJvYcCW98r8qYUI25LlbkVQkrI2se9PBOq7qwUehLfzt/6Am3D+61S7dNij/edGkTskdYPB1NDGzx0yPWiAa9BOY@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz577O77GWuqtB2pQpO9WF16zj5VQkYMAYqpqFuRRpbwj9xKgQ
	Xak/hhcs/dNPBWhM1kzA5eZC/Pl/uOO92f5aznVG65nQpPza1cOm
X-Gm-Gg: ASbGncsMS2/Vw6FNSJwOpCRqDlnLBsX2NgPs2JVg/n/3+o85Xn9d90zyaFtjM3XHVSe
	MgAXPmspqYRKWzar8uYjxqgGpZhYK5/ka0NY6aYK8JveaQEvQaJBagkQ4vt2KIrlowZdUNNPvs6
	UuzLTI3AaRmu0AKyHUYOye2aP9tw/39KpXukcamW42SGsPpO8hwoUUgS69Ppvdygc0RgsnjUktA
	7QM4+PIFYm6tEqu9/V8QFiUWkqkNFMmOcWV0zZY9hQY06Jnzt06Fo4=
X-Google-Smtp-Source: AGHT+IH+Up+8Dum/4aYIY1BGkGKicgZXe0a2Ikn2fqHPrU+2by/0xgpI4ZZlwjrt2f2KHnS26uW+mg==
X-Received: by 2002:a17:902:e845:b0:215:3862:603a with SMTP id d9443c01a7336-219e6f08c61mr188619565ad.10.1735585781989;
        Mon, 30 Dec 2024 11:09:41 -0800 (PST)
Received: from ice.. ([171.76.81.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964f09sm182886795ad.26.2024.12.30.11.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 11:09:41 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v6 00/15] staging: gpib: Handle gpib_register_driver() errors
Date: Tue, 31 Dec 2024 00:26:20 +0530
Message-Id: <20241230185633.175690-1-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reviewing the patch for fixing Coverity scan issue from
gpib: cb7210 [1], Greg pointed out that the gpib_register_driver()
function can fail and must return an error value if it fails.

This patch series fixes the above issue by changing the return type
of gpib_register_driver() function and returning the error value if
it fails.

This fix also makes sure that wherever the gpib_register_driver() is
called and if it fails - the previous driver register functions are
unregistered (if they exist) and the error value is returned. The
pr_err() statements are added indicating the fail and the error value.

Thanks,
Nihar

v5 --> v6 : Removed unnecessary pr_info() statements when the drivers are
            working properly. Added pr_err() in all cases of the driver
            registration fail - indicating the failure and also the
            error value.

v4 --> v5 : Added pr_* statements indicating when the driver register
            functions fail or if the module is initialized without errors.

v3 --> v4 : Made the v3 patch into series and also fixed an error in
            v3 [2]. Each patch in this series is a fix for particular
            driver handling the gpib_register_driver() error.

v2 --> v3 : Modified the gpib_register_driver() to return error code,
            added error handling to all the places that the
            gpib_register_driver() is called.

v1 --> v2 : Replaced the redundant cb_pcmcia_init_module() with
            pcmcia_register_driver().

Link to v5 : https://lore.kernel.org/all/20241228060800.107653-1-niharchaithanya@gmail.com/
Link to v4 : https://lore.kernel.org/all/20241226193637.241049-1-niharchaithanya@gmail.com/
Link to v3 : https://lore.kernel.org/all/20241221214822.163667-1-niharchaithanya@gmail.com/
Link to v2 : https://lore.kernel.org/all/20241221091121.35476-1-niharchaithanya@gmail.com/
Link to v1 : https://lore.kernel.org/all/20241221022632.20931-1-niharchaithanya@gmail.com/

[1] https://lore.kernel.org/all/2024122133-outskirts-causing-099a@gregkh/
[2] https://lore.kernel.org/all/202412221424.WIjKFIPf-lkp@intel.com/

Nihar Chaithanya (15):
  staging: gpib: Modify gpib_register_driver() to return error if it
    fails
  staging: gpib: agilent_82350b: Handle gpib_register_driver() errors
  staging: gpib: agilent_82357a: Handle gpib_register_driver() errors
  staging: gpib: cb7210: Handle gpib_register_driver() errors
  staging: gpib: cec: Handle gpib_register_driver() errors
  staging: gpib: fluke: Handle gpib_register_driver() errors
  staging: gpib: fmh: Handle gpib_register_driver() errors
  staging: gpib: gpio: Return error value from gpib_register_driver()
  staging: gpib: hp_82335: Return error value from
    gpib_register_driver()
  staging: gpib: hp_82341: Handle gpib_register_driver() errors
  staging: gpib: ines: Handle gpib_register_driver() errors
  staging: gpib: lpvo_usb: Return error value from
    gpib_register_driver()
  staging: gpib: ni_usb: Handle gpib_register_driver() errors
  staging: gpib: pc2: Handle gpib_register_driver() errors
  staging: gpib: tnt4882: Handle gpib_register_driver() errors

 .../gpib/agilent_82350b/agilent_82350b.c      |  23 +++-
 .../gpib/agilent_82357a/agilent_82357a.c      |  16 ++-
 drivers/staging/gpib/cb7210/cb7210.c          | 116 ++++++++++++++----
 drivers/staging/gpib/cec/cec_gpib.c           |   8 +-
 drivers/staging/gpib/common/gpib_os.c         |   7 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c    |  32 ++++-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      |  47 +++++--
 drivers/staging/gpib/gpio/gpib_bitbang.c      |   7 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |   8 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      |  17 ++-
 drivers/staging/gpib/include/gpibP.h          |   2 +-
 drivers/staging/gpib/ines/ines_gpib.c         |  94 ++++++++++----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |   6 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     |  15 ++-
 drivers/staging/gpib/pc2/pc2_gpib.c           |  38 +++++-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 106 ++++++++++++++--
 16 files changed, 447 insertions(+), 95 deletions(-)

-- 
2.34.1

