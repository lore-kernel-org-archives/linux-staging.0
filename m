Received: from outbound.st.icloud.com (p-east2-cluster2-host7-snip4-6.eps.apple.com [57.103.78.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273D238656D
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 21:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434302; cv=none; b=NG4sKA9eHv42vkKuxAXXKs1B5NfUNe2J0YokUtR00J1PhL3PLhAc2AT/LqKHTsiDTkAv2+E1T7YMiwgM+/Cf92tohnbfPlkmP85WThH9/GdMqV1D8yQU9WUUW/otTX6b9wL2ZOdRIlaSTrHYfKsOilN2QWH+lSE7wwxnAAj18QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434302; c=relaxed/simple;
	bh=AJR2UymKFf0NwBQGNRnhlm2Rq2l230U4DWhBmLovI5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hzZ/88kpxm0sWCLPAAXXZaSiNt9wM+AZX88PcOujEdkEMWIBfIXL9rZRGjNLj2zRLIvKkAAiLKlMbL4ancOF/Hm7matdHKS2SGWEhvkGCWImxDoxJAx0YSKbLiffiT4RY7wMQKOE0ZTY5sE1djt+ZrMZ4ZABdQXPIl1btWsRTt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=WrIZwJQ8; arc=none smtp.client-ip=57.103.78.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="WrIZwJQ8"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPS id C45491801FC2;
	Tue, 02 Jun 2026 21:04:55 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQBLHVQFRQNHF0kEWhcOVk1TDV8IRA9XElsZRhl3AlEcVg1XQ1QEX1BfHA4EVAddBV1WUAJaS0ATBEsTBVIHXU1WDUcPWB5cFBcLR0NeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQJGCUoBXAdfAkcXTABbA0YBXVMNXwhED1cSWxlGGXcCURxWDVdDVARfThkMSh1SVlsTVRdGCQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1780434300; x=1783026300; bh=0BDCRHdVyxk1bjjseAjEcgUz9E6w5Qj0OqwslKJnNNE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=WrIZwJQ85+ESwRAhmOMxn/SB/kWIk5CPQu0XOXmWsA0aYP9QyQS173dhq1QPdfXvr6u/SYiHUzznHlcZnPXqiz5A5aoQ3qWnqIfDWwzkgw3as/wm7XBgu2NM5X43UaCU13onijXyyFscXFYF9CXS97r2vdyTuYfPg/tnNuFsAAY3VeohVcgaADUjBOkEUZj6hZVVPcZuJBCxPXFufafyfRJ7GtDy2ZUL/GSidDCo4LaxLBJPu0a6hx1kF3JpdZpMVJuaTkh5DDknvUwBTxqD3xhZY4GyPni870e5VbtTXLhOflwjmw9hGZttpIN3YLE2+jeQOzLX9/CyVuaoQw3YEQ==
Received: from DESKTOP-MKLAF7C.tail7ab390.ts.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPSA id 0CD191800AB0;
	Tue, 02 Jun 2026 21:04:49 +0000 (UTC)
From: Jules Debbaut <julesdebbaut@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jules Debbaut <julesdebbaut@icloud.com>
Subject: [PATCH 3/5] staging: rtl8723bs: fix alignment of continuation lines
Date: Tue,  2 Jun 2026 23:04:05 +0200
Message-ID: <20260602210407.4364-3-julesdebbaut@icloud.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602210407.4364-1-julesdebbaut@icloud.com>
References: <20260602210407.4364-1-julesdebbaut@icloud.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=fdKgCkQF c=1 sm=1 tr=0 ts=6a1f457b
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=FelO9ux0wxsA:10 a=x7bEGLp0ZPQA:10
 a=PddA0_aAOYkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=fZH_e3wht1EP9LPdaggA:9
X-Proofpoint-ORIG-GUID: h-yh4cCjgH0VPm-9ZoaY4Uyb0wTis-uN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwNSBTYWx0ZWRfX1fWHxKGno5c3
 fj0uDAMINIpYpBTYoxPFfGKp2ZRYTFhV4HWtCPOcrub3TpwnY0NX7hauObSKbq1qk+Ms+i/pbOS
 OPu0PTuXQbA8bo6j4rpBY3DBi4F6i0ikSxHi2kY3KXSO6VXbwL9ESHdTsEUYf88wWLe9dUMyJPx
 d1zgkQ5KhvDjgD0g246MbsQfoJbI8IJrCTOs/2Ah+LR5Mbbm9vg8kgNJDzOegKnBO6YG2oIL+vz
 qKseHRBX8oP1oQ+l7vctFc8WuGIHnpq4vIm59OSLiBFqxfd1XuyJqdgjKZWdot7EOa8r/bAS4g0
 0WE+eDniP6B7sPq7MvKj0ZrNKuP/Q1XBOtFr3YYhWKpKBU1V9hNyQvTbtwAOtM=
X-Proofpoint-GUID: h-yh4cCjgH0VPm-9ZoaY4Uyb0wTis-uN

Fix alignment of continuation lines to match the open parenthesis
on the preceding line, as flagged by checkpatch. Collapse the call
to rtw_ieee802_11_parse_vendor_specific() onto a single line where
it fits within the 100-column limit.

Signed-off-by: Jules Debbaut <julesdebbaut@icloud.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index f5a6f6e1c..8ef12222e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -107,7 +107,7 @@ int rtw_check_network_type(unsigned char *rate, int channel)
 }
 
 u8 *rtw_set_fixed_ie(unsigned char *pbuf, unsigned int len, unsigned char *source,
-				unsigned int *frlen)
+		     unsigned int *frlen)
 {
 	memcpy(pbuf, source, len);
 	*frlen = *frlen + len;
@@ -702,7 +702,7 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 		*len_attr = 0;
 
 	if ((wps_ie[0] != WLAN_EID_VENDOR_SPECIFIC) ||
-		(memcmp(wps_ie + 2, wps_oui, 4))) {
+	    (memcmp(wps_ie + 2, wps_oui, 4))) {
 		return attr_ptr;
 	}
 
@@ -766,8 +766,8 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 }
 
 static int rtw_ieee802_11_parse_vendor_specific(u8 *pos, uint elen,
-					    struct rtw_ieee802_11_elems *elems,
-					    int show_errors)
+						struct rtw_ieee802_11_elems *elems,
+						int show_errors)
 {
 	unsigned int oui;
 
@@ -911,9 +911,7 @@ enum parse_result rtw_ieee802_11_parse_elems(u8 *start, uint len,
 			elems->ext_supp_rates_len = elen;
 			break;
 		case WLAN_EID_VENDOR_SPECIFIC:
-			if (rtw_ieee802_11_parse_vendor_specific(pos, elen,
-							     elems,
-							     show_errors))
+			if (rtw_ieee802_11_parse_vendor_specific(pos, elen, elems, show_errors))
 				unknown++;
 			break;
 		case WLAN_EID_RSN:
-- 
2.53.0

