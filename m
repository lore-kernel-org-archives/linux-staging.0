Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5AD3B8BC6
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513124; cv=none; b=IlVyOVjR2kWmfUqylGheBlvLSY3UTLFQwLAZ2t833OriHoecTazK/D9/X5A63sMAwtlaG0Pw2juv8oj7Z23zzOl8tE8Asn2jH0oX3hDbM0qGMflW4y/JFh/NyqGUXXr2YR91Yy60uWDniAJf33Dv8S7Cvkx4cJfNJmpRhHD48jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513124; c=relaxed/simple;
	bh=mMeeJuaZNxecKvFROX7Q1UPzFZzGa8Hph6hnSmJw7K0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JeB0iIj5WOm0022x49xXIFwBXKc6u9yfW6B8LrQ6zdQQpw6CsfRWQA0LT7DMaVa1IrIZ6ouPMc7NM64NY5sKzsZl+CezNbS57Dn9L/Gc1KAhAFWlcZjpjJjKgiVqHJt8BlCh9+o8F6l7t89tkU11//onDbju8vSXcgMYACyXAkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsC8hkiH; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsC8hkiH"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b94a19fdso602760f8f.0
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 01:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774513121; x=1775117921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l9cHpCwLSJWHYVjnLpxFvTWscwNHAujvygDF0mECPT4=;
        b=lsC8hkiH4jP+CftFOvwPKphqhZQNgsGIb3nmaiwoi4K+xrgIxQgNbFJrWNGtYRasye
         Y4lUr2VOk6DDuHyaQAgmksQXw9qKmHNJ7DwHjyWtRmHFCRrQShzjNcs2zMcCMgl8BEWi
         j3VGFWJNht9UC1gxaUCof5BmaFAshxVidwBOlQKOQYLJB3tl+C1SrlwEAHnq2nGeugqm
         jKfqfTbiOO4WXoeTADd3cPyHXByIJCV+bHSxSC8z5o90atESx1JvTgJIyeCWBXY0bRS6
         +dBT5r8XGvl3eg8ZM/aM72mtVIiMh93MAPYg5Za/qrsVVaQMH9dUzBCJn1Ao0TDdAqEE
         JuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774513121; x=1775117921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l9cHpCwLSJWHYVjnLpxFvTWscwNHAujvygDF0mECPT4=;
        b=AEIm5vyURBYXJzxvcHyqCSQ/t+u6kUSvpc9pyzr5y8fQfCxArmkK/J2xh14SSa1Qwf
         gI7kSnMYCPTR/M63A/fOjq1yt2no+8AiPSC0tOotg30hHx+jpGLEGbu9aBNe8vuqg1GR
         v5BrpH3WdWkvkKsFnQgL8ozh5zCNtTrcw4+qGzbCPZ5pibp5kiVRdveVytZUMGYcT9e9
         dXS4CUQuJKDMtFk1yBZQgTqAHTKWIydP/77vopUb3Iva2YdubLLwrdMyjNYGf/IoUnIU
         gViX4p4b63uo5QpE2XkH+bKuGBjGphzpr+0GzKuCF0gUuM+nvqBDlBWAobM3N2kZdZrv
         QKAg==
X-Gm-Message-State: AOJu0YzpiURj08kqBiAQs+rFfwBfNrhuVCZ3bmZq+ory7f4lxSkRVaWQ
	Z07k0QmjdOFqtVmMeBzGTR1zmnJ+OvmCJHIxKEDXHQ412SxSpSab1Jrm
X-Gm-Gg: ATEYQzy2dxejji8thTRnSi45GMLGXzrTK/naQxM2gdGS8V5ijrpvt31tWRRmu9HIYBK
	AF5OBOqSxHz3yhmhNP102avO6wE5fUJbJp2jrvF5gPerTLLnkLqp+hJlxsD28Vca03nxtj336gK
	x72M7QF5qo8n8k2FU4X/ut0hplbEqsaLZTDaRQ01/wgFLzgFr7kGOmNL70CAEu/dSABvu/06cAl
	yz2ypmOuw6XOHtoengRKJ1+95x6L43vPzuGjD7Jyo2bnPVc+UbIu1qXKVN6M16SfeS8oqNCokLz
	Bz2zP45s6AS5DpDlw3n5DXFdQChPPd00rDDCtzvZjFcFdwkWcqNGRFwSZ5YDjvJ/+zM3iA9L5Fa
	FWagDeEiyWB7GhAx6YbeVnhTU0P9HQzsBGs2lhheZQGeC29suyYCI8K5hXpli2v0QOf/fA9d82A
	lva03fArJ1wZ8lPR5Wl/xWhwY=
X-Received: by 2002:a5d:5f92:0:b0:43b:47bc:c147 with SMTP id ffacd0b85a97d-43b88a1d79emr9378781f8f.45.1774513120739;
        Thu, 26 Mar 2026 01:18:40 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cefd7sm6130521f8f.17.2026.03.26.01.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:18:40 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v3 4/4] staging: rtl8723bs: Choose slightly more readable error check
Date: Thu, 26 Mar 2026 09:18:28 +0100
Message-ID: <20260326081828.6314-5-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260326081828.6314-1-omer.e.idrissi@gmail.com>
References: <20260324220453.47406-1-omer.e.idrissi@gmail.com>
 <20260326081828.6314-1-omer.e.idrissi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let sdio_dvobj_init use a slightly more readable and conventional
error check for sdio_init().

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 01b5d8a70072..d0feb28b7043 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -155,6 +155,7 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = NULL;
 	struct sdio_data *psdio;
+	int ret;
 
 	dvobj = devobj_init();
 	if (!dvobj)
@@ -165,7 +166,8 @@ static struct dvobj_priv *sdio_dvobj_init(struct sdio_func *func)
 	psdio = &dvobj->intf_data;
 	psdio->func = func;
 
-	if (sdio_init(dvobj) != _SUCCESS)
+	ret = sdio_init(dvobj);
+	if (ret)
 		goto free_dvobj;
 
 	rtw_reset_continual_io_error(dvobj);
-- 
2.51.0

