Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833508F5A
	for <linux-staging@lists.linux.dev>; Sun,  1 Oct 2023 13:44:10 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-533c71c5f37so3313409a12.0
        for <linux-staging@lists.linux.dev>; Sun, 01 Oct 2023 06:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696167848; x=1696772648; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=522MwXZqJUWHyXjMD6+ZKRNyT+zr9qIsF/KHqubKWwA=;
        b=mCCbFG8socNlgyNio+4NgXdzs9T9TuQwsA4fZBc4Z5KveiEV3NrBZ1WUcXSjo94c9a
         Ddvfjz43R6bRCUimpRU5i1dBMrk2xPW4EsDsXH0znxCLS0FCy7QceZ2uk9MF70foccDW
         RWMG31DFEx+YhDLnc9lD676GMh2nKvcE23snLG56GLRHp43k+5WWPoIeV8zB3wpPFlxM
         zh/TiPVyX0jF2+QM2YRQvzVfKopQe1NZtMpKcITu4YLhbv78acVwI+NOi7CfMFKC5atO
         5K0NDoFpdJOI6iBkdn0sZ0yNnY01YvqLNyJqFkURSd9qFw09YEDhgRudwmD4NxoExm5S
         xlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696167848; x=1696772648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=522MwXZqJUWHyXjMD6+ZKRNyT+zr9qIsF/KHqubKWwA=;
        b=EIDhmcV9C8bo8Mb9nE6hWC39yV5OClynmIMEw9rLD8DhNuChgC/nVNgnNTY7LTurXe
         2LxSFruhMkkses+zsseB4gtGt5wT1hAsJj/avIxHF8c+IrBBdUFLiwhMkHz2wMNx7zbo
         7VsYXkdavJiyrEYkDp9HQgqy92bvHjSG4qPBNIK0Z7CM9sGCW6uLzj0AAGpHDuzqfN5D
         jF1IHYgLfAQUnwrw19H9fiof+nvM2+zTAewNpSUwvqzV1Yx2EcopW2gbFMjLAADTjNmP
         ebaSSjEFjyeKzrlzxCapoW9aGUeNITFgBxKmsxIDNhekqF9Z4lPP0OikIbfdE9AHRMtj
         LIsg==
X-Gm-Message-State: AOJu0YwC9wRC7XfHreHgnL03XcVHU8sXny845iqPculZTH48MswQugPP
	GSeKermdAL6+zktOkt/gimQ=
X-Google-Smtp-Source: AGHT+IH1X/sCWgQUa5MwEqVHyRwzYptm0N4XJUzsCkcGYjg1aLdr7kQqWgTAJMGC/YuZsOPhr/n/MQ==
X-Received: by 2002:a05:6402:5243:b0:51d:cfeb:fc3b with SMTP id t3-20020a056402524300b0051dcfebfc3bmr6777839edd.1.1696167848673;
        Sun, 01 Oct 2023 06:44:08 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id k15-20020aa7c38f000000b00537fee52351sm2743509edq.28.2023.10.01.06.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:44:08 -0700 (PDT)
Date: Sun, 1 Oct 2023 15:44:06 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/11] staging: rtl8192e: Remove dead code from
 _rtl92e_if_check_reset()
Message-ID: <5f29332205dd76896e981fa627925d62a6bf7f63.1696165351.git.philipp.g.hortmann@gmail.com>
References: <cover.1696165351.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696165351.git.philipp.g.hortmann@gmail.com>

The return value of _rtl92e_tx_check_stuck() and _rtl92e_rx_check_stuck()
can only be RESET_TYPE_SILENT or RESET_TYPE_NORESET. This functions are
only used in _rtl92e_if_check_reset(). In _rtl92e_if_check_reset() the
return values are checked for RESET_TYPE_NORMAL which cannot occur.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 87f5441fbb10..f67923ccf790 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -975,12 +975,7 @@ static enum reset_type _rtl92e_if_check_reset(struct net_device *dev)
 	    (priv->rtllib->link_state == MAC80211_LINKED))
 		RxResetType = _rtl92e_rx_check_stuck(dev);
 
-	if (TxResetType == RESET_TYPE_NORMAL ||
-	    RxResetType == RESET_TYPE_NORMAL) {
-		netdev_info(dev, "%s(): TxResetType is %d, RxResetType is %d\n",
-			    __func__, TxResetType, RxResetType);
-		return RESET_TYPE_NORMAL;
-	} else if (TxResetType == RESET_TYPE_SILENT ||
+	if (TxResetType == RESET_TYPE_SILENT ||
 		   RxResetType == RESET_TYPE_SILENT) {
 		netdev_info(dev, "%s(): TxResetType is %d, RxResetType is %d\n",
 			    __func__, TxResetType, RxResetType);
-- 
2.42.0

