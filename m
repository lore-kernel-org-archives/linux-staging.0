Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE643FEC
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 21:24:11 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id u7so11058429pfg.13
        for <linux-staging@lists.linux.dev>; Sat, 02 Oct 2021 14:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=tyaNHYSot78JIfayCvFdZP5ADG4ZrfdCKwO4KmosFLA=;
        b=ZKpEeCuxZEY/wCWn5h6rjv1EhuWNh5vf7TRcQEkxzP79Eou2MSW6rd+nU5is0iPds+
         AEQPVdjPQyyg67qPje1h1m6Atvtjtiu8dlN0eF/aOYGqKa9br5atkWTwUe2q7epEEty8
         QZuVUlE2y0H/x3jOGj9nfOI0ajsYgkYbgibqsUdjKlOlDO46aXkgx7HAVjiEw5u4pvdD
         HMAz3opxQuvyzpuEMfS13lcaCwnPy2iHI0QaxeS0fmoSuxpF90t2YBgyRfbRKSte594P
         jxj20v0xlDY2uFJmbRdzc9HLfuIcV1Iv+vXoUkelVk62WPNdY2ax/aGS3kfd9TUKSlzN
         tN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=tyaNHYSot78JIfayCvFdZP5ADG4ZrfdCKwO4KmosFLA=;
        b=1n+lHbLec3MfiO7so+O1BfmqYxiXWh27uwIXExdVoe6RIXD/Cvu4Ambn2MUIAoDx0H
         5ElOxgfZDnfdLT+vVsnpR2xFtYrFIQ2Pn7p0TqeKHfN1omIZnvZXwTuYGonvqRlnavi3
         Sl1upJJNnm43m4UAT7KHKNN0vJmb1ZhaiNajZ3vfwFAEe/+jhSs7+xW5GYd7E4/1lUE4
         YmOaHIe4bumpS+4wepcL/77+22yiXTnVdczqUv6WTl5zXNNBYAoipFt4vNW7NZUnUXKP
         z+1gX+hBN4LvKiwwkOsDBoxrit2SjsZiIOYdJ+XCY+47MawuipqoQry4IsS5e9BS/xGx
         8o+w==
X-Gm-Message-State: AOAM530NSnMpcq4ZdhU/nLosX6yxIyOU3JnoNMXELQ4BxO6GRqjvM0Jq
	idAKqsR81paKAU+ST3JvVFo=
X-Google-Smtp-Source: ABdhPJx4NYcgw6T0x4hW7IZD7Il4i7ml3b5X8Cexl1Ll+qzqTY1Nl6/5Yid+bklBNEie72lMaJeYhQ==
X-Received: by 2002:a05:6a00:ac6:b029:374:a33b:a74 with SMTP id c6-20020a056a000ac6b0290374a33b0a74mr18366920pfl.51.1633209851302;
        Sat, 02 Oct 2021 14:24:11 -0700 (PDT)
Received: from user ([223.230.105.60])
        by smtp.gmail.com with ESMTPSA id h4sm290908pjm.14.2021.10.02.14.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 14:24:10 -0700 (PDT)
Date: Sun, 3 Oct 2021 02:54:04 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: gregkh@linuxfoundation.org, lee.jones@linaro.org, clrrm@isep.ipp.pt,
	colin.king@canonical.com, dinghao.liu@zju.edu.cn, nathan@kernel.org,
	zhangqilong3@huawei.com, jiapeng.chong@linux.alibaba.com,
	saurav.girepunje@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: saurav.girepunje@hotmail.com
Subject: [PATCH] staging: rtl8192u: remove unused static variable
Message-ID: <YVjN9FT4KjLGX/Zg@user>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

remove unused static variable channels.

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_core.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_core.c b/drivers/staging/rtl8192u/r8192U_core.c
index b6698656fc01..594239990455 100644
--- a/drivers/staging/rtl8192u/r8192U_core.c
+++ b/drivers/staging/rtl8192u/r8192U_core.c
@@ -96,15 +96,12 @@ MODULE_DESCRIPTION("Linux driver for Realtek RTL8192 USB WiFi cards");

 static char *ifname = "wlan%d";
 static int hwwep = 1;  /* default use hw. set 0 to use software security */
-static int channels = 0x3fff;

 module_param(ifname, charp, 0644);
 module_param(hwwep, int, 0644);
-module_param(channels, int, 0644);

 MODULE_PARM_DESC(ifname, " Net interface name, wlan%d=default");
 MODULE_PARM_DESC(hwwep, " Try to use hardware security support. ");
-MODULE_PARM_DESC(channels, " Channel bitmask for specific locales. NYI");

 static int rtl8192_usb_probe(struct usb_interface *intf,
 			     const struct usb_device_id *id);
--
2.32.0

