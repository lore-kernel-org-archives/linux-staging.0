Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906A6612E
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 19:22:18 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id u9so6287289ejy.5
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date;
        bh=a/Ks7J+SbGZiBo7wbQorabT/5WmVbsbSn3RJSyr6imE=;
        b=oSvr4+rjYsGhnTDq7UnTYgcl0i7LCByjGI2GCX2Se41xKYJo7k6VJGSPFvyjIoS5t4
         HY2pkazrjq0/zcJPYkaQOkeKjyusESqctNmWn+KidMDwBCwsRvo1oqF1E7pe/ra0byCe
         lBc1NZKXsRSL5l+Py59WmBcx6jNNjdQ0gK81gKP6/EQxbmhJGdg9jO7bxuoe77tDQB9L
         12VqlbtN7jQ2OK2gEOBrMfs+W1bLA7hW6vsaTY6Sr7UdBcGZCh2X9NsP3gTz+F7ymoKp
         B/cc3k+aZUyY/PmGXEY3Wgm36lUU8jXJhSU2Vk4TKkgcAcfuUys3RlIyQl24keOLKvOY
         l5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=a/Ks7J+SbGZiBo7wbQorabT/5WmVbsbSn3RJSyr6imE=;
        b=3zTjpXDgvPJc6d2u7tUffhgq/9BQcEkWDSTTEsrROoIasy46ncNLZ/S9DwS8r28mvC
         D2EfklE31LQKigDacJP2gZmV1yuuVYrMSKO1A2n8GqmZGKWhoM5eze6HtHyqtdjeUwSj
         6QnmLXoy5p9yOFehG8wl9Y9YUvw54iTK3S8u36oMRPBlSE1I9CZQ4yigMwUBJoRw9Dpb
         9g98zgE/LIHAojKcCTWLXvTAo0X8bx2iM/7QizohVZ8jCqoLF9qD0m8JDwiPgUfNVbOF
         +HT4Yjirk806dVvTR7iJN96W7FB4kUpo71BLLoW3M96wohkJMcHVpNODKMZRs1BPYNE8
         41Rg==
X-Gm-Message-State: ACgBeo0BbRSJN/8rddw/fGUhULfID4/uw8fimulTaUFsKbMlrw6Yq+dR
	B2iPmfiu2PzXJ80EJ4AIfv488K81xnM=
X-Google-Smtp-Source: AA6agR5Iq4uzLaSVrbc2HH6cwYNAsJ2EEiJbhwCM1npW3GqsZ+D6JPDBtkepkS2Jf8XyeqYCoda28Q==
X-Received: by 2002:a17:906:9b83:b0:730:b3ae:343 with SMTP id dd3-20020a1709069b8300b00730b3ae0343mr11224767ejc.670.1662751336838;
        Fri, 09 Sep 2022 12:22:16 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2cf5.dip0.t-ipconnect.de. [87.186.44.245])
        by smtp.gmail.com with ESMTPSA id u9-20020a17090626c900b00775f6081a87sm622639ejc.121.2022.09.09.12.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 12:22:16 -0700 (PDT)
Date: Fri, 9 Sep 2022 21:22:14 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 8/8] staging: rtl8192e: Rename CurSlotTime
Message-ID: <1b71366d87b2b178fcd8f182127a51c7a7507936.1662402870.git.philipp.g.hortmann@gmail.com>
References: <cover.1662402870.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1662402870.git.philipp.g.hortmann@gmail.com>

Rename variable CurSlotTime to cur_slot_time to avoid CamelCase which is
not accepted by checkpatch.pl.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index fb9e5fe5fa5d..671fe547639b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -304,17 +304,17 @@ static void _rtl92e_update_cap(struct net_device *dev, u16 cap)
 
 	if (net->mode & (IEEE_G | IEEE_N_24G)) {
 		u8	slot_time_val;
-		u8	CurSlotTime = priv->slot_time;
+		u8	cur_slot_time = priv->slot_time;
 
 		if ((cap & WLAN_CAPABILITY_SHORT_SLOT_TIME) &&
 		   (!priv->rtllib->pHTInfo->bCurrentRT2RTLongSlotTime)) {
-			if (CurSlotTime != SHORT_SLOT_TIME) {
+			if (cur_slot_time != SHORT_SLOT_TIME) {
 				slot_time_val = SHORT_SLOT_TIME;
 				priv->rtllib->SetHwRegHandler(dev,
 					 HW_VAR_SLOT_TIME, &slot_time_val);
 			}
 		} else {
-			if (CurSlotTime != NON_SHORT_SLOT_TIME) {
+			if (cur_slot_time != NON_SHORT_SLOT_TIME) {
 				slot_time_val = NON_SHORT_SLOT_TIME;
 				priv->rtllib->SetHwRegHandler(dev,
 					 HW_VAR_SLOT_TIME, &slot_time_val);
-- 
2.37.2

