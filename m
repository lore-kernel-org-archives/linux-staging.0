Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE442FB1
	for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 10:47:47 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id i94so13703381wri.4
        for <linux-staging@lists.linux.dev>; Sat, 19 Jun 2021 03:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gNOemOTras9F985BUt7jkfUSz/FQKfSLHckmy+4u2+Q=;
        b=BDBD8xtztljbm6h7TOYCBuGpI54y9JGm3EMTi0BKlhmA6/h1e71zHv1rRfadK/n0QS
         nmp3KmbtwuTItlUvX+H7b4roU14CIzp7Uf4g+xpbxt5auQbHGQbQEpA/pMLpRmFUSR7C
         9lRunf2wsBV5GKKC77Bei4aUpPwSWWtQJ5fvygtgIgTAD1+CUE7zhIYVSXSyyRvRk5To
         9LtIu3WALsEcMpkCMhoqwuF1UPSSmGy2qsG00pConutb3dO7Qq9TiCdOTg8HirtzUTGy
         0vGexY7v7eJfKZzSKES7sW+HUbwXwy7rW0qDFGUOMFuNPjVw81sccK6yD+QXNGFMOQou
         5vtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gNOemOTras9F985BUt7jkfUSz/FQKfSLHckmy+4u2+Q=;
        b=uNMLvqANlTdEe0mGTFZ8cTt6LS0RvHpXx0jcZQgprppNeW1goOMNsinOrVigBVPhW0
         EwAk39bTQXC8wqSDQJnL+yVtMxiwmTOXnu+Rze6DamJ6ekcKV+8IRJBVntjHOUHEPW6y
         Mu0S4XTohUiYzeF/Fr4806A7MF+oa4maWEJs+Dg7vQCX8v1gwh+U2YyMud5mAw/6So2r
         35Oxzx4zMa1w6a+kF6fWEEIDba4MCyZQHL3K2mogm+2M/aD09lcJPdi9G1uPXxCniX+m
         bDY4VczVuiIvJ4Tnzdbfe7s98Vh8eJufa/I+rGhw1gxhuwNKl5vAVRAUJBenhMCKnAen
         IVpg==
X-Gm-Message-State: AOAM532mkn2MnrkhGEQzWsv+63tRT4Aa3TyHETVSwcICz126vWlL0Q6W
	n9xWxwOxCd+pfVrZyRbJ1Us=
X-Google-Smtp-Source: ABdhPJwnVchvKDG6fQg7ryPh7cdC62znzKma5Zexny4pJMdGlv202m5DRtVup+wRx1aVPECscSRRyg==
X-Received: by 2002:a5d:49ce:: with SMTP id t14mr16915770wrs.365.1624099666240;
        Sat, 19 Jun 2021 03:47:46 -0700 (PDT)
Received: from agape ([5.171.81.81])
        by smtp.gmail.com with ESMTPSA id e3sm1056119wro.26.2021.06.19.03.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 03:47:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/18] staging: rtl8723bs: fix check allowing 5Ghz settings
Date: Sat, 19 Jun 2021 12:47:20 +0200
Message-Id: <76a466525997ca006707bc2115705995892d420e.1624099126.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624099125.git.fabioaiuto83@gmail.com>
References: <cover.1624099125.git.fabioaiuto83@gmail.com>
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

