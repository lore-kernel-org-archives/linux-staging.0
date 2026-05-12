Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECF6349CD5
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 11:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778586735; cv=pass; b=IXCeFgkqwvc7Wy75v11dp55zVU1Y4WzpEk0JN27/tslF0UWKKrabtmt7UEqVUjv6YRuDGQnQF+XJ8M52T2JWJ2ERvB2NfVFhN1oAN9f1SEkALt2LwPVDnUsS4NUS9NueQMznIHgJoWNPdMrqI3NQuseJFdCTrwNR6MuG3L71EEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778586735; c=relaxed/simple;
	bh=KYt48MAj+9nWnWtVVAQGV9jcNVbVMiBTFcTtL/lRl9g=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=kGBBreSxwhl8iGYyVT+kCZaJwREXQIlMR3d6yoldLyyHfwBITyxLI3iR2xqJVoN9zT1gGG0430a66rsH1F3OC0FyV+kHk8bv9FkbOiDZeWRMqdhojk8A8dApdrSIDy99W5wdjKu/ajlkLaEkG+VJMArc1DWsHYFhu+RJZP5Fi/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=vZoOH8OH; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="vZoOH8OH"
ARC-Seal: i=1; a=rsa-sha256; t=1778586716; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=e6eKNnH9Wi+KlUJbaemws2Obma2sbSaQEtc7p1TxxX3+2mCtssJljPtaJ6lzdLXB7O1rkN/6bFUeRtgC25WA+XTm1JUVco16g//X5NIqh4gVUZStVSU5Rzz8vJADmvhgzvPh/4QooMxR/PMHpTPl9TX41W8DlTX+SrP6DU9sdUs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1778586716; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=j+OcU4z/kRu1OaRz8YMAK80fh0AxHtfdj09dBgIqD3g=; 
	b=XaCyiCJPFZMl8AOI+zcpLUaLAfJp41neL2dNBteXSCcUe886Kuw5Fu5Wx4UboG6BK9ZH/BUzpnVnoWkgil2RAVwpK4F0ilA23lfNZewTRqGNdPT1bEBGZtrDvkjigQjr5HOTmhzd1O2GeQoupFP1jit5UtVxTwg18giT7MsfgeE=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778586716;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=j+OcU4z/kRu1OaRz8YMAK80fh0AxHtfdj09dBgIqD3g=;
	b=vZoOH8OHUW8xaxWvJRoQ2vDcSj16WDg1fURdcpmVgGa5etwl5em00xK2ww5rcI+c
	GucWtqW2T5IijYZIO0yPspjUCJ9k1IoApLlc6uSoboRIoD+avRa7718Hn1NU2RBWMtG
	OLAW2tPak5zSMlhS4vI/pbiZy/v3JLXmlk28PQdM=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1778586713838478.6338551223447; Tue, 12 May 2026 17:21:53 +0530 (IST)
Received: from  [27.59.63.39] by mail.zoho.in
	with HTTP;Tue, 12 May 2026 17:21:53 +0530 (IST)
Date: Tue, 12 May 2026 17:21:53 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e1c077ee4.2272059b46402.3689085453526247548@zohomail.in>
In-Reply-To: 
Subject: [PATCH v7] staging: rtl8723bs: remove unnecessary braces in
 rtw_mlme.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

From d60236e3784e4258a7fe5e173d603d2b05d2af21 Mon Sep 17 00:00:00 2001
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Thu, 7 May 2026 21:29:11 +0530
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

Remove braces around single statement blocks.

Found by checkpatch.pl --strict

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v7: Added version changelog below the --- line as requested by Greg KH.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 9cf1c95dd924..c14b8dbd478b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -483,13 +483,13 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			break;
 		}
 
-		if (rtw_roam_flags(adapter)) {
+		if (rtw_roam_flags(adapter))
 			/* TODO: don't select network in the same ess as oldest if it's new enough*/
-		}
+
 
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
-	}
+
 
 	/*
 	 * If we didn't find a match, then get a new network slot to initialize
@@ -2410,9 +2410,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 
 	len = 0;
 	p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
-	if (p && len > 0) {
+	if (p && len > 0)
 		/* todo: */
-	}
 
 	if ((pregistrypriv->bw_mode & 0x0f) > 0)
 		cbw40_enable = 1;
-- 
2.43.0



