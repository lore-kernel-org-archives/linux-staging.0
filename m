Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285BFEBC
	for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 21:57:47 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-348c9b58870so1612995ab.3
        for <linux-staging@lists.linux.dev>; Sat, 22 Jul 2023 14:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690063067; x=1690667867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NiYt7Tw0QK7f0nlz4SKEHhaEGnGqAWTc0j4eEPb3kRI=;
        b=ZJmJmCWE6gO0q9V9V7FLGpi9A4sxOAgfALRUjFO1sPEb0pIScMYl62jlC6Pn9DLgCW
         lh8vILEeXCl1UJGK+2mB/w/LPHM9XBX979nhfs3fTb02+J69Gu+SDKdFSnt24EJ5eE3G
         XhUlBC6wvB7Kd8NeiBh5szHXZgPJMko0q1bt+84LLMMLcZuh33lg9bqJWhLHAkE/aVT1
         T9G+LJcn6Ey3U8dDNr6jcNjklx73XESyrjmfRSFNjOBkU8oj/wtq+17sxR8gyoIPSAD5
         vNYvuxEZh/5PIJqoUViaPdihnIEYn+Df+rz4QuubdqxvFKYgjNzk36UXP+4nz834jw0F
         Gtvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690063067; x=1690667867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NiYt7Tw0QK7f0nlz4SKEHhaEGnGqAWTc0j4eEPb3kRI=;
        b=Cz5336Z1XrN2AiSOKEfRxYPYer+S8wpuAlmzpA9iitjZa3C01+2j1Tnf0TvVu586Hv
         e1gymlnw8My+BiEULenxkf0cOTQGtUNEsIpT9l37D7xj0uDZ69ebAHI2cVXhuuPFquKr
         KfCpgLUw3YWYFzvHtA6lLc4jPoiC5zLg1sV6zo2myE/uUoaoYtWcMqGXybJBvUAq5Dgz
         7D50cAVrCBB/+JPs21zJNeGQqKkoYSQmg9wPnDChQvTjw3W5LqQDrtXBboe1iighl4ia
         5Yh6MxLolWVj5bRdNgD/Fu9UEeYFACxApJpT8sbaV/3qeMkWkVt6funox+ULAfAUbeMj
         hWGA==
X-Gm-Message-State: ABy/qLYxVOFmgMZZPJDFA2YIKw08oHgUcJ89JzFKbUo6df655JEJzYdi
	wrVEAxXCOxIqrb9f/Nat//s=
X-Google-Smtp-Source: APBJJlHn9jzE35Il7Hl7iVud49hHzAOTyod5n63H74V9XLwnE7acIsYFtMK2mdecTsPOx2PVVYZ71w==
X-Received: by 2002:a92:d943:0:b0:348:8050:d7a with SMTP id l3-20020a92d943000000b0034880500d7amr3536447ilq.30.1690063066913;
        Sat, 22 Jul 2023 14:57:46 -0700 (PDT)
Received: from localhost.localdomain ([161.97.244.155])
        by smtp.gmail.com with ESMTPSA id dp21-20020a0566381c9500b0042b1061c6a8sm1966166jab.84.2023.07.22.14.57.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Jul 2023 14:57:46 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
To: franziska.naepelt@googlemail.com
Cc: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/9] staging: rtl8723bs: ioctl_linux: Fix else on next line
Date: Sat, 22 Jul 2023 23:57:36 +0200
Message-Id: <20230722215736.4183-1-franziska.naepelt@googlemail.com>
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
- ERROR: else should follow close brace '}'

Signed-off-by: Franziska Naepelt <franziska.naepelt@googlemail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 40a3157fb735..b8595b28bceb 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -654,8 +654,7 @@ static int rtw_set_encryption(struct net_device *dev, struct ieee_param *param,
 
 				psecuritypriv->busetkipkey = true;
 
-			}
-			else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
+			} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
 				psecuritypriv->dot118021XGrpPrivacy = _AES_;
 
 				memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
-- 
2.39.2 (Apple Git-143)

