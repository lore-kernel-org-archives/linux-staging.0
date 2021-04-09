Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE16D00
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 12:46:15 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id j20-20020a05600c1914b029010f31e15a7fso4662838wmq.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 05:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=KlSRX8zU0KTuE/qKWYqizNg9JGBt025L2E4igOAe0/s=;
        b=h7poIT8bwExI/TCmdJHHT3BNh+Imp230eLBnKUq1rGm8O3Fp1/pLUjLDlp52DPWAwB
         TMALSKeLMq1a9zIgudAPNVdNZvuCuwqScMANowOAo3B0UULTsqCRvPkbhzaFo8A3lfhP
         7OIBBcQ/wz1mnXv55CD4g0SM8Rgi58I6f4L+iSTlOkPg0Tw356Iq3DvwbX+HUji5PKvn
         4vKCMjzeZ+8694e/nePPLBsIm+5zRvKzP9lsKuuCjCcFwBD8XWAGuQQnfxV6cqqnX8Ig
         +5sugpZJm8fnxr0jMQngF1l5aa9VM/OMqqBSN432LVfAnibnj9bbVzvEACtbpdtT/xfv
         dnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=KlSRX8zU0KTuE/qKWYqizNg9JGBt025L2E4igOAe0/s=;
        b=ILZX6pXu9w8cIUPp/Sb7N6HTrvRyVXJ19VEcyVmGp1/sTE66maEZgDJV7rECUcW4Mg
         rCewFjZuucT/gX7hyyb3bLYWIIcmHvZHvEpk70zSpF6aWv3lqTDp8sc+Ide/CnwLOq3k
         pF0r34VpuEGdDrP7X/8sOGeua2kXOccJl5GsXAsKroBiujVGWb8sED+vVwlGRgXpY6ZW
         cFPc/lI/v6vxmgHhyTH7BYC7ckMgfF6KOY38aH5tLZL5stJMDCzlsmGC76/QEI+ouUIu
         Kal/4YpVeO3ueKcL4jfzIlPn5wS5HL0/XwwtZdLTu2h9FJSU7FqYcJy0OpOdtDv9BbMr
         f9TA==
X-Gm-Message-State: AOAM5330o98KggOOSYGebc6DSnI/ArmqSdOGz3BJ238s7c9ocnz0rU/L
	Fg7itDg7pc9IKuScpVJE46M=
X-Google-Smtp-Source: ABdhPJx33HYypTGXE4AUKki/UmoaGB6AYtLBPnpcbIuOWYpzdkVhe+9R7QfIy31CD/k7pwDoIR5XXw==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr9021126wmp.165.1617972374293;
        Fri, 09 Apr 2021 05:46:14 -0700 (PDT)
Received: from test-VirtualBox ([87.116.165.76])
        by smtp.gmail.com with ESMTPSA id e23sm3745970wmk.15.2021.04.09.05.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 05:46:14 -0700 (PDT)
Date: Fri, 9 Apr 2021 14:46:11 +0200
From: Sergei Krainov <sergei.krainov.lkd@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2] staging: rtl8712: fix wrong function output
Message-ID: <20210409124611.GA3981@test-VirtualBox>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Return NULL from r8712_find_network() if no matched wlan_network
was found. Code with a bug:

while (plist != phead) {
	pnetwork = container_of(plist, struct wlan_network, list);
	plist = plist->next;
	if (!memcmp(addr, pnetwork->network.MacAddress, ETH_ALEN))
		break;
}
spin_unlock_irqrestore(&scanned_queue->lock, irqL);
return pnetwork;

In this code last processed pnetwork returned if list end was reached
and no pnetwork matched test condition.

Signed-off-by: Sergei Krainov <sergei.krainov.lkd@gmail.com>
---
Changes from v1: Updated description

 drivers/staging/rtl8712/rtl871x_mlme.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8712/rtl871x_mlme.c b/drivers/staging/rtl8712/rtl871x_mlme.c
index 8a97307fbbd6..c38161114b80 100644
--- a/drivers/staging/rtl8712/rtl871x_mlme.c
+++ b/drivers/staging/rtl8712/rtl871x_mlme.c
@@ -146,6 +146,8 @@ static struct wlan_network *r8712_find_network(struct  __queue *scanned_queue,
 		if (!memcmp(addr, pnetwork->network.MacAddress, ETH_ALEN))
 			break;
 	}
+	if (plist == phead)
+		pnetwork = NULL;
 	spin_unlock_irqrestore(&scanned_queue->lock, irqL);
 	return pnetwork;
 }
-- 
2.25.1

