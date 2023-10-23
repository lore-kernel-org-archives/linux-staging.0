Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A208D6FAA
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 06:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m7yJAEeL"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9c96a82e93bso33743566b.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 23:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698043245; x=1698648045; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=usb14TKnR5nGARmhYK6QjpDq5f+Ywoldfs7WPWSHtjk=;
        b=m7yJAEeLy3K3ORMEXHFwErP3CNcUjWnMT9DPyuW5C5kCUZBOXUS7VG52sv8gL4KGFF
         r7nVrRwgr59Mm/OFfsJYX2qLXCQqc4jXDaPDxBG3x/dUTLwhxFtr3UTItEPd6Shvc76n
         x3oA86G4NGU1a4pRbCib5f6/HVguCKEaBiuGZZKvIsGxlBkmW7mdFFwXeBbJ7v6cHnsQ
         yX3NpMUKKTaE4HlOcX3qO5KGUriJPk5EQkiLL4PT++Ie37htN2Hz0offjtmgfGaf3pZ7
         5s/TZ+yb6tlpXwkDMDu6Q8BOetlrQawj0zdJd6aC5Y8MDmjDdx4DSfm3zCVX3C/1yTlf
         ZMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698043245; x=1698648045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usb14TKnR5nGARmhYK6QjpDq5f+Ywoldfs7WPWSHtjk=;
        b=eKIAxojDlnJZgJRUCPfodVgkwz2M/oh9wsXRt92kiaVliDjoLwZUecZVUyYOg86Xyy
         2aLK447BWOdVDiL/iM8AXKLHHGH3SHuvQ31vm5B59lR7u3sIJ7XxE8Q0SseSpPy3HG/+
         7KPo/UiZlWyYgJSNEsERaYdDHHQjzNtswI88NvFFLj3QP88iVIQT06sRP5ZMSNVAH4+M
         rjcljnBSSWUuMp/yPu7aSsH+fmVaWwsB5OE5H1h7fjIfcMVKSRbNEUP8h+x4csHu7MMx
         FlNkDwTgxyiQH4gs10SiQ/4dNTwBH1AHLAYvGHjQTLz8LFnD00novAjGIlOi6MaEuCZR
         vMTA==
X-Gm-Message-State: AOJu0YxbMcxDWX278cYad5cz0f8JrjkPHBjF4n7yiDwOFauDaD0h5VPe
	hQfOlPAu/KSRihFxCN4lb9I=
X-Google-Smtp-Source: AGHT+IF6ARxAGq5faUU73LlSjuP8qajtw7vveJvgBijeRWRJh4wcE9migJuJqgAIXuIuDBYnm/cfvA==
X-Received: by 2002:a17:906:109:b0:9bf:b83c:5efd with SMTP id 9-20020a170906010900b009bfb83c5efdmr5050754eje.3.1698043244873;
        Sun, 22 Oct 2023 23:40:44 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id h13-20020a1709062dcd00b009ae54585aebsm6097878eji.89.2023.10.22.23.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 23:40:44 -0700 (PDT)
Date: Mon, 23 Oct 2023 08:40:43 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] staging: rtl8192e: Remove unused variables TClasProc
 and TClasNum
Message-ID: <04ce3eaaaf3897a22dcb95ce2f449658199770d8.1698042685.git.philipp.g.hortmann@gmail.com>
References: <cover.1698042685.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698042685.git.philipp.g.hortmann@gmail.com>

Remove unused variables to shorten code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_TS.h     | 2 --
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 240e808fc4b2..ab737428d4a7 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -21,8 +21,6 @@ struct ts_common_info {
 	struct list_head		List;
 	u8				addr[ETH_ALEN];
 	struct qos_tsinfo TSpec;
-	u8				TClasProc;
-	u8				TClasNum;
 };
 
 struct tx_ts_record {
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 7151827408b9..3206fdb3e65a 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -95,8 +95,6 @@ static void ResetTsCommonInfo(struct ts_common_info *pTsCommonInfo)
 {
 	eth_zero_addr(pTsCommonInfo->addr);
 	memset(&pTsCommonInfo->TSpec, 0, sizeof(struct qos_tsinfo));
-	pTsCommonInfo->TClasProc = 0;
-	pTsCommonInfo->TClasNum = 0;
 }
 
 static void ResetTxTsEntry(struct tx_ts_record *ts)
-- 
2.42.0

