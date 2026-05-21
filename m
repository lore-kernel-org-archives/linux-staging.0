Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4903D45C8
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368648; cv=none; b=Kc5cafv4ETgyZzlhluOMUF2Wd+w6m9qYskpGhfDphfGXfCOrazQpjhY/PtZDcBSB+L6ZtBeloQBAdf1HbX/v6BXqAkN2pdCwAT6i2eJ8gQT90ey44ura4uCJ+N5YZ2bzzPvIDvPS/BWVB118Ix1X3lwziqSMsv/rrT5Lba3BTS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368648; c=relaxed/simple;
	bh=11XpadIVbnWDgGbnLsDIYuVi8q6V/iekBQR9d9ytC84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=td/J0Gw6gK8o9EqOfDj2vCJKB1Gl2rzfqT3LwAcdocbB9xE8Sxa4MZFDWNkJANj6HjMDXHFGK8eMWF4s1jjYja80teub3fHV82odkTzUyIlRT/UTmtFb4El/tt8KpZ58EicaBo9/e1kzOdQsy4xstOO5cNhWVHcowBLyDo1t7mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OptjD7cp; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OptjD7cp"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8f97c626aaso1173368866b.2
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779368645; x=1779973445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMhZs4Eu6gRgBabm++8DBCSAa+Wm8K3ZfuFNhzHSur8=;
        b=OptjD7cpGsuZxxXklyib96IybxklcHofHGbFhhkqdCoYpsOYewnSIeSkOrBHp8CLqV
         3RZFLT9ivNduKJ7jeSm1f2KCTIgn5WQOaTtinJILisvXAqunpO+Ik0N7OiFGvn0chpVz
         bArFtgbVjaKO+xYqg29sVKNkd5v2Oh3c9LNPqVRng9N+6CCSCP/9PeDOUgsqyps6gvVa
         3+51fo8NFEkgW8GY5LhBx9cr1sIfpaoSbaEkyreFqJeMKhzRD2g24WIVOBUaytRGy3cx
         iY8IPxkmahD7AI8v23Z3d/k5ocniyyOU9HOwjPJUq+7EF64xOmLt6v5VEIck1OBryJVt
         VlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368645; x=1779973445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMhZs4Eu6gRgBabm++8DBCSAa+Wm8K3ZfuFNhzHSur8=;
        b=eu5nwX8IFJ2pAEmhgYCpVNAW8BS/eDijGEtshy/KPLN0y8PKnyl93HYatg7jw08LLV
         TU/sF3qfcxvnLNDlkqalMtyPG6zCY08RhLMw5Dc4WpvjCaT244EavGukjwwge5i/7Bp5
         yLSJ0qazWQhYQP1XDlASwt5GyNrkEkCj1i/oV/CKJgVA91zggLjUXl8boozDzb15q8wB
         nhbIO8tbPKFOwg/iVjyRnYd2b9LNrAjJdAXdXFN8foV72rQ932qA6Sc1eGOxY06T01X5
         h/DCri8sLD9BmrdbNxQ+/2/40FTsNKY38GTxcI80PpYWsI6mgiZaFtYF5zu92lAMZGv4
         aMWQ==
X-Gm-Message-State: AOJu0YyRP1/7oXhUbgBJGbgmg/BQvKO5ILLHBVUSWYKi9/IKnB6zDHn2
	h5uDjGdpVpgPwF+Tpe9uHXrlxhEjw3YcSgpTEdy0scCSVcF70V0288lk
X-Gm-Gg: Acq92OFQqJYep9GQi+CFu+el9ykYlbxN+luufokgXw/7v+Yu1MvWHz56YkNgMNlk4XU
	id3xspM8gourAlbzFfcetCvO24bSnHwb4jm/URYIzgFewm1CuA3ZZ6SRiTW2NKiVIFqlSKtCggf
	49F8BEI1U64cgEKzTE8jUpyC24pskLkJZ8VSgdyUDcNhypTvZSWVhamnG/bWApjdP/xZsqC/w06
	NOojiDF9ME5bWyBpYz5TjBKt4S6xP1BV+fJwsJ7e78FUEh/9wPjW7/33nlCRgnWF1CVRgpjv7Bb
	kAbSFpqPiNiAjGd7yKr3IM/XUsZVEVnJa6MN8r/5k/F3SGdVhMyzgpr+an3vTXCp/Wbk0hv3nw1
	8jS0dtWu3TwE3FXAI2C7xFfBoG7Wu8vAeHXqH7Lu/GMqrEBr5EhK67rL2YqKaJBAbO9RvSCFOvc
	SONRlor0FK7FTG5Dcqox78RIWPOXMjGH59rCXANxqJ0t0HUF84gBwmxLdRqotBgMUDMY1sHL22I
	FNkG4e2SppDCBtaWK9JVCVRiRB/5Qy1YazBGClhDFn3WmbBSWQOCyAojHoDJjQGG5foFRVqy6dd
	gCoTZYhRXGXPrqf/+fZZwxgwuiZR
X-Received: by 2002:a17:906:fe05:b0:bd4:8bb6:3d52 with SMTP id a640c23a62f3a-bdc1564035dmr156822366b.36.1779368644437;
        Thu, 21 May 2026 06:04:04 -0700 (PDT)
Received: from ahossu.localdomain (ip-217-105-56-94.ip.prioritytelecom.net. [217.105.56.94])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a505905sm43766266b.37.2026.05.21.06.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:04:04 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	stable@vger.kernel.org,
	hossu.alexandru@gmail.com
Subject: [PATCH v6 4/7] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Thu, 21 May 2026 15:03:27 +0200
Message-ID: <20260521130330.754181-5-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521130330.754181-1-hossu.alexandru@gmail.com>
References: <20260521130330.754181-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HT_caps_handler() iterates pIE->length bytes and writes into
HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
HT_caps_element). Because pIE->length is a raw u8 from an over-the-air
802.11 AssocResponse frame and is never validated, a malicious AP can
set it up to 255, causing up to 229 bytes of out-of-bounds writes into
adjacent fields of struct mlme_ext_info.

Truncate the iteration count to the size of HT_caps.u.HT_cap using
umin() so that data from a longer-than-expected IE is silently ignored
rather than written out of bounds, preserving interoperability with APs
that pad the element. An early return on oversized IEs was considered
but rejected: it would bypass the pmlmeinfo->HT_caps_enable = 1
assignment that precedes the loop, silently disabling HT mode for APs
that append extra bytes to the HT Capabilities IE.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index e0d73c267786..dd34f229df12 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -936,7 +936,8 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 
 	pmlmeinfo->HT_caps_enable = 1;
 
-	for (i = 0; i < (pIE->length); i++) {
+	for (i = 0; i < umin(pIE->length,
+			     sizeof(pmlmeinfo->HT_caps.u.HT_cap)); i++) {
 		if (i != 2) {
 			/* Commented by Albert 2010/07/12 */
 			/* Got the endian issue here. */
-- 
2.54.0

