Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354DB6D39
	for <linux-staging@lists.linux.dev>; Thu,  3 Jun 2021 15:50:56 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.110]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MbRwP-1lDZ3a32dd-00bswL; Thu, 03 Jun 2021 17:50:51 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 15/16] staging: vchiq_connected: move EXPORT_SYMBOL below the right function
Date: Thu,  3 Jun 2021 17:50:04 +0200
Message-Id: <1622735405-9980-16-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
References: <1622735405-9980-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:57wtJEjeGiY9/Pgr3k7Z1aVH3icLrS2h7OHpzo1lARJyr8wlCj5
 tgruXZ0CspoNXKZAfthjTFnl/2zJxYSg9Mn0r+k3MtjNpJAayv6mt9Y2gj9zgf2aSuMwEfx
 /k1mByGu6AUF+5YktSO7jepzRvnuj5ONHj1eTitUhSK63yFMmmcafgpR6iqbvb+IkNAQbyg
 mx2RpQ7mvd8mCPy/v1vFw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:IJEppM9KPww=:VAFyDVAaue3rPB8WxnMIxH
 Zyo3k3HW/WT29/IkQgHlJVF1K3un9/h5PnI0RWOfJ6er5My2QFTCTIw1hiCOFx1La1ofgfWSh
 r6IFkC7oQhL6NHhtsQuUagHrgWFXvS94Cfa2RsbZcvUhWvrRn+Ps2/ngxIaXrEBiLNreScLdR
 LWUy0UDwcUl3gqU9K/E5R/G5HSsyt5XnO4+mORC9wc+Yyp3WgijRd9LLGZweMOYA8QtVhkSte
 XBuJR96VlfTuRppT2kXYyFAoQexk9JN1l6jtdv6Z1m8Ymz39OoeCUSPw7EJvIz/exQLpYZ9It
 IgijopFiCD20c9tBSvvaF0mZo+Qju/YSBVX47Du/gNvxjRr4h43/pLYTKU9ZsEHZxiMh5eUWY
 ebKSFfGMf6RVACNqJWNLSaSGcrFml9P5wKrGFA5pj729n+3gX+GbtJ0W3nHY4TTPi0Rg48yBO
 O1DA7nJU6A3cC7VrmoY2dHuFCLgod4Ak5I9kZIrupNp2YPssJUmut/1JEkdEQjcO3ss8mRBNV
 AFkPfAgw5/VTuuOKnDbj2U=
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

It's more intuitive to have the EXPORT_SYMBOL() call below the matching
definition.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
index 3023fa9..0ee96d1 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_connected.c
@@ -52,6 +52,7 @@ void vchiq_add_connected_callback(VCHIQ_CONNECTED_CALLBACK_T callback)
 	}
 	mutex_unlock(&g_connected_mutex);
 }
+EXPORT_SYMBOL(vchiq_add_connected_callback);
 
 /*
  * This function is called by the vchiq stack once it has been connected to
@@ -73,4 +74,3 @@ void vchiq_call_connected_callbacks(void)
 	g_connected = 1;
 	mutex_unlock(&g_connected_mutex);
 }
-EXPORT_SYMBOL(vchiq_add_connected_callback);
-- 
2.7.4

