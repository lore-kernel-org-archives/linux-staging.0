Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8922C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:58:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id j6so139724179edw.12
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jypa2KZz1jaCb25AkvRox++XG9Sod4bM8BJSXTd2gt4=;
        b=Oaq22mGxBm00uR2oC81gkGJ0DLrNl2TZrquOp+DsHSh7dA8mGJMGtbWtLQaZTA4G4i
         9D+sgF6DZ5dK8JSVpt0aMlPamrOJ9vQjzzLpMZKnZOTRE+l9/IPcUp8uis0zfwv6TqQP
         PVRl2g2jDDaIxhU6AC6vK+ZHaVY8ER10DQJRg+UoM6OfHIMxJ9dsmlGsdOvyH4oHqoGV
         yp0enqqAQOxR5ZRPDAqfYnVFV5xMv2lodMWlRGQnTMWTpZN0/CGkRpQql73bbJd/7jEM
         fYtOBxjyYFruI5k4o0aVeaqqJMDguL+Zk2MeJa37uT79EZYE+3DqAQEv+OcMDHlnA2Eu
         3UxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jypa2KZz1jaCb25AkvRox++XG9Sod4bM8BJSXTd2gt4=;
        b=Ndz1m/5dXrwzhoCsunzc18CX52TgjqCkEJorDi+ubw1hUmE7K+gR5LSRffya70gw79
         BIXJhwXlg46mZcss57pkNU1Jd1va4uLjAtlLlRag1SDEmYC1XWQJOzH2rp3RzhM3KD8t
         fJoP0n5vi4CvzVCrZu8DN7l+VUD2FO1av73TJdUVOnn5tDZdnNO529H3C0nf1Hn1b9rJ
         Lur5HJUd3g3HUOmJOhFh/pjgzZV1sW7C0Af0MMhevpZN5C2SGiEdVyNhTC4XA31NZvXE
         0XIdQ3QMdRiedwjCv7Yf0VOEdNJPQLXKdrtb79zH2n/t7Ggtr1VRMsFu8U97q12teC/c
         FfyA==
X-Gm-Message-State: AOAM533yOBxFpYa9zB/sbH8rMHs/BeTGrOI3RPOi60okcwjSUFbYW5NL
	mYOabAxL1YLvGMq0KNrDVds=
X-Google-Smtp-Source: ABdhPJyl1esHZl2UmsYjnpJRxX5wQd9/tTBMpv0aGaUVT/aoDg14dnCKuBGYf9i3mVHNP16V+luJKA==
X-Received: by 2002:a17:906:4556:: with SMTP id s22mr37079990ejq.321.1641239879000;
        Mon, 03 Jan 2022 11:57:59 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:57:58 -0800 (PST)
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
Subject: [PATCH 56/56] staging: r8188eu: rename camelcase GetAddr4Ptr to get_addr_4_ptr
Date: Mon,  3 Jan 2022 20:02:31 +0100
Message-Id: <20220103190326.363960-57-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro GetAddr4Ptr into get_addr_4_ptr

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 9d8d69cc562a..d464938a12b6 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -256,7 +256,7 @@ enum WIFI_REG_DOMAIN {
 
 #define get_addr_3_ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 16))
 
-#define GetAddr4Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 24))
+#define get_addr_4_ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 24))
 
 static inline int IS_MCAST(unsigned char *da)
 {
@@ -304,7 +304,7 @@ static inline unsigned char *get_sa(unsigned char *pframe)
 		sa = get_addr_2_ptr(pframe);
 		break;
 	default:	/*  ToDs=1, FromDs=1 */
-		sa = GetAddr4Ptr(pframe);
+		sa = get_addr_4_ptr(pframe);
 		break;
 	}
 	return sa;
-- 
2.25.1

