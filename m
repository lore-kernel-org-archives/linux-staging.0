Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B0334374
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587919; cv=pass; b=iBmHXQlVr9q7PI9wUlgwayW3hvRjTJPooy0bTuzpyUHDdeMVvqtZlcyj/ZqIT4y/O9CPlDcFTcIRR93he0tBVDhJ72F77SVKaB+1Zny3V6cn+chc4A7fjxLb5uduvXjOLdvIZhJ6hFUbmjfnXRZzh5Wn3/HnQ/QRn7+MKCXXBQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587919; c=relaxed/simple;
	bh=sIR25L1OURO5iBE2GDngGjjVg7dUuv4+Q4pQZhA5CF0=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=Zrg6Y8E+0jHOlZ3T2g92SzW7iLVEDR+ASElL2j4LVdKEEiUT68/zAhd6aSMEAqtfNnDo/oKVLs2ixvHMtlI1eyjUEvmVA/Q3e9eSMt1U5MtbL+5ejfWG5Rl3U78xWCZ1X2ngwEF08wGsMPVFFTta5LjzutAUoUWUWGfKEVN0eQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=incTXxlZ; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="incTXxlZ"
ARC-Seal: i=1; a=rsa-sha256; t=1778587903; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=JjQ24fxBTF+FMAcT9E3zwVTRwjRnoqb9cQSWNt/dKMbYsJ/55kJlveta+ctIHOWViKdXOVcdEmSGcKKgUxZF16gRV70RAOKQqWacEy0eCUCNYftTnyeZ/MQDUx3moXlhf4eJgHLLC1VHljp8OdT7+03WVY9BlWLC4WzpjY55VGQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1778587903; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=NaTheYE76gStgaEtLVGKsdKfP9e4uzFIe31guKLJsJQ=; 
	b=LcnqJNl2IGlYpLUTuEm8vQtUwUkPvJVe8GTXOVY8kuuEc8Qd4Ob2WmXXgvbVGrHMw5JYKbBMtpMV8SfeHCnGKWMvDSR/tDWvtg1zWZOHq18RFU3FJPLZ6J2sWqedsEH+R/N3bX6HhZcCZdBVwp15ME7EFY3Sx3rVRcQyoS7azmo=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778587903;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=NaTheYE76gStgaEtLVGKsdKfP9e4uzFIe31guKLJsJQ=;
	b=incTXxlZrOuiwlRco0BcmAvpF3wCH3zHfbNjlhyJHG5wG3oZLAqHcHhVEnDP0Q8n
	bjL0cnrfSEA1SkjlYFNkcyGuV85KfxA5dQUatme7GdBh8E286UO0MMTFCskQkd5RXmb
	CbD2EiAh8GgMfoiXXbMNocHqV9M4RhY3VTNeFZPM=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1778587902764904.9320546751536; Tue, 12 May 2026 17:41:42 +0530 (IST)
Received: from  [27.59.63.39] by mail.zoho.in
	with HTTP;Tue, 12 May 2026 17:41:42 +0530 (IST)
Date: Tue, 12 May 2026 17:41:42 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e1c19a323.2dbc56d746976.8507108782933043169@zohomail.in>
In-Reply-To: 
Subject: [PATCH v8] staging: rtl8723bs: remove unnecessary braces in
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


From c981cdc1149e5ae7e5163f80be1631fc11c4b14d Mon Sep 17 00:00:00 2001
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Tue, 12 May 2026 17:38:31 +0530
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

Remove braces around single statement blocks.

Found by checkpatch.pl --strict

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v8: Fixed double blank lines. One blank line only between statements.
v7: Added version changelog below the --- line as requested by Greg KH.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c14b8dbd478b..3d88a3a185d5 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -483,10 +483,10 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			break;
 		}
 
+
 		if (rtw_roam_flags(adapter))
 			/* TODO: don't select network in the same ess as oldest if it's new enough*/
 
-
 		if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
 			oldest = pnetwork;
 
-- 
2.43.0

