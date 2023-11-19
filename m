Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495AE36E
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zg875CWR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9fd57d009fcso19857366b.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432149; x=1701036949; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aoxqGEFk9urPUCn7RYMpHrc4r9kPUjHKVpLcLoj2K+I=;
        b=Zg875CWRSxxiqugWUQH/1gVTmiGpcvnQf7sshUOpiJfd7/ZYz0B5mdwRwRHHr2y0nO
         5o8wGSWTNSogKl7EjO2NbGs8WlY7d9BeD/9kswC2UizZd2EfZkyu+wOREVKRIdUCKFC5
         1tbYTZA7chLspwkH6784Z2mDla7MjezBoHoig4gUbmQTrDDWwTFiprhvbAsN0AWF3U0y
         tE0elIfjggmEQncuBAulfimcXKRQRcQEdSM9bkM9IqXt2AXcSUrifuvBGcZkn8sXW7Rx
         M1nNynFjf4L3BL8OZjllEROnpBgRq/laV5jQzZmOOYbL9r9L/jFtMVfADQsLG/BdNAld
         oylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432149; x=1701036949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoxqGEFk9urPUCn7RYMpHrc4r9kPUjHKVpLcLoj2K+I=;
        b=RDnsDpbTN326feAQ2wAOTa1WY7RXcCxN4b20tQz4nDdtFkHWq/t5y9NzP51ZFwSP7M
         JQ2hGvPls1x5YRSMSCgVjx6NM125fmBxmpDAXNkGArtdN/kZXk28Fa+xb/Lh9pxxa3d9
         E1OICZz5IiRiUwcpn0uLk8BlAsfJ4KmeGtTLQY3HFxnvoDXE2GnD674jK6+W3ueEMjd8
         5bAOqXoYPA8LrewKOsPs7wMHYVsCJ0rbIaOHVbqpwqhN+KctRVICKtCNwytAfb0/V3HJ
         3OKadXtSM2j+umvNhGQrgWEBmaE4hwLEA0HdSeUrBRmHcbKPB/SMh86rcy/aYozpxObm
         kW4A==
X-Gm-Message-State: AOJu0YxinGRqIFQDNC5lFL87c6d4EtAB78/oAbTrjtJJF0TkBcdcrnkO
	A5PxRcpRXslY6dihDvhEttE=
X-Google-Smtp-Source: AGHT+IF0nppcsVEy+uQJy8MCutCLr5TzKFZ9U+on2LhEGmKQzq7Kah7nSBX13282/CHLpSypbR7dmA==
X-Received: by 2002:a17:906:1da:b0:9be:4cf4:d62e with SMTP id 26-20020a17090601da00b009be4cf4d62emr4303045ejj.5.1700432149497;
        Sun, 19 Nov 2023 14:15:49 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906c00200b009fb1c3ce877sm1755880ejz.76.2023.11.19.14.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:49 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:47 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 12/14] staging: rtl8192e: Remove unused function dot11d_init()
Message-ID: <d2e8d81ec9eefc7b7eeb9f6fd6a28b28db6b40f0.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

The variable dot11d_info->channel_map is initialized in dot11d_init() and
in dot11d_channel_map(). dot11d_init() is called only once just before
dot11d_channel_map(). Therefore dot11d_init() can be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c            | 8 --------
 drivers/staging/rtl8192e/dot11d.h            | 1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 1 -
 3 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index fd488e2fa815..9ec112e00e38 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -14,14 +14,6 @@ struct channel_list {
 
 static struct channel_list channel_array = {{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13}, 13};
 
-void dot11d_init(struct rtllib_device *ieee)
-{
-	struct rt_dot11d_info *dot11d_info = GET_DOT11D_INFO(ieee);
-
-	memset(dot11d_info->channel_map, 0, MAX_CHANNEL_NUMBER + 1);
-}
-EXPORT_SYMBOL(dot11d_init);
-
 void dot11d_channel_map(struct rtllib_device *ieee)
 {
 	int i;
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index 82748b12bd82..767bbbc8b01d 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -31,7 +31,6 @@ struct rt_dot11d_info {
 #define GET_DOT11D_INFO(__ieee_dev)			\
 	 ((struct rt_dot11d_info *)((__ieee_dev)->dot11d_info))
 
-void dot11d_init(struct rtllib_device *dev);
 void dot11d_channel_map(struct rtllib_device *ieee);
 
 #endif
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 4b842a1789c2..c3466291e221 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -795,7 +795,6 @@ static short _rtl92e_get_channel_map(struct net_device *dev)
 
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	dot11d_init(priv->rtllib);
 	dot11d_channel_map(priv->rtllib);
 	for (i = 1; i <= 11; i++)
 		(priv->rtllib->active_channel_map)[i] = 1;
-- 
2.42.0

