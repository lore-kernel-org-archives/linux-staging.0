Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60453FC7
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Ew1nClS1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d3cfb1568eso20520045ad.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296790; x=1703901590; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=usonjnBG2njPou2HdeBz8fvEAliGcyLStCZ9ITDEc8c=;
        b=Ew1nClS1SR7sXHYkcE69DoiindqiWUQKdqL338D3YpygAOjP66wYL1AP4vF2GIRLKN
         UWtVKn/BGpNHSolmyrfYMqCG47A6XUt0/QkD/GWkBF8rf5WSCPEIMoROi5UeYRoYSTFI
         4GiLSwC1WfFHahihYTvuLrI0J1vq884d/CvZZGe1f56CFaHabxcW4fNU5hLGUVY7Jvng
         ljBX5spqJFOkruWGZSy87YpjvXnfHobYTiWex6m1WxTmCYmI+u8ZQblqju16LkQOg5rT
         c+r1c9ivC2PIb+x00C55RGojVuOaLYimquVY6JyVHTzfaJsbNBr7XSHDjh4eu5UIJWta
         ZVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296790; x=1703901590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=usonjnBG2njPou2HdeBz8fvEAliGcyLStCZ9ITDEc8c=;
        b=ljRrNHXWeK9IU33sVm0TWNtHNblyhgn4dapnp369QKM37L3njFGe3kTJHKuBEOYLqe
         MtLdvBTAOXAz0fwLb6EMI2T9fPDNA1Hmpt9HWuy5wmRsJbYh9bOd2+HPyX7qsNdC1lDF
         nIiXehidO9x5YOwECReOEUZA6AXlQvIKXlnrSbbxqpomVF1XvPA0XkBfoGfflycZPayW
         OAa/hf9dlTWDdhoR1lxpVS48eR30LaMRkfkX70tvueHiTPvZFa7j2hE9UBkiQClolMhX
         w9n+K+wpNoRoEr22xUDHzf24NZ4xYDn9gl1lDdg4fFBTfnvQsb+nv5A0WAYrgmKoLhf5
         KRvQ==
X-Gm-Message-State: AOJu0YzSh0OYv3VXlqzAt74j0OfzLP8xefjjsd4v+FClk6wCSZSooJI1
	xTIciikGse9WGPuY+WQg45wW71byHab2nQ==
X-Google-Smtp-Source: AGHT+IG1XTO9xfo2wICSr6CN0C0CEnKwzISg3BBtWfVJz2soILdavBNKFvS3NFnDP0y2p6KmBkDo3Q==
X-Received: by 2002:a17:902:db03:b0:1d4:59f:c21e with SMTP id m3-20020a170902db0300b001d4059fc21emr2945365plx.32.1703296790299;
        Fri, 22 Dec 2023 17:59:50 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:49 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/20] Staging: rtl8192e: Remove unnecessary parenthesis in rtllib_ap_sec_type()
Date: Fri, 22 Dec 2023 17:59:27 -0800
Message-Id: <20231223015942.418263-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove parnthesis to fix checkpatch Warning:
Unnecessary parentheses around ieee->wpa_ie[14]

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 208079c542ea..32760dc65961 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2231,7 +2231,7 @@ u8 rtllib_ap_sec_type(struct rtllib_device *ieee)
 		return SEC_ALG_WEP;
 	} else if ((wpa_ie_len != 0)) {
 		if (((ieee->wpa_ie[0] == 0xdd) &&
-		    (!memcmp(&(ieee->wpa_ie[14]), ccmp_ie, 4))) ||
+		    (!memcmp(&ieee->wpa_ie[14], ccmp_ie, 4))) ||
 		    ((ieee->wpa_ie[0] == 0x30) &&
 		    (!memcmp(&ieee->wpa_ie[10], ccmp_rsn_ie, 4))))
 			return SEC_ALG_CCMP;
-- 
2.39.2

