Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69168EBB
	for <linux-staging@lists.linux.dev>; Tue, 28 Mar 2023 07:34:32 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id q102so10028376pjq.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Mar 2023 00:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679988872;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74FtOghNrSOXlcsn5kCzAXgL3eR9Qjcb90tsTUubXFs=;
        b=LjpJwEAUIyoScr71Dd9QqoZ9v+7nFWU0SWT8gGgNLm0Q2xEx6jk3sVQpYX9a4LxEXI
         fcs95LsdjCcf9PxEhuxKQ2Ux4FHAbeb/7mP6tD3HZm6lsvDc/jzfC24035h+NrK2bNAb
         lmdGlJ8G6WpS5uRBoyMkr7EwsEnkabRzYxHGN+g/eJDP1ENEDGq6XD4pHXcEtFwM5QH+
         k8lihjsW6QNKswPATkG3OOpzs9NWAFljyN0gFW0Nx4y/v4CYVPzEI5Qjw31qZeIRjJHT
         MI8l1sl3XjTw+BdfWfF1H5MIkF3GzjewjyOq1DBmBcFWsCR6sQUD8O4pAMANKyBoPu9t
         iJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679988872;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=74FtOghNrSOXlcsn5kCzAXgL3eR9Qjcb90tsTUubXFs=;
        b=BzxdKTYLQIQc3aPtQiFmDIe1yGDO/2/7yGWEsXfiazA49UJwYqg5LFLlNlTGRDsLPT
         1dMoq5WZQLzPUXX5vOyUyujnNIsMsPME5j6Yjt196XVq7/4rYju/OFY0dUhsz07P/jnr
         z07sFAWk5Xi6Izr/NoZZaceJkALZn2tl0/mwERuLP9D8NmTTGuMAKIsEl7AusSbq9cHE
         yrYV8uPzGxrfEDEAJ0vl1nq0k2gDAgmH8iSuc+CpHCEutyFkygPZoY1wMyIcpSSCNpen
         /YIp+u/4ygy5y0VYf7kqOvsGPCzqwvi9O6bqfIYaeDqZ50jU+tnUmqqg/PKU5+6n7G/n
         1oCQ==
X-Gm-Message-State: AAQBX9csjX9flaqCep5wZZ/2rd6sCzJKGbY4P/02ZeSe01iWfQeMQcyK
	e8OhoBnbDNEpRktNaRaq0Fg=
X-Google-Smtp-Source: AKy350bsIvk5vENGCQauLzCQa8qbHe1+rPia+gx1rzsNB2dCkEpvwxKtnbHxtgJ5BdgoI1BmXIFWQw==
X-Received: by 2002:a17:90a:4fc2:b0:23d:4242:a7a5 with SMTP id q60-20020a17090a4fc200b0023d4242a7a5mr16518173pjh.47.1679988871799;
        Tue, 28 Mar 2023 00:34:31 -0700 (PDT)
Received: from trent-reznor ([2601:641:4000:81:94c0:86ec:d844:1f3f])
        by smtp.gmail.com with ESMTPSA id t16-20020a17090ad15000b002339195a47bsm5438626pjw.53.2023.03.28.00.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 00:34:31 -0700 (PDT)
Date: Tue, 28 Mar 2023 00:34:29 -0700
From: Daniel Watson <ozzloy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: move open curly to first line of if
Message-ID: <ZCKYhfonZN36ZHjG@trent-reznor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch flagged this as a fixable style error.

Signed-off-by: Daniel Watson <ozzloy@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_recv.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_recv.h b/drivers/staging/rtl8723bs/include/rtw_recv.h
index 44f67103503ae..fef2fd0e8c84f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_recv.h
+++ b/drivers/staging/rtl8723bs/include/rtw_recv.h
@@ -398,8 +398,7 @@ static inline u8 *recvframe_pull(union recv_frame *precvframe, signed int sz)
 
 	precvframe->u.hdr.rx_data += sz;
 
-	if (precvframe->u.hdr.rx_data > precvframe->u.hdr.rx_tail)
-	{
+	if (precvframe->u.hdr.rx_data > precvframe->u.hdr.rx_tail) {
 		precvframe->u.hdr.rx_data -= sz;
 		return NULL;
 	}
@@ -425,8 +424,7 @@ static inline u8 *recvframe_put(union recv_frame *precvframe, signed int sz)
 
 	precvframe->u.hdr.rx_tail += sz;
 
-	if (precvframe->u.hdr.rx_tail > precvframe->u.hdr.rx_end)
-	{
+	if (precvframe->u.hdr.rx_tail > precvframe->u.hdr.rx_end) {
 		precvframe->u.hdr.rx_tail = prev_rx_tail;
 		return NULL;
 	}
@@ -451,8 +449,7 @@ static inline u8 *recvframe_pull_tail(union recv_frame *precvframe, signed int s
 
 	precvframe->u.hdr.rx_tail -= sz;
 
-	if (precvframe->u.hdr.rx_tail < precvframe->u.hdr.rx_data)
-	{
+	if (precvframe->u.hdr.rx_tail < precvframe->u.hdr.rx_data) {
 		precvframe->u.hdr.rx_tail += sz;
 		return NULL;
 	}
-- 
2.34.1

