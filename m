Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0543F364B3
	for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpZDTwL3"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5451faa3aa7so697869a12.0
        for <linux-staging@lists.linux.dev>; Fri, 24 Nov 2023 13:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700861483; x=1701466283; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dob4ueyHhx+j/dqC0hM3DyfpnYphHI049VubfpO8Pec=;
        b=BpZDTwL3cr9VaGbhtfKbP3n2tWeqA/ukjNi4PaFF2+MXmEEee8r6dAhRv4dIke8hqx
         rJTYbOC03HpAUvcRRfDemhbSx3doMt+UPRh7fL5koCLiMegTR9FxMbzYtGFZ0inhAB7L
         YmUNvFrA+iNCSxfzk4AmBct8WrhG3Gs/rOz1OBck+z7loBOe656ZuBY3NlNFJRB+1aJp
         zqfwLXvEU/cgPlWLqrei2uyQooNyapzlbT7MQiWq4lmDOTVi4wdNwjvsHcd7G4tVArbh
         T6evyfJgLITOTyvFtedl+uVyVgqOwgYm9nuYiU2XZqiIxUiXRZqptVz0h4V/24HJN3cx
         48mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700861483; x=1701466283;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dob4ueyHhx+j/dqC0hM3DyfpnYphHI049VubfpO8Pec=;
        b=TFZCT1WqvC8xwMuAOJeDezvaGLoGhzsx6nUQKpcibJH+zTxMMV7LJsurs73WArdbut
         0zzV3nC7FNlbVwx3HvCkgsoTcNLhK5QmM4o051wZaGWH/UGcc6LLLvxqRCXAW4UEYbw+
         3mRXEQWChEqMtaysucmxq9RbvGXKsyxtG4hT0JtC7VK7JW9P4ptTMJBHx8JV8kY4E5M0
         j7oUYveYzSxxq4cHi1v/mc66TU6ievfCHQyHiXQ/GmmVLuqkTXMNnQNfuLp0RsCxpGYa
         adJs3i51GuDZIDXOcVCxqkPTgF8+Cv4UNUuvDjHFdxNRazWEPzpS2LHiJnUZ3/dLgoRF
         LD3A==
X-Gm-Message-State: AOJu0YwCQHyy6x5pCBJAlnR8VBeml13ru/e2viJMjmrQr6hWMwU0n8cQ
	WeAHYOMXfHcbQ2hC1TCxwroycEqxVns=
X-Google-Smtp-Source: AGHT+IE+QY80vtVsrteuoXEgHjoIDKq5TSlxlerFbuFhWGXd4HlAsRT1ffDgjkTb8zvZWldBQgXRiQ==
X-Received: by 2002:a17:906:3948:b0:a01:ee03:37ec with SMTP id g8-20020a170906394800b00a01ee0337ecmr2983066eje.3.1700861483322;
        Fri, 24 Nov 2023 13:31:23 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id lo20-20020a170906fa1400b00a041474d13esm2492176ejb.127.2023.11.24.13.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 13:31:23 -0800 (PST)
Date: Fri, 24 Nov 2023 22:31:21 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] staging: rtl8192e: Remove unused function
 HTConstructInfoElement()
Message-ID: <ed49162367b03a848895638adcdfe3594d4219b3.1700860759.git.philipp.g.hortmann@gmail.com>
References: <cover.1700860758.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700860758.git.philipp.g.hortmann@gmail.com>

Remove unused function HTConstructInfoElement().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 16 ----------------
 drivers/staging/rtl8192e/rtllib.h         |  2 --
 2 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index da4cf6f25794..00273d709f3c 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -328,22 +328,6 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
 	}
 }
 
-void HTConstructInfoElement(struct rtllib_device *ieee, u8 *posHTInfo,
-			    u8 *len, u8 IsEncrypt)
-{
-	struct ht_info_ele *pHTInfoEle = (struct ht_info_ele *)posHTInfo;
-
-	if (!posHTInfo || !pHTInfoEle) {
-		netdev_warn(ieee->dev,
-			    "%s(): posHTInfo and pHTInfoEle are null\n",
-			    __func__);
-		return;
-	}
-
-	memset(posHTInfo, 0, *len);
-	*len = 0;
-}
-
 void HTConstructRT2RTAggElement(struct rtllib_device *ieee, u8 *posRT2RTAgg,
 				u8 *len)
 {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index b7f4d7e2ea26..04433c79b3a7 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1760,8 +1760,6 @@ void ht_update_default_setting(struct rtllib_device *ieee);
 void HTConstructCapabilityElement(struct rtllib_device *ieee,
 				  u8 *posHTCap, u8 *len,
 				  u8 isEncrypt, bool bAssoc);
-void HTConstructInfoElement(struct rtllib_device *ieee,
-			    u8 *posHTInfo, u8 *len, u8 isEncrypt);
 void HTConstructRT2RTAggElement(struct rtllib_device *ieee,
 				u8 *posRT2RTAgg, u8 *len);
 void HTOnAssocRsp(struct rtllib_device *ieee);
-- 
2.42.0

