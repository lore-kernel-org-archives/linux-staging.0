Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12077EBC
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 21:58:00 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7835ffc53bfso77109939f.1
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 14:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690063080; x=1690667880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NwbewUwtQOX42wr9LwdKvivKXFOaLGQh9L6giyMZRg=;
        b=HEp/1maRsFLWMNQhtS2UwRdOszuhv+sqOFeVsCUn7Ofs9yGRMzSw6v8kdd447LsBed
         ZgEk1WR7oKw0l2Rmbf0bWGusM3JQFMsOgXnJG8dWKCHjBa378DdBf2DXhxXBvZwb1mcT
         Q6EmAnwywYZhJ7kJp/jdDlpz9Dl25l+pPx9TqJAkcR1I73kLduUmlVYI6HsppG5HZ23o
         98xXPrFjsE1N+gGSAtYfsmla/1cykphCieTiXHP7rMTeZxQADaxMJZ/JU1h7/w9SvFUe
         DdYBu3fV6RGYWwvWiq+B02N9YBHfNE7hZN7BS9dHxo/fm+MnJVoLLJPbbVxNkvdZ3G9d
         yGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690063080; x=1690667880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NwbewUwtQOX42wr9LwdKvivKXFOaLGQh9L6giyMZRg=;
        b=Zx+sq7fmBqoOnbaOxuv78XKrKJh9Nv/OmKRqRgbS+qqlr/lNWBFdsqw90YnLLmYgon
         8JUCYQtKXCrGVxYj8vJSvMeA/pVAxRp/SZHSnrtnSGpVkqwCwxPz5BGlefTVpfLTiSrG
         eP88LGlZKw74McRQWmDyvci55WDdySn7ntG8vbyBMaFuUxzgMm/PFIevP9SOLv9kxEnW
         cuyZ10VKhhiN5oK4oyrziK22x1C8diDRc5nxl1Xn9PjdxvuMBPqRVh0TjmfbdZmJqjAw
         jR7txMY2isN3wNt3agJkoWx4aBiNwIgOA9Yaqw3cWPwRHVr1Mh1XnUGlE+cVLO9qEIFu
         VOcA==
X-Gm-Message-State: ABy/qLZOpYb5XTb6Vdn1VNGtANxbu+yyFi6tOH9l4k2YuNOrJu7QQJL9
	f4hRKxIMV5cBMOBmbUzWmUDth7akONBGgQ==
X-Google-Smtp-Source: APBJJlFjqqOWMP2pfQkY9d8/m0nxsrzn9e9tCzjf9GN1nqn6HNu0IYM3J3IRyzRBdreEsnet4wRqPA==
X-Received: by 2002:a05:6602:3404:b0:783:6aa0:9816 with SMTP id n4-20020a056602340400b007836aa09816mr2716255ioz.7.1690063079959;
        Sat, 22 Jul 2023 14:57:59 -0700 (PDT)
Received: from localhost.localdomain ([161.97.244.155])
        by smtp.gmail.com with ESMTPSA id j17-20020a02a691000000b0042b4b1246cbsm1921783jam.148.2023.07.22.14.57.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Jul 2023 14:57:59 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: franziska.naepelt@googlemail.com
Cc: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/9] staging: rtl8723bs: ioctl_linux: Fix code indent
Date: Sat, 22 Jul 2023 23:57:57 +0200
Message-Id: <20230722215757.4214-1-franziska.naepelt@googlemail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
References: <20230722215330.4114-1-franziska.naepelt@googlemail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch issue:
- WARNING: suspect code indent for conditional statements

Signed-off-by: Franziska Naepelt <franziska.naepelt@googlemail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index b8595b28bceb..20c296d88c8d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -640,7 +640,7 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 
 				psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 				if (param->u.crypt.key_len == 13)
-						psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
+					psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
 
 			} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
 				psecuritypriv->dot118021XGrpPrivacy = _TKIP_;
-- 
2.39.2 (Apple Git-143)

