Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB32C6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:31 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id w18so24902706edc.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O1aFTwFa3e7XfhNdQLIqRt53XzZNGqwukxfvFSfxhVw=;
        b=s1vgJHd0xERyv+jYDm/Ug7hVQ+VjvmU0pKdnS8SJCPO0RjDfhe8vn9sw5wirMQ7DqU
         uuU4+nf9mSXn2LMcTVUi9w+5z6oiJSkhRzsztCxFDXmjazhM6sx52zqXOiZaDWtzT8S9
         Gk/rHS5sgGljaEWw2h++O165TJIR+aAPpVj29oLeILqbN/F+hWkWyw8LTb4E/P/I5Ycv
         e2kNpJ5F8FDMkXspeIuqld1m/K7c/7NTvHnoFtacZb3ylfklZpIDfmQQxwqy8sNVdsp1
         vclhfB1a0yuFoOnyj9zq+jIMvNJk9UZUqnWyLT+wcRXGgBaWZ8dzxfN2ORpcW3Zku6ut
         BtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O1aFTwFa3e7XfhNdQLIqRt53XzZNGqwukxfvFSfxhVw=;
        b=daF9Pol9uGMMuXMoQWNYw/1/duuRy8mKija8YavUbupswXKyZWTj/Lizp/5VIJ0Cvl
         x1QZsJVwNAh7PMIQjndzj7RVNux1tYckRCLvbE/Wdo1h93UYgr0wuHrgTg/QuErXLaj7
         7g0QA98cw9dz+KR+A2c3cCpMP15bKkzUYXNs+z/+ffNRthU/xEE3Oc0Z7Cv+KZFNWZPz
         wgBS92NgVZfzgrfYwjlO/uajVYGbQ/0pEac5Lsr2jRgAPsynSaFtp2+966z/m4TP9L5o
         Cs9a5BUUpDoQd7dkhAuXwZnp2x5TUFgV+fr6y/12nd85RmUWj0Ob41oD3EUp+cYqq20K
         3BiQ==
X-Gm-Message-State: AOAM530lJJuuhAm+c+xUrH2Glwhjl0oT/wiJWx/+1YrIlgnqo+M8lveP
	oDmjNajOrnsFefRah0rY4FXubA==
X-Google-Smtp-Source: ABdhPJwfsQYUqv4wT3YXO5qYgt7SaeynRLeosZJw6WqDJRIvdoW8NTosiObVvnIPhbUMDVJdV2Cz8w==
X-Received: by 2002:a05:6402:1685:: with SMTP id a5mr163642edv.185.1618423950410;
        Wed, 14 Apr 2021 11:12:30 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:30 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH 53/57] staging: rtl8723bs: core: rtw_mlme_ext: Move very large data buffer onto the heap
Date: Wed, 14 Apr 2021 19:11:25 +0100
Message-Id: <20210414181129.1628598-54-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function ‘issue_probersp’:
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:2543:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index f708e7b9f8fc8..78ca8fbaab8da 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2450,9 +2450,13 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			u8 *ssid_ie;
 			signed int ssid_ielen;
 			signed int ssid_ielen_diff;
-			u8 buf[MAX_IE_SZ];
+			u8 *buf;
 			u8 *ies = pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr);
 
+			buf = rtw_zmalloc(MAX_IE_SZ);
+			if (!buf)
+				return;
+
 			ssid_ie = rtw_get_ie(ies+_FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
 				(pframe-ies)-_FIXED_IE_LENGTH_);
 
@@ -2478,6 +2482,7 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				pframe += ssid_ielen_diff;
 				pattrib->pktlen += ssid_ielen_diff;
 			}
+			kfree (buf);
 		}
 	} else {
 		/* timestamp will be inserted by hardware */
-- 
2.27.0

