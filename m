Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A201840
	for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 08:36:38 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id h8so16500685ede.8
        for <linux-staging@lists.linux.dev>; Sat, 25 Mar 2023 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bvJuEJW/3WhkhbvLRnBCygzL8nJBB9Z+yoFexvWQ38s=;
        b=NUHUh1h9jI9sYJQDQzGOMmUQ8tRNwVGhP62zpq/wjfZjDja1DbUBHLk2e8shuEgvLn
         p+8lthD6QAxQDMacV9Hjf2Py8faYqHUIHxwABXmW6AaS9ewYW8zEN69hRtPy1Gm39uAq
         gUIxj8EeFZAa4M8O/wrDGzChQWsJW4pAYRqb5wGUY+fexZB8JgkkGBb1Lgq07QOvb2Fx
         K1d15Epka6+dFgXJtHL4kiElh14o5/pckyiFZaLoYemeHXWy0Lb8+/3LHbZFd+sn+oSn
         jdD3Oc27/pSt5Qhwir1ZtltwOnebx2212OUYlXHpHiuFMVaHbUr3fbu/MQwG2UUyMx7n
         azsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvJuEJW/3WhkhbvLRnBCygzL8nJBB9Z+yoFexvWQ38s=;
        b=r1xqtC1v0FL+ArDSfxQa4k96i+QNT7dZwOVw1hzg5WjmhzLeSaws1cacDE9aQuCrW3
         F33T4bv+m+2C++lE4AQ4H8I8I4vgSfrI1MT65zpKowXPX21kaex9zzJQD0ka1s03lY5g
         X5ekYCXC14FrsHqZpRwuJhsYZ6Bib9+WWZvHMGAUCg1MRjDddQ4zrizcD2+vqVHbTZLY
         c+pPzSrN6gZ3ukfuIY8o2qETteFh+oMytR7w45ngv09MHmCQSoAeKyhcRIgW8WmxG/xx
         QS7pLtiRD5RJS0ZbGMxOKL2lJ6Jbpx+ma1pAwYJQvOFXim7U+oneTQOjoI8ARJaD49bb
         x3eg==
X-Gm-Message-State: AAQBX9fRh5f6uvmtBafeKlGoNDdBrPJdApI74M9WEJ/AIV/xKEJv26e2
	E5pOPjI5lIj1BejxdcKKpr0=
X-Google-Smtp-Source: AKy350b5a50DD5w6VTuZ8EksPCAQgGq7O6wFt6S1WV+bZJXmUuGi0Mtf/bTnYUTfuEME4stV4lfMIw==
X-Received: by 2002:a05:6402:268e:b0:502:ffd:74a0 with SMTP id w14-20020a056402268e00b005020ffd74a0mr6647571edd.2.1679733396979;
        Sat, 25 Mar 2023 01:36:36 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id r3-20020a50aac3000000b004fccef39ec9sm11983991edc.70.2023.03.25.01.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:36:36 -0700 (PDT)
Date: Sat, 25 Mar 2023 09:36:34 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] staging: rtl8192e: Remove priv->rf_chip in
 _rtl92e_set_bw_mode_work_item
Message-ID: <a872bb67f71b9992740d5f9b154f794604a2dbb0.1679732276.git.philipp.g.hortmann@gmail.com>
References: <cover.1679732276.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1679732276.git.philipp.g.hortmann@gmail.com>

priv->rf_chip is initialized to RF_8256 and never changed. Remove
conditions in function _rtl92e_set_bw_mode_work_item as those are dead
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8192e/rtl8192e/r8192E_phy.c    | 24 +------------------
 1 file changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 73e426e052b0..1f0d3654c6a0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -849,10 +849,6 @@ static void _rtl92e_set_bw_mode_work_item(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u8 regBwOpMode;
 
-	if (priv->rf_chip == RF_PSEUDO_11N) {
-		priv->set_bw_mode_in_progress = false;
-		return;
-	}
 	if (!priv->up) {
 		netdev_err(dev, "%s(): Driver is not initialized\n", __func__);
 		return;
@@ -918,25 +914,7 @@ static void _rtl92e_set_bw_mode_work_item(struct net_device *dev)
 
 	}
 
-	switch (priv->rf_chip) {
-	case RF_8225:
-		break;
-
-	case RF_8256:
-		rtl92e_set_bandwidth(dev, priv->current_chnl_bw);
-		break;
-
-	case RF_8258:
-		break;
-
-	case RF_PSEUDO_11N:
-		break;
-
-	default:
-		netdev_info(dev, "%s(): Unknown RFChipID: %d\n", __func__,
-			    priv->rf_chip);
-		break;
-	}
+	rtl92e_set_bandwidth(dev, priv->current_chnl_bw);
 
 	atomic_dec(&(priv->rtllib->atm_swbw));
 	priv->set_bw_mode_in_progress = false;
-- 
2.39.2

