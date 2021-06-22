Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D571
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 13:10:28 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v20-20020a05600c2154b02901dcefb16af0so2216427wml.5
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNOemOTras9F985BUt7jkfUSz/FQKfSLHckmy+4u2+Q=;
        b=r8zjWNsHJfYUG4XaG7ALHwWZMS/mKG9J1P3WEpUSGpX5FACY+XGFb3AEYmdK5jgmAD
         u/NvpBC5WHno0T3q4+LtfD8Qo7NVyS8dzEgtxqOhgOLwetITuqPKS4B+pUv5PRMaPpd3
         fPwjXVy0j9weYjUHE2IIkePjkQba2DtbXzWNo/84NDJ2BNqvsGfwGUBsy0eV0613iGKV
         FT/GfRTxIcaDu6fgOojFdoUMEgPSxVAxpS38PHfRMy4QoUtsoY4ZonIRN+861DdgYRUD
         kj8UJQoTqlWpDHBd0N6C7//4N08iPRYJCa1Nq+GYKFgY078nqARmdfIhGEoiqZId3Q7S
         x6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNOemOTras9F985BUt7jkfUSz/FQKfSLHckmy+4u2+Q=;
        b=Qr/o6P21XFgZfpD5lhppgl5L1p4HmmFOLC8oVnI8XEvxc+5NBCx9wTu/8nYUuaAtNL
         h25aPCDMGjMqAmmXrfTYOd4DIrbYobo9PccISHs9tbQ73auATk0gqZtLQPf/Drf4UqgF
         WVNTrX1CZxtnq+jTtv0f+OT9DoOvs/s0tCVD3JVGRW9JqODrK26qjKyb9kvFL/j/miwQ
         9wDOTffJp/eDJ4QRsXK/8rozQ2PK0QN6M5AvhO6BfiDcoLtFemHom6F+h1IkHam6CL9R
         OKTOn6wD9hBm2CTZ7HX81IDoncPky4GBrDhl71vxWe9MHcikBU75EHuwrJiVmXMw0uif
         n1sA==
X-Gm-Message-State: AOAM530zNRI3GBieD1usSn1+nV0XXPcZdDpPPXs7GbVAvHkWm/FLgymj
	UIoI5tvMfeluqCVQydzj5/M=
X-Google-Smtp-Source: ABdhPJy4kfR2MSJThX/eqf8Vo8Iwo3WLxSsS4tIhf+wA84PFtB0S328inGr01cwVQnA52yLXGpuPTA==
X-Received: by 2002:a05:600c:354d:: with SMTP id i13mr4253325wmq.67.1624367427221;
        Tue, 22 Jun 2021 06:10:27 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id e3sm11234726wro.26.2021.06.22.06.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 06:10:27 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 16/17] staging: rtl8723bs: fix check allowing 5Ghz settings
Date: Tue, 22 Jun 2021 15:10:00 +0200
Message-Id: <df7d0ecc02ac7a27e568768523dd7b3f34acd551.1624367072.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624367071.git.fabioaiuto83@gmail.com>
References: <cover.1624367071.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix check allowing 5Ghz settings, only disabled and
2.4Ghz enabled states are allowed. Fix comment
accordingly.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index afefc2c8a2ac..e73fb13f8968 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2572,10 +2572,9 @@ static int rtw_dbg_port(struct net_device *dev,
 				case 0x12: /* set rx_stbc */
 				{
 					struct registry_priv *pregpriv = &padapter->registrypriv;
-					/*  0: disable, bit(0):enable 2.4g, bit(1):enable 5g, 0x3: enable both 2.4g and 5g */
-					/* default is set to enable 2.4GHZ for IOT issue with bufflao's AP at 5GHZ */
-					if (extra_arg == 0 || extra_arg == 1 ||
-					    extra_arg == 2 || extra_arg == 3)
+					/*  0: disable, bit(0):enable 2.4g */
+					/* default is set to enable 2.4GHZ */
+					if (extra_arg == 0 || extra_arg == 1)
 						pregpriv->rx_stbc = extra_arg;
 				}
 				break;
-- 
2.20.1

