Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D5A11CB7
	for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 22:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNwU9tox"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-9c6f0530929so95634866b.1
        for <linux-staging@lists.linux.dev>; Sun, 19 Nov 2023 14:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700432123; x=1701036923; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h3E7eDhKdrSTOA+gUQqkBTD8PxWTKFR6HSert4WMZEI=;
        b=RNwU9toxRoaoSdDgApLuHXBOjjE64I5MJbtaW8iZanjuOIl3fmRHQ8smX0fJoyQvfe
         drcjBDKUaydD7ZOkleOml9/FbH+0VC/3B9Lo163IMQj468ze9MxOw/IWUP6D0fzsjpe9
         Z2q/3sULh5U/gQvgEDTj+0v0WVAsdPXNsCMDA/Dzzhph1q7+5dTFhDYt2t8owWSPGdHL
         lI4qQqhrQNaZOer9O8dcTq5KGeieY/pfH1cBhbb569HXsPEA7YUI0Old4gEs9qoe6SMr
         s2YTMMt23lgZhRemke78v7p1wgIlvsz/HFZNnQOyqkLT3lYoZVDxKlZUu0VXgEyINPUg
         xn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700432123; x=1701036923;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h3E7eDhKdrSTOA+gUQqkBTD8PxWTKFR6HSert4WMZEI=;
        b=qDDk8kYrTSf+i/34yyytrJ6RBm4lAvqWLIOiCBCrdDDPP3kWc9kHtATjrcQfO6LE29
         +gH7ignLOCSGbSVnYfd9RGJyE6qdgQ8kG1Oyuaqf5UkagfT5+Ni76KgE5Gu6CbHsqWa2
         ERECJIsnRsBO9ZgHLTyQ2pSw52+Q8nysEJdNfGZCxxeRdF9LVTtKAXNFlVSwb5cE4NUK
         gGo799N2A6KS+yZJ9nD3UmN0B0RJU6eUgzyJ6eQMaXoiAv7jiTOg/aEWTeKu9e9uQhqV
         Mu3oj0FIxWPCVcuW3OSoiW7pFAlZpzsS9ZlDN/tbJoQlJ8cLtiLJWGRTDPZoNUlX1cdf
         XCpA==
X-Gm-Message-State: AOJu0YyPZbsNbOy53yBDIWLaoSxUNofk9CA508f1sUe6yZsGFx0TKp0m
	UhplRGQKwqQOUsjCsqRt5Wsc7L06erE=
X-Google-Smtp-Source: AGHT+IF8WM/tjO7bGMlVgk4LjdiUb2HDfQgKkQzIG/MIlrpTrVsN6ZgqZqzhMEzDCcBfh8JzZwjtSw==
X-Received: by 2002:a17:906:10cf:b0:9cb:b737:e469 with SMTP id v15-20020a17090610cf00b009cbb737e469mr3933899ejv.4.1700432123425;
        Sun, 19 Nov 2023 14:15:23 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id s8-20020a170906354800b0099ddc81903asm3251330eja.221.2023.11.19.14.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Nov 2023 14:15:23 -0800 (PST)
Date: Sun, 19 Nov 2023 23:15:21 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/14] staging: rtl8192e: Remove unused variable
 dot11d_info->state
Message-ID: <2f1d4851a7a370c5ef367568c2b098bb9fbf0ce7.1700431464.git.philipp.g.hortmann@gmail.com>
References: <cover.1700431464.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700431464.git.philipp.g.hortmann@gmail.com>

Remove unused variable dot11d_info->state. Remove unused enum
dot11d_state as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/dot11d.c | 1 -
 drivers/staging/rtl8192e/dot11d.h | 8 --------
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/dot11d.c b/drivers/staging/rtl8192e/dot11d.c
index f0241982c7a8..08cf95d26911 100644
--- a/drivers/staging/rtl8192e/dot11d.c
+++ b/drivers/staging/rtl8192e/dot11d.c
@@ -18,7 +18,6 @@ void dot11d_init(struct rtllib_device *ieee)
 {
 	struct rt_dot11d_info *dot11d_info = GET_DOT11D_INFO(ieee);
 
-	dot11d_info->state = DOT11D_STATE_NONE;
 	dot11d_info->country_len = 0;
 	memset(dot11d_info->channel_map, 0, MAX_CHANNEL_NUMBER + 1);
 	memset(dot11d_info->max_tx_power_list, 0xFF, MAX_CHANNEL_NUMBER + 1);
diff --git a/drivers/staging/rtl8192e/dot11d.h b/drivers/staging/rtl8192e/dot11d.h
index d3da4af4a16b..c7d35ec86aae 100644
--- a/drivers/staging/rtl8192e/dot11d.h
+++ b/drivers/staging/rtl8192e/dot11d.h
@@ -16,12 +16,6 @@ struct chnl_txpow_triple {
 	u8  max_tx_power;
 };
 
-enum dot11d_state {
-	DOT11D_STATE_NONE = 0,
-	DOT11D_STATE_LEARNED,
-	DOT11D_STATE_DONE,
-};
-
 /**
  * struct rt_dot11d_info * @country_len: value greater than 0 if
  *		  @country_buffer contains valid country information element.
@@ -40,8 +34,6 @@ struct rt_dot11d_info {
 
 	u8  channel_map[MAX_CHANNEL_NUMBER + 1];
 	u8  max_tx_power_list[MAX_CHANNEL_NUMBER + 1];
-
-	enum dot11d_state state;
 };
 
 #define GET_DOT11D_INFO(__ieee_dev)			\
-- 
2.42.0

