Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B691523D1
	for <linux-staging@lists.linux.dev>; Sat,  1 Oct 2022 09:40:53 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id sd10so13554556ejc.2
        for <linux-staging@lists.linux.dev>; Sat, 01 Oct 2022 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=1MtTj3cT/5VTPlvXh/pGzQBDICycaSPpTW526Zz8N3w=;
        b=EW8byPsve0k20XTqJ0YLQ5udpxEwQaGE7Wjls6o6hzjAdfhVZnGIxUdxoEsjfrO6Zi
         I+2FS4yKyjIzR0c7yGST3t35VzfblDiZNLi4p9S14aioUTdiUgfL3O0WavMDi+lA1ulg
         0gNq7kMV0EhOsFQBwGdWjHgicBhxbeNiEh6rLXqUMPj668CDgNmYbLoT0ypddf/KwibV
         RZT38zoBNUw17SSDbigfUrRrBTQJLcfcmT1WtgVEOXdj2bnJchJqRDGxaA4Picgex5Kv
         yL2ZwkL8lDvBgMy6iuY8/At/bQ2SqQErwwXRui+XB7ZpnK8UgMAAQTPbJq41ZQ88+VoS
         kVhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=1MtTj3cT/5VTPlvXh/pGzQBDICycaSPpTW526Zz8N3w=;
        b=uiTXDR/8pvU6/Ok6PraJpJGOes4e5pQMgmuPIEMq0cSrETGn8w5r0Zw+uA4dH+gw9A
         ZyELE2uz9/YRqCk1l3W/Fy4aJvsrkqYb2zezGs4pD0e3UnbI8vUaqha5RmM8z/ceBcIB
         cYvUZ9StVpG+sSGejkaQHfnMNOTWyuo7irzZx9bIYnqUcARr3R5jakWg6pHXliu0nC2Z
         dI8HiB0vOgVuRX0uaxFa6Mp6EQCljXo9YJs0Tqnr8X1uJXUpWegzMiAM9XMO4TNSLGox
         EKpqHiiDFqCGbHvf3Zfk0Ob7bKEBJ4N5pIDYN4G5RbbVkYWG8vXd7CvPQmQFGUjASrKZ
         H0Og==
X-Gm-Message-State: ACrzQf3P+/oLBr3Te42Jf481rzjyTpTyl82YGqoINqAAPuELjBaY9JVm
	H8PiQkDqCEM8mzsIwbrG6ak=
X-Google-Smtp-Source: AMsMyM5oFGYyDqHQAUn8E/FsLBHdUUxu5CKP0PRBhzvVZgEc0urh2Gdfke6Zwj6t96mBjfIGd+wI2w==
X-Received: by 2002:a17:907:1b1f:b0:72f:56db:cce9 with SMTP id mp31-20020a1709071b1f00b0072f56dbcce9mr8884418ejc.605.1664617251958;
        Sat, 01 Oct 2022 02:40:51 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id bq10-20020a170906d0ca00b0073c82539183sm2464476ejb.91.2022.10.01.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Oct 2022 02:40:51 -0700 (PDT)
Date: Sat, 1 Oct 2022 11:40:49 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/10] staging: rtl8192e: Remove unused variable
 bIPSModeBackup
Message-ID: <657035f84d266fd5c6f96e9b530a96c2ab4ff900.1664616227.git.philipp.g.hortmann@gmail.com>
References: <cover.1664616227.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1664616227.git.philipp.g.hortmann@gmail.com>

bIPSModeBackup is just once initialized and never used. Remove resulting
dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 drivers/staging/rtl8192e/rtllib.h            | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 7c0fd2bce923..cbb65cfea83a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -886,7 +886,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rf_change_in_progress = false;
 	priv->bHwRfOffAction = 0;
 	priv->SetRFPowerStateInProgress = false;
-	priv->rtllib->PowerSaveControl.bIPSModeBackup = false;
 	priv->rtllib->PowerSaveControl.bLeisurePs = true;
 	priv->rtllib->LPSDelayCnt = 0;
 	priv->rtllib->sta_sleep = LPS_IS_WAKE;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d23d1c3ce39b..e0fa87b12ceb 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1250,7 +1250,6 @@ enum rt_rf_power_state {
 };
 
 struct rt_pwr_save_ctrl {
-	bool				bIPSModeBackup;
 	bool				bSwRfProcessing;
 	enum rt_rf_power_state eInactivePowerState;
 	enum ips_callback_function ReturnPoint;
-- 
2.37.3

