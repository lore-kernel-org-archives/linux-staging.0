Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE492CA3
	for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 16:55:58 +0000 (UTC)
Received: from dslb-178-004-201-171.178.004.pools.vodafone-ip.de ([178.4.201.171] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n8mLL-0005N8-Ov; Sat, 15 Jan 2022 17:55:55 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/11] staging: r8188eu: call msecs_to_jiffies in _set_timer
Date: Sat, 15 Jan 2022 17:55:32 +0100
Message-Id: <20220115165536.231210-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220115165536.231210-1-martin@kaiser.cx>
References: <20220115165536.231210-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _set_timer wrapper function takes a timeout in milliseconds.
Call msecs_to_jiffies to convert the timeout to jiffies. Don't do
the calculation ourselves.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/osdep_service.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 754691cb2b12..e52e78b2c6b0 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -56,7 +56,7 @@ static inline struct list_head *get_list_head(struct __queue *queue)
 
 static inline void _set_timer(struct timer_list *ptimer,u32 delay_time)
 {
-	mod_timer(ptimer , (jiffies+(delay_time*HZ/1000)));
+	mod_timer(ptimer, jiffies + msecs_to_jiffies(delay_time));
 }
 
 static inline int rtw_netif_queue_stopped(struct net_device *pnetdev)
-- 
2.30.2

