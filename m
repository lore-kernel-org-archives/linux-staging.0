Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2069F11CA1
	for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 16:06:57 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-31f85854b9eso318741f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 15 Sep 2023 09:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694794016; x=1695398816; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JGM1IFZwU7Wt303Jm8PGCn2ePTabuQMB8pTK/IDboT0=;
        b=eop5UlJ4zkI2cpPQVhqUCZD//olSI9kRvbs0c7KN0utJi12e9EBeQohHdDzP+IIGT9
         ejsbLtJGn0SOpg3ucm+0IIMg3ofxySVauGI984Ke44j7WLKqilh9z+XI9JF03a6Q8mXN
         yoYCd957BhPFOZycKe6WwaZ0lQaba/uz5KtBeNUsmah7ie9JnPNlWkCi48iNZvVdj2UN
         GF84tXGesjIm9tZnuvBOywEiopuI3EAWiub7NOF4mJY58waDkhO7r5LAJcBbznMIo5zd
         5DsYwCcCyW7aWy42evfWk0IzVo6x+jL06XTYnECSx9WJkj/cvoCmR2EtGsoryirQhZtj
         hOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694794016; x=1695398816;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGM1IFZwU7Wt303Jm8PGCn2ePTabuQMB8pTK/IDboT0=;
        b=ZNt+bvg48IumvFYip6zBWnVAmFJADmRh2xkEffWyNrM1Q9uaWe6TonTvxVgcxG+hYl
         14812T2S0H3vV6/Vg24ZIsAxvWY6PYi9ePTV6uV+/TaN8w8mlvvhqu+C2FLy4XQY9A07
         rNTnG1onuebeC41iuxrDa05Wpu8vvbeRccSPT6OxL9NF8BtH6TQU3sJrCS2EoCzGhwzw
         gdvuctu34FTH3r99sGncdvINmDsdt6eBrkBkGm5+Lz2ypeMlMIggxV4QSlA5Q3frr9s4
         IhZOnhF4wze5xIHThHfcBauh66H5Zm8HzShYHmxxa9gQuf1Qlb2N39SAQXQ1fNiTOY7r
         fuZg==
X-Gm-Message-State: AOJu0YwlGvh6seRLjtfqgF0wbg4gETEXpZIBj7zGGtynnEiHenlNEbhc
	Bkz1wfSirT9G6WtXCmsg98ksGRFxguL34g==
X-Google-Smtp-Source: AGHT+IF85Oj9/6BKo+0uFr/Sgg1sPEIGA/wJDkfK7IwroU8qof6JWRocqBYZ8TkG9OTkQivE0QoZ3Q==
X-Received: by 2002:a05:6000:1047:b0:31f:a096:6e18 with SMTP id c7-20020a056000104700b0031fa0966e18mr1760927wrx.6.1694794016367;
        Fri, 15 Sep 2023 09:06:56 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id n7-20020a5d6b87000000b0031ae8d86af4sm4754226wrx.103.2023.09.15.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 09:06:56 -0700 (PDT)
Date: Fri, 15 Sep 2023 18:06:54 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/16] staging: rtl8192e: Replace struct rtllib_hdr_3addr in
 rtllib_rx.c
Message-ID: <4d5409433c681557f8187b13f0bbf124a662ff96.1694792595.git.philipp.g.hortmann@gmail.com>
References: <cover.1694792595.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694792595.git.philipp.g.hortmann@gmail.com>

Replace struct rtllib_hdr_3addr with struct ieee80211_hdr_3addr to avoid
proprietary struct.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 7c16d4db67ad..dddd38bbc648 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -210,7 +210,7 @@ rtllib_rx_frame_mgmt(struct rtllib_device *ieee, struct sk_buff *skb,
 	 * this is not mandatory.... but seems that the probe
 	 * response parser uses it
 	 */
-	struct rtllib_hdr_3addr *hdr = (struct rtllib_hdr_3addr *)skb->data;
+	struct ieee80211_hdr_3addr *hdr = (struct ieee80211_hdr_3addr *)skb->data;
 
 	rx_stats->len = skb->len;
 	rtllib_rx_mgt(ieee, skb, rx_stats);
@@ -753,10 +753,10 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 			 struct rtllib_rx_stats *rx_stats,
 			 struct rtllib_rxb *rxb, u8 *src, u8 *dst)
 {
-	struct rtllib_hdr_3addr  *hdr = (struct rtllib_hdr_3addr *)skb->data;
-	u16		fc = le16_to_cpu(hdr->frame_ctl);
+	struct ieee80211_hdr_3addr  *hdr = (struct ieee80211_hdr_3addr *)skb->data;
+	u16		fc = le16_to_cpu(hdr->frame_control);
 
-	u16		LLCOffset = sizeof(struct rtllib_hdr_3addr);
+	u16		LLCOffset = sizeof(struct ieee80211_hdr_3addr);
 	u16		ChkLength;
 	bool		bIsAggregateFrame = false;
 	u16		nSubframe_Length;
@@ -764,7 +764,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	u16		SeqNum = 0;
 	struct sk_buff *sub_skb;
 	/* just for debug purpose */
-	SeqNum = WLAN_GET_SEQ_SEQ(le16_to_cpu(hdr->seq_ctl));
+	SeqNum = WLAN_GET_SEQ_SEQ(le16_to_cpu(hdr->seq_ctrl));
 	if ((RTLLIB_QOS_HAS_SEQ(fc)) &&
 	   (((union frameqos *)(skb->data + RTLLIB_3ADDR_LEN))->field.reserved))
 		bIsAggregateFrame = true;
-- 
2.42.0

