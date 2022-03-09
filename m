Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F86E5127
	for <linux-staging@lists.linux.dev>; Wed,  9 Mar 2022 20:51:02 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id n15so3038433plh.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Mar 2022 12:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=suRNmv6R67HpMji5/xf/olL00ZEMpVSYsMjDd2Yupcs=;
        b=aZspRFy9P0OU6RMmNAybc+fl4/Ya6uKHWiIz5KFSKXo3O6dhVOTo1nCehdIcpGf4sR
         iIHlbU2DcVvkuuhsYoewXDghk82DXsVPh6VC177KLLR8kYJuBUTBp4ZodOLQGkn19eFj
         1BJfzFNtQDHPqL9aH6Rygua/qOTObAFPA2E5lYZMezbrjI1eTTTqlALGk6jwQwSdExlg
         Lvw9gWk1CWCeH5ri0RAq/+Ju7qfxfyS7wiOXlcoETI+pTeyvQ681frFDxRuBkD0A+vNg
         IOcObX3Rb9nTC+azrw61/BzLo7UV0ro6VFKeaRtvXIHWdMoyQi97ZCHM0/jdWgvTYeeF
         fGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=suRNmv6R67HpMji5/xf/olL00ZEMpVSYsMjDd2Yupcs=;
        b=K5tnYUkC2RD2d1kAoxkQqm6Eehm6yBI0VM6c6G9D9ieKEbSAxjD85c+7ltCi0jfKui
         s7K5QOlspSdtMVR2ilFzsQHNZnPW1bZGJQ+fbhmeQH4ddqf1EO+jrA3NMJizCsLYiv7o
         2/g1wS2STNAYbsn14Gu/s9Cgk03rTT6tfhBlJ0gy+rNRKqu+/KtKuJkvoKTds0pJb8hl
         dCNUsZGM94Xsg6prLd8N5XZyREgOf3cDnt4YiSsDv3bfwMwObsw72mv699E6nrNUJ4KR
         9pwlQTHHQnbvGDkORIe6hkbgmonsJyfYzq9o5rHQdPCeBz3Q++92ggVzC+M1Iub52rc4
         Z2FA==
X-Gm-Message-State: AOAM533wAhHZSXholTm7+wSjeQ0UZMrq+UKGUNcY87664tXPEggdacSx
	8q8ShcwxkL44m858Q9jpIiY=
X-Google-Smtp-Source: ABdhPJytxunVsvk4zBdKbaY75AOod7nkz/wTIxFKKwQjzou1amumLklanF/WocA6j5yYvYFPGp+dqQ==
X-Received: by 2002:a17:902:9308:b0:14e:def5:e6b5 with SMTP id bc8-20020a170902930800b0014edef5e6b5mr1467317plb.73.1646859061860;
        Wed, 09 Mar 2022 12:51:01 -0800 (PST)
Received: from localhost.localdomain ([103.85.9.4])
        by smtp.gmail.com with ESMTPSA id m11-20020a17090a3f8b00b001bc299e0aefsm7259674pjc.56.2022.03.09.12.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 12:51:01 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v2 0/2] staging: r8188eu: improve error handling
Date: Thu, 10 Mar 2022 02:20:45 +0530
Message-Id: <20220309205047.45981-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset improves error handling in rtw_init_drv_sw() and
fixes some memory leaks.

v1->v2:
Added fixes tag in patch 2/2.
Used dev_err instead of pr_err as it prefixes the error with
device info.

Vihas Makwana (2):
  staging: r8188eu: call rtl8188eu_free_recv_priv from
    _rtw_free_recv_priv
  staging: r8188eu: proper error handling in rtw_init_drv_sw

 drivers/staging/r8188eu/core/rtw_recv.c   |  1 +
 drivers/staging/r8188eu/os_dep/os_intfs.c | 60 ++++++++++++++++++-----
 2 files changed, 48 insertions(+), 13 deletions(-)

-- 
2.30.2

