Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E318D259E
	for <linux-staging@lists.linux.dev>; Mon,  5 Apr 2021 17:29:24 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id a6so5529716wrw.8
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IbHMPTLRe24Pd8+2GD6131LEb5Zqf3YCRdiVTSad8Sw=;
        b=aXAtIKMkdOIlTW0pk1jTMcs3R5NHHI/lXeyz5J78WNSh+wZeZeAv/Xlo+p8LdsOOV2
         KsMMe4Apk4g1YpUkEqWya8nOb8HMBkzJcXMK8WvFJeAwq3kRWPpk1wr3TxR5GppLcnr0
         +LwEF9yzSWv8T0O+qlX7mwqaWYYObJsU1T83m5Nm1vueaUTU5vnMF/5vOEo7Irgsl0dv
         dYB+9WLxVpaLHshwE9izHFfVLJjdAYLzQETjnnUJbVo/L0F41Fffqw5qNVoCkjALYUcQ
         M1PXiYKFiLh3mHYC7JqxI+HLPKPFoXukmuAswOkT6wJoa0GYY3A1uP4Ddhp26pOXQhPx
         9N9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IbHMPTLRe24Pd8+2GD6131LEb5Zqf3YCRdiVTSad8Sw=;
        b=hv8R0RWyUG5W++YfMbkyJrsFr/pbN8c2p7IXi/A9ThhCaynG0Id/P18ANUWq5YYwBV
         tXfTWLjh3yA9zNtFdl1MNpWozf1qS0fUT184K1yzUqzKuWiBvm8pR85PLxoATaDPYuqe
         AL7+3xGeJbBgL+bXs/oaRj0CcqusbfpoBm30lvkpz5qYw7q6+GnchEo52c1Dle3tBuRO
         QLgPOCVISyh2qcIcP1h9cep1I0rVW0PtzWIfRwJ85F9AvJSIL5iNVHuBFn0ENRhmb8pB
         ppIkXPxdOOQeatwCG/p/wjjabahlvJfZhdFe9GkP2TDt6aP+mmkehWtpMYBJqpZT3BhP
         yl2g==
X-Gm-Message-State: AOAM533fqY9vBs/51F5AC6IkmGVXKiQVKWclLtcRN/ULAWVNdbqqT9o6
	Yq8SV4XPPLWorQ2Ve0gyzoc=
X-Google-Smtp-Source: ABdhPJxrXhiHQRU1bmAtbQNqHJTO63OR3QV1f7PuSiW8C29QPUx0aXqxJks3k4+2K+xiYY0+cinpdA==
X-Received: by 2002:adf:9243:: with SMTP id 61mr17346672wrj.11.1617643763484;
        Mon, 05 Apr 2021 10:29:23 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:9a5b:98e6:2174:bf29])
        by smtp.gmail.com with ESMTPSA id x1sm17858699wro.66.2021.04.05.10.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:29:23 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH 1/4] staging: rtl8723bs: core: Removed extra blank line
Date: Mon,  5 Apr 2021 18:29:17 +0100
Message-Id: <b2961b2d354722d063e05f92bef5df431b8e7898.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
References: <cover.1617641790.git.martinsdecarvalhobeatriz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up check of "Blank lines aren't necessary before a close brace '}'"
in rtw_ap.c

Signed-off-by: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index dc56477eb084..81acc6bcb092 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -910,7 +910,6 @@ void start_bss_network(struct adapter *padapter, u8 *pbuf)
 		/* issue beacon frame */
 		if (send_beacon(padapter) == _FAIL)
 			DBG_871X("issue_beacon, fail!\n");
-
 	}
 
 	/* update bc/mc sta_info */
-- 
2.25.1

