Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F871F16B
	for <linux-staging@lists.linux.dev>; Thu,  7 May 2026 05:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778131284; cv=pass; b=QjRdmsa6I4Zc9PturRqhJMI70IzdCtUr3QDgdt1vYeZYK28LbkU306gJblf4sJg6nBpGBthn1X1Fen6DllO5wn2D0CCkGpoFbQAi2x2FOIRIhh/k0tp15PNwiGABnAL6Ausf7WART9im9iE9ptUWDh/HuHNlqT/h+VoB94LXRls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778131284; c=relaxed/simple;
	bh=qyQoSLW2V42H7MGUJY1ZIWKriitvmZCTdXNSDkur2L8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=Zf7wCk8kXPI53z1YDkV8aW1WdkRQ/MrJd7uesudV2KeZqiJ8lKerm6IEzk1JQsn8zh5Yt5f2t2acRK9dbDfkHbapBQPQhnlxuTQkbsWV4lKHRLKtUFjkjHtImSVcnf/THRX0dPqZv0iSfkAFTcejs+DMVzpbwY9g3fiok1tm8UM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=WcYdr8yI; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="WcYdr8yI"
ARC-Seal: i=1; a=rsa-sha256; t=1778131270; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=KoFB2oko5qKhYDH43xVlF80nu2aeXHiezQNxApJ0ebMpBWUoCh4hrLzuMfG6H1XdB96R/kN3xfT418r/hQ+RV4T+TAXG9Yi/WG4ZKQpambm7ylqfEsD5TG32yD1VgjzJRhqwjUcAHJlbjAs4liIwi+wDBe0T1P/6T9Aza8PpSqs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1778131270; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MTJXJEl//2Ydjiy1UgO0X1+nAsYw1Bm5PY2RhodvAjk=; 
	b=PKzR0smC1UB3MFV5X5/gx361KsBGdcdeWAEYhD/6lH2ZY7/avva0GTqxDhoJHSSfj0dLcFWfxTEvCfgs/2NhlFX1VhUy5QD9ca2HJpp/IYESCm4DFgA8OpnlHWUjRDhnmlR8QeQak6POWvK9E3TheA9T9AnMVMalDIgHXHEBJ0U=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1778131270;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=MTJXJEl//2Ydjiy1UgO0X1+nAsYw1Bm5PY2RhodvAjk=;
	b=WcYdr8yI4hbW3wco71YakVDp5PY15QItgUxACS3KmckME/2d9zJi8pfRyIWK9mBM
	7RJ9qR757FfkTQ8FUAMxe711Q2bQrXHu+tz7oPSbHEDc6SRwx5rpaVlI4Jfvn8HoAKb
	btsFH1ZNjiYd5mzr28P0sH2/+phe9gyTrULLlNH4=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1778131268290154.48732202567624; Thu, 7 May 2026 10:51:08 +0530 (IST)
Received: from  [103.164.208.221] by mail.zoho.in
	with HTTP;Thu, 7 May 2026 10:51:08 +0530 (IST)
Date: Thu, 07 May 2026 10:51:08 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-staging" <linux-staging@lists.linux.dev>
Message-ID: <19e00e1f2ba.31c276864378.4102205719868900596@zohomail.in>
In-Reply-To: 
Subject: [PATCH v5] staging: rtl8723bs: remove unnecessary comparison to
 true
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

Remove explicit comparison to true in check_fwstate() call and
add spacing around the bitwise OR operator to improve code style.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
---
v5: Removed git header from email body. Fixed indentation on
the second line of the function call. Added full version history.

v4: Moved changelog below the --- separator. Ran checkpatch.pl
- no errors or warnings. Fixed whitespace per Greg KH's review.

v3: Fixed double --- line and corrected whitespace formatting.

v2: Resent with corrected whitespace via Thunderbird plain text mode.

 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95a73..c100a0d70fe2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -151,7 +151,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
+	if (check_fwstate(pmlmepriv,
+		_FW_LINKED | WIFI_ADHOC_MASTER_STATE)) {
		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {

base-commit: 26fd6bff2c050196005312d1d306889220952a99
-- 
2.43.0

