Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D39DF42
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 04:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753848263; cv=none; b=qXUsXzFRoNFuIw9Oga6Q8l/1EWBgy1h4H3WKchnf8MgISXVmnEhkcgfC5MmvfuKEwh9Z2DEco8yerVM8k8ca5CKbbPX9z1uC5n+JtyAqO4WXPzr3sNNo35Ft2GDcmH8iMN6E8jihIRFSJK9W4lY3QWjiClGFjEaiuAwbNMZSfcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753848263; c=relaxed/simple;
	bh=WO7h7ptNQ+0Kd+IO3No6V43g//yPa9vBMPwtDSJ281A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DnjQvkWnI3r/jUrZOfYiy6maMG5oqEjogmvJBV2BHIG9NEO8eJ4cFvphKvLYfIClu6uqwDFayZZ4AWazE0lWVnb3uVueQDhkSfupZQG3AOYBf4rgKOTs2XJ2nv7o3rkd2CbZ6+G42hNKZvU2W0uJstMho+ciQ2lxgapfOPyAAtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aplVYcxQ; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aplVYcxQ"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4abd3627e7eso91466711cf.0
        for <linux-staging@lists.linux.dev>; Tue, 29 Jul 2025 21:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753848260; x=1754453060; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4a9sYy5/UHt9zQbhrCp+lFdkLTN7GRIjDcgOwX7XLc=;
        b=aplVYcxQH0JsGKAFb93w2FEC+UQP3vvVzaNMWFDB8jgox8Z1gS6zVLhK/55tb78TBg
         Ka98BDmbi/CHEZZupHarygSwyGaSI4E55m+yU5W5ghWYh8CgjdVZwMpZA8I+lFbds+yR
         RHw2m+uYL+GhxLxkdzpAWSd1DHy/shaul3ocv1Z3Spyx44pBi1YSfpwKKcsCEiotV6VE
         HOoDO3+xKYH7hTHu8+llexV8tCp9axjYxbDUmde2v6EsAybO/zLW7u3FTrmPYDNUoOdh
         eOxgMgj2IXo1pSp6Uf0sPKRM2+KQlkNYl+AYo7Hypw5LWxz4Lge/zuy89lo+hK/6Hxwx
         nlhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753848260; x=1754453060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i4a9sYy5/UHt9zQbhrCp+lFdkLTN7GRIjDcgOwX7XLc=;
        b=nC9iPHVe72xnjOtB+ef+HVnfWSTovlz/PdBs+beSaEMtP8OTaRtaStsEEOw8yjjmYd
         cNqcn7pEl8ZUE+Lo7SPFy2TI37eHFsy/O9GNj0JhV3s9Qhy2vYBnC7TAF1HU7Ti7U/Rn
         K0NW1bRsLlNfnB8vvjd5FZYAf3J0NmDAIVmoHDsyoeFjmSfEol4kLzbP2wTXmPqeIOaQ
         bhszvaTS7B7+grvxnfzSAY8dy23Yd5t17rKXTcgWidQHf452DzN5laJT4qsJrAxkpQ4Y
         qwpULzY80/4f0lLHxvsklUMPkQeelCWlEhXVVYucdMuKxzosQ/53BK4yPmo9Ronu0jsM
         BpkA==
X-Forwarded-Encrypted: i=1; AJvYcCU2oWMFwSNqiEM2a+tjiNMaeFBnz32PmQsE2+bpMuhYFzWYED0iIGDWdFXuQGEKPqUneDdJlpsC0Pj2F3ej@lists.linux.dev
X-Gm-Message-State: AOJu0YweaX/AZ/zhBZ3B2ZaSlRvhz79nUxN4wXpdo5tnVqKZpUwaiyDc
	3q09rBcZL5QI0dIfgoudfk3P7csgnXUfgtAzezx0b9bMDe9Co4pIOhyF
X-Gm-Gg: ASbGnctJ52Tlua5sF1/C6fqNqlmvA0HuYDfeaDbJh+rfSgBscy+IDc1yjFh9hWKhqkW
	BbA38U8tf9VHUHXm5uNFS/QpBUsWHUoJZiFvRXTWhLIk0Afapq/5h2jYKmvaQso5Q+6gFwvxmQf
	br15OUf1duuBtUcgouWHbirD06Ro4bJsaHNKGET1MQQqPzxsEkGzCTrooNGINOmdrhKoB6Ohilq
	YhqcTbE+uDwVhcZ8u0q+gaGmVqJzaHaidOYgm5SGxRpeWNCUi5Wn9FeeGNUFdMtSGgy62ckd5We
	BrzAoetM2fJXgncsr7GBrt5paIEUq/HUYFvignFTCxuvTpTVoXbo9wgtWA1waZsnygnOHbLkoSg
	SH3O6r0VvGuKTahkEE8J9rvpeveuoHmI07bBw48mNLhbvsuyjJKc=
X-Google-Smtp-Source: AGHT+IGj5tKV/3vzPEMftmSFFMwZvypQkE6wxk4J02+x+4t8xFQyvzhizYqTcghhmrhKkbZNHTeITw==
X-Received: by 2002:a05:622a:1819:b0:4ab:5651:3fa0 with SMTP id d75a77b69052e-4aedbc5cf33mr32039031cf.28.1753848260178;
        Tue, 29 Jul 2025 21:04:20 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ae99671b3asm60056091cf.58.2025.07.29.21.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 21:04:19 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Markus.Elfring@web.de,
	vivek.balachandhar@gmail.com
Subject: [PATCH v2 03/20] staging: rtl8723bs: add blank line between rtw_roaming() and _rtw_roaming()
Date: Wed, 30 Jul 2025 04:04:02 +0000
Message-Id: <20250730040402.488284-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250728043628.421849-1-vivek.balachandhar@gmail.com>
References: <20250728043628.421849-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a blank line after the definition of rtw_roaming() to separate it from
the following function (_rtw_roaming()), improving readability and matching
kernel coding style guidelines.

No functional changes.

Identified using checkpatch.pl.

Changes since v1:
- Moved the '---' marker line below the Signed-off-by tag as per kernel
  patch formatting rules

v1:
- Addressed review comments from Markus Elfring on changing the description
  of the patch regarding readability and separation between function definitions

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 24e505111f1f..b1a427a655ef 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2449,6 +2449,7 @@ void rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 	_rtw_roaming(padapter, tgt_network);
 	spin_unlock_bh(&pmlmepriv->lock);
 }
+
 void _rtw_roaming(struct adapter *padapter, struct wlan_network *tgt_network)
 {
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.39.5

