Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9CE3FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:18:49 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id 7so11433287pfl.10
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 09:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KG5rw8fq9QClpiKXfvagJa/MQ1uYCf2JiD/gsJPzlGY=;
        b=XltUDgMW2Qf2bAKXI4A8LtmvSxIKAnIMye7ZdHSOcsDNDXXgD8iosp+UE2wSPl8waO
         DTKyqcHlVvbjGFW5a2HRMuxf6XXrHbkM+LCDcjr2fHZCO5GxepkzYNkjaYsoM8o2QvC5
         3OngRRWe0H99//lU4TaZ6IWZzjr5QwsyGIDuKxdBW4hz4/5dVoOW1k8rZku4felSOX/u
         sFPFjU3G+rIub0EIOqW1iG6qGkeI+q9093FcOop8ex2BD9L7TPhxhAv85eLiugDCYZY5
         JSg5J+XTaetCRxV4BPgxvv7OwCIlEXBMrR5QTU5vBjkFiDmEk14VpIO/n0vJFt40vZ3S
         0gIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KG5rw8fq9QClpiKXfvagJa/MQ1uYCf2JiD/gsJPzlGY=;
        b=GByFn3/xIRD6qLaYzAzFqNaAygy/xwnGM2e20TZ/MnXtpQJFmAla6RGb7wzvfjq8qT
         cnI3sCviKyFcSK0wDtwlvoGUoWAD9jzFbuWCSz2xqYdoicCICheM/7Eo/ZoWAjCmKxiy
         qay7VFYx0huoiQn0zd7aYJauYroZrcokxzivl54ToHyA71pznK0lJSFmaobcORomD1PW
         MIzZqLkDDJTTryyJKtVZ0du/fiNhM1BdOplef2py3NrcN0jKYmN8xjNbVSxT1t7F0Wr2
         1WHe+4D1apJl9WfQpv6HsR7GLMquVki7dN8i9d3D6MqyKjf5knfRw6wW6zcj2lfCiclT
         3vrA==
X-Gm-Message-State: AOAM531SQWpHA/McmwN5VuCwgoIxMEmbesr4EktEXeIu7kato4tf7Zj+
	dco7MGKpsa9mndwGtwipC24=
X-Google-Smtp-Source: ABdhPJxKbgmWixqtmMs4fMYk4ad1KqvahkKC1vk88SrdYpz5tvLB5KnBsl36uAcj+PaqcGZSX0Y7GQ==
X-Received: by 2002:a65:664f:: with SMTP id z15mr21347363pgv.252.1629562728788;
        Sat, 21 Aug 2021 09:18:48 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id y27sm4227011pfa.29.2021.08.21.09.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 09:18:48 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] staging: r8188eu: incorrect type in assignment
Date: Sat, 21 Aug 2021 21:48:32 +0530
Message-Id: <876b83dad76a6f561879da0db1fbb25b251374d4.1629562355.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629562355.git.aakashhemadri123@gmail.com>
References: <cover.1629562355.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:516:57: warning: incorrect type in assignment
    (different base types)
> rtw_br_ext.c:516:57:    expected unsigned short
> rtw_br_ext.c:516:57:    got restricted __be16 [usertype]

*pMagic holds __be16 change it's type to __be16

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 83a4594a4214..14cf13516d34 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -474,7 +474,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 		/*                Handle PPPoE frame                 */
 		/*---------------------------------------------------*/
 		struct pppoe_hdr *ph = (struct pppoe_hdr *)(skb->data + ETH_HLEN);
-		unsigned short *pMagic;
+		__be16 *pMagic;
 
 		switch (method) {
 		case NAT25_CHECK:
@@ -512,7 +512,7 @@ int nat25_db_handle(struct adapter *priv, struct sk_buff *skb, int method)
 						tag->tag_len = htons(MAGIC_CODE_LEN+RTL_RELAY_TAG_LEN+old_tag_len);
 
 						/*  insert the magic_code+client mac in relay tag */
-						pMagic = (unsigned short *)tag->tag_data;
+						pMagic = (__be16 *)tag->tag_data;
 						*pMagic = htons(MAGIC_CODE);
 						memcpy(tag->tag_data+MAGIC_CODE_LEN, skb->data+ETH_ALEN, ETH_ALEN);
 
-- 
2.32.0

