Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227CE29CA
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 16:37:26 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id om7so2595105pjb.5
        for <linux-staging@lists.linux.dev>; Wed, 09 Feb 2022 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H4jFxmUni6FbOkZnCa6JLyaPCS22eEc+ZVQfL1y8iaw=;
        b=WWs21SjLS3G9zEQAIJzi6Y6yF1/J+ccsfWGeAniVbYn726FpGywZOsylkpxebp+18n
         YJU4oHS0bf16sn+HhUAc7Nq7Nd0jFUxHn5tEyetgQsTqNwVqa1Vma/zAp84Rkwv3KL1i
         p+ojDVWVuvv8KXVwKBClepAbIbwmYuK2da4kNWFAd854w1NWAQS4p6g0L8NPNWeqgLSr
         H6xNZm0UyTNj/Rb5A0ZZu5CLNhVPewQTdiwi9WzmYwsEokvS1r9G6Z7KwuaGo6W3X4ue
         pNzJGuapPlY69LrFWF45TNU3kX2sdrGSmNQZREdCfOhuTyLJ5HyghZfF4CxUWfvsfxqj
         r6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H4jFxmUni6FbOkZnCa6JLyaPCS22eEc+ZVQfL1y8iaw=;
        b=1ZdUbZJXelU78VyeMgKN7yqW762f2gGPPO5FRuuPNU6lHlsW0vl7GiWhGky7+9AtZN
         XvZskXCHSwuaFetl73kkoD3ynsIutBVYpIB25sSB6Ur/BIL8HzAipaDGicxN6uXQUENn
         rO8L+IE7lHK554X1QIJie+TsmRpfBHRb4KN424SqSzBAqsKJq4uLdyh7fzuooyBwDUul
         SSGu5lM5X7Ptco65pArMpXjN7o9oM/lkn2hv0/lYLqqsiRvvrQhxkkZBQJGtO8SbOPO9
         prdPiH2gsUXX4S3W9wnjc8/TJ6AM2jQa+6AeN+0/CE+DJ9hnFyStu4uNNyIZG++Siyx3
         yZUg==
X-Gm-Message-State: AOAM532IX7PhsDFkrMVqdy0W3HcWlLMZgGGWhQcteRle4DVcHiQotGtn
	Wlw7V5Y6C3h+YmqRNqv61dxLs3lfugI=
X-Google-Smtp-Source: ABdhPJz83GkpvY+UeNicEorQn/f50/2QRTWl8JDgzZW4eysK1CN8l6OFz3rwi1CuW+GpB01eTN17RQ==
X-Received: by 2002:a17:90a:2e0a:: with SMTP id q10mr3443760pjd.130.1644424645601;
        Wed, 09 Feb 2022 08:37:25 -0800 (PST)
Received: from localhost.localdomain ([122.164.186.156])
        by smtp.googlemail.com with ESMTPSA id kb18sm7840199pjb.30.2022.02.09.08.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 08:37:25 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Abdun Nihaal <abdun.nihaal@gmail.com>
Subject: [PATCH 1/9] staging: r8188eu: remove unused struct zero_bulkout_context
Date: Wed,  9 Feb 2022 22:05:59 +0530
Message-Id: <05b72a7b045a829de6f706295d17c9f0d5fa5e2f.1644422181.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644422181.git.abdun.nihaal@gmail.com>
References: <cover.1644422181.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct zero_bulkout_context is not used. Remove it.

Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/usb_ops_linux.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
index 3977a717d30a..d75933c73946 100644
--- a/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/os_dep/usb_ops_linux.c
@@ -20,13 +20,6 @@ unsigned int ffaddr2pipehdl(struct dvobj_priv *pdvobj, u32 addr)
 	return pipe;
 }
 
-struct zero_bulkout_context {
-	void *pbuf;
-	void *purb;
-	void *pirp;
-	void *padapter;
-};
-
 void rtw_read_port_cancel(struct adapter *padapter)
 {
 	int i;
-- 
2.34.1

