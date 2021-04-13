Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E051071
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:10:47 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id h4so7589613wrt.12
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5vH99A1fpuY8PmP3SpQC4JZoT0N6aqKLVm35tssstBY=;
        b=YyeJkG/wviaq9AXZn5iPJ2pxSoBnDP7b3oGypT2AOj0I1I5/6JBkckXNpvyK8tLtoA
         a+caxOgoPnKgmh0N89rwqt0CnMXF2iCGzm4yFets7UJeggn50+lxo68uVXw+i+Sz3NOX
         K683TGIXcTxUY0gVaQEzODVTX7cQc6zsfVUFEfmW+kUvDXPm61XeX+ew4cN3WZt7K82I
         ykSy71vgxBK+fs1FEeWUhfPta/5CA1A20mElqAEvTwR27czg9gyt17AFG7rTN9q0WOKj
         yoYwGnpank+RDJTj8GN/jyDwXECfKhiPbP3Jpb4knGkWA5f7BBRlzDA2UBvb7yqNS7VB
         9qcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5vH99A1fpuY8PmP3SpQC4JZoT0N6aqKLVm35tssstBY=;
        b=ohbIsEbusEFfsTJ+Gl7jjscx3UmBToFUg+Ru+U5+/n6S5Eg8Xvel3zpxpNTgRLAJe+
         HKvFoPLBnk6WpSW4H3Qn+znuI+RkZxXbBherlh3TmzPTECxouMOni6wnG2mbDsPHiNSq
         7kcMgTk9ZUJtmXh5BeK1khiEIekDDhyrjs7kUKs1nUyVYVdWaqiHw3K2orFdBWhfkwaW
         dOD+vjtUu8VVIcoFcKYtiUES90EbaOxpsYg/zpzM2a1+cJIzdgTfyFZridmHrj3UymN9
         PJt944Qdjzug+q6/TYhDuL2ACRfffZVE3yOcjOTRvGpa/h3TiWXsuSzv+PNlI7YAHpIb
         qPFg==
X-Gm-Message-State: AOAM532ycyr7Wmy08ifE2GqQ9UFyxa7wjf4Q16VM+UzT9j3QSIYOKzoo
	deQNuzB6Nq4FTtTbW/jF0aiSnfcSgZM9CA==
X-Google-Smtp-Source: ABdhPJx1zFyzztrVNNrVNW9vLsorNK6xLTat/RMZw06mPIcS3fqsjJ9lquGTIohLKgujqG12NznsrA==
X-Received: by 2002:a5d:4a48:: with SMTP id v8mr13339054wrs.204.1618323046572;
        Tue, 13 Apr 2021 07:10:46 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id h63sm2557871wmh.13.2021.04.13.07.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:10:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: 
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] staging: rtl8723bs: replace dump_drv_version usage with netdev_*
Date: Tue, 13 Apr 2021 16:10:36 +0200
Message-Id: <463d327e54e903b65f4700f966f0faae3c88d806.1618322367.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618322367.git.fabioaiuto83@gmail.com>
References: <cover.1618322367.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace dump_drv_version() usage with netdev_dbg().

The string printed is the same contained in DBG_871X_SEL_NL macro
called inside dump_drv_version().

This is just preparation before bulk DBG_871X_SEL_NL macro
replacement by coccinelle.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 332855103b14..98c9eb399ba7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2590,7 +2590,7 @@ static int rtw_dbg_port(struct net_device *dev,
 					break;
 
 				case 0x10:/*  driver version display */
-					dump_drv_version(RTW_DBGDUMP);
+					netdev_dbg(dev, "%s %s\n", "rtl8723bs", DRIVERVERSION);
 					break;
 				case 0x11:/* dump linked status */
 					{
-- 
2.20.1

