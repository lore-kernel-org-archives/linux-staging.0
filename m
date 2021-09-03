Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88C672
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 17:56:23 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id n18so5087plp.7
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 10:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=QK06svqw7DyH5jd4WQQegPSwOLABf8o6RovqCiYy1aI=;
        b=dyjdkFN8x1vzuDusjhxQ/tFQK+7RCR7OJad7+OfnrUmNvLhABMLnwmSNIZucbD7tio
         02+MHWXWXUNTzGv/O/ZWOId4PI4GbSxQ2SzE58Z6R5wsnncABp6vzjSZxImmw332XvGr
         1eFM+yf/ris/umM8kyRGyjMNYO5i+/xzZ5yjAmEPcUh6L49suDk2hBjswtm8ivo6N94f
         CUfMQKBUiPCUQroNnEJ0ZvE64i+Nd1KNYLxhZcPQtgFo0hiczaHAwQ00dV7Lh938qTlx
         TSyRiKX7f8Pf8OFWRDP1eCEWJunEPdFjkWS3cfbEBnfkog6X13IL2vtBykU6FH4bdQ0h
         WYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=QK06svqw7DyH5jd4WQQegPSwOLABf8o6RovqCiYy1aI=;
        b=AYwCeWtZmTAY5dsk572frZEdg/MtI9q8Z2O2uZLTlN4Nvenv+399l4oDcIN+Eaj35x
         Lm4g+r5jNUAsKwpSg6VxNTMXiDFv5JrZSbQjt0px8GUvmKtgfqnO9eLE/h5lcWkTYaK1
         IKVpBV1SFGy1Dd+0Emoj7t28p+qeSuiuTXEz/eZnJ6lBZV/7JvTyOmFWrHLuu3SlgQIL
         u/OHJyHWEhg1n+K3YA+K0ujBgRfFsTC/5aa4aGmPlwLlM11LwysfzSs0B4/4bozPFF99
         tf2UL7qRi3WvoSNZzjcK+ndYeek0ephkgGucwRDUG0//cS62RH/xcppgAbQAyOgSMfAv
         wJUg==
X-Gm-Message-State: AOAM5339QswMeyy39kLbqRXYrcUyfnUpywcyLqBgNhm1ID+LkdFdbe1B
	RDeAcqrke5lEbTwOWf3pkLY=
X-Google-Smtp-Source: ABdhPJys+QMDqxVdjzFYs2Zgfj7zs+kqB8fZEIuxNUtjCmKBE3BqN+x24Q2Qmt+1lAwMnlBZr8lrmg==
X-Received: by 2002:a17:90a:4a8e:: with SMTP id f14mr66326pjh.169.1630691783204;
        Fri, 03 Sep 2021 10:56:23 -0700 (PDT)
Received: from user ([117.98.200.228])
        by smtp.gmail.com with ESMTPSA id v9sm26605pga.82.2021.09.03.10.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:56:22 -0700 (PDT)
Date: Fri, 3 Sep 2021 23:26:17 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
	gregkh@linuxfoundation.org, straube.linux@gmail.com,
	martin@kaiser.cx, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: r8188eu: os_dep: use kmemdup instead of kzalloc and
 memcpy
Message-ID: <YTJhwQstKPUYRwN+@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixes coccicheck warning:WARNING opportunity for kmemdup in ioctl_linux.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 81d4255d1785..495fadd2b8c8 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -585,14 +585,12 @@ static int rtw_set_wpa_ie(struct adapter *padapter, char *pie, unsigned short ie
 	}

 	if (ielen) {
-		buf = kzalloc(ielen, GFP_KERNEL);
+		buf = kmemdup(pie, ielen, GFP_KERNEL);
 		if (!buf) {
 			ret =  -ENOMEM;
 			goto exit;
 		}

-		memcpy(buf, pie, ielen);
-
 		/* dump */
 		{
 			int i;
--
2.32.0

