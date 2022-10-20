Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609A07B;
	Thu, 20 Oct 2022 21:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666301560; bh=iR8iS0E42jvZihmNWcy5ZgDuA+WaFkQWN7g/UwsI0sI=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=kxU2ys+gQ6R0R+50QSAynn18+mTFsPmtGVcoBHOLXlbby41oePD5vWzFTFwdMduis
	 dpX5xVacYtPWv2QqApIMUUJ2SlbOyFu78i+5XsdxGCDIPZ2kwOv+pFPRkIJ01iBwv0
	 wvSBU23d7CaK+kLS63xDjo/GbwO1qN0sE459qxsg=
Received: by b-1.in.mailobj.net [192.168.90.11] with ESMTP
	via [213.182.55.206]
	Thu, 20 Oct 2022 23:32:40 +0200 (CEST)
X-EA-Auth: Dt4nhsBn5czK+gafsjybVL/VmW4oP0/+6jSeb68vEDo5kKu6wTGxOpNR8JLuAwSkwgL2u+Jn9qipdtcbqtU4/ntrFLJMURnW
Date: Fri, 21 Oct 2022 03:02:35 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk, paskripkin@gmail.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kumarpraveen@linux.microsoft.com,
	saurabh.truth@gmail.com
Subject: [PATCH v4 11/11] staging: r8188eu: Remove unused macros
Message-ID: <efaf637a14b6f7fdd0178e2aecf8abf17e6922f6.1666299151.git.drv@mailo.com>
References: <cover.1666299151.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1666299151.git.drv@mailo.com>

Simple variants of macros PlatformEFIOWrite and PlatformEFIORead are
defined but never used. As they do not appear to be designed for anything
significant, we can remove them to avoid unexpected usage.

Suggested-by: Julia Lawall <julia.lawall@inria.fr>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---

Changes in v4:
   1. Patch newly added to the patch set.


 drivers/staging/r8188eu/include/rtw_io.h | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_io.h b/drivers/staging/r8188eu/include/rtw_io.h
index 87fcf6c94ff3..e9744694204b 100644
--- a/drivers/staging/r8188eu/include/rtw_io.h
+++ b/drivers/staging/r8188eu/include/rtw_io.h
@@ -285,18 +285,4 @@ void bus_sync_io(struct io_queue *pio_q);
 u32 _ioreq2rwmem(struct io_queue *pio_q);
 void dev_power_down(struct adapter *Adapter, u8 bpwrup);

-#define PlatformEFIOWrite1Byte(_a, _b, _c)		\
-	rtw_write8(_a, _b, _c)
-#define PlatformEFIOWrite2Byte(_a, _b, _c)		\
-	rtw_write16(_a, _b, _c)
-#define PlatformEFIOWrite4Byte(_a, _b, _c)		\
-	rtw_write32(_a, _b, _c)
-
-#define PlatformEFIORead1Byte(_a, _b)		\
-		rtw_read8(_a, _b)
-#define PlatformEFIORead2Byte(_a, _b)		\
-		rtw_read16(_a, _b)
-#define PlatformEFIORead4Byte(_a, _b)		\
-		rtw_read32(_a, _b)
-
 #endif	/* _RTL8711_IO_H_ */
--
2.30.2



