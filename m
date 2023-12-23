Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10EF17F0
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 01:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="OZ6PFMkL"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-35fe8a4b311so2094055ab.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 17:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296789; x=1703901589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+laPmH1xo9FtQlmwlnX0zePEIJhHvMoJwKvv4M3oYI=;
        b=OZ6PFMkLIZDhb/5G8KbdA6iZhhOC7HF868UPGHM1OhcE2CRJvv5ZlY/FpWCHpt7Irb
         +/ShToduNVS3IQI9naU/FkhVoB8gdRgGpr4t1TL3NGe88tpT7YacPEAivnrnfvXOfkP2
         YJRHW0pWzJTMoRrPbajMp3Hc/acWIlwP+3g1AoBEbkVps0uAiU1nUQhzgAZD5ksucPrb
         Mvzpx5eGdHQcPg9REYerN6DKKR1YlgnxfyXPC4lzeWJ7ZPDk1lBJdU8yYACpSAW0Iuru
         OTK1vZbJOumhAR1Epco/WPdynCwIqXwcLdtAwTmwaBaF5TVp5ra4USYUl607hHaDHIo0
         K1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296789; x=1703901589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+laPmH1xo9FtQlmwlnX0zePEIJhHvMoJwKvv4M3oYI=;
        b=cwObjDYM6NMxlyp40ifVeIzveqSWeKU6K2qt2Zp2uApUKdgS5A9n4JIFiNjKPE2qZ3
         +po/IGxNtP1kmyqs791CsZ1+wJ580ol55OT3zUds8jcROE411ZVSvJSeEgTRNCy4ziZj
         mxWIjSI4YXqo/Psdww9b13xL4TVxzIC48O64/Wi1NjxdckPhsSVcYu+Dnmt844OsW8Or
         DoePG5ZZuAtt9wm5QZmbX4Y/yypraUwXXszIdW1IioGJCZr7JC2NGlMtUQHTj9y+BD5o
         G35eKjnXx/k/XKQMgpRZanbmoeOBBgmy76gcbVNwK0R7dwlltWoK4eruTD1sWMqxt9fO
         HP2Q==
X-Gm-Message-State: AOJu0YxBvF2lNwpYncJR+9XnNfNqp1mnEHoLHUVwFWhQjrtY00CvAzJw
	GJrthlb+riQavLARbbUk0m8u2g8pFS7VpA==
X-Google-Smtp-Source: AGHT+IGm84GR8emsXUGb2esKVSA9YTosSbT2uAZXLgYPcIC967Mb8nCry7y70aqDjsKXETwGUUVYFw==
X-Received: by 2002:a05:6e02:1be5:b0:35d:59a2:1281 with SMTP id y5-20020a056e021be500b0035d59a21281mr2977068ilv.45.1703296789322;
        Fri, 22 Dec 2023 17:59:49 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.17.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 17:59:48 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 04/20] Staging: rtl8192e: Remove unnecessary parenthesis in rtllib_rx_assoc_resp()
Date: Fri, 22 Dec 2023 17:59:26 -0800
Message-Id: <20231223015942.418263-5-tdavies@darkphysics.net>
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

Remove parentheses to fix checkpatch Warning:
Unnecessary parentheses around resp->info_element[0].id

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 960cc86ac23b..208079c542ea 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1619,7 +1619,7 @@ rtllib_rx_assoc_resp(struct rtllib_device *ieee, struct sk_buff *skb,
 
 			kfree(ieee->assocresp_ies);
 			ieee->assocresp_ies = NULL;
-			ies = &(assoc_resp->info_element[0].id);
+			ies = &assoc_resp->info_element[0].id;
 			ieee->assocresp_ies_len = (skb->data + skb->len) - ies;
 			ieee->assocresp_ies = kmemdup(ies,
 						      ieee->assocresp_ies_len,
-- 
2.39.2

