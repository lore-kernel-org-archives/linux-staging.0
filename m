Received: from outbound.st.icloud.com (p-east2-cluster2-host11-snip4-10.eps.apple.com [57.103.78.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46123246FE
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 21:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780434301; cv=none; b=JcwqgLdXHe9f8jahrT1CBUoKw7w/J+Siqr3B64Mwc4XenLy8N0jQ97EEvGpjIoRAYrh7jrCB3tunuN+WtgIiIz1tiDgvX0ROec1+hcbgXObnqH4ueRfDjgCGZBSkoXAAnWIDvGlBjSpEL+Nwc/Qd8z9V1bK9ywHQrDdJTApPPeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780434301; c=relaxed/simple;
	bh=KIxfHYpTC9JVDUJdSzvJr10PfNkEifhSx8yAQJuEWus=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kxEG/8/YRFDuN8bqsW8dYyjkA5Px8ITQ3zFAiAnkREBU+KIHxmppr1IjsY3zBq5gpr4PH+5jcE2luv1s6FUYfKmjQPKtnjJZXzeC6e8G9DdBajPWmzz1uqqOEUrBzJJIxW4qSg8rgRObDkt3ezuGng9EURd01YX6rF04d4is/Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=TrdQ5Qtd; arc=none smtp.client-ip=57.103.78.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="TrdQ5Qtd"
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPS id 235491800377;
	Tue, 02 Jun 2026 21:04:56 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQBLHVQFRQNHF0kEWhcOVk1TDV8IRA9XElsZRhl3AlEcVg1XQ1QEX1BfHA4EVAddBV1WUAJaS0ATBEsTBVIHXU1WDUcPWB5cFBcLR0NeCF4fTBwdDlgGEgBNCg42BlkFXglWA0MFNhIUXUVaDlsERxQXG1wAFwZbFAREAV0FXQJGCUoBXAdfAkcXTABbA0YGXVMNXwhED1cSWxlGGXcCURxWDVdDVARfThkMSh1SVlsTVRdGCQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1780434299; x=1783026299; bh=SV2fw/nKgxRnZJaJQc/MUVEiUMv+Z1H04vzQib56pqA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=TrdQ5Qtd+u5yrimZiDi2MUSJ36a27dPpsfckK1HCP3yMG2E0xRnHUirSbGk2FaZhFbY7yivUtkdPqui9woaLf18K11T+CGvO1CZmmzJjnhWdMHK7v+6p5BfsbLZO7ce6eAGhWQNo82d+1M/PO+n4XoiqpZeemyAel7xQabxW2qxmTP5L8eu3AKd6coKEYDSQ7UyydKpn7cOetAoy7XXjhyeUeDJ/o+lpNccMGIbrgYzyUgnWBqkAFC6b2FddO9btShGH4YTOY3tL5stRd79l43Y+3RATvkEJf/AXl4cUK+OXL10Fd3/1Uk/79oiOM1tLICuCovpGVdg1dl2GoMH/Cw==
Received: from DESKTOP-MKLAF7C.tail7ab390.ts.net (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-20-percent-1 (Postfix) with ESMTPSA id C4D061800A8F;
	Tue, 02 Jun 2026 21:04:50 +0000 (UTC)
From: Jules Debbaut <julesdebbaut@icloud.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Jules Debbaut <julesdebbaut@icloud.com>
Subject: [PATCH 4/5] staging: rtl8723bs: rewrap long comments and remove dead code
Date: Tue,  2 Jun 2026 23:04:06 +0200
Message-ID: <20260602210407.4364-4-julesdebbaut@icloud.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDIwNSBTYWx0ZWRfX/cz0LMnnGz+X
 NUACyGjpcOHPfIGAPOjBFlPNdUm5SgGTFoVPlyYEl0OIejw3aT/1GX2+TzUJ4TFSIthUjKc8GqF
 R2XIuV9D0k3rJe+mIPOGYxEKeDnTCZFRzykMFnqXQC98Ux4P4AU7i6VF7AN2YVKCJK/sRmtNeoa
 jnUrpimsksyI4NHzo1Q2seK56gm7KpDtgFcrQhjVlKESrlVzjcAPrr4ui2LLvqoOYgf+vor5GZ7
 rJ3mUEtX2Dz85UzjgDOELXOmMPuksEbkselSO1y5ocwYEjYDcTpBETjIQZSkfvMquVJaL85wAJ9
 4nqYqBx8QrdkfoJfNgAuVxSeD1AplhBWfXx1JYvHeC9tY+6y87cSQRxIM+Pruw=
X-Proofpoint-ORIG-GUID: Ij3yE-wqPZVz2MZHBvq14DwIwtSS3vgv
X-Proofpoint-GUID: Ij3yE-wqPZVz2MZHBvq14DwIwtSS3vgv
X-Authority-Info-Out: v=2.4 cv=M8NA6iws c=1 sm=1 tr=0 ts=6a1f4579
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=FelO9ux0wxsA:10 a=x7bEGLp0ZPQA:10
 a=PddA0_aAOYkA:10 a=VkNPw1HP01LnGYTKEx00:22 a=v3ZZPjhaAAAA:8
 a=BOuQ3Wj6YcDV1aObVx8A:9

Rewrap kdoc comment lines that exceed the 100-column limit.
Remove a commented-out call to rtw_set_ie() for
WLAN_EID_EXT_SUPP_RATES that is duplicated by the active
call later in the function.

Signed-off-by: Jules Debbaut <julesdebbaut@icloud.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8ef12222e..7cf014e25 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -168,7 +168,8 @@ u8 *rtw_get_ie(u8 *pbuf, signed int index, signed int *len, signed int limit)
  * @eid: Element ID to match
  * @oui: OUI to match
  * @oui_len: OUI length
- * @ie: If not NULL and the specific IE is found, the IE will be copied to the buf starting from the specific IE
+ * @ie: If not NULL and the specific IE is found, the IE will be
+ *  copied to the buf starting from the specific IE
  * @ielen: If not NULL and the specific IE is found, will set to the length of the entire IE
  *
  * Returns: The address of the specific IE found, or NULL
@@ -330,7 +331,6 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 
 	if (rate_len > 8) {
 		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, 8, pdev_network->supported_rates, &sz);
-		/* ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (pdev_network->supported_rates + 8), &sz); */
 	} else {
 		ie = rtw_set_ie(ie, WLAN_EID_SUPP_RATES, rate_len, pdev_network->supported_rates, &sz);
 	}
@@ -687,8 +687,10 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
  * @wps_ie: Address of WPS IE to search
  * @wps_ielen: Length limit from wps_ie
  * @target_attr_id: The attribute ID of WPS attribute to search
- * @buf_attr: If not NULL and the WPS attribute is found, WPS attribute will be copied to the buf starting from buf_attr
- * @len_attr: If not NULL and the WPS attribute is found, will set to the length of the entire WPS attribute
+ * @buf_attr: If not NULL and the WPS attribute is found, WPS attribute
+ *  will be copied to the buf starting from buf_attr
+ * @len_attr: If not NULL and the WPS attribute is found, will set to
+ *  the length of the entire WPS attribute
  *
  * Returns: the address of the specific WPS attribute found, or NULL
  */
@@ -737,8 +739,10 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  * @wps_ie: Address of WPS IE to search
  * @wps_ielen: Length limit from wps_ie
  * @target_attr_id: The attribute ID of WPS attribute to search
- * @buf_content: If not NULL and the WPS attribute is found, WPS attribute content will be copied to the buf starting from buf_content
- * @len_content: If not NULL and the WPS attribute is found, will set to the length of the WPS attribute content
+ * @buf_content: If not NULL and the WPS attribute is found, WPS
+ *  attribute content will be copied to the buf starting from buf_content
+ * @len_content: If not NULL and the WPS attribute is found, will set
+ *  to the length of the WPS attribute content
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-- 
2.53.0

