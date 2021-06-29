Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2A570
	for <linux-staging@lists.linux.dev>; Tue, 29 Jun 2021 16:52:57 +0000 (UTC)
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
	by youngberry.canonical.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <colin.king@canonical.com>)
	id 1lyGim-00008b-SB; Tue, 29 Jun 2021 16:36:24 +0000
From: Colin King <colin.king@canonical.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Fix while-loop that iterates only once
Date: Tue, 29 Jun 2021 17:36:24 +0100
Message-Id: <20210629163624.41543-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

The while-loop only iterates once becase the post increment test of count
being non-zero is false on the first iteration because count is zero. Fix
this by incrementing count using pre-increment. Static analysis found the
issue on the count > POLLING_LLT_THRESHOLD check always being false since
the loop currently just iterates once.

Addresses-Coverity: ("Logically dead code")
Fixes: 615a4d12e556 ("staging: r8188eu: Add files for new driver - part 14")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
index d1086699f952..db57f04e7e56 100644
--- a/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/rtl8188eu/hal/rtl8188e_hal_init.c
@@ -185,7 +185,7 @@ static s32 _LLTWrite(struct adapter *padapter, u32 address, u32 data)
 			break;
 		}
 		udelay(5);
-	} while (count++);
+	} while (++count);
 
 	return status;
 }
-- 
2.31.1

