Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D4173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:25:11 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id j6so139440418edw.12
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hLWybMvTvQjm0rsshKSfFK61DNO55meHI6XQkolunpE=;
        b=Bm54eHOwffGHan56tt/RMkzNx3SwpWHZYE2GmgNbelXC/oR+hPOD+pfH+wWFhLMpFd
         VhumWEoxLIXBb/yyQWFFgjivvDtHGskz9MsTj3zf0qnT56s3figP/c8QuTB+TP1DcBYv
         gT5iHRr9cJuZ3QHrTAm0LK4JrmMO/cKPDBDqhKE4dWgU6S8/doOAQ2pI8NTAA4YvD32T
         OO9UWVi18t+LeymU1oLf0SSMDpOQCI5fLXngNrnEtiDB14A5fzPiFXV/+dF8IC4Yg/Oi
         xVCtTNx29Imb40P6QeFW32ZvSHGG/0HxbJQqXHZdZkJ6iMcROgAXt0+WSO6VxD/4DMmp
         M7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hLWybMvTvQjm0rsshKSfFK61DNO55meHI6XQkolunpE=;
        b=rhyPPe76oJDBjEIu0n8VuXrkXV5RASrd99rZ5FZgjuG7itaBwzRWvivrHgpYkD1cmp
         B/yNno8WaBxtL6Uh+jS+SncCEJUc4RorLu1in0Y3Aj+mRbbhF7trHjefeSRHMLRnc0Du
         vg7GSdjBOO1UDjP9m5KDY59+yFiTM89W2h8n9xmmObi/CMqJaV2iyh6VC30S3o3jQG+U
         BdATu8j+oAdAnkbABImMcjKO5y6N2hM5wCRnk31Ruv114RSPVi6qqK3w8xLUZFlq6F3r
         JDkrp8cG+9JY7QJHyeoRcWdNoQENZNBYhmnccTt+YlnK0AN/EW4Ozcl7cd4WGC7bo55t
         ITLw==
X-Gm-Message-State: AOAM530GwsaYp9gmVj7oVpckikhu2VcZuH71QP66jGD3Jx55U5K4V4+Y
	P5PUdJsAV1SwbPp1t+URGFs=
X-Google-Smtp-Source: ABdhPJwd8Tqhh468L+uUUcEWilXC9sGh18M9p2I3NVVdZvkBOV4zG5Id8q6S38KsR+LMmFVxOX2ZLA==
X-Received: by 2002:aa7:da8a:: with SMTP id q10mr46052994eds.302.1641237909530;
        Mon, 03 Jan 2022 11:25:09 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:25:09 -0800 (PST)
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
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/56] staging: r8188eu: rename camelcase SetMData to set_m_data
Date: Mon,  3 Jan 2022 20:01:56 +0100
Message-Id: <20220103190326.363960-22-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro SetMData into set_m_data.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 0deba46d3a23..3a28c02da7c8 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -759,7 +759,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 		}
 
 		if (pattrib->mdata)
-			SetMData(fctrl);
+			set_m_data(fctrl);
 
 		if (pattrib->encrypt)
 			SetPrivacy(fctrl);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index c6b9cd37219a..7a87fac66e43 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -190,7 +190,7 @@ enum WIFI_REG_DOMAIN {
 
 #define get_pwr_mgt(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PWRMGT_)) != 0)
 
-#define SetMData(pbuf)	\
+#define set_m_data(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_)
 
 #define GetMData(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_DATA_)) != 0)
-- 
2.25.1

