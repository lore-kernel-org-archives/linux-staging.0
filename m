Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC8EE833;
	Fri, 28 Oct 2022 07:05:01 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id a14so5760061wru.5;
        Fri, 28 Oct 2022 00:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4A+DB3MMGxIRPCuM9r59RYr1Fl7TwCHgwudqyCCvsC0=;
        b=X294my3GunzaICmgTrsU5fOQP4WGX6lg1uHXMpulNUGBlU11/LtC8FNRtLxr3Y3Zv7
         9aN70wl6eX+0Mudq38kmx4VGAh3AsTniBCfoYNjOUxXUNwGV6HX6bphNBpQCAAywPE8w
         hyOd8KlFCbkdd9zetRvsEVqyc4PDtLleWAWhMQorQhbNbfH8jjL7wi9Hx6YmatDQ2I20
         eTmuDGvCYkcJJYGVl53k/cYGcyKE94Zkw0Iw3eY9OJkaGqy0kj4+3coc55mUeZqYGlIF
         JuRnX6cxoBpZt+ekJhL/meC7aE3GoEw4UfSYq4mUihWrQuHjZNjtW3ggymJHvrYQuFKa
         c24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4A+DB3MMGxIRPCuM9r59RYr1Fl7TwCHgwudqyCCvsC0=;
        b=so0Dbi6iYxcldBIwn9Y578wi/Yf7gigzFgceKH9/yGPk04DHXa22h19HNdnyhPwG1p
         olylayJCGwfFTO5M62Y65mLcjIULNW6q/cmIZlDpkQmIp59HJY0CrJD/X9L/av91RKz2
         3EeNBDlPm2SYiH39PiZ8O556mbhUDeEQ4S5TdJRQMh5Nu9lUegBJbSNt1Ua+dApJVTo7
         qCgyqENWhDjVEnsSJmeqF6RTSbUjcAQ3sUzVPojTA8kCPp+3xW6X/jUWJcCAR2crJR26
         6amoLDLEehkWwMGtEWbpFfkmMw7EULqqu07FAi6ZJIHL0ZuMPiaiWzg/FH2RzO9TcCXB
         1Gew==
X-Gm-Message-State: ACrzQf3RCPLoKXk/Rh/Abe0GcO+tOL4DBgO3TLlBocvWB5M/G93hLb2B
	cG8MLnO2C59XIouCD8lrek27hXESEpAJi+Ks
X-Google-Smtp-Source: AMsMyM7UGZA91JzoSF05iHuaTCKh+QIJKxv0cwKNvK5gR/1Hrxi0tkKCuXObjb2uQQBw4MZwuxDz5w==
X-Received: by 2002:adf:f342:0:b0:236:9035:31b6 with SMTP id e2-20020adff342000000b00236903531b6mr6210790wrp.200.1666940689054;
        Fri, 28 Oct 2022 00:04:49 -0700 (PDT)
Received: from rdm ([41.75.189.203])
        by smtp.gmail.com with ESMTPSA id v11-20020a5d4a4b000000b0023662d97130sm2914757wrs.20.2022.10.28.00.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 00:04:48 -0700 (PDT)
Date: Fri, 28 Oct 2022 10:04:39 +0300
From: UMWARI JOVIAL <umwarijovial@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH]  Possible repeated word: 'very'
Message-ID: <20221028070439.GA36889@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reported By checkpatch.pl script

WARNING: Possible repeated word: 'very'

Repetition of the same word in one sentence same line

Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
index 090345bad223..30a0276b8b58 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.c
+++ b/drivers/staging/rtl8712/rtl871x_xmit.c
@@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
  * If we turn on USE_RXTHREAD, then, no need for critical section.
  * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
  *
- * Must be very very cautious...
+ * Must be very cautious...
  *
  */
 struct xmit_frame *r8712_alloc_xmitframe(struct xmit_priv *pxmitpriv)
-- 
2.25.1

