Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0C28C854
	for <linux-staging@lists.linux.dev>; Fri, 22 May 2026 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779410774; cv=none; b=AfAQbmOd4SKMyBAL8wN4bt91a/54lk+PwkjeYq9WiPFt5X23+JRe9sewBIti4uIdjvqXV+TYCZHpaPNdjuD+op/q7W+3gz4cyiFYhNKmXoHy/Fs7LVEiHLnfV03d4zl46tTFHCD8NlHuTURZ/PKBrkAtCeacB7UAXBs6tKPyEmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779410774; c=relaxed/simple;
	bh=HrGZAnQwY9MJbd/wv7fd5eZFlQP7idEHOmDb1AkwUaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AtTMBkkVUEDATa0WsnKU9DpAGHh0LxCdhifexCFYfNNNfDaGZMtHylo32sS2aMC+FZxkCdDCR7ETctHaBmSOC/sJn/cdGLCi2tWj97sSJp5wUVj++kMFqGYBayWx+/7lewGU4/hpqZQdQKMvR556xdxug0ulvxhLzrcvQMyw8EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTGWG4q7; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTGWG4q7"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-67fd8befac7so15226209a12.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 17:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779410772; x=1780015572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuMzZ0oPIB63SQlMEwBPtCu4kk4sfKKOYS1JICO/Nwc=;
        b=RTGWG4q7Woz58GJ7akla1JEix8Bgm6xpQ2RRXL4lh3Zw+K/ibfBbiUl6UEA+IjxLDI
         dG27AgzfEgHOrZkW+c1X2iCq911wPlgsL+69k5X6FUlkYALx0FMEpk49mrCCfwJGUSaU
         p2lWmjSh1eCLw5Z8OfXBiqrqwKLzwgVcXvq6b7RCAbIE/ZuO6sFrIjnozqcZ+rUIuCyS
         Bep1U8Volm8QXhqKiOFirDHA1Abbbhmi6OWcpvR6LJSi64hNUzpLt2BIm47fjskjkLau
         wXFUl+NAznSVkafmQR3GjNzNJukPV4betE1MCEOVZciVYL6xlXGksMyN/bZnudDIblAf
         hR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779410772; x=1780015572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuMzZ0oPIB63SQlMEwBPtCu4kk4sfKKOYS1JICO/Nwc=;
        b=ctSUmP317maOb2jFuM1Qetqge/2EgCGKm6QCZpd4yI+7k4hmmzvs9MtxBItOcpuuAX
         jgNYZ1Azu03avKP5GlwCn3Kw/O4NUxYbprS0HNm7XQuTo9uDhsCOAtEDGuAyo78oK8H/
         566ymlkn2QdMBgvbTHbKXudc9cZRgbG+p4rwlRX4KUuCRB3Uc5LKx7FrjunsThXhAXvW
         823cTycADfEMY/oFK6nf1erUn25KVVVTNo4+0ksnThBSWfznYs8hYbnbr+2qu1z+THZm
         ZUtq37dilE/SQVB+J74iFw3GhDYOSMS9mEHyiznemkj7LmnjRQX4PJuPao3h/n0nx3LM
         zzWQ==
X-Gm-Message-State: AOJu0YwgGyhKLfFKrSv9sRSOw3k8oIn0V0r589BLHVoV8VJrNw9aQWGh
	MO3tSeepnNvaLvdOWcV6H6BMIDKVZkuw2R2WuX/WpZDY/DggF1R0mWDD
X-Gm-Gg: Acq92OH3nWqcYDui5tX1PbRFV17tqjLI7BHyESkyIba1jZ3Aoqre3MWJYC0S0UAQouk
	i3/PkdOWIa7efZs50DjJlGEU4hFdmZWmwBoB0tc5YuKUF418FuiHnfZKRLPupsf0M3bFGNs1Tzo
	a3RhRL0D4a32QsnrjnDirPMMlcCvgOcXx5nnwlEcqtVkqNjescseICkxds/xOdzMmrQa6miOAsk
	L8Mv86fBuBoyKk1qmeTe80N+y6wOHmc333Cdui9ccbp1IXeEjhhTGsQhPD/TXoCz/BLf785TSzh
	Sk6x+zArEvE55JuuA9B3zk5VYYeTTy8o5woUOvpH/HJEWEi17ov3bpoxRa3o7VoTmONizQZrYkk
	q4OmeSeFdkmaEnbIomguMk+Vg0w+PocT60ySjDK4Q1f6kZDoUFr2MIEZ6vTOMN/EEXe6U51hVTz
	9mU3dCO8RAuf3x+70ZsVnPOzaHGROb8KWr4bhnsH/RBb7gBxUj80A+VQJRj/4oqCzs0oFELV/cs
	mtzWdZdrHv4/nvRimJuwDbh7qatAFmqA9EgZfCGW/KCfNXWh1uuQ1Se0tzkhVDsiwBUbwIgC6n5
	xEbFxN3KtEm/d27J/q8iMDX0v/xz
X-Received: by 2002:a05:6402:4495:b0:672:bdaa:3e75 with SMTP id 4fb4d7f45d1cf-6889c432190mr513119a12.9.1779410771911;
        Thu, 21 May 2026 17:46:11 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b72cbbf3sm3535a12.0.2026.05.21.17.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:46:10 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v7 2/7] staging: rtl8723bs: fix OOB reads in IE loops in issue_assocreq() and join_cmd_hdl()
Date: Fri, 22 May 2026 02:45:26 +0200
Message-ID: <20260522004531.1038924-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522004531.1038924-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
 <20260522004531.1038924-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two IE parsing loops are missing the header bounds checks before they
dereference pIE->length:

 - issue_assocreq() walks pmlmeinfo->network.ies to build the
   association request. If the stored IE data ends with only an
   element_id byte and no length byte, pIE->length is read one byte
   past the end of the buffer.

 - join_cmd_hdl() walks pnetwork->ies during station join and has
   the same problem under the same conditions.

Both buffers are filled from AP beacon and probe-response frames, so a
malicious AP that sends a truncated final IE can trigger the issue.

Apply the two-guard pattern established in update_beacon_info():
  1. Break if fewer than sizeof(*pIE) bytes remain.
  2. Break if the IE's declared data extends past the buffer end.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884cd39ec756..c646dc2a1741 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2931,7 +2931,11 @@ void issue_assocreq(struct adapter *padapter)
 
 	/* vendor specific IE, such as WPA, WMM, WPS */
 	for (i = sizeof(struct ndis_802_11_fix_ie); i < pmlmeinfo->network.ie_length;) {
+		if (i + sizeof(*pIE) > pmlmeinfo->network.ie_length)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pmlmeinfo->network.ies + i);
+		if (i + sizeof(*pIE) + pIE->length > pmlmeinfo->network.ie_length)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
@@ -5324,7 +5328,11 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 	/* sizeof(struct ndis_802_11_fix_ie) */
 	for (i = _FIXED_IE_LENGTH_; i < pnetwork->ie_length;) {
+		if (i + sizeof(*pIE) > pnetwork->ie_length)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pnetwork->ies + i);
+		if (i + sizeof(*pIE) + pIE->length > pnetwork->ie_length)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:/* Get WMM IE. */
-- 
2.54.0

