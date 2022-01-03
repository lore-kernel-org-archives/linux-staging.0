Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236E12C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:53:20 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id o6so139855349edc.4
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L3thxqyHADyILlOXoWfVQ/+L3dqIHOY8Hktm+9JrG0s=;
        b=RA3fHvP6sjzHRO13u27hOQbt4NTcNKrqKM1apv8sk2jSB/+dnIj+HcT1qgoL1dSmRW
         L53OgO9FULFiszzhO+6ifkXo/FXiVnNPWmaKT6UT64jAoZdYZDml90M/q8YpfpoCkQsl
         fA9dOs1N08Xytk0QJhgUX4+c31w9myiASEAQteMvz2BgpEpIRpMYQgGUkbQ0FSlVZ4g3
         KOE5JK4VogH9BZ9lrb0ohgOuRzzn44Zb9/nbwZkGgQB2tI7gKiP28Rwb1/VAtbyvAGV4
         1OQ8WvdiSVXGKuvM7f0XdpufyrBxD44r6c3lYeSRUrUvfc66j8wfYx0ZCEke4XJVyfAV
         WVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L3thxqyHADyILlOXoWfVQ/+L3dqIHOY8Hktm+9JrG0s=;
        b=KDSWSWXcKCw45x/yh9QcEd+kknMyATnaUz07hUx2yp9WGUrEKnxL7A6x2fFEZ6to3K
         w0RTa2jeCYk67+v71sDgj2AeIoqPdQBTf9a9w5qRnoLeRYYOqXUyIi4phsWVQZWsID3o
         pFpoNJwtL8Y0mQWJIGNnjOW4KyZqRzPcDsd+DnJLXsT4ZqFmuavypM19M1z1B0TH802m
         jg94VSBpDIEc9tduu16j4f8fOPw70xAhGjysGaE6cq+rf4ZjIHxBGDN+g8/AZCeFKR7s
         pJZR9XGNG/SGy2wekCPNmn6hzXZm+ep5pY0Z+41jfMwYHNZ6r7oHnxBTWTCHBx9TwTK7
         2nlA==
X-Gm-Message-State: AOAM5321Fxj8NXKuXFfURT7bmd1oAY6XMq3byH4W2dPUZYr76qG/j5ww
	BVfb6URTqPpiGmwbSHdmhns=
X-Google-Smtp-Source: ABdhPJyt0OQmgAjebYtBz6OL0xisq/ruU5K/LA7kf0th1Bmzl1jkAziDG2afDGYQSvEC9KRw0Zty7Q==
X-Received: by 2002:a17:906:26cb:: with SMTP id u11mr21082371ejc.630.1641239598514;
        Mon, 03 Jan 2022 11:53:18 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:53:18 -0800 (PST)
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
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 51/56] staging: r8188eu: remove dead macro SetAMsdu
Date: Mon,  3 Jan 2022 20:02:26 +0100
Message-Id: <20220103190326.363960-52-alb3rt0.m3rciai@gmail.com>
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

Remove dead macro SetAMsdu

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 7a42031ebc15..63f1b0a974f4 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -248,9 +248,6 @@ enum WIFI_REG_DOMAIN {
 
 #define get_a_msdu(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 7) & 0x1)
 
-#define SetAMsdu(pbuf, amsdu)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16((amsdu & 1) << 7)
-
 #define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
 #define GetAddr1Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
-- 
2.25.1

