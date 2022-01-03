Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DBA2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:27:59 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id w16so139675268edc.11
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2MdYEcgXd4B1apWzHzTGq7elyU9Ldr6jcgJyInqhbm8=;
        b=DWll5Tdbp8H5HRUrHGSm2RDLZ+O3CAcVRf/QUtYeRiv8aO2Tiv3g4EJR8x6y97+7Rh
         0JSldGS2DfA1tpC+b8BSjpu53nJwDd752qu1IQk6MmcnatK/UIOco0HoEErqutRbfOGP
         CEll1IZ2Z2e0vIKN8yCQ0FyUV8kipVHiK07x962qDUN2JbeRD96Y8vwta4so89lr1P59
         2lxogeA3Tw1JZnmO7wYpftu4QIGhz3X5LIxFKlylVY8GWxUoJd+Lk1YTWHyEXukjfyt1
         XwWyf9qjSQQTlfAPZi2y29plywdseuD6yRZGVMExFFcvu7BnKskoz6ZLZ2taIlzcH8C+
         gStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2MdYEcgXd4B1apWzHzTGq7elyU9Ldr6jcgJyInqhbm8=;
        b=qelp+mYD3pBnK3EnFUGjo4yLtoBEsFjQWCKroy79dOZ/uFti06AJtG53AK7dyUurIU
         fv3/g1vZX+fQ8JF40FcKFR/iCxIxWwJzEAg6CyaDVTsP9Jrx9VD9DUX6ty0GKKugr6vD
         R1Xr7LX0QCv+PlJPTX6fkNcq7aI7xr6XkoGs4Q6mpb9G8JV+cHh4ozicZyrjRyd1XAHK
         iaVp36v6/n8gwnXEtu+YgpEw9q6eThiEAhCg0ltlSF2zRcMIJPC9HpaFSGVtjrSQqA8w
         BIDzQWK3jJmAeMhddRwvZjoMAq3XaVqg0r9H0kOJ3zuzbPm4PRrLNESaGdz5NlOTJTe8
         fBXg==
X-Gm-Message-State: AOAM5305PKLz7lPwmR3mUr8ADXnVN6F76ra3YN2BuOgJvJHUNB12//XE
	c8AW5b/UgbvG/ok78rwQoIY=
X-Google-Smtp-Source: ABdhPJz1XH1JWQwa5gvjsuWNQYom2EFo3T6mQfWaLCBfrDBrR2gCSXf738rRV1O0zBiO/IEDg1dIXQ==
X-Received: by 2002:a17:907:1b0d:: with SMTP id mp13mr36836605ejc.29.1641238078164;
        Mon, 03 Jan 2022 11:27:58 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:27:57 -0800 (PST)
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
Subject: [PATCH 24/56] staging: r8188eu: remove dead macro ClearMData
Date: Mon,  3 Jan 2022 20:01:59 +0100
Message-Id: <20220103190326.363960-25-alb3rt0.m3rciai@gmail.com>
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

Remove dead macro ClearMData

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index d42ed74c8469..73465becf1e4 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -195,9 +195,6 @@ enum WIFI_REG_DOMAIN {
 
 #define get_m_data(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_DATA_)) != 0)
 
-#define ClearMData(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_DATA_))
-
 #define SetPrivacy(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_PRIVACY_)
 
-- 
2.25.1

