Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710741391
	for <linux-staging@lists.linux.dev>; Fri, 15 May 2026 01:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778808875; cv=none; b=uWyZTbqbiN/ISm2LirnqUZkqEV0gvLisldGpcEuh6eUw8y3bZ4OC5FoRDv7bJvRvxIOYRfdkMsasFNWLeox2kN/39nkjVpIDSiP2mOAsERwFCYEfyigOXKnn8eYh0xyJ1GUuBiawcNf5Abs2EQyHOB/Zb8Avt4foJkKr2Fk68Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778808875; c=relaxed/simple;
	bh=QMWv5kTR3Z8orXG1d69hSRQEQKzRadhtj3GlQuXI5zA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Zgr+syU8bYW5OMQ2bHDJpFBBz+4DqXGHeYRerXcTZelHuWYRtu7PKEHXhlnxtWvcYvJ5G6bNh7ZZMJpQXukLhrzzm25h5gAj5ui50qYPAzu8LvY5R1TlTdEj/+0alYwdP0ZCUigI0TkejXnWqzS4pyICIc2rx5OTw/AddJtabMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkRF2+61; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkRF2+61"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba4a1a0325so59121565ad.0
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 18:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778808873; x=1779413673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B88evz4AfPX++SW1Roueh1KZYYJZf38uXj4ng+JFhXM=;
        b=fkRF2+61tdujQs+yHDM88tx5g1JjL5eW/YBAUtAsCpdjeM0GMDbbYRZEmriwDGf5sk
         Y9puTHdGUwtgEwXmJDaCuqXJm4K04VJGkICceTiXDBrDMkA7h74HATKrXRttcJgFyvll
         /1b5KkiMVPV7T4gG7TdKbKdF4uBG0TSvYPSG6ZP0OjMrOGvxUE91+F2JQdTD6MRLFliN
         V9X2oFw2fmHA0iNC89n7xFiC0opCBmCPwLTvPel7fx1PfWehjaLAdt1P41oyUCLWyQEr
         Qdwvuc4ANHnJK1MP8WsyeWnW1LLt1rSJdnreIwTfazIlZmYPybwlZbTrUCmnq1pnTaGp
         n50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778808873; x=1779413673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B88evz4AfPX++SW1Roueh1KZYYJZf38uXj4ng+JFhXM=;
        b=WYOs1x6olv/xqVC+joc3ysZTqAt+CSijLkyB1nFEtyllysSouKG6PrHv+IDO0SmWvd
         1ulKcQpSLsc2ILaBtlT3mR8lGerAmXEzQNQ3pSpZQiAbc+oQxsrO5Y9X68AdkkfV7zhe
         pTiE3tIOpQG1LIY/LXYG2EJNVKfO5ajCgI7BmkgwdQpfhILlj//Z/r3jf4bCU8xDcpJe
         INCpI1ff7Xxc3Isy4a87igJlr0JXdSwAtaDcmqXQ6Cf2TFpXFCmbKXt6rGAZDoDylZFi
         mXPorTSVeXi/rzufkrpBCHwWg03FfY/Yr1EDNcUC0f+JCX09MZQxGD+2EdVuPBeU5Ncb
         WnoQ==
X-Gm-Message-State: AOJu0YxMSfS2eC4sIuiK5DA0DdyOMgiwDHW/e2Cy11qmpSGttUypwMXZ
	SFU9ixyxBzvW1sNCMZAVBCGh7WZemkeRoD3f0OLmzuJEenB4Unb+ExuxJ9SMcYkpUMg=
X-Gm-Gg: Acq92OFrdWYuWOdVY/a87kb0HiPQlt5L/0Kc7uNyvdJpCvCK9aoAVcnRn0eTUyiEy8D
	KvfdIvis2xrW6iBNmJUGAuNuMaLRIV7TTAGSXSKC1yplJo96tGxJyTRxHjvdRvy+yXfWxLSJsGD
	4S97oKfjIKZcAC86pYxTsklVPURi/gBVDPjS3sCVzYgX8aXR8VBBCM9lkiuvCVWd6ZPz2KwcVDE
	TGrIVRrKHe7nH7B32P+STJvunLTprFVF7ORiysRoqkP4D90lNilGcVsrnAX7+ESSMBy5Z0z32Mh
	gtTG/ZhLsPoRKfEWL7OuCcQ5VfYJWGq0bc6wGEeWwl0YndSfWYd1Nej7J71XhZh2lSX9iZkgfuC
	wjycuK5GgwayGO5R3unXg2v3CKFF7xlsP1XPTYq6aKV+vYymx0+ocL7YZ5aUfjXGJUljD996KIP
	VU8qHeIu4rtXK/P5Ab+bJN+/hB0EVkjKzWNCelD/3eJsJOZEYGMDsTmceubX3fkjnpgTwPYasTS
	g==
X-Received: by 2002:a17:902:cf09:b0:2bd:3d5b:e87c with SMTP id d9443c01a7336-2bd7e8f183bmr19253965ad.37.1778808873522;
        Thu, 14 May 2026 18:34:33 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([36.255.89.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd7e8e5904sm10395355ad.64.2026.05.14.18.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 18:34:33 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 3/4] staging: rtl8723bs: reformat rtw_efuse_one_byte_read() signature
Date: Fri, 15 May 2026 01:33:54 +0000
Message-Id: <20260515013353.61614-3-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515013353.61614-1-mokshpanicker.7@gmail.com>
References: <20260515013353.61614-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605150301.7FuEahpv-lkp@intel.com/
Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 2be74f2d4ac8..ef0cec40d388 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -79,11 +79,7 @@ u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 } /* rtw_efuse_read_1_byte */
 
 /*  11/16/2008 MH Read one byte from real Efuse. */
-u8
-rtw_efuse_one_byte_read(
-struct adapter *padapter,
-u16	addr,
-u8	*data)
+u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)
 {
 	u32 tmpidx = 0;
 	u8 bResult;
-- 
2.34.1

