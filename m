Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FAE748C
	for <linux-staging@lists.linux.dev>; Sat,  9 Sep 2023 18:19:51 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-401e6ce2d9fso8866435e9.1
        for <linux-staging@lists.linux.dev>; Sat, 09 Sep 2023 11:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694283590; x=1694888390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GpwmshN/SnkxoMv0hgadPL0UXh7rR+Fy3DtPmnciQb0=;
        b=RXa3uRsX7rzJwK/XQ1qQZw45FRVSH9orKe+nu4XTcogFfu/aPzyfeO4EleO2HNZQxa
         E4Rg3bkw83EZWkpSF2w15yP2ebuUuAhvLoTHe3SOhrcXZ3alN8DTqbP7R5jA7Cp/8uM7
         7eonGkZV5Y47FaSqtBoNPsReQ2ATLVHYEtis61vhqoDwvou6U3dnJIJt7OzAdMsVKwpD
         U/urpCIpHTSUlhrj3X68zNeh5MeBLUNq5KP+b3MZcgiWIntjvQXquSmB+BH82ejfZIL9
         wFHHKwv9/7tv8+oRfpSz8LJj48oUKrrPgj0pe+XaGR3lJNikS0/qzUFf0mxSfs3voMq8
         bYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694283590; x=1694888390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpwmshN/SnkxoMv0hgadPL0UXh7rR+Fy3DtPmnciQb0=;
        b=amh8l3wLpS1tWe58SC/TeDgQFy6HFf0CAdVO9v+QINddGOEbR8tavf7mqikO0AsfGe
         mIQIU90qHlZ4g8Zn/u9onAVF7+CPfPJOcGmcHskd8s1ORkJVdjY/GdVydAZ95ZVQ2Jt6
         fgkhnKANCdHSfKfsc4ewOAqEh1YyboP3tYc22QU84SFPIpzvxOUkIkWyc4Ku0qwqmOdP
         M8h+aa8KyJbb1gKybOHD3zExf/Gy5n8KNALmxyVB3ViCdtKZ1INwt782VV/AB9wSIyA3
         kb0q/RIKOS5O3AARDeWumpyJgrOLJ7mjAWYLcx3p2EUmT1SgzCX7M6374tpstnvyPTCN
         o3pg==
X-Gm-Message-State: AOJu0YwTUBxnQFqcgy5z+rexwtuE1vpiTcZ/3mWZhhu+vX+unqfRG0N5
	aDES45ulX8+aXhd3Wol/+Emngml+B73wrg==
X-Google-Smtp-Source: AGHT+IHLt3smwCNceCgJThJzA35FlMq7WPqfvXc8OO+RfHKvxUVXmcgCPYlMvVJBJCWColdkWAkbzQ==
X-Received: by 2002:a05:600c:1d0a:b0:401:c6a2:3cd5 with SMTP id l10-20020a05600c1d0a00b00401c6a23cd5mr4916064wms.2.1694283589687;
        Sat, 09 Sep 2023 11:19:49 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id l10-20020a1c790a000000b003fed70fb09dsm5232607wme.26.2023.09.09.11.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 11:19:49 -0700 (PDT)
Date: Sat, 9 Sep 2023 20:19:47 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/8] staging: rtl8192e: Use standard function in
 rtllib_rx_check_duplicate()
Message-ID: <c636aadd4cf4898c57c348a1d789790c5a459749.1694282907.git.philipp.g.hortmann@gmail.com>
References: <cover.1694282907.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694282907.git.philipp.g.hortmann@gmail.com>

Use standard function ieee80211_is_beacon() to avoid proprietary code and
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 89c8d66765fe..80eee43ee444 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -904,11 +904,8 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 {
 	struct rtllib_hdr_4addr *hdr = (struct rtllib_hdr_4addr *)skb->data;
 	u16 fc, sc;
-	u8 frag, type, stype;
+	u8 frag;
 
-	fc = le16_to_cpu(hdr->frame_ctl);
-	type = WLAN_FC_GET_TYPE(fc);
-	stype = WLAN_FC_GET_STYPE(fc);
 	sc = le16_to_cpu(hdr->seq_ctl);
 	frag = WLAN_GET_SEQ_FRAG(sc);
 
@@ -916,8 +913,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 		!ieee->current_network.qos_data.active ||
 		!IsDataFrame(skb->data) ||
 		IsLegacyDataFrame(skb->data)) {
-		if (!((type == RTLLIB_FTYPE_MGMT) &&
-		      (stype == RTLLIB_STYPE_BEACON))) {
+		if (!ieee80211_is_beacon(hdr->frame_ctl)) {
 			if (is_duplicate_packet(ieee, hdr))
 				return -1;
 		}
-- 
2.41.0

