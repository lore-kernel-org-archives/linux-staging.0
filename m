Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD972FB3
	for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 23:49:13 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id c2so2385821qvs.6
        for <linux-staging@lists.linux.dev>; Wed, 23 Jun 2021 16:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J3iZq93qJlhlHyJJ5kBsLs80OLUbQCBovB25rjj6nBk=;
        b=MDTcxN6PgmSYgHfdoQZsKxxj0lM9G2XTHOctwJ//t/yRrurpZDRCjzB+PEtrgmIYH6
         0e+PWS9nxQyRJ6TuJROprV2kHstrbzteByQ50G2wGFw53HgW/Y2GTnCnbqlY8or74Sbc
         z4SDd4L7BjgbSuBIVJEcewclr+fpX762EKj4cIxdSZ7f0lafo6hTtgk6lJ3lnyIPJxMp
         TkbW1FCQzbQ+nLmu74IgkqfK9Fp+KYVG7iN+n+bdp5gbYpWo5QExEu6CdSV04TOPW01s
         B976T6laDypJOYQ69TMzJL7Q+i6ncuDM8NVj/Dfw89fw/OrJOMN8FE8PVJZRgJWwZ7Pe
         2mJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J3iZq93qJlhlHyJJ5kBsLs80OLUbQCBovB25rjj6nBk=;
        b=dTX6W7dx1WGXRFRLsXbt1mJrUEP1Ba6Ya5HYCSc5oHVkDkAXeeyopiqzAtqTNR2N55
         xMSQ4l5hC3HEkQRjU3UtZNgoiQ8RA0scthFhsORGFiCk4GVMU0Tp8dq8/JEwylE7qnLx
         ich2FNepSwJ36FY2JhUW0kSQEbOK9NnwcIo5+IjJRCaHpcLdwC+ij5WcRK3Tset3+bra
         pZUS9InXX55w2lW4ehAV5/xBoFRc3dta/eueq/ONzw0ICTvCbNJw2ShtBs9O2f8LOsKh
         y12xGCsRt7Pq5/nnSqzDGGrzs864LWfYfvBSBAX9QHu1a7AzNQZEsbBqXxmPcfWPqw8v
         ronQ==
X-Gm-Message-State: AOAM533eSoeR0AqZusM0DdU57tTDE1c5zH/vsQ6k1o36HaX7/KrUSZam
	nKzcqsxscLl++MvvK1Wh2WlwDhoXCc5XTQ==
X-Google-Smtp-Source: ABdhPJx6FK4Vr5U43TGDZ73KbHRZUMRXatqX0Ot94wWOHZbKqVv6HVERl5XQdaSt9qnUMmTVo5Nh8Q==
X-Received: by 2002:a0c:d7c4:: with SMTP id g4mr2367407qvj.23.1624492152287;
        Wed, 23 Jun 2021 16:49:12 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id w2sm992387qto.50.2021.06.23.16.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jun 2021 16:49:11 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/9] staging: rtl8188eu: remove all DBG_88E_LEVEL calls from core/rtw_pwrctrl.c
Date: Thu, 24 Jun 2021 00:48:57 +0100
Message-Id: <20210623234902.7411-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210623234902.7411-1-phil@philpotter.co.uk>
References: <20210623234902.7411-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E_LEVEL calls from core/rtw_pwrctrl.c as this macro is
unnecessary, and these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_pwrctrl.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c b/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
index f6fe43e0965d..95e2eea23e42 100644
--- a/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
@@ -112,12 +112,8 @@ void ips_enter(struct adapter *padapter)
 		return;
 
 	if (pxmit_priv->free_xmitbuf_cnt != NR_XMITBUFF ||
-	    pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF) {
-		DBG_88E_LEVEL(_drv_info_, "There are some pkts to transmit\n");
-		DBG_88E_LEVEL(_drv_info_, "free_xmitbuf_cnt: %d, free_xmit_extbuf_cnt: %d\n",
-			      pxmit_priv->free_xmitbuf_cnt, pxmit_priv->free_xmit_extbuf_cnt);
+	    pxmit_priv->free_xmit_extbuf_cnt != NR_XMIT_EXTBUFF)
 		return;
-	}
 
 	mutex_lock(&pwrpriv->mutex_lock);
 
@@ -129,7 +125,6 @@ void ips_enter(struct adapter *padapter)
 	pwrpriv->ips_enter_cnts++;
 	if (rf_off == pwrpriv->change_rfpwrstate) {
 		pwrpriv->bpower_saving = true;
-		DBG_88E_LEVEL(_drv_info_, "nolinked power save enter\n");
 
 		if (pwrpriv->ips_mode == IPS_LEVEL_2)
 			pwrpriv->bkeepfwalive = true;
@@ -161,8 +156,6 @@ int ips_leave(struct adapter *padapter)
 		if (result == _SUCCESS)
 			pwrpriv->rf_pwrstate = rf_on;
 
-		DBG_88E_LEVEL(_drv_info_, "nolinked power save leave\n");
-
 		if ((psecuritypriv->dot11PrivacyAlgrthm == _WEP40_) || (psecuritypriv->dot11PrivacyAlgrthm == _WEP104_)) {
 			set_channel_bwmode(padapter, padapter->mlmeextpriv.cur_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, HT_CHANNEL_WIDTH_20);
 			for (keyid = 0; keyid < 4; keyid++) {
-- 
2.31.1

