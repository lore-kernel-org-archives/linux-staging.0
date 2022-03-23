Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC5D1B72
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 15:42:43 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id d15-20020a9d72cf000000b005cda54187c3so1333034otk.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pTW3ojHOoYxc3NDEw8p+NuV70LNriFTIX1fV7UqDwAo=;
        b=gbAWLXGsBGLKq5p+palFqOuBgcaK5Ps1B8mC37CvD9gNwWF+FU42WgUviYW6f/1cma
         Sg8qDkaTsRlcLMpcgbyxVIu7sGZAff5NNCFxccQToeNqZJONzP6gcMYSluf/iPLgCd09
         v5p+WvZfH56DvO7zZUIQIDft9wiqBOjXbTytJAvXmXswaiOh084OCM1AIBF/zjN16u1U
         EiMm6sN7XAWHo2UwOleeHkhh3U1HHRRNhkPwlVLPNwa0rK/ewiQfWMf6l5kla1sFQ/oN
         ZUB7YXBY2GzPFtIFwEC8yKo9kKcWIQ5OF2N+XLfIpUHOphiiOUPDMka9r1rAlMrp45NG
         EcOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pTW3ojHOoYxc3NDEw8p+NuV70LNriFTIX1fV7UqDwAo=;
        b=v2ftnELoizTCIK4R/yYtfcw4K7Ckw406uQiOJnlohgp8k3T2IxRtY9bbdotf0j+sKJ
         OBY0TXm/mPi7D6quV/+EHRrxNXVmZMq7XILn8cveWtAFoSBFirLc1oAQ3q1USeIVrobq
         Pjdtb3sPM3yngfJvIs8rd9yKnUfMNiFHv0d4R20yXlMeV56izfVn/XDK2Mp/2lzF5B3D
         dwF+C7jglt40G3hq3T7JLLXIo8hXZfXb31C4GISFwElQoByNZ6EkGvxwz0kWfdbpRSlH
         3Rvryhcwuz/GgWzxb/NFw99X+9hoRKLMlBCbJDDXHB3HQ+PK0DuoSHXA8GC4HPZR+Y7N
         +zuA==
X-Gm-Message-State: AOAM532qr+cONHFktVJHv/MFkXZmoZT3He2dN6JAJVGL/ka2/QZsjfZD
	pGiIgVmD/2sjXorRZmHCsEzGjfpkkFQ=
X-Google-Smtp-Source: ABdhPJzt09P/aHdFjDESdfzrvXiRlkz/Stor50HGeB1jPH1GFryQrF6FmJl/YZZKoxVe3kWk25qiLQ==
X-Received: by 2002:a05:6830:2469:b0:5b2:2e05:54bf with SMTP id x41-20020a056830246900b005b22e0554bfmr218558otr.76.1648050162175;
        Wed, 23 Mar 2022 08:42:42 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com. [76.183.134.35])
        by smtp.gmail.com with ESMTPSA id q12-20020a4ad54c000000b003245ac0a745sm152323oos.22.2022.03.23.08.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 08:42:41 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com,
	hdegoede@redhat.com,
	kuba@kernel.org,
	saurav.girepunje@gmail.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH] staging: rtl8723bs: Change rtw_ndev_notifier_call message to dbg
Date: Wed, 23 Mar 2022 10:42:37 -0500
Message-Id: <20220323154237.21736-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

The message received in the kernel log for the state of the notifier
call doesn't seem to be of much help to end users. Changing the message
type from info to dbg to hide the message unless you are debugging
the kernel or the network subsystem.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 05482341eefe..bc58bd8c38b2 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -389,7 +389,7 @@ static int rtw_ndev_notifier_call(struct notifier_block *nb, unsigned long state
 	if (dev->netdev_ops->ndo_do_ioctl != rtw_ioctl)
 		return NOTIFY_DONE;
 
-	netdev_info(dev, FUNC_NDEV_FMT " state:%lu\n", FUNC_NDEV_ARG(dev),
+	netdev_dbg(dev, FUNC_NDEV_FMT " state:%lu\n", FUNC_NDEV_ARG(dev),
 		    state);
 
 	return NOTIFY_DONE;
-- 
2.25.1

