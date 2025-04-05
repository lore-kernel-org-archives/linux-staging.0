Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE34D19A;
	Sat,  5 Apr 2025 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743811807; cv=none; b=F6204xcK8dBxWucl+Aq/FMkRY252XyYoU4SwI0CwPenznSGeuUMOMGczP4gDahvRdZPXvoqdEUi/JW59aYWVLi89nk/8dm5VkzVvszE5x8Ih8LmNN86elGovLenhDR/xZINTbyjU1AlzwklOuGD69Sp98eKuWrD7c9KwwzWEzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743811807; c=relaxed/simple;
	bh=pmmaRqN7rXALYQH83hlqR8An1ishV5jBJzRY+eC4NUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aSQnggQ8f3WxznbE4XE6/5G0he263AxuvYmCOVBoSy3LsV1R8d5u7sw2/ERMff9SeP9wCL5usUzJQ4TAAg5CAuV83f75EnRIu7nsYwjj+DXqvEOuoCEtl/73NKl0n9MbsYn1ZmbdeblVNB/Cs7eCmb302C8EMBn+6nqVysVYcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UZ14YlN/; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UZ14YlN/"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6167d0536so4606129a12.1;
        Fri, 04 Apr 2025 17:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743811804; x=1744416604; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HEjVc9ejEgtKhgMciej+qKT5ntFRA2f8i3TphBlRWL4=;
        b=UZ14YlN/L3vZQ4jJ2oOfbkQYNTPPHsikYi3s12XeFvNsodNWCYrhywTNbTy8bb0wsx
         r5zU3sUuawKd/KZjhXfiGDAVaweZ9hnTWVRHuo6TOFek0p2p4GwDi1gWmVpdXQUkYxjn
         6v2t2y+84oaiDHMM6iamccxiZ9bqQNfT6VbTw6YcntPfAuA8XUbXZ4N009GMKsytQLhA
         0gmcveVcKrAZdigS3b3bJvbVq7pnY68Q/YNJiHg+aUCtTMAPR6S4DnAFeRGAH24vTJLT
         bH2dLtQCcokEBE8Y6nvxU2ySKPqMf+CW50y8carDMaq7XkjpLgOw7+bOQiImJiP48rB0
         5E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811804; x=1744416604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HEjVc9ejEgtKhgMciej+qKT5ntFRA2f8i3TphBlRWL4=;
        b=cu+PBpIB/hzB35UtSCBoGmjFUPP3q7qk89oCMzHB1bK5W3zd0nTPu7BmTDKu3KLgMc
         BdC6IXy+DPWIjMfHaIst84v/X7AjoXydmHORFoj6HFloR4OnUQlBKHmB75wF6iHThJfG
         NRVyhdoTre69Y6H+UMBljXnmeYtbqOCc2P0ttMQc+J50IpwmDt1g15dXgWYcqWT45vQS
         RiMHn1tqupZC/NMXUL8CY3wAGtHK4wxChxoBzoAFZfYdxU4+acXFdPBvwPYvtOY/BQRm
         D7tXf9ieRKAtHHfPzZYrr0v9iSIbpCsGj4lbDdWBbX+cKmr1K6MeOx2JA2Ta6VqikIMC
         Yw+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBGl637BciRvCpFIUPIIfoKRlp7redRXYFXEhiAqie8OqazRTRHdqmOb41CXypELKim7IWEJvt3rM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvcWwCz9E3Bt43SjcEVQ//4h2NZDqsApPxRIfo+omgBrqbbmt6
	x+pQVYdlDj5MCxUBEjowdG7QKfEwSdM6JTQkB1hr0NMCnXtA74eeXBumvvz4
X-Gm-Gg: ASbGncvtRNIJTsL9qJwrVsaabJQI0XLhrVIETDqR8zxZwYqbtVo0vjqe88DX8dwPQ8b
	YhvTt1VL6sfeREEojEDd3xHllb14n1kBRue7fi+TvTLJ1Y2OjKsXmJmIWSzdS8lDy1M4e9FFr2f
	OXW+iDp0NtFR3Uii8veLfEmgoFqs6mqVmt4bNkNEnRHUSTr8gwqZIBTlhGU9KZ24VJzqfIYedoW
	5AkGZpZ5R6FrNduhxbiE9JqaVuoE0X5O0WVeQQR4BxMsJkBaVSHbuh3UPh/wn/ioOZgEj4q3i5Z
	c3nRi4ePgehqITsq+envyvJaYtoqO2zFRL5siNd0/pCc40bGmg==
X-Google-Smtp-Source: AGHT+IE85esx6A4PJTGOWVHuGgOO4I7v2jLl1nJD1tUzIsDLj020wHzfyh82c5B1ItMJEym95jd1hA==
X-Received: by 2002:a05:6402:210c:b0:5e7:8efa:ba13 with SMTP id 4fb4d7f45d1cf-5f0b3b61098mr4010902a12.7.1743811803658;
        Fri, 04 Apr 2025 17:10:03 -0700 (PDT)
Received: from ubuntu ([105.112.234.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087ed19e7sm3039854a12.20.2025.04.04.17.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:10:02 -0700 (PDT)
Date: Sat, 5 Apr 2025 00:09:59 +0000
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, julia.lawall@inria.fr,
	andy@kernel.org, dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Message-ID: <Z/B019elTtKG/PvD@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace the bitwise AND operator `&` with a modulo
operator `%` and decimal number to make the upper limit visible
and clear what the semantic of it is.

Also add white spaces around binary operators for improved
readabiity and adherence to Linux kernel coding style.

Suggested-by Andy Shevchenko <andy.shevchenko@gmail.com>

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v1:
	- Added more patch recipients.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..630669193be4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 			if (psta) {
 				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096;
 				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
 				SetSeqNum(hdr, pattrib->seqnum);
@@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) % 4096;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) % 4096;
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

