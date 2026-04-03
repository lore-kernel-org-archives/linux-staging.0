Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E22857F6
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 22:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253800; cv=none; b=pm5Is3sC8glrPcwCOzfEUpnF6E69ynYIYkO7Wny2XisCqid13P5v6eiEpRle7fWTKw8wNuUldkRYt+DUl4rPrRklqCS1ctLW+ZeCjfCgsSeLkTdh/7wCzyaL+yPKWZQQnh5ZUq2/QqsJI550ZqF7J0SdunPgh2aM1LLVpG6anKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253800; c=relaxed/simple;
	bh=vchdPlj5en6WgOxMGlf/0GNVgRlNIiAB+wIbpfwg0fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpGsOg3kQdiAEOtS304Fnpg9d0B65QrX2B/17/l3VlOaAXiLCxjpo82RKrgggsjqTTd+YouDT2yxc2Qf42zrKXXOB7K/fRtQC5kJ92tBeYxpbrYYBDoJPpRq+LJhc74B42obz3J6CzKlKwQN6xrBKP7vtyJ3w1Wc+vLS93+1ipM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5/W+mCg; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5/W+mCg"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38bd3c6c502so17890711fa.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 15:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775253797; x=1775858597; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG6mZ605iecw0+a1afoiURzwsWl3q2GeQprcwT7FWPA=;
        b=c5/W+mCg1xfgq+/Z2vsE5By/e0kyK2F/jc6qlmBQKp6NDhV+NaLLQ8ArUYaHlweU/z
         VdSktWVCQsvzV/F+M4BMvds5yOBXs0+g9Eg5SICvsdiK2motpys9ARC9UIYvnlFM8RhO
         iAm/CMfi8VLEre5zh+Iujh890Ig8ay7J5G4TVgkT+UXVOKsGE4FftxG6eqJvQAxHmsbY
         b89OgzXirevXA/0fdi/RP483bVt0efUF0O5yePKRqD2jGwNhUjbQT6pd+ijpzLEQO4nm
         XGQENM8l+lctJ0e3kLdgPLvXJPvdxILamGz3VZ8pjetcu4Bmv0PuF6hdFotuQ8wCAUFk
         MNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253797; x=1775858597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MG6mZ605iecw0+a1afoiURzwsWl3q2GeQprcwT7FWPA=;
        b=Seyq93gG/cRkBjsgSinG4TxWFbKj2MYeofa16DPlQbTRjlbHfiK+8ctIW6EB2DBbI7
         1iwAgq4giptmNyFdpy5ITVFUU8q8ZHVCLEjmi8kG6w2tm92Dj7Kb7tsb7MDbMNE3sVLq
         RZ4rkZVv+44v7DZN+aLscGioSM7pD34+QAmgj/luJcbGjkUhteyjTUxSY5TLlJB+/RNJ
         46zNqfJF4e0T7dras2pd5/8cKyVPtXYNDIdPfXc2ssbTv5kFYMqFQfL1L5bx61YQiKXf
         As9XVJnppxn20xNMwQknP+laEMLLCM2XlHwXSucmOgUD8tjyWAeOfCkjX/1z/TNETRB4
         EpMw==
X-Gm-Message-State: AOJu0YzeU27PiRVV5J4CCs9CuVtaxqVLkg/O+SbBnQghhB6vWYPiFsxi
	7WCDt87VMUWmii8foAhL6+v0F3YsxzbzwVJzARahZb2OorYPYQErG692
X-Gm-Gg: AeBDiesGM2rRGJDTvzdKC94IJnONjRHWV7S1NqQNzFN7qspJK75FupTbS6hr/0uVxN1
	cqrlL3EyYw3W0aqpWRsrpru9redjfdcx24wGoc0F0GOIOSscjK+Q+9dQNvHLzbgVKYbtlv9Y+oI
	q5P1eMrpEZ6pnJpIcuewkvvCoYPThUI51LMcK8JCPa5TXnunodsb50j8gIL0ZDA9ioXR7CcpYfo
	0LewneAuUREOllJsqPhyyojscGww3N3VC/lZvyQoZiZrU0xurW6gvnGGKU9lHJKR/kUyfdmwB3c
	gbppVyu7WOGDbtlC8GTHu2TC/q4NnzjovYi2SoHRhJd/Cqu/h8BcKC1ePsb2isl2uMcgC1DjCcx
	F1LapUd2F9P1NPXoWrO3pKb1dNj4iCVTPgFVDb+iOx8KQUCJ5ui4biS0bGsv66TjbIXUF23Hczk
	zs2HTaytZP36mQCY00N6Zhkb3cjPMXGwBG1Jt0w/2xTR4joPYIx0Ah
X-Received: by 2002:a2e:a80b:0:b0:38c:4231:91df with SMTP id 38308e7fff4ca-38d92ce2452mr14114421fa.10.1775253796892;
        Fri, 03 Apr 2026 15:03:16 -0700 (PDT)
Received: from localhost (94.191.136.33.mobile.tre.se. [94.191.136.33])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fffb53sm15020831fa.16.2026.04.03.15.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 15:03:16 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: correct logical continuation check in rtw_btcoex.c
Date: Sat,  4 Apr 2026 00:03:09 +0200
Message-ID: <20260403220310.1824969-2-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403220310.1824969-1-linus.probert@gmail.com>
References: <20260403220310.1824969-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Corrects logical continuation placement in rtw_btcoex.c
Discovered and verified with checkpatch.pl

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f0a4..caa757b8dc0a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,8 +10,8 @@
 
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+	if (media_status == RT_MEDIA_CONNECT &&
+	    check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
-- 
2.53.0

