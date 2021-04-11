Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079F6D0D
	for <linux-staging@lists.linux.dev>; Sun, 11 Apr 2021 18:12:28 +0000 (UTC)
Received: from localhost.localdomain ([37.4.249.124]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N8oKc-1laky12BaY-015tXo; Sun, 11 Apr 2021 20:12:23 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-staging@lists.linux.dev,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 01/10] staging: vchiq_core: Simplify vchiq_send_remote_use*
Date: Sun, 11 Apr 2021 20:11:31 +0200
Message-Id: <1618164700-21150-2-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
References: <1618164700-21150-1-git-send-email-stefan.wahren@i2se.com>
X-Provags-ID: V03:K1:gr3fli/8dO+c2JrkL8FA0YqcI4R5Qmgld/vrZCUAp6R8Iu/wwpo
 fuom4zgRJ81WLh0+fXdVHLqUapK9uMuiJ4bdWRJDiBOAsLOwdfAmgbRuOsdAiForE8a+P+h
 wXyt0H5VgHGrhVJql0dDaY+VeLKCise+U924YPRnnpuXm3XWL1Yzvw7I1Yvkq1XfTihatrs
 X7UfqYJPBfycCPU+7+lhA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E4AJ8E+YqXI=:iFuE6slzsuLx9/LHTDhjCM
 Yc7wYdfzSh92HyyTMN4FoWhidGQOOUq4aWZEXUQ3ISGHPSbI4Q9W1PoghE7B0VDslX5Ph6MDC
 wppYDKn0Q6zEXDdRPTsWcgynepoQ2zaNyh4bWiycifxhJFdPrZUOR15sCUAwMTsQOMCsgdudg
 OoBlaay3vt0u2LwjWjqUBCJbUr5Iu1yglLGxHXHkcNkUqQEwl/P6n4Skhu/VarFgSsAw6w5ch
 PsEzguy2ZXlGuoukf9ZWiv88c2EE46ZR8jskYU5wUbPBwdc+f7KDaE0qrhDB26MV8v0BMlxxh
 HnbfOYqOGP3Fz5q+cei6Q6iK7a+N+UHDjfPqGiO1Zu1HxaWK/nchpYUpTl09oUyAz7Or4Sy5b
 8+DkJ/5jyXKilmOzihyRqH0MVblD1nSwnG+9h/KKVL7aCkUh7n4nX+ooueOnh05pl1cz7NGnZ
 muuth+WrtsHNMgTAURnxRyU4efaUIBAes/JS5kY0c4d52GDdLsL3
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

There is no need for variable status. So drop it and improve readability.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../vc04_services/interface/vchiq_arm/vchiq_core.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
index 0b0a97b..271d498 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c
@@ -3702,24 +3702,22 @@ vchiq_loud_error_footer(void)
 
 enum vchiq_status vchiq_send_remote_use(struct vchiq_state *state)
 {
-	enum vchiq_status status = VCHIQ_RETRY;
+	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
+		return VCHIQ_RETRY;
 
-	if (state->conn_state != VCHIQ_CONNSTATE_DISCONNECTED)
-		status = queue_message(state, NULL,
-			VCHIQ_MAKE_MSG(VCHIQ_MSG_REMOTE_USE, 0, 0),
-			NULL, NULL, 0, 0);
-	return status;
+	return queue_message(state, NULL,
+			     VCHIQ_MAKE_MSG(VCHIQ_MSG_REMOTE_USE, 0, 0),
+			     NULL, NULL, 0, 0);
 }
 
 enum vchiq_status vchiq_send_remote_use_active(struct vchiq_state *state)
 {
-	enum vchiq_status status = VCHIQ_RETRY;
+	if (state->conn_state == VCHIQ_CONNSTATE_DISCONNECTED)
+		return VCHIQ_RETRY;
 
-	if (state->conn_state != VCHIQ_CONNSTATE_DISCONNECTED)
-		status = queue_message(state, NULL,
-			VCHIQ_MAKE_MSG(VCHIQ_MSG_REMOTE_USE_ACTIVE, 0, 0),
-			NULL, NULL, 0, 0);
-	return status;
+	return queue_message(state, NULL,
+			     VCHIQ_MAKE_MSG(VCHIQ_MSG_REMOTE_USE_ACTIVE, 0, 0),
+			     NULL, NULL, 0, 0);
 }
 
 void vchiq_log_dump_mem(const char *label, u32 addr, const void *void_mem,
-- 
2.7.4

