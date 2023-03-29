Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551A47B
	for <linux-staging@lists.linux.dev>; Wed, 29 Mar 2023 00:30:01 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id q102so12499776pjq.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Mar 2023 17:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680049800;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5dDXDEKaPWyjVmYBq6F6y1pBkqb1wubgYG9yZaDIb+g=;
        b=n/dED3HhgTrJKd3HcAlbmgd4LrtzSNSBwSm0od/SyON23+Lnljpcpvvapng6VaQfQD
         cbpoxln89/Q86WDDVn9xDJvNlyMQtj/AQcx02+tTdlI+7hEnr82LhTGzSWkq2mZZKsiq
         nwUNgErJh2JOPAi7x9shhNWf/ywg62wkDl1tJ8yf8knm8uS7RgWn53+7pqyhnX2MbIqA
         XVKlMxZesro4ubZ68NyYaIdX3ctBLbWRmG5TU9EFnH2F8MzctGDnhZpLe8fVd1D1rdip
         8zqv1ZOqngLzUAVVHEpbmPwuewKjZ8T/1uc+uWoo0VWGCtS/4CO7rI4josyzoE/7R6Vc
         un3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680049800;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dDXDEKaPWyjVmYBq6F6y1pBkqb1wubgYG9yZaDIb+g=;
        b=TwCD58WBHD0NWoQ7xpx7GM2IwKHti3Ov3g/+ZYvzxT+ebyj76uF2wJCeVh4s6Lx4bf
         DtQ0man0RXm28PcDp6LxsLVxExEHviLZUMx8eNBXRM1kA5j/zFgkEByLC56sbHUzbVVG
         WpnPFdt9ZcfvkiYB03k9KgLQjX+xtweHJIBMm2bKDmjXd2zgPmPJYMe1lenUzJv2i03A
         rIT/jHE9QutYzB3i/iwdCwGYV2YPPaf2SJ9JF4ADRiW+Fqz0Cy52O9VO2rYeKweshiuS
         0fig2u2JVvO6Lc0JYs0iJ6lPtq0EKrJHINOx3IZcWTHoqYiKmHdumrl6AOAetCT7i7gF
         su5A==
X-Gm-Message-State: AAQBX9fpycG9Ogbry3yYphaOpQ0qFZb2QiFanisfZoq/739hAa1EunB1
	OI12HlNCgN3JYbrzjt3f7xI=
X-Google-Smtp-Source: AKy350bCmesSDRvdPkjekz+Z3jVn5m2WxHssAzk9i+O2Fcen0QNNUL/BxQEowyaU/VBhRJ13Yfd+SQ==
X-Received: by 2002:a17:902:fb4b:b0:1a1:924d:19f6 with SMTP id lf11-20020a170902fb4b00b001a1924d19f6mr14778667plb.66.1680049800637;
        Tue, 28 Mar 2023 17:30:00 -0700 (PDT)
Received: from trent-reznor ([2601:641:4000:81:6dd2:ac8f:513b:947b])
        by smtp.gmail.com with ESMTPSA id jl17-20020a170903135100b001a1d41d1b8asm16668689plb.194.2023.03.28.17.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 17:30:00 -0700 (PDT)
Date: Tue, 28 Mar 2023 17:29:58 -0700
From: Daniel Watson <ozzloy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: conform if's braces to kernel style
Message-ID: <ZCOGhkLvLtBEo92Y@trent-reznor>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Move the open brace of if-statements to the same line. This matches the
brace placement style described in the kernel's style guide.

Signed-off-by: Daniel Watson <ozzloy@gmail.com>
---
v1 -> v2:
  - explicitly state in body that patch moves curly brackets
  - provide consistency reasoning (not just for checkpatch)

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

