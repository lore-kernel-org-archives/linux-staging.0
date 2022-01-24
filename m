Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCDC3FE1
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 22:44:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id v123so23994653wme.2
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 14:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7znmcaDRDi4XBN93/6yXaX6uBsi3TKnQRGE8o8aEMJU=;
        b=6NrmZXRPLdTEvLqS3ppSEX5eWHDYIGuQfgP+OmoRc9nX4bQYf6Jc+vK8VwVvGC0reW
         YpD083sS6XzF3mD2x3Q6yx2gLLg56RiTdTTPdvEEqediDTbdenAFJeHqICEDuv+/Zubj
         BfTtwNHZxFcf6gIxCZDN/jFFR4r5+FwNGUVP+XFPjhm6Zmlpr+meHkUGeJuPRNIBhB+s
         JQwHBvsiBFiv326bYrkQh5gYUXHzaPHc2q5Xlpo9YBG9E5oaD5qM+1DmA/8d/ZY8cTif
         8X4bHgLpIL3sjvtJr81nb8eUzkA9Eq6E3D0TjA//coBqxuxn2wMKklIxCHk7zs3XGh5Y
         cCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7znmcaDRDi4XBN93/6yXaX6uBsi3TKnQRGE8o8aEMJU=;
        b=j+Xd3eTmyPMWL+Q3iHjcepJt8CsteNaQXC9gBYnvrRZQLfwSkKWplIsicn5UwjNfmg
         ZD2CaB0xaDY+7EBCp9uiq3XMmiWb5EIZpVlpTXSZWqSyADGcezSsAil1VLk9z7hZpAx4
         d+yb2OxkRMrlJBJBXnQ18upkPN2c0iBwJ1lVwQbT8iryJsQz+9QhuDw2Sw/CbeGLSb7s
         xMeZ3Haf6PNegQ4zAiXkVT+J3ezQPTleJwa0wUkK7/FISnh8Fff7lNKagaPAP2Ef3akY
         SpZLYM77s7OL4Ke3jhSTR0tPu/kTo1RBw8lMA/skTfWklDzO9e+cJP1cOnuzABf2Lib4
         qXbw==
X-Gm-Message-State: AOAM532h+1DAZrv6F1aJh7KzUOC+moinXoOyRHp4WRUI1wRQEiTdY7Gf
	5PN6KP7j2rDYHRv7ZCfwdGXSLw==
X-Google-Smtp-Source: ABdhPJwbcicGgogM0TZZeXSpHymAph9CrVa/BQqjNDo7r1juFnFPlm1dFX+XORwvjCEQhpNJ5GbSGQ==
X-Received: by 2002:a1c:a7c2:: with SMTP id q185mr378882wme.3.1643064276529;
        Mon, 24 Jan 2022 14:44:36 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id i3sm15010613wru.33.2022.01.24.14.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:44:36 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [PATCH 07/10] staging: r8188eu: remove DBG_88E call from include/usb_ops.h
Date: Mon, 24 Jan 2022 22:44:12 +0000
Message-Id: <20220124224415.831-8-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124224415.831-1-phil@philpotter.co.uk>
References: <20220124224415.831-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove DBG_88E call from include/usb_ops.h, as it does not conform to
kernel coding standards and is superfluous. This will allow the eventual
removal of the DBG_88E macro itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/usb_ops.h | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 0a1155bbc7b8..2b1d50d2b2f2 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -30,11 +30,8 @@ static inline int rtw_inc_and_chk_continual_urb_error(struct dvobj_priv *dvobj)
 	int ret = false;
 	int value;
 	value = atomic_inc_return(&dvobj->continual_urb_error);
-	if (value > MAX_CONTINUAL_URB_ERR) {
-		DBG_88E("[dvobj:%p][ERROR] continual_urb_error:%d > %d\n",
-			dvobj, value, MAX_CONTINUAL_URB_ERR);
+	if (value > MAX_CONTINUAL_URB_ERR)
 		ret = true;
-	}
 	return ret;
 }
 
-- 
2.34.1

