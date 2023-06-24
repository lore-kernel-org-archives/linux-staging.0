Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135057FC
	for <linux-staging@lists.linux.dev>; Sat, 24 Jun 2023 06:04:57 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-98273ae42d0so37031366b.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jun 2023 23:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687586696; x=1690178696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2BWbcO1nwvpd6S1p5aHK6YNqJsjh6u2uTKVKHyBrc6U=;
        b=gyaBU3hGEcyfDQFaVIoIY85LxuTTosEfx7uk3Z1KH5gcty1zpE+PlK0OX6wNvY5nfa
         h3rllOG9uoSGkj+5OWoYL01CCqYIJshQ+NBJgD/S6zSUsadEaq2lnwtF7Cir0LUIw4GP
         ldkRQKotJegsLHJP7UoRvpXJ0b+FV7o1VGswEURyK+jHVoXJCosavKnvdExIRm7R1Y6b
         CIXKOdUV0dOVeAdK7dd9Xd8QxPupqVUrnO62TMmON4CzYNchuUq96J4t282qDgQqqPKQ
         jNkF60rbsTy2bP1KUzb7PXNKLStMZ0r/wjk3K7r9zRPbSeeXeiDCejSek0aLhmSCo8Vm
         0Y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687586696; x=1690178696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BWbcO1nwvpd6S1p5aHK6YNqJsjh6u2uTKVKHyBrc6U=;
        b=jsUCMv41JmpCxr8gjiGMulm44BFRT6A8J4hSJxjZqbV8Dcc7hOTwoRCI9IUDoH8SmC
         +57E+WQejtOxwyc0lBIm/E0Sxhs82rzpWtIa+1wX8bns7GMhspLgtRMDpOtYos2iUZP0
         lxTrFPwcv76m0WuabepcLPwAK6ieA9GgGvzEbrTiNOY8SpCD9LjiHLyRz+hCCJwZMvOI
         SmBEjGOfhip5qR9DzJS14f4brI4zXPnjDLh0cevXtXxWoZ5fDoYoGrzULyHqffF1drN3
         SQhmlCGN5xcOvBNVdkDWlvGDr8HYoRnAiYd5mWF4napKzlrPiMbtnJKEy/ny/+iejvh9
         JZcQ==
X-Gm-Message-State: AC+VfDzyOy19GaH+KdMvEwZ4Gvlo1v7nzMH7kwykaEohTnhXv2MgAKjX
	NqzC8HN7tT5sMyllgGfe4m8=
X-Google-Smtp-Source: ACHHUZ7be3ZRgN7ScfoKn8GtZlHQKSPn4jcQARRkgRHFYt1lBd1H8O8ZdujY0N/htmY1NI/zWgY0gQ==
X-Received: by 2002:a17:906:64cc:b0:987:115d:ba05 with SMTP id p12-20020a17090664cc00b00987115dba05mr18950034ejn.3.1687586695801;
        Fri, 23 Jun 2023 23:04:55 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id a2-20020a1709065f8200b009827b97c89csm501286eju.102.2023.06.23.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 23:04:54 -0700 (PDT)
Date: Sat, 24 Jun 2023 08:04:52 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] staging: rtl8192e: Remove variable ieee->short_slot
Message-ID: <74fe53ccfafe2e0e18319b5502ed83544cc3ffd8.1687583718.git.philipp.g.hortmann@gmail.com>
References: <cover.1687583718.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1687583718.git.philipp.g.hortmann@gmail.com>

ieee->short_slot also named priv->rtllib->short_slot is initialized to 1
and then unchanged. All evaluations will result accordingly. Remove
resulting dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  1 -
 drivers/staging/rtl8192e/rtllib.h            |  1 -
 drivers/staging/rtl8192e/rtllib_softmac.c    | 10 +++-------
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index a24527585166..aaff8d739efe 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -774,7 +774,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->retry_data = DEFAULT_RETRY_DATA;
 	priv->rtllib->rts = DEFAULT_RTS_THRESHOLD;
 	priv->rtllib->rate = 110;
-	priv->rtllib->short_slot = 1;
 	priv->promisc = (dev->flags & IFF_PROMISC) ? 1 : 0;
 	priv->bcck_in_ch14 = false;
 	priv->cck_present_attn = 0;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c7f800a0c48c..aa8abec390ca 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1486,7 +1486,6 @@ struct rtllib_device {
 
 	enum rtl_link_state link_state;
 
-	int short_slot;
 	int mode;       /* A, B, G */
 
 	/* used for forcing the ibss workqueue to terminate
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 23b33a239703..584371f0ce57 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -852,8 +852,7 @@ static struct sk_buff *rtllib_probe_resp(struct rtllib_device *ieee,
 		cpu_to_le16(ieee->current_network.capability &
 		WLAN_CAPABILITY_SHORT_PREAMBLE);
 
-	if (ieee->short_slot && (ieee->current_network.capability &
-	    WLAN_CAPABILITY_SHORT_SLOT_TIME))
+	if (ieee->current_network.capability & WLAN_CAPABILITY_SHORT_SLOT_TIME)
 		beacon_buf->capability |=
 			cpu_to_le16(WLAN_CAPABILITY_SHORT_SLOT_TIME);
 
@@ -939,9 +938,7 @@ static struct sk_buff *rtllib_assoc_resp(struct rtllib_device *ieee, u8 *dest)
 	assoc->capability = cpu_to_le16(ieee->iw_mode == IW_MODE_MASTER ?
 		WLAN_CAPABILITY_ESS : WLAN_CAPABILITY_IBSS);
 
-	if (ieee->short_slot)
-		assoc->capability |=
-				 cpu_to_le16(WLAN_CAPABILITY_SHORT_SLOT_TIME);
+	assoc->capability |= cpu_to_le16(WLAN_CAPABILITY_SHORT_SLOT_TIME);
 
 	crypt = ieee->crypt_info.crypt[ieee->crypt_info.tx_keyidx];
 
@@ -1190,8 +1187,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if (beacon->capability & WLAN_CAPABILITY_SHORT_PREAMBLE)
 		hdr->capability |= cpu_to_le16(WLAN_CAPABILITY_SHORT_PREAMBLE);
 
-	if (ieee->short_slot &&
-	   (beacon->capability & WLAN_CAPABILITY_SHORT_SLOT_TIME))
+	if (beacon->capability & WLAN_CAPABILITY_SHORT_SLOT_TIME)
 		hdr->capability |= cpu_to_le16(WLAN_CAPABILITY_SHORT_SLOT_TIME);
 
 	hdr->listen_interval = cpu_to_le16(beacon->listen_interval);
-- 
2.41.0

