Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B81615AE6
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 15:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZnAgbCq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c1e8458b9so6039235e9.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 07:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702221986; x=1702826786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jSfz65UDs/wKcMDkHDq6mjAfRk0t651ez9MkrfvQFp0=;
        b=KZnAgbCqAwKr8EcPX02uOVbELFHhnY6qT6RO0RmkeCfFARQYNAclsTROUsWI5ayvoC
         7rAVz12y33JduxQqE+pWUtqjKvvcKPJWsYhgH3kOm3gmYJ2lx/lwoXaDLx+nF/jtsSL8
         sa25zCI3IFTcfJ632Gj745vFXzcIOplON+17oLNPU4VG78YLaKjdD3HECUK/0DHROh08
         33pSi7XsV1ddU/5iaxSLwlwLnx4O2GK7pNUl+5Dc6GE/s9Vb1aY/D8m5wWNtobMsq1VQ
         m6fbqCB4ouawO5450on5o7MMmGDA8+0aAIieQ6htRq8/89quUALMVQ93gWRitsM84YU/
         Yg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702221986; x=1702826786;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSfz65UDs/wKcMDkHDq6mjAfRk0t651ez9MkrfvQFp0=;
        b=ejGJC0wYPYk0hDKlRUN5KwqY3xE74bvLUqohz4gXrUgDT+q4vZiJZpl4NKfxMsCwxy
         /u0/duwTgOSpt04qzhCFHD5LqgDwHEPZrppjnKSk9oTLtiIv2ouTlUaOojMLUHKxWEmq
         YeDgARYbqmSjXkjFkx4FO7mCw5MdXi/qQIeoVVRZ7/0oLQX60cxKNiU/SclBJ8iWTDBc
         FWFsDZ0F4Nkg0zOA3tSaTDPsXKnbr5R36gVOu2ubG65nOvIzQLVTvk7Zg3tMnJ9VzJUJ
         Ud0Nr1xubUCmwyQuxcGBxXoxNiH1LzbFtf2malJ4J5BhWMhECHsJTI/CMZMFlN7BCzEq
         HmTw==
X-Gm-Message-State: AOJu0YxcYZdMPeLsisprkPRSYm/MXwXwxkZIP4Z6/91LZfWsvvn1PPif
	dEYFoEpAppoQBHeIGVJ2mu4=
X-Google-Smtp-Source: AGHT+IELaS9Zr+mPun+iaRw9flRNeqOTMP1mF8lUdD7/PdMBwDlmQtXTrSt7KifuKZ2C8wH7VD5i1g==
X-Received: by 2002:a05:6000:154f:b0:333:5330:2934 with SMTP id 15-20020a056000154f00b0033353302934mr4979541wry.1.1702221985654;
        Sun, 10 Dec 2023 07:26:25 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id g3-20020adff403000000b003335ddce799sm6529063wro.103.2023.12.10.07.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 07:26:25 -0800 (PST)
Date: Sun, 10 Dec 2023 16:26:24 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Remove variable
 ht_info->reg_short_gi_20mhz
Message-ID: <a2778d12a2bb104a980a69f8eb05ba1cabf7b545.1702212003.git.philipp.g.hortmann@gmail.com>
References: <cover.1702212003.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1702212003.git.philipp.g.hortmann@gmail.com>

ht_info->reg_short_gi_20mhz is set to 1 and unchanged. Therefore all
equations result accordingly and ht_info->reg_short_gi_20mhz can be
removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 1 -
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 5 +----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 6556c5df958d..8a4bd389004a 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -97,7 +97,6 @@ struct rt_hi_throughput {
 	u8 cur_bw_40mhz;
 	u8 reg_short_gi_40mhz;
 	u8 cur_short_gi_40mhz;
-	u8 reg_short_gi_20mhz;
 	u8 cur_short_gi_20mhz;
 	u8 bCurSuppCCK;
 	enum ht_spec_ver ePeerHTSpecVer;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 7acc8b4c11c4..ed9b3db1a393 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -71,7 +71,6 @@ void ht_update_default_setting(struct rtllib_device *ieee)
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	ht_info->reg_short_gi_20mhz = 1;
 	ht_info->reg_short_gi_40mhz = 1;
 
 	ht_info->amsdu_max_size = 7935UL;
@@ -471,9 +470,7 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 	ht_info->cur_tx_bw40mhz = ((pPeerHTInfo->RecommemdedTxWidth == 1) ?
 				 true : false);
 
-	ht_info->cur_short_gi_20mhz = ((ht_info->reg_short_gi_20mhz) ?
-				    ((pPeerHTCap->ShortGI20Mhz == 1) ?
-				    true : false) : false);
+	ht_info->cur_short_gi_20mhz = ((pPeerHTCap->ShortGI20Mhz == 1) ? true : false);
 	ht_info->cur_short_gi_40mhz = ((ht_info->reg_short_gi_40mhz) ?
 				     ((pPeerHTCap->ShortGI40Mhz == 1) ?
 				     true : false) : false);
-- 
2.43.0

