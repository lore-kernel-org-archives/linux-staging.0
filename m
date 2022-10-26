Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3141374
	for <linux-staging@lists.linux.dev>; Wed, 26 Oct 2022 12:40:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1666788024; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YUPFAJcWa6doiWlEPxdAbuwGVJWZQg9mj3RUNUfd9GODZ9w9rqpkucik9lhIcCvahAepgWezYyiQTIA+I3BVw2FGcLDIkjbYDPZW2zIX8T1NlA6zVr628VFFFs+4EFykTHtO6Z3xMSgQY69dQOzDZF+vZxj2T4gNuGjT2G+UnlA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1666788024; h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=OfyJwTiWx+2RzcwoDlVjx0+DSd/U0Zg3cQSdnUzsHwg=; 
	b=D7wuEhzQ8x16XKtmu1ErUvZMjd14cHGVjKZ8s9kHPloBqb518GO3m96Or0Rta/n9B6UCR7hfi71MGYhaQdcQtOlIyjBkZ2TQRPq47PL+1rQxJPQpylS0dlruPvypGL7OF1GfcOl61TW/g8MVkzU5GfI9Bn4dROJrcJXTIUH+tGc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=t4rmin@zohomail.com;
	dmarc=pass header.from=<t4rmin@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1666788024;
	s=zm2022; d=zohomail.com; i=t4rmin@zohomail.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=OfyJwTiWx+2RzcwoDlVjx0+DSd/U0Zg3cQSdnUzsHwg=;
	b=Jy0qaeRp51aucJVBZr40t+MbHbVvcF6GskRQuAtJ0/cotM0VO/yVCPaed7Uoc8QD
	xCYn+WJeFyjMFNuzkZknHQ6a10XX+l9O7KLWpRbFDP/fCoLubfjtWwrhPU3IIY/TKPL
	asfEyWXhXJFI9RNdgDRtMcMEFqSGBkI7kZvWbUAw=
Received: from plymouth (103.47.132.27 [103.47.132.27]) by mx.zohomail.com
	with SMTPS id 1666788022817369.81207230669327; Wed, 26 Oct 2022 05:40:22 -0700 (PDT)
Date: Wed, 26 Oct 2022 19:40:15 +0700
From: Aaron Lawrence <t4rmin@zohomail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] staging: rtl8192e: rtllib_crypt_tkip: blank line before
 close brace removal
Message-ID: <1ba11754f1b1e39b1525a837b8493ba8434d5e3b.1666787061.git.t4rmin@zohomail.com>
References: <cover.1666787061.git.t4rmin@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666787061.git.t4rmin@zohomail.com>
X-ZohoMailClient: External

Removed multiple blank lines that are not necessary before a closing
brace. The issues were found with the checkpatch script and were
dealt with in accordance with the Linux kernel coding-style guidelines.

Signed-off-by: Aaron Lawrence <t4rmin@zohomail.com>
---
 drivers/staging/rtl8192e/rtllib_crypt_tkip.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
index 468f28f48eba..40930c9b0017 100644
--- a/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
+++ b/drivers/staging/rtl8192e/rtllib_crypt_tkip.c
@@ -321,7 +321,6 @@ static int rtllib_tkip_encrypt(struct sk_buff *skb, int hdr_len, void *priv)
 	if (!tcb_desc->bHwSec)
 		return ret;
 	return 0;
-
 }
 
 static int rtllib_tkip_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
@@ -420,7 +419,6 @@ static int rtllib_tkip_decrypt(struct sk_buff *skb, int hdr_len, void *priv)
 			tkey->dot11RSNAStatsTKIPICVErrors++;
 			return -5;
 		}
-
 	}
 
 	/* Update real counters only after Michael MIC verification has
-- 
2.38.1

