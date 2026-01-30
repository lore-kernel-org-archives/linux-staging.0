Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968B9387349
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769799462; cv=none; b=iQXkcMFk9awN1zTq6xOAk9yKUoV16VOcRbMB7mWz55e3O8H5kKRxOWm6nSLH7e6Z51KnDaJVUXB6XjxdBd7TgK/BQvUNWzvoP8IoW8P3cV5F+D9DxpXIp1cj1rHB9hgjI5egAzvJDlrcVcUyDgZix+QqbP2q156+RuWHQPq//20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769799462; c=relaxed/simple;
	bh=uMjtgTE2oQaSlXZ2RpWzD0PdmDQs8ivpMUqvhD1eH6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fddvf8NcYnEyYbgBQdyzzoW8Bx4p+L1lsqc0vzRiALLd+rWLCKbfLOMIJelaRNHg6Pj2Kvsp2x/Q7+k1O7pAEtyGYvkjQdh5TY3TaMhjwkwcXoNnrmvdyik6WYqjvccU6kAD6zLLVj0taP8Dro+F4eF22Xnd9vTU5oLfEsnjkTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2r1uSjK; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2r1uSjK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so1643005f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769799459; x=1770404259; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVrBPCMwxLFaPKXm7iV49koCmmnJv5JcMuWXxCdjyKc=;
        b=Y2r1uSjKcuvVSslE6h5uO6WQ7xtH7o+vKzSODsh9BF1euqlLWm09zrG5wq59m4D6dX
         sCOVHTt3tDblPG4AztR4ZztwAniRNIg6hGRFNNEobGVQMgFglBEsBlchxZgA/4s1NSz7
         O4pt4s4LYhi9Pg3FeaecUT5NOThii88kEsnJXBBERtkMSqlJ7yywDn8MEhsSCesRMabv
         mdyn4i0id6T83ryqvBOVCcO9rkrLPS9XlX4mXrEB/IxYvwS0zPKktXlkErQBp3s+NlGF
         twnvuhVOOmwpQoNymN7u5Ed/HKFhiuXUguimOTH1UvJvtmAM2DFcsWb5EHYgWB0wT4kD
         Ir1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769799459; x=1770404259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVrBPCMwxLFaPKXm7iV49koCmmnJv5JcMuWXxCdjyKc=;
        b=GyeE7Y5a7xEkTiTlfXlelTHSTBL5WRoihoGbV4wSDJTLEjpWdVvfu6C6orjP4E2aUu
         5YJZFZUBMBWkTRXg846k49vzLNZ/44+CgpAgX0obzdaHnVPfe2MyPjfC1Wm/b5KWywQ1
         bTeUGe95GyKIaJtSqUwChAj0PKDwy7sjzMd7F+oQyK542a/1qDvQIa2w44SHjF7IW1pc
         +6M5J7xRnzdiCaX4rUHuyu2TPgBhQ1ogbnwak6Ewg8/hUc9cbMiyjlw4x8BFMlsDkWCt
         bFjczPQgmvEto1xCIX6uX4BZSGzIc7hL0iV5FAlmmGNFm3oAep00Olo2nCzm7veBYU+O
         cGxg==
X-Forwarded-Encrypted: i=1; AJvYcCX2KkDT9i3ECeGxbUoY9cWFcMSv2sKdCM13zInlS1FIQB/Wo+y6EURstwK22PjmRYXfwUtNGJBAR5t7eKl0@lists.linux.dev
X-Gm-Message-State: AOJu0Yz16/4FrwQH+Pa0hZufJJoCA+/RELo+8YUE1DM+xm1YCITrGcY6
	g1swh0DNPtLTBwydCM/ZDVqH13KL+4PGZh4ic4GUcdoNA7o79mwYeD4=
X-Gm-Gg: AZuq6aL1zl2Ybot6RvRvO+cUDLILMgaz3TejtKLcZuvFmgjS/DNXhdSrVbYM+vVlBP2
	58PyDr/xyzBj7VISojXluLM4DYye//mQTIS8LnGN+RjklQEGl4U3xO7w93CbasJerTmCdXW4hZc
	32o5PQQ13pTkr83pZN7mu6lgIBDcfxIkEYv6ibzHyqxb5d9P2lQg2VhfB0U+l5btHJ0XeHpszUX
	hITA4pyrxVEAVf2BwlA1WaL1wPWhDUoR7MBUOdRtapc+nuCxb1LFHInsBAoLl0zw4N+/QgFfS2U
	NbAQ5PL9gVIARtpZqqqq+1D0xLIi0xwWU7+Y645X5nPBFEcoNoi1MgNbs9nXKJe9bHXlBqdGca+
	jc4raIdCXXeluZeQFlgyqWO55n50aeJgOVslbyXrtZq52SlC6KdU390085ZpJ/Z+dR8lfVg2V+O
	MYpCw4O8q+VJa1SjynNTdmpoMDVwCogXAt0cvSiJrvr4R+XlGA/bSF9e80cMrDjA==
X-Received: by 2002:a5d:5e01:0:b0:431:32f:3159 with SMTP id ffacd0b85a97d-435f3a69048mr4920418f8f.7.1769799458876;
        Fri, 30 Jan 2026 10:57:38 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm26474164f8f.13.2026.01.30.10.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:57:38 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v6 4/5] staging: rtl8723bs: modernize hex output in rtw_report_sec_ie
Date: Fri, 30 Jan 2026 19:56:57 +0100
Message-ID: <20260130185658.207785-5-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130185658.207785-1-lukagejak5@gmail.com>
References: <20260130185658.207785-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the manual hex-printing loop with the standard kernel '%*ph'
format string. This simplifies the code and uses modern logging
practices.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7dfc2678924e..5e79a720710f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2071,7 +2071,7 @@ static int rtw_append_pmkid(struct adapter *Adapter, int iEntry, u8 *ie, uint ie
 static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 {
 	uint	len;
-	u8 *buff, *p, i;
+	u8 *buff, *p;
 	union iwreq_data wrqu;
 
 	buff = NULL;
@@ -2087,8 +2087,7 @@ static void rtw_report_sec_ie(struct adapter *adapter, u8 authmode, u8 *sec_ie)
 		len = sec_ie[1] + 2;
 		len = (len < IW_CUSTOM_MAX) ? len : IW_CUSTOM_MAX;
 
-		for (i = 0; i < len; i++)
-			p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), "%02x", sec_ie[i]);
+		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), " %*ph", len, sec_ie);
 
 		p += scnprintf(p, IW_CUSTOM_MAX - (p - buff), ")");
 
-- 
2.52.0

