Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64841492193
	for <linux-staging@lists.linux.dev>; Thu, 23 Jul 2026 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784820941; cv=none; b=OisZRDl6ePO37PA/2xN9XzQMUN1cCGfJkGJRodnyhesytU6XgE9XtDUoGTjaFuNi4SfncqyTDV62IYMktOl/Ds0LbBu24/q7EfvuXERG4BSHm7gF3tt6NKvj+FKxOCIncD5dZgGWHEPA1XGhaF8vIMmsq1YqUEjR0PNKtYHWP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784820941; c=relaxed/simple;
	bh=apV00Gw61ZFknAtmcAOdxGB/0WtJe2lyqR7Enc0R1fA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pec827gdfYuUfbb+aclrb6WjweaXjhjIndPq7xhkKDOTiin2taAMZCjeQfjy2qlaFPv44U7NC1Bej4j/q9uMlD2zW3p13D6S8zbxZGsbn1di49x8geVn3yuwL7qzaoirEq1IT7A6W/9jPO9kFvf1+s+2p6U6f4ehIUiFguklQgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=ebY4qQ75; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="ebY4qQ75"
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4h5ZvQ3twvzDqW5;
	Thu, 23 Jul 2026 15:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1784820930; bh=Tb63SEOBc+RKCzbjXmyACMa8UBN/An6VNSzrKXFQ5kQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ebY4qQ759UeDlaHjhzEZXwBjDp3IsGCfOqwPTnVDzho7+wFQ7HUuKqPwqpK8aT8Cm
	 2H4C1eSWNWwIK93XKybuc1bc5NzVE6sKpZ3JNxKZ6kudNC7KMC6MsW/TOlu/uFREz8
	 nnmlF+L3wLhv/Ys0pt0oNycoJAQzCm29CM/+GjNY=
X-Riseup-User-ID: 051B7EC523C34B16448AAEE64383A3D20C6739D71C9FAE98E31F334E3AB8EB41
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4h5ZvP2TT7z1yjb;
	Thu, 23 Jul 2026 15:35:28 +0000 (UTC)
From: =?UTF-8?q?Santiago=20Ruano=20Rinc=C3=B3n?= <santiagorr@riseup.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com
Subject: [PATCH] staging: rtl8723bs: fix several line spaces in wifi.h
Date: Thu, 23 Jul 2026 12:35:21 -0300
Message-ID: <20260723153526.255965-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Address checkpatch.pl warnings fixing reports of type LINE_SPACING:

WARNING: Missing a blank line after declarations
CHECK: Please don't use multiple blank lines
CHECK: Please use a blank line after function/struct/union/enum
declarations

Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>
---
 drivers/staging/rtl8723bs/include/wifi.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index d5132bc4280a..4bf158d429c6 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -163,7 +163,6 @@ enum {
 #define SetDuration(pbuf, dur) \
 	(*(__le16 *)((size_t)(pbuf) + 2) = cpu_to_le16(0xffff & (dur)))
 
-
 #define SetPriority(pbuf, tid)	\
 	(*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf))
 
@@ -192,12 +191,15 @@ enum {
 static inline unsigned char *rtl8723bs_get_ra(unsigned char *pframe)
 {
 	unsigned char *ra;
+
 	ra = GetAddr1Ptr(pframe);
 	return ra;
 }
+
 static inline unsigned char *get_ta(unsigned char *pframe)
 {
 	unsigned char *ta;
+
 	ta = GetAddr2Ptr(pframe);
 	return ta;
 }
@@ -225,7 +227,6 @@ static inline unsigned char *get_da(unsigned char *pframe)
 	return da;
 }
 
-
 static inline unsigned char *get_sa(unsigned char *pframe)
 {
 	unsigned char *sa;
@@ -272,11 +273,11 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 	return sa;
 }
 
-
 static inline int IsFrameTypeCtrl(unsigned char *pframe)
 {
 	return GetFrameType(pframe) == WIFI_CTRL_TYPE;
 }
+
 /*-----------------------------------------------------------------------------
 			Below is for the security related definition
 ------------------------------------------------------------------------------*/
@@ -335,7 +336,6 @@ struct ieee80211_ht_addt_info {
 	unsigned char basic_set[16];
 } __packed;
 
-
 struct HT_caps_element {
 	union {
 		struct {
-- 
2.53.0

