Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF7B6136
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 20:48:47 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id h17so2624114plc.5
        for <linux-staging@lists.linux.dev>; Wed, 02 Mar 2022 12:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=diwGqdVYQiz2F+5ByyijR4Y4A/4HzWpPakvUGGYkewA=;
        b=Ol9rwv0pFTOMtN0ZbFoiXm/Uqcz7nNVd81xvC5yl6AnhXJkGwxP+S2feHz4Z6C5I6Q
         5E5ZqsxbFK2+a7tSj4qhk1uvXgVeLJ9PVC/FwhwAwlRR4R/Ngr2VfLaRMqiFxUojBiYs
         cIOF53APdW2D7rLYlTJvCZ8+DvD7Qjc4wtA8myYfHFwhE3u9/DQO61XqDMSSFRGw9Y9l
         zVjTI7qRNCuF83S/IOg2WN/Bn8XXVKGPPKlyoIEEXVbj/JCQ6JscLyG2d3MlW+ZOKUzg
         mIo7cEXZrvn2SQ25zpEvLyXjdS8dHOpI71g0tUGTUVJIjmbOqfAxIgnY4YGOAIILlLtK
         mcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=diwGqdVYQiz2F+5ByyijR4Y4A/4HzWpPakvUGGYkewA=;
        b=QvufjdHvif31JZvb7QQkvtVqsPtg1Rktted0m9bJyZNHvS1DJB+u3K9O3S6VrnUk+9
         RDO0IN2YTVCv+7Pq+AM97frcolz5e9IZA9sSnCb/WmrFJGvi/aJgyg+1ItV77B6rol8Q
         KlU7MUhdvTtZNdGpdHIfoE3QNownQzeM7HABdlfKvkIOThfx0eCnHurzzGaPjJ3qMnDS
         uB3liHrjhQPYqxcTXvad/HJ1T/xAqfOw7WI9xystLUEuC4LaOvuT+9WGRMfXo7uqKXwe
         96kFp7sSoPCFxtkletmBVzq2bEI3IdAZpgmn7vQ9WTPaiPYrG5MGvV6pN81M5s1fefR7
         w9rQ==
X-Gm-Message-State: AOAM5302nAE3j8SpbONsGobL49wph0tr4WVSTMP1sXqgMcF0//nQ8sCu
	7kkebcsiwKpb9PLYJK7/oMo=
X-Google-Smtp-Source: ABdhPJzoTyHXNLjd+giSdub8RkYLX1CzD8/sMLQMiWwmnrlqJDnJLYHQW9DV7h8RIlAJGG/7CStDXg==
X-Received: by 2002:a17:90a:4f0f:b0:1bc:54b8:c3 with SMTP id p15-20020a17090a4f0f00b001bc54b800c3mr1686937pjh.110.1646254127171;
        Wed, 02 Mar 2022 12:48:47 -0800 (PST)
Received: from localhost.localdomain ([103.161.98.179])
        by smtp.gmail.com with ESMTPSA id bh11-20020a056a00308b00b004f40144cf76sm50905pfb.142.2022.03.02.12.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 12:48:46 -0800 (PST)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH 14/16] staging: r8188eu: mark IS_MCAST as bool
Date: Thu,  3 Mar 2022 02:17:35 +0530
Message-Id: <20220302204737.49056-15-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220302204737.49056-1-makvihas@gmail.com>
References: <20220302204737.49056-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark IS_MCAST as bool as it returns true/false.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 39b7a596e..df3331b13 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -295,7 +295,7 @@ enum WIFI_REG_DOMAIN {
 
 #define GetAddr4Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 24))
 
-static inline int IS_MCAST(unsigned char *da)
+static inline bool IS_MCAST(unsigned char *da)
 {
 	if ((*da) & 0x01)
 		return true;
-- 
2.30.2

