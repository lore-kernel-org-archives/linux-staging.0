Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFAC47885C
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 16:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169982; cv=pass; b=jFYRCLmooOxovzQ83e1Eku2aUW0OOpqiepmVE+YMVHzrZ4iMdye1y5LXWVTsN8nsLqthwRQJn/hTv+3ZbZ1HgEOJYc4dfmFC6PqukJnaAq7hPSyCcERf8uK23EQOopT2cnd/phwmF43HGWdzWJGYmXcvOPkVmS2WbuuUiUXKWMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169982; c=relaxed/simple;
	bh=mK7J2ID/D1dShdS3fpRmaYIO9fDDq5hQ/ktF1P8Ag+A=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=FGxiflKoO3JYOypy8uFJGW6LJ6MXlgBFtifmWcW9WhzBCxGoq/W01Wbi+apVtRaVU0Ifu/WyyZ/BRs/rAyHi4Kd1lEx4fFeUkVd/Ur0I4n0rv4TduIEeZh56BB5suWLwt4DAY58NXnA04iIgVw1J5a5ylBY2Y6QmteHTD1oT7gw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=hjtJ8a2d; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="hjtJ8a2d"
ARC-Seal: i=1; a=rsa-sha256; t=1778169961; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=CY/cJ/F3t8Yvwit57gp3+fWKmGeGJtmllYTPfxHrqdZ/tZK1egXVTseTimeH1Z3ddktCM+S6VlL//yc+7YtLGhJ/HEnV7UT1qthQlJn+OgoUKhJx/5h7LeXmxsJ4aR0oB3r5ZVsIp8zh8EKFl9khvx83XjxwbUFwKkAyWdfog8E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1778169961; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ab4F+runtXLhTlCdQi0dIDRJOksMsJem6KppAp8PrBk=; 
	b=aOoVn2qJT2hCgehnHHcu8zxKIV31GihfGTakfoGEQm+w9wBeceeV5qXG0X93DU7jPEXQnC/M+V/YJpZZWBlOt2duNN5NoZOpzz6hvQYbVhnB3lzf7D+JdrDcB/4IXo/P7/rAEjLZ7e9XJdnNbOBsDPbPYdWMZQfJTvoEE/Iom+8=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778169961;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ab4F+runtXLhTlCdQi0dIDRJOksMsJem6KppAp8PrBk=;
	b=hjtJ8a2dPR6458eIvXFDVT88gskTvh4kqU0X6J7qRSua3QpzAPh1IJOb4Lfob8Tn
	gVVwM1N4sLQUTNgwTId/nFbMYeAkefKfibPI0fIZ/rdke46ulowH4dUQAwvn8I1fiis
	aiV5GrvUNFRiMEDMwReVlcf97UC3TcMaoy/9TzRg=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1778169960195705.683681161421; Thu, 7 May 2026 21:36:00 +0530 (IST)
Received: from  [103.164.208.221] by mail.zoho.in
	with HTTP;Thu, 7 May 2026 21:36:00 +0530 (IST)
Date: Thu, 07 May 2026 21:36:00 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e033056fb.47bb4db720358.3907801390816381202@zohomail.in>
In-Reply-To: 
Subject: [PATCH v6] staging: rtl8723bs: remove unnecessary braces in
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



From 50c6b6259becbb357e3d7c9f8e26cef10b4e0ef3 Mon Sep 17 00:00:00 2001
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Thu, 7 May 2026 21:29:11 +0530
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

Remove braces around single statement blocks.

Found by checkpatch.pl --strict

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
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
 
-               if (rtw_roam_flags(adapter)) {
+               if (rtw_roam_flags(adapter))
                        /* TODO: don't select network in the same ess as oldest if it's new enough*/
-               }
+
 
                if (!oldest || time_after(oldest->last_scanned, pnetwork->last_scanned))
                        oldest = pnetwork;
-       }
+
 
        /*
         * If we didn't find a match, then get a new network slot to initialize
@@ -2410,9 +2410,8 @@ void rtw_update_ht_cap(struct adapter *padapter, u8 *pie, uint ie_len, u8 channe
 
        len = 0;
        p = rtw_get_ie(pie + sizeof(struct ndis_802_11_fix_ie), WLAN_EID_HT_OPERATION, &len, ie_len - sizeof(struct ndis_802_11_fix_ie));
-       if (p && len > 0) {
+       if (p && len > 0)
                /* todo: */
-       }
 
        if ((pregistrypriv->bw_mode & 0x0f) > 0)
                cbw40_enable = 1;
-- 
2.43.0

