Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D1531BCB7
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 08:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771404818; cv=none; b=k5mMFVthgOCRDQrSWMmqqxgLsOT365Bu/7qH2vhdUb4CtIMEosnUqqJqQUbh7UovboFyeud3FDSQgQ99AQf2k2197bDwRJR+t/Zd8d/Dc2H6T4ECUpG9ShswiuxGbsn1mf7k7x2PK9zeHpBlhltGScEY7M/GzDxAP3by7UiqLuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771404818; c=relaxed/simple;
	bh=qeSWKSUa3FT+Q0B2EwgstoVvy/Nc2fDqU0KAzCwBovU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sik1RJ+UgQprzduDjwawddyFgvnX1W/Tp9YpkUrpeTEcE8nfHY+st+ThHQl9LzE2bVZPkSbBERGgS/ViSBktyJdbxT2vpoOZVAk0hBoJOy37OtZ5Zjc8d0zdMLX0L37kdBbdZeQfAhr5hqozI6RXIBSgSXft3angNnaVBi0GZTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ynq2Sjow; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ynq2Sjow"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4836cd6e0d4so7867275e9.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 00:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771404815; x=1772009615; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A+ZMsZmGuuNceskjB8AOHcTkdxLd9CqBfihMF80ZWSw=;
        b=Ynq2SjowX6RGr22nV/kZFx/RzBYigGIteUg5UVDrQAOHaLsa9U7TtjRh/THKgMo1UJ
         RKhzqVIRQkuTDixZGcCKmMMobohCfadUvHLIXsbQiZfXLusjOaNITewOW922ZzIeu8yJ
         0JCd+KcnFipWbLx/1UiOeEFz0ZIJClcCy8bEXiQktXA0IBu90HUVZPkUksTOyKrD58ER
         QXlPZZSVbVdioPxfG/UqVNYaSXK22IoqI4SJjM2suMgWq38Obyzfg7QuHCEIKCdT9gZm
         MLu9a+TrulGjeXpBBFfClHsd+PaszHErnQrgRTPO0XTKowE3WQ0hu4HbCwbAIWRuL7sY
         TK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771404815; x=1772009615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+ZMsZmGuuNceskjB8AOHcTkdxLd9CqBfihMF80ZWSw=;
        b=Am7t2wd3vvOb0wTQQ8fT8y/C6hIpaUYxSVWFJZ+PCfD9hZ4t1Ws/hmbihCMIoLwQdL
         5bdeCSREBOeqnw8tIeUwHGR03+0IRluQDRw5SSl6ecZgIK2XZy32AN4mY/puU29ERUaJ
         4uLKTusev+aQdqjhD2ceqXSXrGmmVqTE/DFRODvFS60FuMtQ55MuZOVVLXTCMdKA0XvO
         eEoX5W+jNNZr89o4ViC/aIzwz2z7zIOfSwp0azS2rcyA1PlhUcZbsW3+C+U2L2WWIWv8
         bFqxhbv4OAl4ZD+aOfVMP0GdFCyp3Nnw+BkON2nppJXisCu5EIutlv++VGqr8pqnk0Hn
         0Xig==
X-Forwarded-Encrypted: i=1; AJvYcCUXkjUNqiVx+lemcHyQY13Vp1LGB95oYtYO64IabGBs0Zc++e/sdBer2BaN8fL7gnxBD/BlQZfvfupvHX/H@lists.linux.dev
X-Gm-Message-State: AOJu0Yykc+M2bSvm5ExOtVASh1f5fPJ7JPcmCZeWH/wmLbnQrs/H3lHy
	WgU/q8sW4VRPp+xmEzoRHFJet35Dw3Lds5x3wSnaF4hqnjsRL27/5xpo
X-Gm-Gg: AZuq6aJSIvGkiilwNQxbQiLOyFy0Tw09OTTPV3I4iUZx+f+tVi1OXokBulNDUwyAKn5
	AWjDAgCMOglehMhpzXAaFLW8NCzpEh/JmNKVf0ItONeTnleKtccxBlGPpv5Wb5uWrWO3hA/CFyv
	aT4Nak3AUwf4vP8CkBAlexXtgXOHPbRWh5sQ8pQceGmEWNcvqfcQ4m/mvv7ygurq+bNt3RANumv
	1bkQiKrCHSeItQEeblzSDWyc5mhEoz0AbAC5Wv9ZfAt69EQA0m7haUCxVh0truT/Amc76rrFmRd
	Qp+d+YlQ0xZkinlO2aAeA/2Gl0buuuQeUY54lMT00OizWOoNsS0YHUvd9sCX4/DAhYpDp+SdwdB
	GOTRjQEvPVoutiMk6ihGgXjXOO+PU/IYUzVeXUn7CE7K1e0zIQIXbAZGFbc3eMYn/4g6eDyw9kA
	RWgpnsVY6fZsqMsw0XQHPhf6/MXMrGwGomOMrYl6VD80wXpU9Oxr8jHNlIMVGYaKUk/MVCG+6BF
	BFkQgzINY8+JpR+Z2TCDVJZLyUTS0pvC1JnjvO9FRyOwG6N0Juq
X-Received: by 2002:a05:600c:b93:b0:47a:94fc:d063 with SMTP id 5b1f17b1804b1-48370e38ba0mr174705605e9.1.1771404814987;
        Wed, 18 Feb 2026 00:53:34 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4836aa0847asm643318105e9.3.2026.02.18.00.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 00:53:34 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging : sm750fb : Fix typo in comment
Date: Wed, 18 Feb 2026 12:53:03 +0400
Message-ID: <20260218085302.105282-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changed "programed" to "programmed"

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/sm750fb/ddk750_mode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index 3b25892af713..255cbfce847c 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -74,7 +74,7 @@ display_control_adjust_SM750LE(struct mode_parameter *mode_param,
 	return disp_control;
 }
 
-/* only timing related registers will be  programed */
+/* only timing related registers will be  programmed */
 static void program_mode_registers(struct mode_parameter *mode_param,
 				   struct pll_value *pll)
 {
-- 
2.52.0

