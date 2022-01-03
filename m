Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119F02C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:14:49 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id n30so27363112eda.13
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LpkU+rNWe8spczBIxaAKXqgJnKkb3NyjCTDX0PoMqaU=;
        b=q3ro+IBRzmPDLa7DYjCIXT6k1CfPsfXKgwUwXQ7VdWAnXt66nokFXABDR6oyllM+jD
         c3Y3HZjNgPspXB1ggKzpZNKnvvFdDmB2oqcqEdX6UVfEDBDIXw0A5eHhSYzfdlRgxes+
         vGxYq8oATTtOskrE9owyGj/X+DYCTTmUsusDqPls2MKESX/nzrgxjjW/aXu0PaMF55LX
         NWoMfXq87TlhBmYNaXUWEuPT6QBftDjBtbGWQZhHirchoGHdBlf4bKLxtO7LcRblXbe6
         WbkOdvxPyVdkn7+fqQsSXLhxIlFZYrL4j8PW8p6ka4HT09V2+XXbSRU9KwC5UIF3Fc9r
         8aMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LpkU+rNWe8spczBIxaAKXqgJnKkb3NyjCTDX0PoMqaU=;
        b=VBSlHganvi9ciNL/xIiHXX/83EagIc6wyg8IMBBLEQzBn/rNjg0LOD16gq9nCy5hpr
         5kz1rod/vcCkw4sm8PkkmFvSmyMSoSa5xeaLlxatxXZ7GIzSd77lwCpiPm1IRgNXXA8T
         jXGI8sCtoSXFpajaTZBn8smLcq2nTQ/vQDLZvbDrKYIxX9eHYqmcas3kOg06DECeJ4BC
         SRNISUjB+HDBed55ET0Caj2Gf9pTmgq9MBlkYgvz9GRXHiB4quxbeSUKtrecvsRS6LCY
         syis0R+nQEvix0b3s1Tvumx6ByjEVD6m1mLaPPTFMjFGUsCRpaeZt7HHKC7RVVLyNDDi
         AAew==
X-Gm-Message-State: AOAM5318AOf8MRcct6xRTLM3tZL6TCa7Q3Yu+B+sH7QXp/yTNsy6DNEg
	nVGBKZgH/ANUzFxPgBue0Xk=
X-Google-Smtp-Source: ABdhPJy81N6FCCEQ6dQ/tdjBcRxFYtzEJ5ss5JG48wp7TXQkP5XU94Fs9na08sbmIkcH0Z//ymXaIw==
X-Received: by 2002:a17:907:97cd:: with SMTP id js13mr36969524ejc.497.1641237287446;
        Mon, 03 Jan 2022 11:14:47 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:14:47 -0800 (PST)
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
Subject: [PATCH 10/56] staging: r8188eu: rename camelcase GetFrDs to get_fr_ds
Date: Mon,  3 Jan 2022 20:01:45 +0100
Message-Id: <20220103190326.363960-11-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro GetFrDs into get_fr_ds.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 0075b438027b..355c8f854b08 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -171,9 +171,9 @@ enum WIFI_REG_DOMAIN {
 #define set_fr_ds(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_FROM_DS_))
 
-#define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
+#define get_fr_ds(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
 
-#define get_tofr_ds(pframe)	((get_to_ds(pframe) << 1) | GetFrDs(pframe))
+#define get_tofr_ds(pframe)	((get_to_ds(pframe) << 1) | get_fr_ds(pframe))
 
 #define set_m_frag(pbuf)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_))
@@ -286,7 +286,7 @@ enum WIFI_REG_DOMAIN {
 #define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
 #define GetTid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) +	\
-			(((get_to_ds(pbuf)<<1) | GetFrDs(pbuf)) == 3 ?	\
+			(((get_to_ds(pbuf)<<1) | get_fr_ds(pbuf)) == 3 ?	\
 			30 : 24))) & 0x000f)
 
 #define GetAddr1Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
@@ -308,7 +308,7 @@ static inline int IS_MCAST(unsigned char *da)
 static inline unsigned char *get_da(unsigned char *pframe)
 {
 	unsigned char	*da;
-	unsigned int to_fr_ds = (get_to_ds(pframe) << 1) | GetFrDs(pframe);
+	unsigned int to_fr_ds = (get_to_ds(pframe) << 1) | get_fr_ds(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs=0, FromDs=0 */
@@ -330,7 +330,7 @@ static inline unsigned char *get_da(unsigned char *pframe)
 static inline unsigned char *get_sa(unsigned char *pframe)
 {
 	unsigned char	*sa;
-	unsigned int	to_fr_ds = (get_to_ds(pframe) << 1) | GetFrDs(pframe);
+	unsigned int	to_fr_ds = (get_to_ds(pframe) << 1) | get_fr_ds(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs=0, FromDs=0 */
@@ -352,7 +352,7 @@ static inline unsigned char *get_sa(unsigned char *pframe)
 static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 {
 	unsigned char	*sa;
-	unsigned int	to_fr_ds = (get_to_ds(pframe) << 1) | GetFrDs(pframe);
+	unsigned int	to_fr_ds = (get_to_ds(pframe) << 1) | get_fr_ds(pframe);
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs=0, FromDs=0 */
-- 
2.25.1

