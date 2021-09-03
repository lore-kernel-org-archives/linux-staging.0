Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE773FD5
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 19:05:01 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id q11so76710wrr.9
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 12:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iGjCcoCfsKc5nOLWhuXqF/48+OAzPEG2ZVBrM3dGEWk=;
        b=HZk5le5JAtvCcFATezsYrwuRukTLJn4cDBIsS1ilVZc+8gR4Yw8uY9032wSs+BiRYg
         5OH4uVtnmtlnOdRGEBX9nDofgIG1oLzcg3WMRvSAv+w7JPuTrJI0dnrd/9mnSZQF55i6
         NhjXzPceW1wHCR/RuZIhC9Q70e6Hx0QqEvYdLVpYsgI9O7U8nOhW5D1tX6x85Q0VpxsX
         iP7MKYZ9gLqtKswPHmOJWvszh0+ptPO5aP0sX1gxL/U25dIjoT+ArtNFVwolhU1V4eve
         6S0Hx6Dht9dMLHHKhltauMiZvsSoE7Z0C24qxSAKvMogF7po30B2t0n8klNfmL18pFyZ
         puCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iGjCcoCfsKc5nOLWhuXqF/48+OAzPEG2ZVBrM3dGEWk=;
        b=XVyFBlra1gQWrR7OVhHLoYR4gUmoo3XSPHP69uQx/HufjczFmWoehju+E7HI+FBbe/
         fqAlj3dEOfKUZMiFOOz/9OVnpDU4kx722SJt9U5ZhgpI5qNROEAJ3lBUlVN3he9NSEMr
         HjM24MqUtD1b1X9SRKEkHwKQ/3Rbqebb4Z8gJI9WzhYOKJ011P/3ByFjWV7qKJWdFuG1
         T14CrFQgfnE9qYYuo8kzonOWWUAnI+ndxSFsPzZ2r7ejbWgW3fZT0dTtFeZzTOcQwxSL
         gmWqSu2e+4roEnV+gcVBDdC8/fbUa56hCEE14MleV8LPJNJ0UETt5ACHQFesZJpOtP2D
         cvxg==
X-Gm-Message-State: AOAM531mJFsQ2Ju2aWmmk/lELpPd9anBXrPpGPhAkaHNxjfyA9Zm/WjT
	HUki1E3TUWEyapLYJhNvCsY=
X-Google-Smtp-Source: ABdhPJxalX5b9bt7SlCR3opFgt8BzJiDjjgTjyu4DYUPmbtzDFboVHWtm88r3ZaNBG5RW9XCGIzx/w==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr598397wrj.72.1630695900023;
        Fri, 03 Sep 2021 12:05:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::848c])
        by smtp.gmail.com with ESMTPSA id u25sm229291wmj.10.2021.09.03.12.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:04:59 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: clean up dead code and use in-kernel arc4
Date: Fri,  3 Sep 2021 21:04:41 +0200
Message-Id: <20210903190444.15585-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes the unused function rtw_use_tkipkey_handler()
and constant CRC32_POLY.

And it converts the driver to use in-kernel arc4 encryption instead
of a custom implementation for WEP and TKIP.

Tested with Inter-Tech DMG-02 and TP-Link TL-WA901N access point in
WEP and TKIP mode.

Michael Straube (3):
  staging: r8188eu: remove unused constant CRC32_POLY
  staging: r8188eu: use in-kernel arc4 encryption
  staging: r8188eu: remove rtw_use_tkipkey_handler()

 drivers/staging/r8188eu/core/rtw_security.c   | 123 +++---------------
 .../staging/r8188eu/include/rtw_security.h    |   6 +-
 2 files changed, 25 insertions(+), 104 deletions(-)

-- 
2.33.0

