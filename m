Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65B7173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:26:07 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id f5so139583901edq.6
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jkA3kF7oouMrz8OaCx0NK+QuQogRafsrzsNMi1b0VfA=;
        b=KQgVs9E753FazAUQJDFe+2vwWrd09epPlueL+9vpj5DOj6hcfPm3foHDgNF2COQz/s
         UJbQYKbyVPeAgw5A4baKNGhCBLR3FsrSZhSUY8vwhm7N/vnSBFcFcTr4V1gDVfeGcFO9
         A7nI2CdfzEV5SbiApDd18HXNWC9iPr7rABTKAv03yfdwYgetYAGK8cKumPdyuMcFfjZi
         4UR4Pf2KNING8eNMOQmTVIPqjF154pPACqguc7E1haV+9S8C5Xv7x9gH4i+c4jUuIxi2
         WQE/lGMQakmUf6zBJAMUtYUG18cOKAsTze3aVvjOcITbHiEGcFGxJXtbAaRPo4NoDsvJ
         8+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jkA3kF7oouMrz8OaCx0NK+QuQogRafsrzsNMi1b0VfA=;
        b=6Lc/cbOLKCF81/kLuWmMHltV5rSDM6TrXpWvFCRCzUl58CEHhhpexONzo2AZTksK3t
         y/04atDhn4HopsWs85f6PkHHhuLLZLmoq+iIMXv92wSYOPtRRgma7XJXN93Fib/3kv0D
         u1ZwKbJHaTMkwMbHcNLG702uumDvryU4Z0tJM9FPXycz1PUxRncyJ7R12XSj3/kYqlBm
         B0n18qJEVPT9YthBRzGjI7LCmu7pkyPy+MTiWPUjn/qZxeX0PWmuHTwrbWD+kOLBI0iS
         FgFTdda71IobuYw7gpxouEXISlup+pDFkx2Nw2TMvXViaQXPhr09aWzmaZ0Dk7G0RXDY
         WRPw==
X-Gm-Message-State: AOAM5326UkqKZnNKY7Fj3iJXaXyzb3G6aG/vIFyvgRJxU1So8JZhEzy5
	6Vztn/Akl5VF6OW0cKX9nwI=
X-Google-Smtp-Source: ABdhPJwJuWeUCG00KDTtp+Fzw9yT30Vqn+RDPQx4j9k649W6aD9DBpXxpKobB8NFVGyj96lgHEuNng==
X-Received: by 2002:a05:6402:d72:: with SMTP id ec50mr38021050edb.107.1641237966177;
        Mon, 03 Jan 2022 11:26:06 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:26:05 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 22/56] staging: r8188eu: add parenthesis to macro set_m_data
Date: Mon,  3 Jan 2022 20:01:57 +0100
Message-Id: <20220103190326.363960-23-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enclose in parenthesis complex macro set_m_data

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 7a87fac66e43..869a38ec9ba5 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -191,7 +191,7 @@ enum WIFI_REG_DOMAIN {
 #define get_pwr_mgt(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_PWRMGT_)) != 0)
 
 #define set_m_data(pbuf)	\
-	*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_)
+	(*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_DATA_))
 
 #define GetMData(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_MORE_DATA_)) != 0)
 
-- 
2.25.1

