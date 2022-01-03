Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53EE2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:13:48 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id bm14so139504153edb.5
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yv3Zs6aPCOxb9Ol1DDbz0c0Mf8kauTqoujTLZniKHjw=;
        b=BztBCGZSq6z+6Uwkb9kf9ip5wW9ErWdSJr5YwSQXpko3DvCC4fnTGqYC0r7A+nO1tw
         QSTVpf41RBRa5/dkOkf0HNTszxxEkaU7PoHGwSeEDwV/AOhqxKzjwUzWo6Z4/n/H6tO/
         2FvJu0ULC/yr6+Bd6JjSc9+O3BPSPKkhWCrIfngtOaf+P1ibxDg6Jtcdw0zt/XyxotP8
         oRV4N8PBVflkgk8hyFdSjUbZh8gyaZqN2YQGy+qlEIvb9Yr24p2Tz9Q5khBO7OkzInb9
         oZRh39tzJsWmhramzIYWurMsffJGI6Qe0mcGitKiPe4Znh0JZyjYp6nndA1ce5FrBmeu
         xO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yv3Zs6aPCOxb9Ol1DDbz0c0Mf8kauTqoujTLZniKHjw=;
        b=gWqEq7YU+KUYf7uW6By0dra3owQM/z2r/8p7nUoUFeSdziGXSWBhdTD1UUH1kRpwM4
         Jw3dXthpBI2I1n+iIGteTQ2Ro1K7nP6cuJ5yZ+r2nNwndNprEaX4nVJWXza5k/OfB6xy
         5jkQJdUSivgTo76v25wZhubvAnMs+ZeYVZ6eZDhtZ+hQxrQBHGx4FM7ARfE52NE/UesH
         P+hvmIBvD5jm+5TQcokaQ8rmsVm9eNln82SlsuXyS/SocaH2lSKTXS1RXpU2hu+lO5IX
         b+DJTym22ARCDh6wJGpj8QMeIElOD23TXmnNn5MUvooGlgYZELKzBOTmBFTdQ+8IaqO8
         rykQ==
X-Gm-Message-State: AOAM5337VPLihntxI6xfhzoDMxWVTKKShJXItavIEC+A5gOu138Fr6/T
	Yp/CSxjH/bfA73zPApzbOE0=
X-Google-Smtp-Source: ABdhPJy7IEcaJEYb5Nt3I3zEfVaJkbfr4U9ODBi8QD/RO9SRYe3OZnX8l+CniTyRUOw6A3+eGY8Hog==
X-Received: by 2002:a50:8e4b:: with SMTP id 11mr43805692edx.272.1641237227388;
        Mon, 03 Jan 2022 11:13:47 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:13:47 -0800 (PST)
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
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/56] staging: r8188eu: rename camelcase GetToDs to get_to_ds
Date: Mon,  3 Jan 2022 20:01:44 +0100
Message-Id: <20220103190326.363960-10-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro GetToDs into get_to_ds.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index fc5be22c5d2a..0075b438027b 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -166,14 +166,14 @@ enum WIFI_REG_DOMAIN {
 #define set_to_ds(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_TO_DS_))
 
-#define GetToDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
+#define get_to_ds(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_TO_DS_)) != 0)
 
 #define set_fr_ds(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_))
 
 #define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
 
-#define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
+#define get_tofr_ds(pframe)	((get_to_ds(pframe) << 1) | GetFrDs(pframe))
 
 #define set_m_frag(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_))
@@ -286,7 +286,7 @@ enum WIFI_REG_DOMAIN {
 #define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
 #define GetTid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) +	\
-			(((GetToDs(pbuf)<<1) | GetFrDs(pbuf)) == 3 ?	\
+			(((get_to_ds(pbuf)<<1) | GetFrDs(pbuf)) == 3 ?	\
 			30 : 24))) & 0x000f)
 
 #define GetAddr1Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
@@ -308,7 +308,7 @@ static inline int IS_MCAST(unsigned char *da)
 static inline unsigned char *get_da(unsigned char *pframe)
 {
 	unsigned char	*da;
-	unsigned int to_fr_ds = (GetToDs(pframe) << 1) | GetFrDs(pframe);
+	unsigned int to_fr_ds = (get_to_ds(pframe) << 1) | GetFrDs(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs=0, FromDs=0 */
@@ -330,7 +330,7 @@ static inline unsigned char *get_da(unsigned char *pframe)
 static inline unsigned char *get_sa(unsigned char *pframe)
 {
 	unsigned char	*sa;
-	unsigned int	to_fr_ds = (GetToDs(pframe) << 1) | GetFrDs(pframe);
+	unsigned int	to_fr_ds = (get_to_ds(pframe) << 1) | GetFrDs(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs=0, FromDs=0 */
@@ -352,7 +352,7 @@ static inline unsigned char *get_sa(unsigned char *pframe)
 static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 {
 	unsigned char	*sa;
-	unsigned int	to_fr_ds = (GetToDs(pframe) << 1) | GetFrDs(pframe);
+	unsigned int	to_fr_ds = (get_to_ds(pframe) << 1) | GetFrDs(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs=0, FromDs=0 */
-- 
2.25.1

