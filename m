Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02632242D6A
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 05:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779341233; cv=pass; b=q2DGk4Hi6bCGcuYslQz0ehTPKnjIR/RbkM/crjfxgNrTN2dPrfvcAU4MufObI8nJ77d6UbchGp+sGZMvGI14qulQJqRMFis3pIHC9qOHANNUmSUwS/tjqu9LvhfasyWKlDnKMs7Vrgxppb4UT8C0MM85DVMCRdlFKgeiAQOpfBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779341233; c=relaxed/simple;
	bh=sDOrHME2WzK0WbnZKiDnD6MHd3koZSJyjnLRWLG8/I8=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=Mv5BfHfho29y86u3njoNU6qzmP9AN5dKWVQxJJ8poJQHsCuNRB9wDPLxA1hwsQMT+vhqoh3MCwMGX0cm3UJaGe5xhV0FrndYzSXQsXrQzoLvxotSfhKUvaqcLJco0nDHIebvRw8PSg+2A6hHgQiItzZrUPF6dJ1MKNHPGLZdF6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=CnzhGon7; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="CnzhGon7"
ARC-Seal: i=1; a=rsa-sha256; t=1779341214; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=VavG3RG0vlzqMoSvIwqruEAcZXwds/2T025hPKm5ifXgZ6PjZ6y6DIACO506mA8/P7Sn0aitZBALWkqi7pq4CjnV1C1p57xO4YtUhjeB6OZ8leNdQ0Nv9KJTTMoYX+f0JMUvb15ZmKsRlBM/WWrRL56m2TRgmATK/Qzy5M3BZa4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1779341214; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mF4kMiD/cx+DUYSG83dpfQ+e31V36MRSnhlpl8Rms2A=; 
	b=Kwn8grQwVHqnSO6dd3abmH1hGOjHc8dkiquEzubJbJ4WapSiJ31fX7AkzOEzN3gESYTYN4PDqubjcFzWsHl8VRPzHQ0JQUSW6yFrzvDS4HjjX/uhHkfm2JNZEZMsUn1mAFxQJQN621Kj8K/vAOizB+/w3i0S0OLJzyUHYC7vhoM=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779341214;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=mF4kMiD/cx+DUYSG83dpfQ+e31V36MRSnhlpl8Rms2A=;
	b=CnzhGon7fIgFUXKCj+vWvjUKv4+13mKlSzAhOlfubfnCoJXTGtQT21Idk/VinHEj
	esaTsiP/4j7qb1CDiFlGfq9WcSdbb9Cabo/mwSYDjconGSWW2fB0ceSk3SEiprwhDVP
	G32tKz4PP0xVmtrSrOWU6vvMCDhKTTFPchQ3AMpk=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1779341211867576.875824417363; Thu, 21 May 2026 10:56:51 +0530 (IST)
Received: from  [27.59.63.162] by mail.zoho.in
	with HTTP;Thu, 21 May 2026 10:56:51 +0530 (IST)
Date: Thu, 21 May 2026 10:56:51 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e490038be.2220747069631.5983756933086873911@zohomail.in>
Subject: [PATCH v10] staging: rtl8723bs: remove unnecessary braces in
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

From: Ashwin Gundarapu <linuxuser509@zohomail.in>
Date: Tue, 12 May 2026 17:54:37 +0530
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_mlme.c

Remove braces around single statement blocks. Also remove an extra
blank line to maintain one blank line between statements.

Found by checkpatch.pl --strict

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v10: Removed extra blank line. Single blank line between statements only.
v9: Removed git header from email body.
v8: Fixed double blank lines as requested by Dan Carpenter.
v7: Added version changelog below the --- line.
v6: Rebased against staging-next to apply cleanly.
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 3d88a3a185d5..22776af126ca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -483,7 +483,6 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 			break;
 		}
 
-
 		if (rtw_roam_flags(adapter))
 			/* TODO: don't select network in the same ess as oldest if it's new enough*/
 
-- 
2.43.0

