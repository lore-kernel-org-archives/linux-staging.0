Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E4E2C9D
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:37:26 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id q14so131859024edi.3
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ItW2ZfOCk9epwBWau94z6UshNP1ETEpj4UJB+QqE/lA=;
        b=IQvWk9Ib60swSMjpXrQjJYSNgARFj4Spks/nZczYoF6HQf9S5iIjBAXxHztE+0Mdxj
         fdgMj71f/K1twrhupya56RjjlRS63QB0ZK/57tnXVtT4XObfpBPGPak34Spy9Sh03lNg
         cf7wewJ6hB3Xea4H+kYOFlTbvi69NDP078Nxwi642focFCaG8OgJ63MXbTCNfhRDxbIk
         TU/p4D77kBjiKwp+XqAOzDcG/IrXd80gDnYBtujAFbbDD56VgzTY+yWAmYMXZoSaVrnn
         8hY6uKN3BQUfcs1CphoRQKlgigsm9RKRH2pkFKobg0KUKIHEr4bNU4a7QPLLfk/LH2TQ
         SlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ItW2ZfOCk9epwBWau94z6UshNP1ETEpj4UJB+QqE/lA=;
        b=jwwpCncUlA0TTnHGfjukhNvw+sqpN7wWv53HqNWDZvUpKVX+Kcxe4NBKTvF615OXO5
         UkhKLd6JgNJ9N+JPiNio5iBdknHenhOoeE7AWd3hZHeLUFCPlj1IYxHNC4r6hdZwP935
         2w6YN4S49bVve8zwpyRV4L7NRUrHe4DeTd07zoA5ppgRODzgaCq6AX6H+qA3rg4dnRne
         HMu8TzHpzo2kGE/OvfsF9Tqny/xMtknXXJzChkcomqzipXvrKY3M4K8JfsNNyisBIP6k
         9OKtylpqiY69NsdvfgtyER6wKSCyayffllRlIefH8Y3spUFm7XnAqAdRFf0nWP8gFHA4
         WmGg==
X-Gm-Message-State: AOAM533ECbb/WEZqKkTMnrYpu3VTovlXMWlRsh9LZp29E/nK7k4/fCD2
	rDWjssqXQw2KcOuuZMnwaSc=
X-Google-Smtp-Source: ABdhPJzcP7Vc9h3c4xSlwnS+qw176Bdq7YWsFJB3jEAmAZ5CPs8i7Ghi9PwPmyCCqBadHIPw+Q/Mtw==
X-Received: by 2002:a17:907:97cd:: with SMTP id js13mr37016585ejc.497.1641238644554;
        Mon, 03 Jan 2022 11:37:24 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:37:24 -0800 (PST)
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
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 34/56] staging: r8188eu: rename camelcase GetSequence to get_sequence
Date: Mon,  3 Jan 2022 20:02:09 +0100
Message-Id: <20220103190326.363960-35-alb3rt0.m3rciai@gmail.com>
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

Rename camel case macro GetSequence into get_sequence.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 8fd2ae89d7eb..6224e4631bf9 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1106,7 +1106,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	pattrib->to_fr_ds = get_tofr_ds(ptr);
 
 	pattrib->frag_num = GetFragNum(ptr);
-	pattrib->seq_num = GetSequence(ptr);
+	pattrib->seq_num = get_sequence(ptr);
 
 	pattrib->pw_save = get_pwr_mgt(ptr);
 	pattrib->mfrag = get_m_frag(ptr);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 7997eb290b4f..1b2545cba279 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -217,7 +217,7 @@ enum WIFI_REG_DOMAIN {
 		*(__le16 *)(pbuf) |= cpu_to_le16(type); \
 	} while (0)
 
-#define GetSequence(pbuf)			\
+#define get_sequence(pbuf)			\
 	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) >> 4)
 
 #define GetFragNum(pbuf)			\
-- 
2.25.1

