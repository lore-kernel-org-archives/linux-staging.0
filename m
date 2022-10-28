Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71F57B;
	Fri, 28 Oct 2022 05:14:31 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id n14so2345916wmq.3;
        Thu, 27 Oct 2022 22:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y8Cl50GxiFHirgjeWPOfiswX2gs4Kajn64w85/PEn9Q=;
        b=aNZyiFu8QyAiNdVys2tpGzR/2lt6NUhGjCrNITFwiS+dPB5Gn1gx+YNA5KyZ/qOmYR
         Wq2uUP33O6D5zmrCGfYuRXnySKEucM1rAyvYMAkkxnKLXujmSwgSu0U80zwzAV8FsVYM
         A/5Y8maP6T+c4mcNrd55u+0xiUjtDrfIIASSnjSHmRT+YsNGCAn2w3zSqDqqJh5UDxNE
         kAm6FhaWx7DKLbR46mya/kdBgj9HSjpzNODjfuVRAAvEcqetMRym80Dfns/svvHJkKcv
         Cni4dCzTzXQ+T2+34lOGMlprcXyOUX6WcM4bcPdKM6lrgC0KKD1sKfj3KfI9nVzOhFDt
         I2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8Cl50GxiFHirgjeWPOfiswX2gs4Kajn64w85/PEn9Q=;
        b=0/3hnu13+4+UPmqr5oxPjYBS1Lp0Jlg/Peb1Ce7HxOUGgnWxZOC8R3bzOmbYv5JW3K
         akxJlqe8VdDVn68NbEXJrw5Ce/C7k0BtdKUOJA9n9a8CkFBRFKhXW46PlQktRSw6aufh
         bX88FQjcmabJl7bGQG6Jk406g+N+vZ6LajyCLdQYC/MT0xw74URcOMMGaPAnkOFNlt2X
         4aPO8KO92N6GN72PCOlBCaH+DIpq7Qj4dVAnOwva8t7xbaqzfja8/3o4DQPu7A4nSKvk
         tx9S47+0kQIT5XStwvQYnjnZE7Za+CJMl6GvUrjYa/vbSLET8y4g13Y95W6Yx2HujXcz
         KDUA==
X-Gm-Message-State: ACrzQf3FVQyNbArSZI1rzYXngHRpSUMvKdbhi5/EDM4NdeDOxOU6qGoU
	dPCnjCPetpSehDkvGPQ/YonaPv3x1u1GN7ch
X-Google-Smtp-Source: AMsMyM622kSlxG/TIpcADNn/5SRSeYeEfF7kG7yWa7pmhzooVofXyimagOAy9qY+BBWtZxDlj97SRQ==
X-Received: by 2002:a05:600c:46c7:b0:3c6:f3e6:1f13 with SMTP id q7-20020a05600c46c700b003c6f3e61f13mr8040409wmo.62.1666934070110;
        Thu, 27 Oct 2022 22:14:30 -0700 (PDT)
Received: from rdm ([41.75.189.203])
        by smtp.gmail.com with ESMTPSA id p23-20020a1c5457000000b003a601a1c2f7sm6357483wmi.19.2022.10.27.22.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 22:14:29 -0700 (PDT)
Date: Fri, 28 Oct 2022 08:14:20 +0300
From: UMWARI JOVIAL <umwarijovial@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] WARNING: Possible repeated word: 'very'
Message-ID: <20221028051420.GA30073@rdm>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

i used checkpatch.pl script to identify the above
Repetition of the same word in one sentence same line

Signed-off-by: UMWARI JOVIAL <umwarijovial@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
index 090345bad223..30a0276b8b58 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.c
+++ b/drivers/staging/rtl8712/rtl871x_xmit.c
@@ -766,7 +766,7 @@ void r8712_free_xmitbuf(struct xmit_priv *pxmitpriv, struct xmit_buf *pxmitbuf)
  * If we turn on USE_RXTHREAD, then, no need for critical section.
  * Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
  *
- * Must be very very cautious...
+ * Must be very cautious...
  *
  */
 struct xmit_frame *r8712_alloc_xmitframe(struct xmit_priv *pxmitpriv)
-- 
2.25.1

