Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764B310F8
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 06:09:47 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id c24so8245384ejd.11
        for <linux-staging@lists.linux.dev>; Fri, 05 Aug 2022 23:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dOwmTAb/YyYu9dvtbrEUu3VG7RE6NxbTxlYgj7dPfSU=;
        b=a5mNY3fulOEL0OlxHdFGSGJzJB9w3t0CQ3SEkGhuG9XwhqNHZ3uZuP2HDeeyw2QGI3
         2tDVTsCYKNcSEbaOsihngfUl+bI3rVaXn9TyK2vEao9xf2PwyexjXRACtG6bJqMCpMT4
         DZPx7nVRls6tHbJafngLlGRakMsMF+czRLz70TCcc2KF4O4XHks45p+ENqAVPqeFzOi7
         P2i+Jm8HZzioCH1LOfxyLtIkOxAo+8R6MqivY9OVQqKWfpfw53dTX+WIzFu/1ICydsHt
         TChPjQMS6yWK1YSTH3YG/MykBU75WOj8C1EufNoKLgaMeUX2CMTmOPFuIxg7/CUQVFw2
         Txyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dOwmTAb/YyYu9dvtbrEUu3VG7RE6NxbTxlYgj7dPfSU=;
        b=aVKRXx8N5srov6GYeYCgL4eE9PGuQyFef6eQ1wsNTyjgwU60yqaLSF3LA+CWVdqXkC
         MtKSPqbdkmlrlJKq3gFOIw+83wN+QoWrYw6D/9N+YmU/Mg5GgCHX+v3hVHfS7SCW85Sb
         32MnJv2vWYvr6IGlY8snU3wjktpluDXt2BOl4qhOoluqDA1INurFrwysJntU6g+yTGwm
         wXY8vVVyg7YWgwpjr8E5vt3OcBqxbr+OiY/noLpX/rR2mZ0Xiqcvw8+SiQ7DUbv0YeNb
         bOhrpP3m1WtNGQvb1+g5lJE8tBzfP97OLf/xn20ly+JHrF3lIShF2cj8BR4dMcGd4wzR
         +wIQ==
X-Gm-Message-State: ACgBeo0/m1Woc7b4b3GMxr3/dGbY39fuHZ2hux/RWDlRl8limSarYnfk
	ulQMb/k5Gc/YtZ+Z5Hpy0zs=
X-Google-Smtp-Source: AA6agR613ThnWZjyEgQeGd3tVPxybmcPnYwV5sowDy4K1bxoG5SmKFYLHCdOroFIHPOqScnNzt2/8w==
X-Received: by 2002:a17:907:6d98:b0:731:2bb3:8e17 with SMTP id sb24-20020a1709076d9800b007312bb38e17mr697716ejc.203.1659766185809;
        Fri, 05 Aug 2022 23:09:45 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id p10-20020a05640243ca00b0043a7293a03dsm1002357edc.7.2022.08.05.23.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:09:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: r8188eu: clean up phy_CalculateBitShift()
Date: Sat,  6 Aug 2022 08:09:26 +0200
Message-Id: <20220806060929.11022-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series simplifies the function phy_CalculateBitShift() and
cleans up coding style issues in that function.

Tested on x86_64 with Inter-Tech DMG-02.

Michael Straube (3):
  staging: r8188eu: use ffs() in phy_CalculateBitShift()
  staging: r8188eu: avoid camel case in phy_CalculateBitShift()
  staging: r8188eu: clean up comment for phy_calculate_bit_shift()

 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 30 +++++--------------
 1 file changed, 8 insertions(+), 22 deletions(-)

-- 
2.37.1

