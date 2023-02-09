Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1126D1B
	for <linux-staging@lists.linux.dev>; Thu,  9 Feb 2023 16:19:28 +0000 (UTC)
Received: from localhost.179.lan (unknown [94.29.124.73])
	by mail.ispras.ru (Postfix) with ESMTPSA id BF6E740737CD;
	Thu,  9 Feb 2023 16:19:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BF6E740737CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1675959555;
	bh=tLZo/bcb1EOssw17se/FP5c6fL7fMLC93o2ouQs+qsk=;
	h=From:To:Cc:Subject:Date:From;
	b=bBg7GYv0wHRcC3LFE1fVPT3Gv3QsaH89vfq4pXj+33wNmIDh+5iJBb9dCRSMvUGuw
	 oZEJHmWKcoqY2j6MlWhn6QYdb/QfCJKIzczHGQpS7SJ2HkadjKPZloUZ2VrqSp1xb/
	 kHpEuVFUNRGgYIxwizlj1jmnuQuX7rloX+QXZB+I=
From: Anton Gusev <aagusev@ispras.ru>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Anton Gusev <aagusev@ispras.ru>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] staging/wlan-ng: Check hfa384x_dowmem result in hfa384x_drvr_flashdl_write
Date: Thu,  9 Feb 2023 19:18:36 +0300
Message-Id: <20230209161836.29991-1-aagusev@ispras.ru>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In hfa384x_drvr_flashdl_write, hfa384x_dowmem is called in a cycle
without checking the result. Ignoring an error there may lead to an
incorrect flash download buffer value during the consequent write.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Anton Gusev <aagusev@ispras.ru>
---
 drivers/staging/wlan-ng/hfa384x_usb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/staging/wlan-ng/hfa384x_usb.c b/drivers/staging/wlan-ng/hfa384x_usb.c
index c7cd54171d99..baac5c02f904 100644
--- a/drivers/staging/wlan-ng/hfa384x_usb.c
+++ b/drivers/staging/wlan-ng/hfa384x_usb.c
@@ -1880,6 +1880,12 @@ int hfa384x_drvr_flashdl_write(struct hfa384x *hw, u32 daddr,
 						writepage,
 						writeoffset,
 						writebuf, writelen);
+			if (result) {
+				netdev_err(hw->wlandev->netdev,
+					   "dowmem(page=%x,offset=%x,data=%p,len=%d) failed, result=%d. Aborting d/l\n",
+					   writepage, writeoffset, writebuf, writelen, result);
+				return result;
+			}
 		}
 
 		/* set the download 'write flash' mode */
-- 
2.39.1

