Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A32C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:07:45 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id j21so139299943edt.9
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jM4NyCG+Klkl1K7S7VYyfqpY34ENYAtSLpzEWHASd+M=;
        b=N7HTuu6Cox+eZeWfdx42tiN5bwB17QepQCcHWcxmmLYRhXp5vWBIqrPBF97/4s1nve
         PngsOPAh30YfQGRVzphP0lkSj1NHzihov0UNaksKaPMHT3mWZIVTzFpGsXwhY0QvVDXH
         saAfwdUXFGFJyVLpol1X5Mf/et7oTw7Z8XR1+/9jLeYCXTWL0sRcbmTJoJE5qx9RxnA0
         AAtoMszQXB75Wxt9KhohH1HMzqv6tmToWHL4lIMloi5Aa9+hFqaM1JBMm7dJEZWr/Jmo
         FgdYvCFpIfcg2iY2kpVhekJDz1T7gdW2spAm7zFftzsoI37Fg7CrlTrqehgpM3XmRVOE
         QQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jM4NyCG+Klkl1K7S7VYyfqpY34ENYAtSLpzEWHASd+M=;
        b=XDR6Vi+nCnF8zARZ5swqOwNkFX8fVn7/478As8ZcG/qg64/lgJFemBZ2uuwXPEYg/U
         V7Xd/l13a2RBJGDN39wpHrLwsQst3Z31LsRi0+PKwY8luJm3VzucPTdkb0TG99RMFBAs
         EyPQtxPu57cMNLqg4XdN0TI8tjsdv5YaRA4tduo8fC22vBRZrUW8/N3V0FB/kLJzRVD8
         jaz9vuPV416pLWULWO1ABpm+//L4ftVhhjuBglCsth6M3SB13GAbaqJCirNazzJbsPqk
         EtaMjNnS5cxPYuW9gpPOkzUFvh+IyLJUwPy7gLj5IRhhYeyrJs+IvnhjaBp8pjP3vHjb
         rRQw==
X-Gm-Message-State: AOAM532xCc+P9GuXQBxiZ/wkMxcacw7Oo6cOpXtTXv2JNYn54A9oT/+S
	Vwjn7gjttUVjvolXuNWa0I8=
X-Google-Smtp-Source: ABdhPJzVGH0TzQD9DSODD33MFlbou3zYOuDhhIBe9JnPA6WT3vUrlXVu5m1VD/1+8bwKCdI3lF2S5A==
X-Received: by 2002:a17:907:6d9c:: with SMTP id sb28mr36437148ejc.393.1641236863893;
        Mon, 03 Jan 2022 11:07:43 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:07:43 -0800 (PST)
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
	Yang Li <yang.lee@linux.alibaba.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/56] staging: r8188eu: remove dead macro ClearToDs
Date: Mon,  3 Jan 2022 20:01:38 +0100
Message-Id: <20220103190326.363960-4-alb3rt0.m3rciai@gmail.com>
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

Remove dead macro ClearToDs.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index c556cf378c8a..487a4b7eafd6 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -168,9 +168,6 @@ enum WIFI_REG_DOMAIN {
 
 #define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
 
-#define ClearToDs(pbuf)	\
-	*(__le16 *)(pbuf) &= (~cpu_to_le16(_TO_DS_))
-
 #define SetFrDs(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_)
 
-- 
2.25.1

