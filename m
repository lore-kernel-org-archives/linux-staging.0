Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA8C7477
	for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 18:09:13 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-94a342f4c8eso281502766b.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684001352; x=1686593352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ecItjrrmoNNrjpM5Xnudv7ep0+/pzn0LcIKgPQDDuqk=;
        b=OhW9IXYNc9c1cy5QoUcNc4Q2EhO0kguK4lHy+NQU2OEOLZE3WddNOxATsr2MtTdlW7
         IHYLhbtxYXiGO1Ztmgvh3jQCckjDZOJqzzqoQhKK784v2h4iI0GcJZIvQjCgFYtHT8pA
         zCLg4Ulx8WDsrAcd+MYr6B+EnmPTwSPJJGJuiadpZn2DoK5LDlLmXLhnsHRk8OkXGqIq
         SnbU7pTEt4yJwZAPAv0bAw/F8PZuQIAVCxRtDNOWBbSFlyAQvPPa97TKaSh0k0bDDTGP
         xZZifLnziLqjfb/g5hRumer2e8BLvIuUXPit8ET99ZoH8Mf6pxq5OSrh61lTOhIQeT0V
         WX5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001352; x=1686593352;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecItjrrmoNNrjpM5Xnudv7ep0+/pzn0LcIKgPQDDuqk=;
        b=efjLukFBOZWsCAmPzA768S+FerK3L6a12RRyVTwlVQZGgNWxg/jjACNTDHV4UHr/VA
         Sm69dDvHivVqoHEIiHZgNvz0xV9mov1F6JbCgdREbg2AVIIj8pdIgXbJM6f8tTyYUiJa
         UXr+WrrpkKTZuzsnRr6nUHEY14pLer/UKL6HweieIQ/rwlx8cRIylgRKLRHHGtU/TZO0
         o/gD00wOW2F27NSMxLnAjaHaN6rR0ntLig913QCGjE9qSz2tiCKZa/AWMOCmyxZHmrr9
         JbmKCRQjI5s2EuzvOzhjj9ClCpSDb2tkdepv0xGAIMoY3RRLdf0bvHMD3HtOnY0EzTFg
         b6Sw==
X-Gm-Message-State: AC+VfDyJeyJF/A69efewJH/xz7of1z9MRl3kHJh8dFI/kOeHHUMWQWW9
	3z0QMw5MUKKNwz5ak2m/JL4Ve0+uPxg=
X-Google-Smtp-Source: ACHHUZ4nfwDHku7aKvlbwj61Ico7w84ukD4Dneu3ddMfP2G+h5jX0bdNZ6yHEZC3yNpZkiL3T+glLA==
X-Received: by 2002:a17:906:5349:b0:953:2918:71e7 with SMTP id j9-20020a170906534900b00953291871e7mr2464704ejo.5.1684001352023;
        Sat, 13 May 2023 11:09:12 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935e01.dip0.t-ipconnect.de. [87.147.94.1])
        by smtp.gmail.com with ESMTPSA id jy11-20020a170907762b00b0094f3b18044bsm7040634ejc.218.2023.05.13.11.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 11:09:11 -0700 (PDT)
Date: Sat, 13 May 2023 20:09:09 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] staging: rtl8192e: Remove undefined function
 hard_start_xmit
Message-ID: <603a143ba506ca031d7bd70a844b9f080872d601.1683960684.git.philipp.g.hortmann@gmail.com>
References: <cover.1683960684.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683960684.git.philipp.g.hortmann@gmail.com>

Remove function hard_start_xmit as it is not defined. Equation
!ieee->hard_start_xmit always evaluates to true. When
(*ieee->hard_start_xmit)(txb, dev) == 0 is called the my computer is
freezing.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtllib.h    | 7 -------
 drivers/staging/rtl8192e/rtllib_tx.c | 8 +-------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cc4247ebea6b..7be02cfe56fe 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1654,13 +1654,6 @@ struct rtllib_device {
 	void (*set_security)(struct net_device *dev,
 			     struct rtllib_security *sec);
 
-	/* Used to TX data frame by using txb structs.
-	 * this is not used if in the softmac_features
-	 * is set the flag IEEE_SOFTMAC_TX_QUEUE
-	 */
-	int (*hard_start_xmit)(struct rtllib_txb *txb,
-			       struct net_device *dev);
-
 	/* Softmac-generated frames (management) are TXed via this
 	 * callback if the flag IEEE_SOFTMAC_SINGLE_QUEUE is
 	 * not set. As some cards may have different HW queues that
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index 54119fba8a57..c3f1910d9f58 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -572,8 +572,7 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 	/* If there is no driver handler to take the TXB, don't bother
 	 * creating it...
 	 */
-	if ((!ieee->hard_start_xmit && !(ieee->softmac_features &
-	   IEEE_SOFTMAC_TX_QUEUE)) ||
+	if (!(ieee->softmac_features & IEEE_SOFTMAC_TX_QUEUE) ||
 	   ((!ieee->softmac_data_hard_start_xmit &&
 	   (ieee->softmac_features & IEEE_SOFTMAC_TX_QUEUE)))) {
 		netdev_warn(ieee->dev, "No xmit handler.\n");
@@ -938,11 +937,6 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 			dev->stats.tx_bytes += le16_to_cpu(txb->payload_size);
 			rtllib_softmac_xmit(txb, ieee);
 		} else {
-			if ((*ieee->hard_start_xmit)(txb, dev) == 0) {
-				stats->tx_packets++;
-				stats->tx_bytes += le16_to_cpu(txb->payload_size);
-				return 0;
-			}
 			rtllib_txb_free(txb);
 		}
 	}
-- 
2.40.1

