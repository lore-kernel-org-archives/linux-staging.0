Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFD26D1A
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 11:43:47 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id v140so4425405lfa.4
        for <linux-staging@lists.linux.dev>; Tue, 06 Apr 2021 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Q9WBuK6OhOs9OaGEgKhL5YcwsAzLgbzYaT8/doodq88=;
        b=FGNFAZPqCEv3zJHnNSHZC66i9V/OZMZFSbChHMkmTFpg5xHD3JV14L7arnZXaRbOFl
         0xszyZD4NXj5rU0elJif8lA5NMQOIm4BrEEN1UqFo54CAC4CbLvkfvUU78n4/zN3xJbJ
         tMEtNUN4s2AVNWJx71ZTBR5tAEKO3+n+Hf48QFZPAh9ZgMWH50Ntz6rHRHQewePMiorp
         b2q3+/3hluoekjEmv8THygae5Vt2ka6RAoXD2oYWI3A66UhB1CMemAlBtbB77m3mt/CY
         ucO3T4oulrFvrU2G+m+OVeOHy8hH7acQ+9+KHVRZte1XD2+5huAXNbaUmKvx6Spr/umu
         qwBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Q9WBuK6OhOs9OaGEgKhL5YcwsAzLgbzYaT8/doodq88=;
        b=fYph3qPlqAeDqxuIJ8LbLV/yFGUTe5ZfJ/sAOMyZ8ETUIoFu7FugoYZDF5MdMmJhAJ
         rqOaUIJ2/A/9xFHJ/CW2Jc0tx6TqKq8EepMjoRuWTq+SFTkHEZ8FLwSTNLX8DbKgJ0y2
         T35x7pIaiKeQRUenU3g0cQo3WvvyFwc2a6IUkj708+DffkvuIhv138wRCvrXF9Tnccbw
         4aFDmCWbH3r1g3KehaaepftaqOpVdDHyOjbKc9bUbDlh/GCPod23BycL0lgrydAxRS8b
         +ymJ6h4nDqvEXiHShunmvjGtZk2Mo27hi83Wrlh4CPzeCajjnusZ59ZIf+fSdne0jn9F
         03zg==
X-Gm-Message-State: AOAM531NgCFsJybPDegYm2T+/xxJaFwu32AVZ636b1L75zUH+FetvfdC
	O9jDpHypil2a1S6JkHXPMb0=
X-Google-Smtp-Source: ABdhPJzSmDvywKme+gC3EQ9MaqzfjJ43DnM1j7ttMF/OrHQs7HIopbK5dc+zZKkYN+Fj7K71YXEPSQ==
X-Received: by 2002:a19:cd1:: with SMTP id 200mr21004350lfm.480.1617709425433;
        Tue, 06 Apr 2021 04:43:45 -0700 (PDT)
Received: from zhans ([37.151.32.231])
        by smtp.gmail.com with ESMTPSA id h9sm2206860ljh.58.2021.04.06.04.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Apr 2021 04:43:45 -0700 (PDT)
Date: Tue, 6 Apr 2021 17:43:44 +0600
From: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com
Subject: [PATCH v2 1/2] staging: rtl8712: Rewrite NULL comparisons
Message-ID: <74471865b399584d73a18696d2008006301dfd71.1617708653.git.zhansayabagdaulet@gmail.com>
References: <cover.1617708653.git.zhansayabagdaulet@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617708653.git.zhansayabagdaulet@gmail.com>

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

