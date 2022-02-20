Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3296C7B
	for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 15:49:05 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id hw13so26841118ejc.9
        for <linux-staging@lists.linux.dev>; Sun, 20 Feb 2022 07:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dARIPsQFLgerpwn1kQ2g+irfqGZDCER4zOvKgssyNuo=;
        b=fFzb5I+Xrzyb7TNUivKHhlRdkvfeCmNWBLCRAGxwGGTi4Hlc2FRsX0syDEtgC2GkDY
         NOIXYpBQZiY/9N+FiDnO4cwrSx5FLXjkzvuKEByuGT3fa7kfg6wpiZhckWom4veyzVlu
         7iXKZBQW3FIkDPCCwx3XSqEtsqSzglp8VPA+SGxVFq4z5peIwd+4W5DUfOkwWQaFguGo
         iGen3s0GReq9iMuH1OOYBQ2kWmzWRDalj8Hw+ZWj4eP9NiAjxFlNXksl9/jX7gn6KCQH
         ljF6/AFu8u5bpMoO1rW1fOadtp8JvVXsPg999ucvYZH+Kx9Djv3M7qhxVmDlkPTJPZfC
         4p3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dARIPsQFLgerpwn1kQ2g+irfqGZDCER4zOvKgssyNuo=;
        b=cpAseIUjmJKnSJ4+QuTcBsmtBCiumi4rjLvhMpVoAP/SE5AfhHvOS1ocWduw2S8hfK
         Y/nTMMEnS6syQcRN1Ychjr/uuP1SB8ylAP/563r5P0GqvDYU3qmdeMziTbJI6LEULLw4
         nt3D/wiEfuMWBOPXzAZhXyFP9AXVtiOiX8IXNr9TbzD9K3OKLiAjmm3ZF9tH49IgLxMt
         izNTlXiaxSVQn/tvXhEwol6ZCAepfn4/Ph+7WCL1/EkdTWpvUsr1oaLMsBxKIzf3Y9LV
         bQfN9rYsH6O3dlcD7v8WtfmOoKdPTNDgoj4zqgMvGTTWuTl4MhBlBjjcmNCgqhX9LRTY
         d0Og==
X-Gm-Message-State: AOAM531Nms04oynpr5VWMOCAV26Y3Mb+3YpD+VDwKtGiqWz+vdGxcBcj
	Itx/EGDULCaInoV/LEEuPio=
X-Google-Smtp-Source: ABdhPJzOfIaCWcddsfGqtsIX6dBfFI29GRWro4vBxYgh/w8mpHKlXKl8UazYmXPZQtv+xJRoQ6poEw==
X-Received: by 2002:a17:907:1dc4:b0:6ce:f3a8:49b7 with SMTP id og4-20020a1709071dc400b006cef3a849b7mr12425908ejc.121.1645372143489;
        Sun, 20 Feb 2022 07:49:03 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb8f.dynamic.kabel-deutschland.de. [95.90.187.143])
        by smtp.gmail.com with ESMTPSA id ew6sm4178979ejc.217.2022.02.20.07.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 07:49:03 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: clean up rtw_rf.c
Date: Sun, 20 Feb 2022 16:48:44 +0100
Message-Id: <20220220154847.7521-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This set removes 5 GHz frequencies from the channel-frequency map in
rtw_rf.c and simplifies the rtw_ch2freq() function.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (3):
  staging: r8188eu: remove 5 GHz channels from ch_freq_map
  staging: r8188eu: refactor rtw_ch2freq()
  staging: r8188eu: clean up rtw_rf.c

 drivers/staging/r8188eu/core/rtw_rf.c | 61 +++++++--------------------
 1 file changed, 16 insertions(+), 45 deletions(-)

-- 
2.35.1

