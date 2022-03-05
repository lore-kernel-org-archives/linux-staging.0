Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061232F4A
	for <linux-staging@lists.linux.dev>; Sat,  5 Mar 2022 21:32:00 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id bi14-20020a05600c3d8e00b00386f2897400so3375608wmb.5
        for <linux-staging@lists.linux.dev>; Sat, 05 Mar 2022 13:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Mi2MyRH4qz07k40jNFPsAGQE2Jp6+/W02tCyKhboX7A=;
        b=DK4Ll3hRmJ4i6QTp33kAKp/lNGJriKpnXKuoOUIqev7eXZtMjaOz724I4fBCk6ZCNi
         VesodY8gGK8uQg0gss2lkysYrIQjIOWk64LC2FAR6/0yNitwcGRcABri4Ovq4+w5Kgzd
         i7VSNfA6HMHYwWcv4iKZDpSmll80mMdVY39rzJDJLbL1djYpihUxjCkWhQB6tMtRdX5R
         ld69UwzjypiyusBLucp7AwdCrdfrYjFpO7qt1XWzwGosizGggmjzmnyfgA73pjrb+G83
         4ullV84EsM0SHcesALOp4nu2cAeqyDolJ2Xv6ncSTJRDejeLPwPH0aiNor16217gH+eh
         rnLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Mi2MyRH4qz07k40jNFPsAGQE2Jp6+/W02tCyKhboX7A=;
        b=UHbZCurlwd0SiuwQsBu6dIGPjTvU+iRETQA3uRNQ9aRjKFx14Qaaa/HzzH7FOb5a3P
         bcwpMTb1lzkyplKm/I0A05d2KOGhvy5s1bN96EwTZ96j/TFQ+hotdaBLrgmnT3zyYVwc
         /budaqXRdRvbNxcMq+A39WJqlbspA2AqyMLDr6srnD7iFhUaoedYtQ9zd4wIvUbB29cv
         0n6PfJ/rVS1xJGYAS+iFX13JFXUQJjC7sTf03nCsNMJ4+xEVk2C3hN9FnG/37Z1WnHBh
         oR20JqHAvUvj/dYU68Vp/2m3piKUt4KVGt3Alfs3pVgGZtBlVaciAl0rMkYD1LWJkjqK
         ug8Q==
X-Gm-Message-State: AOAM533gTkaF6jU4Ej9GK1JkBrbzMCkrXP18DMKODktNECnVLJzfXiHA
	bU1Z33wvDImoDVdVCw0PLJg=
X-Google-Smtp-Source: ABdhPJwqmdBH4duclSfVpiRvnglFMJA3f68Kb3M8zVyX9ydD5ic+EGgrcktkVyWj4RF9Xrpn9fO5Fw==
X-Received: by 2002:a1c:f003:0:b0:381:17f5:21b8 with SMTP id a3-20020a1cf003000000b0038117f521b8mr3558452wmb.158.1646515919152;
        Sat, 05 Mar 2022 13:31:59 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935aa6.dip0.t-ipconnect.de. [87.147.90.166])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003811fab7f3esm9925553wmq.30.2022.03.05.13.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Mar 2022 13:31:58 -0800 (PST)
Date: Sat, 5 Mar 2022 22:31:56 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] staging: vt6655: Remove unused 5GHz support
Message-ID: <cover.1646512837.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hardware of vt6655 (PCI) and vt6656 (USB) do only support 2.4GHz band and not 5GHz band.
Both drivers do allow only one vendor id and device id.
So no other devices are covered by those drivers.
Because of this the following priv->byRFType cannot occure:
RF_AIROHA7230
RF_UW2452

Tested with vt6655 on mini PCI Module
Module used for testing is using byRFType: RF_AIROHA (2.4GHz only)
In order to combine vt665x infrastructure it is important
that vt6656 is also not using this code.
vt6656 on mini PCIe card (connected over USB)
is using byRFType: RF_VT3226D0 (2.4GHz only)
vt6656 as USB Plugin Module
is using byRFType: RF_AL2230S (2.4GHz only)

Transferred this patches over vt6655 on mini PCI Module

Checkpatch errors occured because indention was changed. (3x times CamelCase) 
I did not fix that in this patch series as it would make the patch more complicated.



Philipp Hortmann (4):
  staging: vt6655: Remove unused byRFType in channel.c
  staging: vt6655: Remove unused byRFType in baseband.c
  staging: vt6655: Remove unused byRFType in rf.c
  staging: vt6655: Remove unused byRFType in card.c

 drivers/staging/vt6655/baseband.c |  80 ------
 drivers/staging/vt6655/card.c     |  56 +----
 drivers/staging/vt6655/channel.c  |  85 +------
 drivers/staging/vt6655/rf.c       | 404 +-----------------------------
 4 files changed, 3 insertions(+), 622 deletions(-)

-- 
2.25.1

