Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF97364B3
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UtScy6A9"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c87acba73fso5883891fa.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 13:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700861470; x=1701466270; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lucCRVdFyECgtyRqDncojEzhqXxZuxdPkU1gxZh8Hdk=;
        b=UtScy6A9j+JrDzAmbLFwadAQjILss074d879GX+HQ14CdFS+KEpNtHHQXIerwu2WCy
         P57XdPr67+Mz2mRAZqY2iU33H10Vxkvy17PXTnyvJEkB2LoDIbO/u98Pgme54rQH6MDa
         spQSZYlMDm4okBtffysDaBR4j/AV/t/mCbHHAu2jhQPcxVodLPakDKc2CA/tTEa5WtMD
         h2M15f4VWc0V3jKyRn3fTGfxt3295zZE9nZ5Ue2Cl/En228nyu/gUfTUOmlqiuAv3yqf
         whobxzUFCvbnqVsrZ1Sx1C8uVff0J5vbA/oM/lE3j9FRX74uAmjb4ZNGqaXP9dAU6rEb
         BIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700861470; x=1701466270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lucCRVdFyECgtyRqDncojEzhqXxZuxdPkU1gxZh8Hdk=;
        b=D7GSchwAcfdrQFJmQRe8doHQl+/14EPudKhjp8MKFXQC3u1qavp2e8CNxR9tC8OwBb
         2MpxMzmvxX/kGVviY56wl20IZabW1BZ8c80DfKuzrFD1s+u0Ut9S83O7oeppDMe+D+qx
         /2JT6bW7+TXks3F0ieOD+sTp2U8Jh9WoMAowWeErFOBY+QklUSXepHgGur1lJIFwjN9y
         /9NMxogbbqD4vOV8dqZdpmwAl1ZxtxYKi4unhM4zXWETg6IBNr1dIV2k9hg6cimZx0u2
         pgf1ganN/id/+dJUo+yO9umevTjSwhJXC8KkDT8GaUZ5pWF5NDjLmtldoZVGximqd6gZ
         uN1A==
X-Gm-Message-State: AOJu0YxA0q6SJN3UOpXJaR/NX6RNzi4TVY8XETOfiMVCUH9ippTx/Zrz
	K3U+YRDj5mXn1MRXO8aDc3A=
X-Google-Smtp-Source: AGHT+IEGC+FkWool5xrxMKIxPHFJxPbScb7nXCa1f+4jiux3ltzhvrqQmA0uEENYkpc9LpAwkhCweQ==
X-Received: by 2002:a2e:150e:0:b0:2c8:3406:6641 with SMTP id s14-20020a2e150e000000b002c834066641mr2393867ljd.1.1700861469951;
        Fri, 24 Nov 2023 13:31:09 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id si12-20020a170906cecc00b009fca9f39e98sm2538605ejb.26.2023.11.24.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 13:31:09 -0800 (PST)
Date: Fri, 24 Nov 2023 22:31:08 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] staging: rtl8192e: Remove unused function
 rtllib_get_beacon_()
Message-ID: <ed825d5fb1946530c310afca1d3f27e46da35f06.1700860759.git.philipp.g.hortmann@gmail.com>
References: <cover.1700860758.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700860758.git.philipp.g.hortmann@gmail.com>

Remove unused function rtllib_get_beacon_().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 4e33a453f86e..8c7ad56d4402 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2130,25 +2130,6 @@ static void rtllib_associate_retry_wq(void *data)
 	mutex_unlock(&ieee->wx_mutex);
 }
 
-static struct sk_buff *rtllib_get_beacon_(struct rtllib_device *ieee)
-{
-	static const u8 broadcast_addr[] = {
-		0xff, 0xff, 0xff, 0xff, 0xff, 0xff
-	};
-	struct sk_buff *skb;
-	struct rtllib_probe_response *b;
-
-	skb = rtllib_probe_resp(ieee, broadcast_addr);
-
-	if (!skb)
-		return NULL;
-
-	b = (struct rtllib_probe_response *)skb->data;
-	b->header.frame_control = cpu_to_le16(IEEE80211_STYPE_BEACON);
-
-	return skb;
-}
-
 void rtllib_softmac_stop_protocol(struct rtllib_device *ieee)
 {
 	rtllib_stop_scan_syncro(ieee);
-- 
2.42.0

