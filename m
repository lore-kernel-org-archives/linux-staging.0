Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819784C64
	for <linux-staging@lists.linux.dev>; Tue, 21 Feb 2023 14:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676991217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M+LyQHnkup5dx7Mkw3w1VDbwLmdNqHR5BNXswxPLmbA=;
	b=dDb2QLnvTfWa7Ant1F/HodjHhGys6c8YocYH5Cmbinl4fNMn/PpACDHbBqBN1YlpY3QgW7
	lJDmFT6htoxauFLlBkKxQlyCAw0yEaFt2AlssGlAlwYHHE7D4UmSUxtlEjP9nSJwqvSJJ1
	1d/G0fFsAeb8ADmWAs3QUgOASKHjrMo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-X1gL3XSLNgirxIrPTL150w-1; Tue, 21 Feb 2023 09:53:34 -0500
X-MC-Unique: X1gL3XSLNgirxIrPTL150w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1A7DD19705A9;
	Tue, 21 Feb 2023 14:53:34 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.177])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1105F140EBF4;
	Tue, 21 Feb 2023 14:53:32 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 3/4] drivers: staging: rtl8723bs: Remove unused clr_fwstate() function
Date: Tue, 21 Feb 2023 15:53:25 +0100
Message-Id: <20230221145326.7808-3-hdegoede@redhat.com>
In-Reply-To: <20230221145326.7808-1-hdegoede@redhat.com>
References: <20230221145326.7808-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The clr_fwstate() function is not used anywhere, remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 1b343b434f4d..ee748620107f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -490,18 +490,6 @@ static inline void _clr_fwstate_(struct mlme_priv *pmlmepriv, signed int state)
 		pmlmepriv->bScanInProcess = false;
 }
 
-/*
- * No Limit on the calling context,
- * therefore set it to be the critical section...
- */
-static inline void clr_fwstate(struct mlme_priv *pmlmepriv, signed int state)
-{
-	spin_lock_bh(&pmlmepriv->lock);
-	if (check_fwstate(pmlmepriv, state) == true)
-		pmlmepriv->fw_state ^= state;
-	spin_unlock_bh(&pmlmepriv->lock);
-}
-
 static inline void set_scanned_network_val(struct mlme_priv *pmlmepriv, signed int val)
 {
 	spin_lock_bh(&pmlmepriv->lock);
-- 
2.39.1

