Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249352C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:22:23 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id m21so140743457edc.0
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EsOC6AZp5IFXMmkUsnZBB2WWUEffS5Y6nVu2ADk4ouM=;
        b=H62SBRjlrcRZMuo2L/YNFUx3qY3HVkDSVKGIG5rF433j5fr83aKtefwsH9Wj8SOaQg
         d88Pb8qoIpYEME0njVzqZDWCzyEdm3CmA0SwexwpcohLJLeo1SbQ/+Z6DcbfX0cpCWXF
         dtW94gyaoeMQj8pNivYHBiYQj5uDONYJpl8zsXn7fUDa0kpRe6h6h4gh6qBknxB1mdMQ
         Q1jh6FUFbnh7mwDs7FQ0Uj5VfUiU7oMZmELvYRY2B8BTu7s2CqfD/J7maqP7aIa41EuV
         03R5WOBYE4iRN4sfoDphCfWYMNQ1g0NOoFjA7GY/zhL5HHeO6cTykBkuO9xAGhQlQVBl
         oYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EsOC6AZp5IFXMmkUsnZBB2WWUEffS5Y6nVu2ADk4ouM=;
        b=lIw6s2K1PNf2hVv/3IjjjQHqUNk1q1vex/iVWw4/s6RpPHR0UhThyMLh+E6p7lJj57
         S0nV54R1EUaAilNXzDNeQiyNmBV5MKpQD/GKS5xQRSZ8XNyVkkdLLxm+YuBY+RooxqJA
         mWH/19Jnt70XhFIqUdx8hzHvAGgxnIAAJU4199P92qDnUtmTQNhOm06eHCK30ndJj9iB
         9jmYDyQ2zU5yZbXrWkFZVrI7ivd5ZgJnXk7si88I5FKolv0UwIWYJh0GlYj/wXReVCAQ
         e1LGec6Vj6z3pI/yK3ISt7mhTHph+7FFUrnuhX2LezJp+X17Bzo0tSYqwEJyAOUkZ3Vc
         N+AQ==
X-Gm-Message-State: AOAM5334k1Zh5GLGpjVaOQx9dzMqGN3r14IWj73oSEpAGkWmgcDhbV1v
	RuwUPjFzKmLdW6ROR0xI9fs=
X-Google-Smtp-Source: ABdhPJzFY9oNfYe+aeuwQoycP2Xo9a7p7VphlwmMqQk2ZX/+W9EqtVKhgtxUIpcdqUbpEGRPm2mvkg==
X-Received: by 2002:a17:906:7d96:: with SMTP id v22mr7636512ejo.538.1641237741505;
        Mon, 03 Jan 2022 11:22:21 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:22:21 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/56] staging: r8188eu: add parenthesis to macro set_pwr_mgt
Date: Mon,  3 Jan 2022 20:01:53 +0100
Message-Id: <20220103190326.363960-19-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enclose in parenthesis complex macro set_pwr_mgt

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 3f16e9b9c342..4b52c4205a2f 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -186,7 +186,7 @@ enum WIFI_REG_DOMAIN {
 #define get_retry(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_RETRY_)) != 0)
 
 #define set_pwr_mgt(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_PWRMGT_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_PWRMGT_))
 
 #define GetPwrMgt(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PWRMGT_)) != 0)
 
-- 
2.25.1

