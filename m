Received: from mail.djl.id.au (mail.djl.id.au [51.161.134.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DCC177
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 13:49:05 +0000 (UTC)
Received: from desktop (unknown [1.145.53.183])
	by mail.djl.id.au (Postfix) with ESMTPSA id 4CC8520B64;
	Wed, 11 Aug 2021 13:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=djl.id.au; s=2021042801;
	t=1628689277; h=from:from:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:references; bh=aRyA00S4X5p3+7ZrmTyjDWwd0nEXuT1ptgeoX5ewrO0=;
	b=AaI6EmShLoMGLZjFeK04jG1uBT/ZI6h6E7Evxpl3uJNRi/eIj7y7hQTXTVfIf1wHKDgXtP
	o7qmZ2uNHWroyGsJfFdZUbFS5XKGN7g3kpmA85INtKwolpai4Hwx8sPl1vkY036tLQozXk
	LhKReAMe8oRcMQWsTjvkZhp8wqZXbTQ=
From: Dee-Jay Anthony Logozzo <dj@djl.id.au>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dee-Jay Anthony Logozzo <dj@djl.id.au>
Subject: [PATCH] staging: gdm724x: Place macro argument within parentheses
Date: Wed, 11 Aug 2021 23:41:32 +1000
Message-Id: <20210811134132.5240-1-dj@djl.id.au>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Place the macro arguments within parentheses to avoid precedence issues.
This solves the following checkpatch.pl warnings

CHECK: Macro argument 'len' may be better as '(len)' to avoid precedence issues
+#define ND_NLMSG_S_LEN(len)    (len + ND_IFINDEX_LEN)

CHECK: Macro argument 'nlh' may be better as '(nlh)' to avoid precedence issues
+#define ND_NLMSG_R_LEN(nlh)    (nlh->nlmsg_len - ND_IFINDEX_LEN)

Signed-off-by: Dee-Jay Anthony Logozzo <dj@djl.id.au>
---
 drivers/staging/gdm724x/netlink_k.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gdm724x/netlink_k.c b/drivers/staging/gdm724x/netlink_k.c
index 7902e52a699b..8f39cc5617aa 100644
--- a/drivers/staging/gdm724x/netlink_k.c
+++ b/drivers/staging/gdm724x/netlink_k.c
@@ -19,8 +19,8 @@ static DEFINE_MUTEX(netlink_mutex);
 #define ND_NLMSG_SPACE(len)	(NLMSG_SPACE(len) + ND_IFINDEX_LEN)
 #define ND_NLMSG_DATA(nlh)	((void *)((char *)NLMSG_DATA(nlh) + \
 						  ND_IFINDEX_LEN))
-#define ND_NLMSG_S_LEN(len)	(len + ND_IFINDEX_LEN)
-#define ND_NLMSG_R_LEN(nlh)	(nlh->nlmsg_len - ND_IFINDEX_LEN)
+#define ND_NLMSG_S_LEN(len)	((len) + ND_IFINDEX_LEN)
+#define ND_NLMSG_R_LEN(nlh)	((nlh)->nlmsg_len - ND_IFINDEX_LEN)
 #define ND_NLMSG_IFIDX(nlh)	NLMSG_DATA(nlh)
 #define ND_MAX_MSG_LEN		(1024 * 32)
 
-- 
2.31.1

