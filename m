Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E47173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:39:18 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id f5so139697855edq.6
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BMhggAvIizLWpZm5anArBqzFIM1VgWDkud2H5TZUdOQ=;
        b=ILjtXqTydxDVe43R7vp27AFF1uezTtpQc2Pq41CcWnIn7oeOYpc4rd/Gv9YHBZG1q9
         raRvH0tYi7J4QcDjb0AC6CNGZV1yMZMekWXRhXjhKQnlVYtZtR1hFpB8rw8wg2mNG7sH
         lrOUr5uALw7BbMOB93VTF38N1O6KZCr5F1HuQpvNo/uycHDsMuey2oxzUGOrT3huyA8S
         zVfX7I1YIZJSGMlF+lRNI1xYvNjR8fFOKeO2WMkKJIZasUcIGFUpQl3Ck7XwxQVvuB0j
         g1QioGYzGeQsiNepciskXOoJFzlh1aQoxwoaVGTEX0MmSZ/JG4fTsO2FGw/H0FuZEhGE
         kKtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BMhggAvIizLWpZm5anArBqzFIM1VgWDkud2H5TZUdOQ=;
        b=CIDF12s6yUYoKuOXvi7UnPaM5xAQbnUFGiIubZ25XtZH+da0/fGY2OdPd++PmYKIIb
         4OrT5smoiDGFbhQnyFxgPSZ5f5tSMVzyITWDBVN/jiX+mlYJVLkVbJJmRS0j9MIw5vbY
         VSwC97FW5xY33kuCZyX0R/S7FYddkINaanppVUK3pB2vhXphqAulsDY6o/Z6pxLYvnpG
         fjxunk9cQgoJHLTykP4KPlzchuS38ZSV0KSQHynckzAJW1KWFwIXzoMZihWwGqC8u5UE
         LKKVNSYjyfpyqRAVKkZcKWjfMYtw5QN9CZH52h1AIHRmhg/xGtiWmFaDRPqT55XZ9pED
         GOJg==
X-Gm-Message-State: AOAM533UuU6onu3wvvGymwxRGKPshvrRmf8sNw6Q+zDC547/L7nYG3Hl
	7Tk/5gUrclVQ392mixqgkZo=
X-Google-Smtp-Source: ABdhPJyDx/PUo9F9PIasWO3OfV4fpxNZtHIjJ5Ib3UTPlJLaFrNiDwiGGdk7W/1OtHBydLkqLjPVGw==
X-Received: by 2002:a17:906:71cc:: with SMTP id i12mr38604007ejk.457.1641238756758;
        Mon, 03 Jan 2022 11:39:16 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:39:16 -0800 (PST)
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
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 36/56] staging: r8188eu: remove dead macro GetTupleCache
Date: Mon,  3 Jan 2022 20:02:11 +0100
Message-Id: <20220103190326.363960-37-alb3rt0.m3rciai@gmail.com>
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

Remove dead macro GetTupleCache.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index ec9fe081dbb4..652a31da0556 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -223,9 +223,6 @@ enum WIFI_REG_DOMAIN {
 #define get_frag_num(pbuf)			\
 	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) & 0x0f)
 
-#define GetTupleCache(pbuf)			\
-	(cpu_to_le16(*(unsigned short *)((size_t)(pbuf) + 22)))
-
 #define SetFragNum(pbuf, num) \
 	do {    \
 		*(unsigned short *)((size_t)(pbuf) + 22) = \
-- 
2.25.1

