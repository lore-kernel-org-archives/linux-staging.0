Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0D5173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:10:46 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id bm14so139476814edb.5
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6nQs++6ARsQ/FQX35cmcGfQB+Ie2xqkMpCT+P3NLo+M=;
        b=QM6D3TrqzO9EDKiGfZ9vsXBkxBqOzY9LMJSsqdVD8KvGasOv3GkMGGKO3cK4JIib8e
         cVfhhDtLgi7LGOVCzPJ2kdU6Rwb616XgI/RovCleUusUmAcaA3tfH/wFNMfGpvJV59Ry
         OO7xzrcobUZQqzzDQsHwwFqnzjxrqxWD96BNqTJ8Jiv591Uc7h3WYLTYLhLGIFUX9JqG
         TggC5PB6u2ZsvBfTw526pnXZA6hNT4Z1Yx64hExmnaw7ozLpyV9g4+qRdjs3MuQ1A6dD
         utk0j5ykiWjxJ7AMx28PX6rq/chkqc2wF3EiAbjXACbtNxW2tJQW69GPPHWjSAY8MPmm
         sObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6nQs++6ARsQ/FQX35cmcGfQB+Ie2xqkMpCT+P3NLo+M=;
        b=4Jn+oYk5IX0y2KAAkvGLalLw8R/ExBhHjUrcyW49W1ddvgazYCHs715pSj9HQu1Qb/
         /agepo4Xcxzrq2byBKIQuODQf+GllGT0jFDkxwKl9W9IvdF/w5pUW8mCcZTjLOc0jFYA
         E9P+TpaGmboW6ZUl2otSqIiQmi83LGhIzCb1YjnNZDeQJJBXOj/DojARHQDo/QQxV4ym
         ydKn33vc2QNqLTBiOCkKlH2PSMCk9TO9Afm2a77FsOXPaLu8ce5jqAbvbJ+AiBGdzHIu
         Oo44htfOtyO1kWThk9oFC8dQ7LFyBUw2g56kFjakR5J9HnMM3bBlWcTDrVY1WDKaTpwl
         RfOw==
X-Gm-Message-State: AOAM530/peLl3K3EBlKvNJ8WctvWSp2jvrZk5uAtoYRsWZrapzPfCmRw
	mc9hKKpztPyj7g9rK5LfP80=
X-Google-Smtp-Source: ABdhPJy65f9It0Qoju2jk7GIwJeKX3ISQrdEZeMturN/4vLMy763sNT6ZSaMDRfiaXqHqn7POYZFXA==
X-Received: by 2002:a17:906:4793:: with SMTP id cw19mr39545489ejc.15.1641237044813;
        Mon, 03 Jan 2022 11:10:44 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:10:44 -0800 (PST)
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
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/56] staging: r8188eu: remove dead macro ClearFrDs
Date: Mon,  3 Jan 2022 20:01:41 +0100
Message-Id: <20220103190326.363960-7-alb3rt0.m3rciai@gmail.com>
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

Remove dead macro ClearFrDs.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index fd70b9513329..1d24d798c5f9 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -173,9 +173,6 @@ enum WIFI_REG_DOMAIN {
 
 #define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
 
-#define ClearFrDs(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_FROM_DS_))
-
 #define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
 
 #define SetMFrag(pbuf)	\
-- 
2.25.1

