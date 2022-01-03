Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997C52C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:18:35 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id b13so139449076edd.8
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pf4Guz/QyLHYzCL9xnQna1t1OdhnRtr/IjFq1WthQ44=;
        b=VNZeSrS+zf/bxOvADVakMf97HdMDClGE3Hp92HF6jZytJyVGU+/mMRYK10vsOslQBC
         vs6OFd9xfZHZXpC2/8zbW7lLrd0BbGFBVKOjr0Uuc7yE34mNBq1/2qvdp9DrRHUrUgQB
         5RUIpmeBycKnZnokgbLmBWlJ4Z7Kkmh7OcrzCMrm22JMewbxYs3LJSf4EVEiKopD6nqR
         gACXUEr+9QBOmAGHj9GHfsrec4INvmpTXxpEgdrbLUGLGNYu66mT0NUQYLclxFcHsQcW
         nAENprVEavDATTBZHo73ystXtxd0H42Gg/20XwErpapKLWTuZoJltpsN/cpraQ/T+paS
         H9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pf4Guz/QyLHYzCL9xnQna1t1OdhnRtr/IjFq1WthQ44=;
        b=HgC/kVWNBMz6F8/iOW42OVN08WyotHUFuVvoypnIWz7Qs3qxsO9oNxXxt102IeX+dR
         cVIvzhr/AHlz5BI+asKCFsTz49W4ESbxMKjtxxsroNGjMGrxlcl5PQgvKOjruY9femd9
         oy0oX3UNU7hNEEg/LaSXRH6bEQQF38jb7rAmw5xM1bhj2Phq+1tvJ/XqIsIOa8R5oHXo
         Ldmj8eK2YMDzSTPfjef+zb6O98W5zyznok7NIwlW6syIzzcVnMZ8Vpmcj76vQt4bQvM3
         DiqZcl8JbyO8kT556ENvdGDnh1bMuzIDw8OJ0qkhZ0K+nw1sYleaoAfinQ4V58WCIXq0
         BRZw==
X-Gm-Message-State: AOAM530xKkk5/1c4rr4LunnU3ZEs0KGWGz226QhWyfuvG9fIeSg9tb74
	pkg48f0Rzn3RYTxDQvdnGVc=
X-Google-Smtp-Source: ABdhPJwMWvbp3Ey9CtteKr2S4t3lqXcd40I5sTCGN9QUlCOsfdCkv/aN9QeEs6Hgzv5vmIsBp0PEDQ==
X-Received: by 2002:a17:907:6d9c:: with SMTP id sb28mr36461651ejc.393.1641237514049;
        Mon, 03 Jan 2022 11:18:34 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:18:33 -0800 (PST)
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
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/56] staging: r8188eu: remove dead macro SetRetry
Date: Mon,  3 Jan 2022 20:01:49 +0100
Message-Id: <20220103190326.363960-15-alb3rt0.m3rciai@gmail.com>
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

Remove dead macro SetRetry.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 30185d0dabec..4b124376d263 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -183,9 +183,6 @@ enum WIFI_REG_DOMAIN {
 #define clear_m_frag(pbuf)	\
 	(*(__le16 *)(pbuf) &= (~cpu_to_le16(_MORE_FRAG_)))
 
-#define SetRetry(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_RETRY_)
-
 #define GetRetry(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_RETRY_)) != 0)
 
 #define ClearRetry(pbuf)	\
-- 
2.25.1

