Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5CE72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 09:25:21 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id x11so24201941ejv.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ERpR5xRKdfRwZYTB55/K1Gw6Me8MLOQ3TscUX9zEgs=;
        b=uy2+vu68l3UkpcTybvBp608ylbvFoWhpZIqfqB0AUe10/IwqPTeyJ9AaiI7GuDexq8
         z50G/H76LE3vWHVJ5mcDkXvw+Htj74Yyh611n78Fw+5Lsa8EEQ+TF2du3h6p6QtOxpmE
         bjax7VdyGxyaAT7ka4EITj0lDqMI52mfHD3hao+9OPtbMb/iVhoEAxfGB0/JiLfBeBrc
         jdhOhFnNmgUUIXWwLu4KxPbgUTpcfTbMOMFFQWpw1D5pg4d4a5e8/sxyQi1Oe5idn1oj
         mQplMjXtVqEW0qWz9m0JeMem4ssc4G1g+UnKIJhgcD/oXg2AbkLuZM+s/gzig9orgakC
         3KDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ERpR5xRKdfRwZYTB55/K1Gw6Me8MLOQ3TscUX9zEgs=;
        b=OGo9MEmPwslhgDr1f32motzL8tKmwKycAkbgd2qkGvWnMrXtAk6refA8/gcPpdlBUQ
         lHarNjv/awu4ayA1XNrODZhDa4+mo62f3X+va8j73r/UmjPJ6bB/SPlu28V2QnxkJoYF
         Saxhhm87nQ0gKnrJqMZQSIrpYfH4Zv9W1JBm6clfn01pVydh5i6uzyuG/P1oZL4ZWW2E
         l1ysVuJg0uKovDK4VI99dQxsT+ar7besM8tPkGw3+XfA4aybLOfM7be9ksZDDPo51L8l
         WGieRaqnMcLOErfSKqullDansNY4a6+kmbrbw/8S5zXUh841KShH1BQWJDb60+/oL5I/
         bseg==
X-Gm-Message-State: AOAM531/swhfBvqJZeZZGo1sxSjvoM/mDItrcd5mzVVV6v2xbBZrXGXB
	fr4rNn5uforLeDmHCCOtt6g=
X-Google-Smtp-Source: ABdhPJzALoYz4d7psZwONMqTAGa10eNd8EaKURpQxKmUryGwQVyewSTL9p6LJ4oxU/lLbTH63tjb2A==
X-Received: by 2002:a17:906:1454:: with SMTP id q20mr19637316ejc.446.1630229119899;
        Sun, 29 Aug 2021 02:25:19 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id d23sm5814414edt.39.2021.08.29.02.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:25:19 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/6] staging: r8188eu: remove unused functions
Date: Sun, 29 Aug 2021 11:24:56 +0200
Message-Id: <20210829092502.3658-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused functions from core/rtw_wlan_util.c.

Michael Straube (6):
  staging: r8188eu: remove rtw_get_oper_bw()
  staging: r8188eu: remove rtw_get_oper_choffset()
  staging: r8188eu: remove get_bsstype()
  staging: r8188eu: remove CAM_empty_entry()
  staging: r8188eu: remove is_ap_in_wep()
  staging: r8188eu: remove should_forbid_n_rate()

 drivers/staging/r8188eu/core/rtw_wlan_util.c  | 91 -------------------
 .../staging/r8188eu/include/rtw_mlme_ext.h    |  6 --
 2 files changed, 97 deletions(-)

-- 
2.32.0

