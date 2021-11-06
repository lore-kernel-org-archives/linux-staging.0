Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9495E68
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 23:16:39 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id y84-20020a1c7d57000000b00330cb84834fso12298326wmc.2
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 16:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dKkLuJzLMfjAjIO6U9gJRFbpQv2dR5fK3LxeHiq7VAc=;
        b=qxQoKYOa/BqrirjFbhlkrCX7iOiLwwZu1kSj/QZmEdYdX1ERTyyLrc7aSP49+lnsAn
         LnqENw+FZLKKQh7rGsTweEuZzJ5aXLanTa++Qa93dpPUxfWOrnWwQV+arTAe8WGWWVhy
         rc4cwuiECHT69pf6ihgCGWorhCFNTQGbkpEt3ImNyCt7OF7qLK0goDvnVYCG0yCL03/3
         rkpsX9D4h3XdHXGlGZrjd2osoZQ2VI8hGlKcNY6akd9GitfwMNt1spD4KnOfT744kv5a
         eCgCtd0LdkTIjTq3hovdy79n+NCsjJoLZGpPNpOyYjcQPoXw6A1c+yBKvoxzI1lafA5I
         LoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dKkLuJzLMfjAjIO6U9gJRFbpQv2dR5fK3LxeHiq7VAc=;
        b=cblKMmq+txtmuvMZYci8rgBiKgHQB9LtD8pEcbJF99IuW/9WvgEToZvBoOdA3fYkA1
         BFqIs9YsG3QqAL0GNwVAHYnw5PjlP9hJ/cXkPCuYngCnY2aCZ45xUw8ID8GSLVRVPSmq
         ZkNAPEuB/pu5u//KZDnuwn6BRPmI527yRcuob7uPJPXmbQ/16NujHNNxA1RAd0Sx37PB
         tWx32NuT60YkUAu2htU7WuWFgOZAlePOFRDyVzDLKMJrSR38sN3BS5t0zA40caNwI3Ic
         lvQMwIO9q2Q2rbopFcBl5z/VU0qtzg+wLYuDtU4J7/zetxgCnzd7F5P6hqtgRIYpa8L+
         zmOQ==
X-Gm-Message-State: AOAM53141c+QAdd+0Fl6xIrcHwh+DFy8S0XQsB5Z7wDRJ2cZcodYsgqm
	FJ0SuGVay+BcP9FaOnTAe+2fhQ==
X-Google-Smtp-Source: ABdhPJzz1pJrrBHH+HiKuqkUplOa8E5uHZTgDF9n11IB9OJ6Ly9NADYhx6cHlDpTQ5Aj/NLNG9VQDQ==
X-Received: by 2002:a7b:c084:: with SMTP id r4mr43627925wmh.117.1636240597941;
        Sat, 06 Nov 2021 16:16:37 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id 4sm16320389wrz.90.2021.11.06.16.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 16:16:37 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 0/2] staging: r8188eu: MSG_88E cleanup series
Date: Sat,  6 Nov 2021 23:16:34 +0000
Message-Id: <20211106231636.894-1-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small patch series converts the last two callers of MSG_88E to
netdev_dbg, as the information may be of interest to users/developers so
I didn't just want to delete them outright. It also then removes the
MSG_88E macro from the drivers, as part of the ongoing macro cleanup.

Phillip Potter (2):
  staging: r8188eu: convert final two MSG_88E calls to netdev_dbg
  staging: r8188eu: remove MSG_88E macro

 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 +++--
 drivers/staging/r8188eu/include/rtw_debug.h     | 6 ------
 2 files changed, 3 insertions(+), 8 deletions(-)

-- 
2.31.1

