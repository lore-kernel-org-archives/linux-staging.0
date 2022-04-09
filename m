Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC44DA31
	for <linux-staging@lists.linux.dev>; Sat,  9 Apr 2022 16:32:29 +0000 (UTC)
Received: from ipservice-092-217-091-111.092.217.pools.vodafone-ip.de ([92.217.91.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ndE0g-0006Rg-RV; Sat, 09 Apr 2022 18:32:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/10] staging: r8188eu: remove unused timer functions
Date: Sat,  9 Apr 2022 18:32:12 +0200
Message-Id: <20220409163212.241122-11-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220409163212.241122-1-martin@kaiser.cx>
References: <20220409163212.241122-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_passing_time_ms and rtw_systime_to_ms are not used any more.
Remove them.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/osdep_service.h |  3 ---
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 11 -----------
 2 files changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 1e55a8008acc..f1a703643e74 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -77,9 +77,6 @@ void *rtw_malloc2d(int h, int w, int size);
 		spin_lock_init(&((q)->lock));			\
 	} while (0)
 
-u32  rtw_systime_to_ms(u32 systime);
-s32  rtw_get_passing_time_ms(u32 start);
-
 void rtw_usleep_os(int us);
 
 static inline unsigned char _cancel_timer_ex(struct timer_list *ptimer)
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index 7b177d50eee2..812acd59be79 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -42,17 +42,6 @@ Otherwise, there will be racing condition.
 Caller must check if the list is empty before calling rtw_list_delete
 */
 
-inline u32 rtw_systime_to_ms(u32 systime)
-{
-	return systime * 1000 / HZ;
-}
-
-/*  the input parameter start use the same unit as jiffies */
-inline s32 rtw_get_passing_time_ms(u32 start)
-{
-	return rtw_systime_to_ms(jiffies - start);
-}
-
 void rtw_usleep_os(int us)
 {
 	if (1 < (us / 1000))
-- 
2.30.2

