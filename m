Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301C730D07
	for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 16:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7D0C257"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a1c6dad2dd0so223986466b.1
        for <linux-staging@lists.linux.dev>; Wed, 13 Dec 2023 08:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702486326; x=1703091126; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V24N0myd3yrAHQ5oXdaUpmt08W779GgLxB9a3K2nYC4=;
        b=e7D0C257upklETqeMzR4C39Y7sXNNDNzQ2saWzf9fo6CmNI67VQeLlSrrZMI31kuPu
         WcYTMSHHpIjKSvqO1cYiXCM9NwPjmOHK3Z8i1EzSZOrH2HAlIsMnJY2hoNsaTk9mgBVN
         MHQB1uw+2EVq76FN+pUHA9YPZXdC7SMbBDXOXMJi/vfjSb2YNTjWALzv27VLsZ7/qQOO
         n4Dc6j06daLjLW+AjJ7cSJbNAe/QH2N5QwzI4PnPayT2xUg5T8SjTu1hvmo3t/bfnhhR
         FlT9Q+8F/D+fABA4usu38lReMeEP/xiO+s3lv97WVznfaW+9UIX0zj8pZT4EbMY0bcLw
         9QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702486326; x=1703091126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V24N0myd3yrAHQ5oXdaUpmt08W779GgLxB9a3K2nYC4=;
        b=IDzGPyqYDfLaYIU9YwjtLuoEDcG+tEk81jwn0O+qpRApysB9FwKBTPb7bQYjnkqp++
         YPkSXAE3qCHioX/YY2fSR67VsjbQ/ACVyQXP3X6D20piu3tXEwmiQIQPFMfKw6CI6xBy
         L0RtaYvND7zT/Ya7+XfIBLM4Hgt47Mx2oheNNjeGxXAOLoyUA7k7MCpRZ5kc6uR5gWn7
         MGvHW72ybx+9+d7XkY3zelQ/c/YC+1UcZ50snV3N0aLPnW1aZmNXk+WWx7DHmrax8Fr0
         hV5m7b/nwuYaespeD7c1IRqJRsFUPLa53LjYO74QqndeKr9IuRMuIa066q4r3efGgCTG
         F10g==
X-Gm-Message-State: AOJu0YypEP/b9Uk8HwxISdjTcrG4yl4LxE/EamzOYkguBERlcl/4C9i/
	4/B2gopmaKQ2uDXTnvGtBsyirUo0PMo=
X-Google-Smtp-Source: AGHT+IGRBQ0A+eaO9nkYVYRpK2dgpNPQhl+tc8bFjCGMjWcg5m3VG4en0D8a54eiU15YIN64PYsPhg==
X-Received: by 2002:a17:907:c705:b0:9cf:7c60:47b9 with SMTP id ty5-20020a170907c70500b009cf7c6047b9mr8673247ejc.1.1702486326023;
        Wed, 13 Dec 2023 08:52:06 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id tb19-20020a1709078b9300b00a1cd30d06d1sm8245382ejc.14.2023.12.13.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:52:05 -0800 (PST)
Date: Wed, 13 Dec 2023 17:52:04 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Remove constant variable
 peer_mimo_ps
Message-ID: <7b2ccccde769133db9365c693fdd0c42e9dc75f9.1702406712.git.philipp.g.hortmann@gmail.com>
References: <cover.1702406712.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702406712.git.philipp.g.hortmann@gmail.com>

MimoPwrSave is set to 3 and not changed. peer_mimo_ps is set to
MimoPwrSave and not changed. All evaluations of peer_mimo_ps with 0 will
have a constant result and can be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 5 +----
 drivers/staging/rtl8192e/rtl819x_HT.h          | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c      | 6 +-----
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index e6d51abd0d01..763ecaad6652 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1753,10 +1753,7 @@ void rtl92e_update_ratr_table(struct net_device *dev)
 		ratr_value &= 0x00000FF7;
 		break;
 	case WIRELESS_MODE_N_24G:
-		if (ieee->ht_info->peer_mimo_ps == 0)
-			ratr_value &= 0x0007F007;
-		else
-			ratr_value &= 0x000FF007;
+		ratr_value &= 0x000FF007;
 		break;
 	default:
 		break;
diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index eb2cfeab97d6..43472b2250c2 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -112,7 +112,6 @@ struct rt_hi_throughput {
 	u8 forced_mpdu_density;
 	u8 forced_short_gi;
 	u8 current_op_mode;
-	u8 peer_mimo_ps;
 	enum ht_extchnl_offset CurSTAExtChnlOffset;
 	u8 cur_tx_bw40mhz;
 	u8 sw_bw_in_progress;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 71d5b6f32869..d424b7729a01 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -507,11 +507,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 
 	HTFilterMCSRate(ieee, pPeerHTCap->MCS, ieee->dot11ht_oper_rate_set);
 
-	ht_info->peer_mimo_ps = pPeerHTCap->MimoPwrSave;
-	if (ht_info->peer_mimo_ps == MIMO_PS_STATIC)
-		pMcsFilter = MCS_FILTER_1SS;
-	else
-		pMcsFilter = MCS_FILTER_ALL;
+	pMcsFilter = MCS_FILTER_ALL;
 	ieee->HTHighestOperaRate = HTGetHighestMCSRate(ieee,
 						       ieee->dot11ht_oper_rate_set,
 						       pMcsFilter);
-- 
2.43.0

