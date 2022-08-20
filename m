Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183682C9E
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:00:33 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id h22so3930914ejk.4
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=S4K7WddGnCKRXo7vMgA8XrMmq8iETnu9thV6SMJ5zJ8=;
        b=KgHqtvn7WP8z/GLXeqAexT061YnUJrRiquK7aPYERsIzzjLzRsxlIAndBsj1/r22ox
         Na8EcVl1MVlTu4KxnuTTy3b+9D5vwQDWzXnvun7Uwl+wzdeDgFoaty/Dfffg9KC6IxYf
         a2nVXVzEFOXRBhrNJaxOT6qrDmz5Tb0UdmpqU/7L/f0DalYHInh1/xMQoFeaSZVFhn5/
         Hir7C+ZsVNOyhVrsbcjeIotwWd+KVlrRIeuH+4HaRHEmzixKQuPnDX7vl5m9P5eJ8eqF
         6yKcckGUeRwXfQBfK3LdnT5TmJZ7+vYE1y/sQsZsPIGYlZ5mDpfNxngtNmswvAIUZ+n/
         Cbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=S4K7WddGnCKRXo7vMgA8XrMmq8iETnu9thV6SMJ5zJ8=;
        b=wdKM0Dld6jJPS+eR+1HVutYW2+1pBIvr0L+npxmu8FOCijEaxqpNVQATqF4o46afRX
         aXJeqdcIviAnjGeW/r4xICTQcdl7dD5fQcXtX5SkklGopSXu4uA94T+DM+IeguAmSasO
         p0LKpZL+2W3N2c0Y/sjLVehyTCSqMUdJRpBh3W+ezA5NdrNfwsvCQpzuqsfqMmD3HOzg
         azUkzKa3kVb90Pu+aj8+rRZVvwWGwCFMPpaB11j6yEAmhNePe1eHhNF2gVpkFYFeslPY
         2JLVnNvg4+JB2XCWrqHNLW54GnpS3tb/17XPAgbnw+JaN9/dBQKH3Ba3NVMVO39EnDk3
         WDtg==
X-Gm-Message-State: ACgBeo2rz63iOXFsIHnPi4TdgQDXotHUL3BYWuKfrBsJicfwBYNZqrZw
	HZlFNr/gFbJhpuSWBVZFaO8=
X-Google-Smtp-Source: AA6agR40o6e2+2a1ybsZbBDky02ISKDVNRQfo3SSi8DJcZIX9o60XSRPX920ah4wBiCdeao7dC1Vhw==
X-Received: by 2002:a17:907:da9:b0:731:1a5:8c66 with SMTP id go41-20020a1709070da900b0073101a58c66mr8176062ejc.80.1661018432264;
        Sat, 20 Aug 2022 11:00:32 -0700 (PDT)
Received: from nam-dell.vm.stuba.sk ([147.175.88.220])
        by smtp.gmail.com with ESMTPSA id x19-20020aa7d6d3000000b00445e037345csm4938841edr.14.2022.08.20.11.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:00:31 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: hdegoede@redhat.com
Cc: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lkp@intel.com,
	namcaov@gmail.com
Subject: [PATCH v3 0/3] remove useless files
Date: Sat, 20 Aug 2022 20:00:01 +0200
Message-Id: <cover.1661017377.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <13600e0c-bde2-198f-26c4-00531f277bf8@redhat.com>
References: <13600e0c-bde2-198f-26c4-00531f277bf8@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete odm_NoiseMonitor.c and odm_NoiseMonitor.h because they are
useless. The first 2 commits are preparation, and the final commit is
actual removal.

v2: Add new patch to remove the file from Makefile, otherwise there is
    build error as reported by kernel test bot.
v3: Squash some commits together. The patchset functionally remains
    the same.

Nam Cao (3):
  staging: rtl8723bs: remove unused function ODM_InbandNoise_Monitor
  staging: rtl8723bs: remove member noise_level from struct dm_odm_t
  staging: rtl8723bs: remove odm_NoiseMonitor.h and odm_NoiseMonitor.c

 drivers/staging/rtl8723bs/Makefile            |   1 -
 drivers/staging/rtl8723bs/hal/odm.h           |   2 -
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.c  | 130 ------------------
 .../staging/rtl8723bs/hal/odm_NoiseMonitor.h  |  39 ------
 drivers/staging/rtl8723bs/hal/odm_precomp.h   |   1 -
 5 files changed, 173 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.c
 delete mode 100644 drivers/staging/rtl8723bs/hal/odm_NoiseMonitor.h

-- 
2.25.1

