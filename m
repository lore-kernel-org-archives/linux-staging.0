Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6859446
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 20:53:35 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id s26so22337121edw.11
        for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 12:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/frlEDrunz1ZlsA7cE8Bp8/LWLs4gKEjmKJVVK0XiGw=;
        b=fYYbDihoqXRluw30lsX0FqgiqsEDtP7f7r0jNvcYBFk0U4tzlJWkplDoy/SelboeeT
         8blaGWBNah2pMlz/Dpa0aF9hMdwcA41q4Dqc0b8QSM3hq01xUcBq86MBoQmPFdLGtf2i
         nfwyYR/D1KtIrLXv870KFibp6RFaaRyXoxrc0/pJhNkhSXrdAD8vX2rsZkXsXPb4E1gK
         OHf+Obt3ImxrxUAmcAT8K6kitLtCDt1jelwNI3KagJ1s05lgs1u/ekVDdQQ+N9DJ7dLu
         cQWPMm/rLjVowfr9hEhFALRZ2sVIhL90j37q4wf0zIRK3bOwT3stbAHJJkFfI2DhDtVR
         mi2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/frlEDrunz1ZlsA7cE8Bp8/LWLs4gKEjmKJVVK0XiGw=;
        b=KTMHhhLqwF3UN4QkbWE1KvhwEWahpd8ee2dvXXMxgNlvjY7ymBWeKPn2bfddvyoTNB
         Yz6gJJbpYyoUM5VY7kXzAEMzlf3KrAF98vv5fR1aTwcwc3htTCl6z0CKUPchGCpdsxa5
         i+mPLu4jPNP4/DJBMQiNOkolsibdRFHOtlDs+E0QdN3fUiUphtvS96oyUembOo+0TCJj
         uMW+CfOPnFk147f5unmoHRFa7VwUszNeG18GJ0CxLRKCez2uFVzVRBvWqu9a1KcBXXox
         Iu9r//z2Vc7po/FpFd5GeqWow5dn47mOiwTxccLYP81jZqiTrvFDKaj8sqZy2EZJyB3A
         kdXw==
X-Gm-Message-State: AO0yUKUZyEnag8CjgdvKJlTaT5c3FYCGGA2hhTuriNkF1OyN0Xf2U0X8
	v4nsCshpYzGSc5yMTicIL5Q=
X-Google-Smtp-Source: AK7set9NJtmtk+CxqG7WBxvoJags2o6wNntGo63fD/DhDVsI2YEnh3XJg+pNVUZ3p2rWdKh75cLm9A==
X-Received: by 2002:a17:906:109c:b0:8b7:1cb4:a5ba with SMTP id u28-20020a170906109c00b008b71cb4a5bamr13227323eju.5.1677012814335;
        Tue, 21 Feb 2023 12:53:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id e19-20020a17090681d300b008c16025b318sm4743497ejx.155.2023.02.21.12.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 12:53:33 -0800 (PST)
Date: Tue, 21 Feb 2023 21:53:32 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] staging: rtl8192e: Remove entry .link_change from struct
 rtl819x_ops
Message-ID: <9b451317eb4c13db007476c30212ffb09ced2356.1677010997.git.philipp.g.hortmann@gmail.com>
References: <cover.1677010997.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677010997.git.philipp.g.hortmann@gmail.com>

Remove entry .link_change and replace it with function name
rtl92e_link_change. This increases readability of the code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 3 +--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h | 1 -
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 0c1eb75f37f6..2d2f9d4a0ff5 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -27,7 +27,6 @@ static char *ifname = "wlan%d";
 
 static const struct rtl819x_ops rtl819xp_ops = {
 	.nic_type			= NIC_8192E,
-	.link_change			= rtl92e_link_change,
 };
 
 static struct pci_device_id rtl8192_pci_id_tbl[] = {
@@ -762,7 +761,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 
 	priv->rtllib->softmac_hard_start_xmit	= _rtl92e_hard_start_xmit;
 	priv->rtllib->set_chan			= _rtl92e_set_chan;
-	priv->rtllib->link_change		= priv->ops->link_change;
+	priv->rtllib->link_change		= rtl92e_link_change;
 	priv->rtllib->softmac_data_hard_start_xmit = _rtl92e_hard_data_xmit;
 	priv->rtllib->check_nic_enough_desc	= _rtl92e_check_nic_enough_desc;
 	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index e572915c1fd2..fa72f8891409 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -205,7 +205,6 @@ struct rtl8192_tx_ring {
 
 struct rtl819x_ops {
 	enum nic_t nic_type;
-	void (*link_change)(struct net_device *dev);
 };
 
 struct r8192_priv {
-- 
2.39.2

