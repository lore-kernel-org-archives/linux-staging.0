Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E3A47A43
	for <linux-staging@lists.linux.dev>; Fri,  8 Dec 2023 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuGu9BOj"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-54cea1f30cbso616715a12.1
        for <linux-staging@lists.linux.dev>; Fri, 08 Dec 2023 10:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702059565; x=1702664365; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+e2GMm4IxE2ZPhAT3rwUK0y+pX6drbXEPnTu9WgFI0=;
        b=MuGu9BOjRxJJ1RL/2xSZuHVpv8INrn3TOm34H4aZKVRVUUZEzMRKivS5C74yCPv2s8
         7q9Y8A755AANVerEbsTmPbYwR0HI8ifc/+AK5KdGcPz1L4edju52Gthclb2qqdeWGdqH
         jsoGOQdznzlN2B2QTL6Z0K7SgV64BDrMWg10JmGuBXilouv8cFYQA8RqJxp97WGIqE1F
         jKSatJxQMGklR6oVblG+3Sbc1gLAXqdm4JSGufU20Q/46t2GYNmqT88HFFMZIcMljIEy
         aDWEwUaKTBV8Ryx0lvKQHxtelkQ/u8A/9o/NPCiV8/UgdKpO/d5ALH3fOq7i0mJJAi0+
         qXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702059565; x=1702664365;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+e2GMm4IxE2ZPhAT3rwUK0y+pX6drbXEPnTu9WgFI0=;
        b=jHu6dOF4s1rfUHtJTwCkpuW1MjeTDiwtErUb8wO0d+gEGgp9uKkr1RSWGRTscDZJeN
         A8nSU6xSaGY97YKCIDdQSc4x1Pu3V3ZdK+FT1bVM4D6FsPqQCwAYMa3mpJ6I6GgNsMOs
         U9LfSffcor/nfYtjNSspR9SwjdgZ6LgX3hks6fnDbKjgED9e3ztt1OMzVpSGo9cAm61j
         zCOupvo6DQNzsRuCb+3cQiqX5zIYDhotJ21HmTvHy86AL8soDDROj4Y30wXKYbl2AFac
         tYyqApYbS8SpBzY79017OswEbrHHxXNCd0cgi/8KpS4GLNeeQPYIb+9SnI2S5HXWTL1L
         bdWw==
X-Gm-Message-State: AOJu0YzrMut/UidQ0qOaDOHh1moiPtEeA9ohGWhJ5qpeUVHgLCo2pwR9
	Bk2/nnZeq7E92SteYk4TGKY=
X-Google-Smtp-Source: AGHT+IHSHhKdNhaPS3KTBL1ZnE1s7W/L7jwh/CBnt54AmVGKgSBxevLAmAfH0JXel/VQQsT5N6f3Lw==
X-Received: by 2002:a17:906:ba86:b0:9f2:3e76:5d39 with SMTP id cu6-20020a170906ba8600b009f23e765d39mr513767ejd.0.1702059565189;
        Fri, 08 Dec 2023 10:19:25 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id o20-20020a17090611d400b00a0d02cfa48bsm1277795eja.213.2023.12.08.10.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 10:19:24 -0800 (PST)
Date: Fri, 8 Dec 2023 19:19:23 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] staging: rtl8192e: Remove c files dot11d.c/.h
Message-ID: <cover.1701989555.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove function rtllib_update_active_chan_map() as "active_channel_map"
and "channel_map" have the same content. Content of "channel_map" does
not change.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Used the following code for testing:
struct rt_dot11d_info *ph = priv->rtllib->dot11d_info;
for (i = 1; i <= 13; i++){
	printk("priv->rtllib->active_channel_map)  [%d] %d\n", i, priv->rtllib->active_channel_map[i]);
	printk("priv->rtllib->dot11d_info->chan_map[%d] %d\n", i, ph->channel_map[i]);
}
Log:
[ 1141.288386] priv->rtllib->active_channel_map)  [1] 1
[ 1141.288393] priv->rtllib->dot11d_info->chan_map[1] 1
[ 1141.288395] priv->rtllib->active_channel_map)  [2] 1
[ 1141.288396] priv->rtllib->dot11d_info->chan_map[2] 1
...
[ 1141.288426] priv->rtllib->active_channel_map)  [11] 1
[ 1141.288428] priv->rtllib->dot11d_info->chan_map[11] 1
[ 1141.288429] priv->rtllib->active_channel_map)  [12] 2
[ 1141.288431] priv->rtllib->dot11d_info->chan_map[12] 2
[ 1141.288433] priv->rtllib->active_channel_map)  [13] 2
[ 1141.288434] priv->rtllib->dot11d_info->chan_map[13] 2

Philipp Hortmann (5):
  staging: rtl8192e: Remove function rtllib_update_active_chan_map()
  staging: rtl8192e: Remove variable channel_map
  staging: rtl8192e: Remove variable dot11d_info
  staging: rtl8192e: Remove function dot11d_channel_map()
  staging: rtl8192e: Remove files dot11d.c and dot11d.h

 drivers/staging/rtl8192e/Makefile            |  1 -
 drivers/staging/rtl8192e/dot11d.c            | 29 -------------------
 drivers/staging/rtl8192e/dot11d.h            | 30 --------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  2 --
 drivers/staging/rtl8192e/rtllib.h            |  1 -
 drivers/staging/rtl8192e/rtllib_rx.c         |  1 -
 drivers/staging/rtl8192e/rtllib_softmac.c    | 19 -------------
 drivers/staging/rtl8192e/rtllib_softmac_wx.c |  1 -
 9 files changed, 85 deletions(-)
 delete mode 100644 drivers/staging/rtl8192e/dot11d.c
 delete mode 100644 drivers/staging/rtl8192e/dot11d.h

-- 
2.43.0

