Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF972264D9
	for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769522710; cv=none; b=GgfHJXpGPgZcgWypjuclXxpAluCOGHX17RYmlVJw4VZJNjzP86IHFc0YPlUHi9qNnBHsFrsZzulIXPqhE2JV2G3kP2uid/GqyJBU7Rw2KZUiRVmGBXl14krOjmH9D/CPTgtFehdKtMg3nrLfF1430j3XUwgTu4QzHw7ItyMrvgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769522710; c=relaxed/simple;
	bh=655UvxMRguw2aAaTzYvfJJNxvJLZI/EmdBtcz0USCeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bNSv7WzMxe1gWVeVovA7ylGpijLK1/61GRGwGlALgH4twM41Kr3Qmdq3hniRDLaPtPIbHBHQNtWeS6kb9iVaRZAQ7IBOIQH1jr911GZK+w2YpZVK//Xx9CdbwWdmOYEpMNnepG6gqgZ3GtAxHUoTvHcZmebX50AdSZWQyrfhf+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LnlF1quP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LnlF1quP"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43590a7115aso717183f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 06:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769522708; x=1770127508; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgcRp9B432K+sOYxf3IVgedVtOmSi4o6hwdp/Nxlp/w=;
        b=LnlF1quPhek4GOzTya27pn5wCDHxoA8KStWgiQKaIcMUVnojW0KQO7ZA5c0lbjFTtU
         xeLbQVXjdtEJYItisQAmVWwJmM/ttdGuNyG3+zTQV45CLjvo19eTaTx092fN/+oLwSXx
         zll+hn0KdfpEESQlA1/GUDR9ZdIb6KM3frllPTANtLOBu6cZQED+9VszSxlK1Umd22ly
         Ef5gDfuOijH7WMMVZ1vsl5WInPA8SMJK9zj6K+rpQfggbw5hTiDKIJZ/cXOXo40+XZKX
         wPDqpAChxX0duxCPVCa/4t1nc/hwHGFEXgFXlzpnL4N+Tu99fOcg2jKNWjA89nN51fAc
         7BdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769522708; x=1770127508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgcRp9B432K+sOYxf3IVgedVtOmSi4o6hwdp/Nxlp/w=;
        b=C7CZW3nEn+xgNV/DFc9jmYt2z30vB+c+rvrwxHBWt02VYm3ozSDbmT8kCrNdsSdfae
         v0b5r0N9UFZ22bddcDDkmihMdakC4MHgj6+kFSnBSv6VyKsaiqSukOszJBe5IIUPMYij
         OR2vIqkzxbIjU+Gqhd9J3hfU3FT8jEhBc5xX7GamWj1UHrx2ZOvQMzTy2SPPlXuhl9x2
         vHDK+1b98eSWmgd/fDxeXcqoyWciu/MA9YB3jrATW024No0o6btL337hZuaTbnfqqg/u
         2dJrneM15x+94FV/6Gmzy9iSRheYrupM93g+NbqWHME8HVE9xgvpsU9K+OwVIiiuyChf
         ql4w==
X-Gm-Message-State: AOJu0YwKvutPwTXhyLowwOhCILO+rlpOS4ahcCqCOQxrMUWMYMhZBFK4
	MLjCTzABn5QYWtjghAgA+Qywd9G8vhkuuyQk5j4cTpZ2eYec3Qducx02U8TEKFwU
X-Gm-Gg: AZuq6aJYlyrexjE+heQeRPrR77v+obt+RnxIxEbCD6opCgLQgHpx46izcioSGMLjTT6
	A8ekTJURDYsyTsjAZ6FbEZSXzDYdo4DtNEuar5YnfmDe/j5wHQdTJDl4Ia8YI7ViHXutw8FGgyH
	ufPrvTbvExgNVCDYa1IZCIf+fAxxGKWefWxPqrzc0i15DCOqv3FRZ6dAupr4jJoFPdihXWXRXcl
	AOZt2AZwwTnibebylCoqHZVljV0TExdxZdH2EIaKXScY6N9OyralpIPV9y6WPdCOOm7DuZ2+oww
	6Oq9yZlMzG5fV6r+F2eNYxbtJkXVxxuRL7YiEndOpLwjQnIJhJPw5lKgVQAmj+5QVyLC0sCFSJU
	7nrWgozNRLcfcMxp7PSSDj3MOHxwtVl74cGq3WNDLDfDVxA9aQznXnpqQ41OvMd3YWbquSo4ifj
	ctChDEmsFKLcArsk7yc3Y=
X-Received: by 2002:a05:6000:26c7:b0:435:98c6:7f03 with SMTP id ffacd0b85a97d-435dd1d4260mr1491771f8f.6.1769522707452;
        Tue, 27 Jan 2026 06:05:07 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e71503sm42472159f8f.25.2026.01.27.06.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:05:06 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove trailing whitespace and parentheses in rtw_mlme.c
Date: Tue, 27 Jan 2026 18:04:55 +0400
Message-ID: <20260127140455.52887-1-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 98704179ad35..555d00da0456 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -710,7 +710,7 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 	rtw_set_signal_stat_timer(&adapter->recvpriv);
 
 	if (pmlmepriv->to_join) {
-		if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true)) {
+		if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) {
 			if (check_fwstate(pmlmepriv, _FW_LINKED) == false) {
 				set_fwstate(pmlmepriv, _FW_UNDER_LINKING);
 
@@ -2018,7 +2018,7 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	return ielength;
 }
 
-/* Ported from 8185: IsInPreAuthKeyList(). 
+/* Ported from 8185: IsInPreAuthKeyList().
  * (Renamed from SecIsInPreAuthKeyList(), 2006-10-13.)
  * Added by Annie, 2006-05-07.
  *
-- 
2.52.0

