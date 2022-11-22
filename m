Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1771E10E8
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 07:46:02 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso14563571wme.5
        for <linux-staging@lists.linux.dev>; Mon, 21 Nov 2022 23:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNmvxzsFPisXHjCgZO/o9Pz9De/lKUYqkCffScEry/w=;
        b=LwoDNLjwCvfI1ik/v9RMhMXTMLe2S9Y8bfuTQDEMWJmzfFBAwqhhSC71aW/GE4XpBd
         YmZ19e39fCylq1AHSUYMFgByYoNs9StS9Vlw9al84PbdJWJuOph4d0p6OFtf5bRYptn8
         HM6whfTvfmPYovw6wys5j4ZySPmUKHHFcO/s28sq8OIeqbUStCD3isZIS4JjhN1v8g/w
         F2+V19r8JEX3jntVearjflpR489oA0t95h44e7KU1QNnl7Qu7hP6DJdkvsDxS3Rbe/KQ
         OQaujboNLP3i7AGPNhFEaPBxtya5H/KwuxwxHQpmddz8oh/rdn4sTXpSGXcvQjrFGhUk
         Q0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNmvxzsFPisXHjCgZO/o9Pz9De/lKUYqkCffScEry/w=;
        b=ypxY3Ph7mKD9PPQewDSCqFgJgL8+RzMsnOzaXVFkFGRww3Wq55l2iWnyYoSapYUupK
         17Z2BFrRgmHSg72k2B+miMS8Q330FKVMOjNVhqUgLDL+Ln+C9gEo/7qIxjjGurANNGs7
         NDv9telo/aLhzMmh+H1VrvcogBwRsDw9ybjEqhnltyzmE2ZsW8+3bCxV8BgX2qc70bDZ
         2Gd3h4GK57bzA9rbajntUpilx19Yq+mrUNGidndkAtw34tC+MjEGQycLt2h/JH5bp9oB
         RtS6sYmcPXawq8WgyEQmRnZd3YdoXfVAwDb9RganA1oE4/92ihSFCDoOf3//d0CXfTiB
         8gCA==
X-Gm-Message-State: ANoB5pnlZFE7BpflOgajBnsKU4efyMBqCliQ0iBt0M9l9zLdxuhsvJoB
	FbTVXSDZYRbntKgvouks+vw=
X-Google-Smtp-Source: AA0mqf4qiRmqD8D6z7JqsqsrSDepgSQyG1OLRWUwqYK/7nLmriXC09dkq2ejw+WK5+2AaMsRAMGwww==
X-Received: by 2002:a05:600c:4f90:b0:3c1:aeb9:29b6 with SMTP id n16-20020a05600c4f9000b003c1aeb929b6mr1651380wmq.97.1669103160315;
        Mon, 21 Nov 2022 23:46:00 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o18-20020a05600c4fd200b003cfa26c410asm23070763wmq.20.2022.11.21.23.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 23:45:59 -0800 (PST)
Date: Tue, 22 Nov 2022 10:45:49 +0300
From: Dan Carpenter <error27@gmail.com>
To: wsa+renesas@sang-engineering.com
Cc: linux-staging@lists.linux.dev
Subject: [bug report] staging: ks7010: add driver from Nanonote
 extra-repository
Message-ID: <Y3x+Lb4Qe0xvBkaS@kili>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Wolfram Sang,

The patch 13a9930d15b4: "staging: ks7010: add driver from Nanonote
extra-repository" from May 31, 2016, leads to the following Smatch
static checker warning:

	drivers/staging/ks7010/ks_wlan_net.c:2108 ks_wlan_set_wps_probe_req()
	error: 'len' from user is not capped properly

drivers/staging/ks7010/ks_wlan_net.c
    2088 static int ks_wlan_set_wps_probe_req(struct net_device *dev,
    2089                                      struct iw_request_info *info,
    2090                                      union iwreq_data *uwrq, char *extra)
    2091 {
    2092         struct iw_point *dwrq = &uwrq->data;
    2093         u8 *p = extra;
    2094         unsigned char len;
                 ^^^^^^^^^^^^^^^^^^

    2095         struct ks_wlan_private *priv = netdev_priv(dev);
    2096 
    2097         if (priv->sleep_mode == SLP_SLEEP)
    2098                 return -EPERM;
    2099 
    2100         /* length check */
    2101         if (p[1] + 2 != dwrq->length || dwrq->length > 256)

Should this be >= instead of >?  Otherwise if it's 256

    2102                 return -EINVAL;
    2103 
    2104         priv->wps.ielen = p[1] + 2 + 1;        /* IE header + IE + sizeof(len) */
    2105         len = p[1] + 2;        /* IE header + IE */

That means that "len" gets truncated to zero.

    2106 
    2107         memcpy(priv->wps.ie, &len, sizeof(len));
--> 2108         p = memcpy(priv->wps.ie + 1, p, len);
    2109 
    2110         netdev_dbg(dev, "%d(%#x): %02X %02X %02X %02X ... %02X %02X %02X\n",
    2111                    priv->wps.ielen, priv->wps.ielen, p[0], p[1], p[2], p[3],
    2112                    p[priv->wps.ielen - 3], p[priv->wps.ielen - 2],
    2113                    p[priv->wps.ielen - 1]);
    2114 
    2115         hostif_sme_enqueue(priv, SME_WPS_PROBE_REQUEST);
    2116 
    2117         return 0;
    2118 }

regards,
dan carpenter
