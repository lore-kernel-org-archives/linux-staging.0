Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE7F2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:42:06 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id b13so139650221edd.8
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=39Wwg7nzxy3GtT4f3IpfOYNOVPqDtDBOoO51LTom+cI=;
        b=nl0q0BmzrlY6u0fRr1zPHmw/tvcjfyE8Hwg3tm5jt3aBZR4qV/WuQYHg4LFFPHr3fD
         39jybTIu4PvEdWyGktk67NMa2attdKSin31FEO2UxoBdzugXKDPuR0TehMWkNeXHoMYE
         aPyVloy2ZUl9ZiJrfQE3GzOh84dqmc1DGz65eBSgnKHvgTUrz33afFUop5IcHC99Y/g4
         kEihHE2tTJ62SZsgtBKbHLYEZCc55hLAG8uLKPqWEz5JVXKFshOfNNXS73O+6dpsERqR
         u+ukYWWFZdldqKeblw+FZRsHnK6+0ka9b/GgdsMg2NeDJF5e5enyfeguwbkaCAPDDmlc
         9NrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=39Wwg7nzxy3GtT4f3IpfOYNOVPqDtDBOoO51LTom+cI=;
        b=cxGwZysToNV4HU+Xm6C2u7tuMdICrxUDzTQQVPuW/ZeFJ/6yDz+SqEJkcykXEoCfAp
         D5qio5J6LPWzxFYkmI43KKSFye9oIhXnYuY//0Kl+AiYZqQRssr2/y9HcVQjYDDf0iPm
         B1yVl3tXRcCiIaZZPAPbwQUkiEGLP1/FHoxCOS3XI8mvacPa380pPgn+EOOjsCGMTkMr
         iQYxJnvlsOggmcHHpoLsMys3AK3wIBeMgaZyX6m3x6iVEE4XYmWTo6K9o3NvKf5B/uR1
         KUFaBy3jbOpm+XB6MRa0l5Z0o+poDkIniG0EVoT7MjPVNw2xiHL4rBr3D4i5dCnm0VEu
         9VVQ==
X-Gm-Message-State: AOAM532JfD6S9hp3JWHZtNvISqhSZQKh+PIpBORRG8bFnu94RFMhuMc1
	QUFqbf8ygYLE7XK1GzVQTJo=
X-Google-Smtp-Source: ABdhPJyZbdFy+lLevDUgsS/Q7/xL4wLbM789uHCHKsiiqN/MiktlmVozlIncgNp6APQZ/DVOfTbOSg==
X-Received: by 2002:a17:907:7d8f:: with SMTP id oz15mr36773355ejc.245.1641238925324;
        Mon, 03 Jan 2022 11:42:05 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:42:05 -0800 (PST)
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
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 39/56] staging: r8188eu: rename camelcase SetDuration to set_duration
Date: Mon,  3 Jan 2022 20:02:14 +0100
Message-Id: <20220103190326.363960-40-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro SetDuration into set_duration.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 502b3ee523be..45cc7cbed156 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -309,7 +309,7 @@ static void ConstructPSPoll(struct adapter *adapt, u8 *pframe, u32 *pLength)
 	set_frame_subtype(pframe, WIFI_PSPOLL);
 
 	/*  AID. */
-	SetDuration(pframe, (pmlmeinfo->aid | 0xc000));
+	set_duration(pframe, (pmlmeinfo->aid | 0xc000));
 
 	/*  BSSID. */
 	memcpy(pwlanhdr->addr1, get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 5894d10c1652..275c6fb0cfc1 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -230,7 +230,7 @@ enum WIFI_REG_DOMAIN {
 			cpu_to_le16((unsigned short)(0xfff0 & (num << 4))); \
 	} while (0)
 
-#define SetDuration(pbuf, dur) \
+#define set_duration(pbuf, dur) \
 	*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur))
 
 #define SetPriority(pbuf, tid)	\
-- 
2.25.1

