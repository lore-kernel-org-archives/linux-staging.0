Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835D528E4
	for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 19:32:34 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id u15so9590909ple.4
        for <linux-staging@lists.linux.dev>; Fri, 22 Apr 2022 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ad/QwBoaLcblV6YkIeWuUrZIToNy2PlGXIo1QCJ7d/Y=;
        b=Ko/peBWKlgHk4Vd467FlMQoUcvpxF1aWq82G2L/42YwmW4UuMoiR4iUMku/8Yaax+i
         nxBIngcvmr4Ce2URDbV9DC58RMvMJe+Tfqkz4yuHYCvprr6cARxxUSN0w0kRSDMaPA5P
         bWEK1pFRBbswAtjyRQlC0qFZ8tZ5IIOUy6/EpfFLPS+3gtyaZBLwFog/CRYEvnm9P21P
         ZeD/sUh2WVk0JvpvG1QQGEDQy0ZNb7OlpFGvJz8r4wUCJ82wanDwg8r3QzuUV3GcxbKr
         o0rdK0taDvVPLS7mU9DMB47VQuBzwH0pFkOoQBEUrzJ6vpviggRL/Faldi6HSzowY99a
         IP6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ad/QwBoaLcblV6YkIeWuUrZIToNy2PlGXIo1QCJ7d/Y=;
        b=3TprMqf97WS2tAXiXB2irgFYW78g5tKu674dWKrSSLvwZGvP+2Yn4C9qtXuTJeD6tv
         G5wETigV7Mkk9Sz5ecob8e4ZWNl9c1DXbnwUxFy20VG7ChTHxvzj+2jsN24L10zhv/Iz
         4oXLUyY3cRqqk1yaIDNqWFxcBxSwkOXPnylmgEUY0JiGFTTMko9ZRmgWFpez9SBeNB2V
         SKWWPQdlTnOMrAP+OilPE1D4yPHgRcc0/0n2tb962Gk9sLLkFcTCwfU8vFnXfaQdoUXN
         paWicYjauZg0UwxikqKJxHTb9IKcbNbbCxs4sosWFxin5TpeT8ThlG/cpgeIZCDmGgGD
         k5zQ==
X-Gm-Message-State: AOAM530b8+nCRU57b6zK5ugbUcQe0ez+iDasy0cgbArFfzXcz//ItPeM
	ChesNz2lA3HU7ywc1YYNBqk=
X-Google-Smtp-Source: ABdhPJzM1tudRoIceKhOplJeE8VebcQReB+kqAwFMEijuKAIGHtFEYV6wYwz+TjzDIvKR44Q95rHDw==
X-Received: by 2002:a17:902:e00c:b0:15a:3b4a:3e42 with SMTP id o12-20020a170902e00c00b0015a3b4a3e42mr6070926plo.10.1650655953960;
        Fri, 22 Apr 2022 12:32:33 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:bfe0:e8c0:bea6:ee63])
        by smtp.gmail.com with ESMTPSA id z5-20020a056a00240500b004e15d39f15fsm3518932pfh.83.2022.04.22.12.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 12:32:33 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v3 0/7] staging: r8188eu: drop some unnecessary wrappers
Date: Sat, 23 Apr 2022 01:02:16 +0530
Message-Id: <20220422193223.11948-1-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop some unnecessary wrappers and update all the references
accordingly.
Tested on Comfast CF-WU810N RTL8188EUS wireless adapter.

v2 -> v3:
Fixed subject line

v1 -> v2:
Drop the wrapper functions with underscores prefixed.

Vihas Makwana (7):
  staging: r8188eu: drop unnecessary wrapper _rtw_free_cmd_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_init_cmd_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_init_evt_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_init_mlme_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_free_mlme_priv
  staging: r8188eu: drop unnecessary wrapper _rtw_alloc_network
  staging: r8188eu: drop unnecessary wrapper _rtw_dequeue_cmd

 drivers/staging/r8188eu/core/rtw_cmd.c     | 145 +++++++----------
 drivers/staging/r8188eu/core/rtw_mlme.c    | 177 +++++++++------------
 drivers/staging/r8188eu/include/rtw_mlme.h |   4 +-
 3 files changed, 134 insertions(+), 192 deletions(-)

-- 
2.30.2

