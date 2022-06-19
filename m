Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AD77B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 19:42:58 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id t3-20020a17090a510300b001ea87ef9a3dso8391678pjh.4
        for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 12:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p64PM6E0TGRLi7vOtiUccETzM6tLKB5mp4MOcHiJCCA=;
        b=otsj+QWi/QqeRrqbbivddkYBK20Ow+ZA4auexlE+f5RNCTdE/E4TEHi/VQFGmqpD+N
         ilyCyLzeA48sbbxX6wqYF0Y+Gn3kcTNLVuGjhClY+TRss1eJwShYgMb0o2ga6d0U1Up6
         3m7+Bu8X7P8k5/l0NndJoFXmQ26IaYFyZn9vt2j91Pe41JqeKF/OdnC1GiC7RUzqtHq6
         ks423bAssMsHYdHbysdQnP3VlXmpo9QteOvJl9IS9GefCqLo8rSZI18y31iSgqLAKzjf
         jDhWB6hQu9ZX60ExUevPFytfiIlP8R35yuwerqZH4v+Qas+OmxuV9Kao6UEbbATCpYQb
         urow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p64PM6E0TGRLi7vOtiUccETzM6tLKB5mp4MOcHiJCCA=;
        b=CWe8mpklTptTH7CvKkwEn/QKzex0LaFGz6N/1VJWQYWYpK//0dvQRsGfGo9Qqm1Cxo
         S+JX+PEw4S47rNKzZ2RnagUJEDGFbBjBIxQKfdOKW2osoRHzTpKT8cM+4gPWK33tLd3E
         0OWcHdQPwb0mLwaGYSMrzJAdaAWe1niLPYQT7MEPyGOa6lRSi+8PLbR31W7M59mZPUeQ
         BgIAmsawe7ZXB1jYr4xJr4EPoNIZO6du+qZ5Jh1q4/DF7ACk7/Fj5FSh24B/dI1VkMTZ
         AVthQWXm0qmA+VwHloocXhN/wrZ074idVgcs54qp+S01MD+oT5rDYhdH6dohbyGW8Z5p
         IdMQ==
X-Gm-Message-State: AJIora8qQRgbw9YyCJhSqxSXZ7cfbkSAfuHth46VcfFbd0dseNim7XkC
	XpwKgtIvEAI+3w4/gfV2Lbk=
X-Google-Smtp-Source: AGRyM1tTEVPq8AxeR+Q/BVmPnVdkXz2lZ/RQFuYV0erbmazTI/xk0cGSEi1l1XGP5xwHiWwxFuuUrQ==
X-Received: by 2002:a17:90b:17c7:b0:1e8:5136:c32a with SMTP id me7-20020a17090b17c700b001e85136c32amr22873247pjb.43.1655667778131;
        Sun, 19 Jun 2022 12:42:58 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id z4-20020a62d104000000b005180c127200sm7370805pfg.24.2022.06.19.12.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:42:57 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v2 4/5] Staging: r8188eu: core: rtw_xmit: Fixed a brace coding style issue
Date: Sun, 19 Jun 2022 12:42:30 -0700
Message-Id: <ff6f2ecb22c3d295ceae0dab593bedfc6eac9e32.1655666628.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655666628.git.marcus.yu.56@gmail.com>
References: <cover.1655666628.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed superfluous brackets around a if clause as per checkpatch.pl

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 73eb2f01c176..6797335f7855 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -952,9 +952,8 @@ s32 rtw_xmitframe_coalesce(struct adapter *padapter, struct sk_buff *pkt, struct
 			mpdu_len -= llc_sz;
 		}
 
-		if ((pattrib->icv_len > 0) && (pattrib->bswenc)) {
+		if ((pattrib->icv_len > 0) && (pattrib->bswenc))
 			mpdu_len -= pattrib->icv_len;
-		}
 
 		if (bmcst) {
 			/*  don't do fragment to broadcast/multicast packets */
-- 
2.36.1

