Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0ECEA3
	for <linux-staging@lists.linux.dev>; Thu,  8 Jun 2023 06:52:22 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-50a20bfe366so64023a12.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 23:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686207141; x=1688799141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FG5d29CrGVCy3fwMc6JWla5/4zbh1hMHL9JL7ITCxvY=;
        b=Z1REewAzAWNqwGy1u0+Mjb+fOCd85z11Q3TOJhkkjdpfZHb431yp0QYK8gguNeMJEq
         ZHgOmt3e+xrJeWxRRke3QlTMOPt8Si4qi8Gj4GNqRJErQ7+FXZ5puwXOwub3oulYUoaB
         mxDoVVqTALWIyo8UKFbK8WSN+Z4nAEPp8quJL6ChVLoaJGTbK59o5cf+0mtQLJxjQytm
         /8hJwtNtFHE5Cz1kwTI5HWokiDRyCTi0OvrzxuVG//cBZyE2R+07i9i2LKVCyVGY2ZvH
         NqoOzK9VZ26mEJlg0ba2VYiYbCRm4ql5F4nSuom9SCZXuHTDD2Yrf+D9omgEDwc4atGW
         YngA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686207141; x=1688799141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG5d29CrGVCy3fwMc6JWla5/4zbh1hMHL9JL7ITCxvY=;
        b=QMlttW/ASPf+Gdvp8V0YkoMTThcDJENMxR+pcExNBT4k3RT4JWnbBFHZiWsODd85L/
         mLgRNYN+wiAzhCiPzeG4WERx+4FcRP8ukY5VU2FotlM7g1t0QRXXtX8VwVevVad3nmg4
         DLTaEnQsA7M3zOIFRQQH8U77AtXBE5nkG/Ufxpg4XQ7uixkfCDvETd1kWrKcJis9J9Zg
         lRxCZH2DD1K5BR8vjLU5l/lvq+56cboNfdfoH38evoEpMXxlA0ACaYvp0XuSlDMkbjmr
         nKMSH7pYy+RlmI4ls2qx4pSdjM6IifDwegKmZrhgdZsTLUYqzrZ+Iik9tY/PINIA9pER
         ANSw==
X-Gm-Message-State: AC+VfDzeqGRK7IzJZzvbaUdT2ReqJz/a+jOBphJZsoiWaknqAZPLTn/g
	kcp0QM7qTD5V67oaTyTQS0A=
X-Google-Smtp-Source: ACHHUZ6RuYcjwjN7cv5K/wAtu8Nflib2VSPcfswegxfDvNW2dWFqUe4GJOKa4jsmuFU+VEz8RQbgKQ==
X-Received: by 2002:a17:906:649b:b0:975:c046:dd34 with SMTP id e27-20020a170906649b00b00975c046dd34mr6680233ejm.1.1686207140631;
        Wed, 07 Jun 2023 23:52:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id r10-20020a170906548a00b009788d99244csm286858ejo.149.2023.06.07.23.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 23:52:20 -0700 (PDT)
Date: Thu, 8 Jun 2023 08:52:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8192e: Use standard api to calculate
 frequency to channel
Message-ID: <fc332e81f6677965e9e51f1fcef9815997effcb5.1686166624.git.philipp.g.hortmann@gmail.com>
References: <cover.1686166624.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1686166624.git.philipp.g.hortmann@gmail.com>

Use ieee80211_freq_khz_to_channel() to calculate frequency to channel to
omit proprietary code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Tested this code with separate debug code as this part is usually unused.
---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 78a70e5f1974..6fd2e94d5f8a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -42,15 +42,8 @@ int rtllib_wx_set_freq(struct rtllib_device *ieee, struct iw_request_info *a,
 	if (fwrq->e == 1) {
 		if ((fwrq->m >= (int)2.412e8 &&
 		     fwrq->m <= (int)2.487e8)) {
-			int f = fwrq->m / 100000;
-			int c = 0;
-
-			while ((c < 14) && (f != rtllib_wlan_frequencies[c]))
-				c++;
-
-			/* hack to fall through */
+			fwrq->m = ieee80211_freq_khz_to_channel(fwrq->m / 100);
 			fwrq->e = 0;
-			fwrq->m = c + 1;
 		}
 	}
 
-- 
2.40.1

