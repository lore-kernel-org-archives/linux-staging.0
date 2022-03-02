Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C98729AC
	for <linux-staging@lists.linux.dev>; Wed,  2 Mar 2022 10:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646216215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jg7TM5Oay/sObxmW3IJGgfctMnZ6D6jz5AVmSEA/88A=;
	b=dX3qiL/l7dCElt9nQgjFyVZ6AVPy9lCYcbY43k9rfay9Hm9737MdJZOHPIbDaw0cYXYX6S
	OW5spZz948y+8ktw1cF8hfDNxFjzDjvlfYTxSWeAKQHFtu2m0bLifCpgEKED/XBmrPhHPu
	0piJXD84fgFO8xSl5qHt+Wp76rjybu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-zHHhZ6rlPh6VEkq5M0y99w-1; Wed, 02 Mar 2022 05:16:52 -0500
X-MC-Unique: zHHhZ6rlPh6VEkq5M0y99w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7A9E1006AAA;
	Wed,  2 Mar 2022 10:16:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.180])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BA74A8316E;
	Wed,  2 Mar 2022 10:16:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-wireless@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: Improve the comment explaining the locking rules
Date: Wed,  2 Mar 2022 11:16:37 +0100
Message-Id: <20220302101637.26542-2-hdegoede@redhat.com>
In-Reply-To: <20220302101637.26542-1-hdegoede@redhat.com>
References: <20220302101637.26542-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12

rtw_mlme.h has a comment which briefly describes the locking rules for
the rtl8723bs driver, improve this to also mention the locking order
of xmit_priv.lock vs the lock(s) embedded in the various queues.

Cc: Fabio Aiuto <fabioaiuto83@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index c94fa7d8d5a9..1b343b434f4d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -102,13 +102,17 @@ there are several "locks" in mlme_priv,
 since mlme_priv is a shared resource between many threads,
 like ISR/Call-Back functions, the OID handlers, and even timer functions.
 
-
 Each struct __queue has its own locks, already.
-Other items are protected by mlme_priv.lock.
+Other items in mlme_priv are protected by mlme_priv.lock, while items in
+xmit_priv are protected by xmit_priv.lock.
 
 To avoid possible dead lock, any thread trying to modifiying mlme_priv
 SHALL not lock up more than one locks at a time!
 
+The only exception is that queue functions which take the __queue.lock
+may be called with the xmit_priv.lock held. In this case the order
+MUST always be first lock xmit_priv.lock and then call any queue functions
+which take __queue.lock.
 */
 
 
-- 
2.35.1

