Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB5A6D1A
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 12:10:00 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id r8so4807473lfp.10
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 05:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q9WBuK6OhOs9OaGEgKhL5YcwsAzLgbzYaT8/doodq88=;
        b=lEgLOvzIKJ5bhK8vpMojTcxMOI2srsJUbA0cmAWbtDpyYtzKh0OyK4e9qe+f0bBg6G
         VnFiVxTaQEBGun2Pp+Zd7XrHiixkAgnSsXJXDKvx0RlQIn9zlhs006Oe9oSEQTo/47GM
         fVE2Hf4rigm9aNECIAnbYhWOa0/mbvWiNp4rmv/LwNWe3YH7EtURckj6phDmIXZuT5JN
         skxq4o6TQD5J5nWa2CLHAQ5hMvwOX9RVAv13ZzEJPlSMbPKxfmGV4SRUleXzS8yM6IUw
         YtXKBAAR2YWMeX3c4+P3ls8ddbgA2uIE/00O57vXuP9O+pPMD6wgk93Jb+YA6ADTRGuB
         wSjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q9WBuK6OhOs9OaGEgKhL5YcwsAzLgbzYaT8/doodq88=;
        b=c9H/MDhgIcwSL3QXT/00sRT6AnkcaOEXc242Xv5EhWQcEioA8y7TJeCGgkHdjLRdou
         Hef+jwmr1Q4hLSOK9esgMaIlbIiQDFR2Gl7h+yvF8AKOSe9uj13D/oDWj830ncyGZUyE
         7gT4KORlNhn1OVxp9u3PGineHMICUTRbrCYz9wNnMojODShd+nZT0KK6csKnt14gOoEr
         d69u/YUwCnuGX5qGu1CuiH+HRByczevaxEygJDI0di4cqSpSrzKY0lqS/OVBbks/wSVY
         Pd2siKpkKvhmeCYP5d45ukYFnF3J60Efoanhf3LleOXvZMLLZaSERursmmbzV2GQWWLs
         VKkw==
X-Gm-Message-State: AOAM5335sJJTwjLyjPcQsO9F1daBpFz/kZXhvGyTvSeUHakML476MzFZ
	88mPmGVUyUQdkf/bVM2at7g=
X-Google-Smtp-Source: ABdhPJw+iVRP+GEZvT2rCwytIxgNxOiVkZCy29EzmWh6/4ZXAxyMolXcr2rferfK10rUNCDzxPqhXg==
X-Received: by 2002:a19:6910:: with SMTP id e16mr20427477lfc.482.1617710998819;
        Tue, 06 Apr 2021 05:09:58 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id g11sm234319lfc.255.2021.04.06.05.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 05:09:58 -0700 (PDT)
Date: Tue, 6 Apr 2021 18:09:56 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH v2 1/2] staging: rtl8712: Rewrite NULL comparisons
Message-ID: <74471865b399584d73a18696d2008006301dfd71.1617710602.git.zhansayabagdaulet@gmail.com>
References: <cover.1617710602.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617710602.git.zhansayabagdaulet@gmail.com>

Replace NULL comparisons with boolean negation to be more consistent with
the rest of the Linux kernel code base.
Reported by checkpatch.

Signed-off-by: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_recv.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_recv.h b/drivers/staging/rtl8712/rtl871x_recv.h
index 7c9995060a6f..4aa39f4f3b84 100644
--- a/drivers/staging/rtl8712/rtl871x_recv.h
+++ b/drivers/staging/rtl8712/rtl871x_recv.h
@@ -135,7 +135,7 @@ int recv_func(struct _adapter *padapter, void *pcontext);
 static inline u8 *get_rxmem(union recv_frame *precvframe)
 {
 	/* always return rx_head... */
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 	return precvframe->u.hdr.rx_head;
 }
@@ -143,7 +143,7 @@ static inline u8 *get_rxmem(union recv_frame *precvframe)
 static inline u8 *get_recvframe_data(union recv_frame *precvframe)
 {
 	/* always return rx_data */
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 	return precvframe->u.hdr.rx_data;
 }
@@ -153,7 +153,7 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, sint sz)
 	/* used for extract sz bytes from rx_data, update rx_data and return
 	 * the updated rx_data to the caller
 	 */
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 	precvframe->u.hdr.rx_data += sz;
 	if (precvframe->u.hdr.rx_data > precvframe->u.hdr.rx_tail) {
@@ -170,7 +170,7 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, sint sz)
 	 * return the updated rx_tail to the caller
 	 * after putting, rx_tail must be still larger than rx_end.
 	 */
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 	precvframe->u.hdr.rx_tail += sz;
 	if (precvframe->u.hdr.rx_tail > precvframe->u.hdr.rx_end) {
@@ -188,7 +188,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, sint sz)
 	 * updated rx_end to the caller
 	 * after pulling, rx_end must be still larger than rx_data.
 	 */
-	if (precvframe == NULL)
+	if (!precvframe)
 		return NULL;
 	precvframe->u.hdr.rx_tail -= sz;
 	if (precvframe->u.hdr.rx_tail < precvframe->u.hdr.rx_data) {
-- 
2.25.1

